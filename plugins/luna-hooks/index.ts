/**
 * luna-hooks - opencode v2 local plugin that replaces Luna's three Claude Code hooks.
 *
 *   Claude Code hook          opencode v2 mechanism used here
 *   ------------------------  --------------------------------------------------------------------
 *   SessionStart              session "prompt" hook (awaited BEFORE the prompt is admitted, so the
 *                             first model call already sees it) + pre-warm on event session.created.
 *                             auto-archive.ps1 -CheckOnly + session-reminders.ps1 + project MEMORY.md
 *                             -> ctx.session.instructions.entry.put(key "luna.session-start"),
 *                                rendered to the model as <context key="luna.session-start">.
 *                             Main sessions only (parentID unset). Re-runs on the first prompt of a
 *                             new day or after a server restart (= Claude's "resume" source).
 *   PostToolUse Write|Edit    tool hook "execute.after", tools write / edit / patch, status "completed"
 *                             -> worklog-append.ps1 with a Claude-shaped stdin payload. All sessions
 *                             (subagent edits are real work, same as Claude Code).
 *   Stop                      event session.execution.succeeded of a main session (opencode v2 emits
 *                             no session.idle to plugins) -> log-gate.ps1. {"decision":"block"} ->
 *                             ctx.session.synthetic (wakes the session, model must answer). The next
 *                             turn end of that session sends stop_hook_active:true (loop guard).
 *
 * Rules: a hook never throws and never blocks the event loop; every child process has a timeout
 * (SessionStart 30s, worklog/gate 10s); errors go to luna-workspace/Luna/logs/plugin-errors.log.
 * Test seams (unset in normal use): LUNA_HOOKS_SCRIPTS_DIR, LUNA_HOOKS_DEBUG_LOG.
 */
import { spawn } from "node:child_process"
import { appendFile, readFile } from "node:fs/promises"
import os from "node:os"
import path from "node:path"

const OPENCODE_DIR = path.join(os.homedir(), ".config", "opencode")
const WORKSPACE = path.join(OPENCODE_DIR, "luna-workspace")
const SCRIPTS_DIR = process.env.LUNA_HOOKS_SCRIPTS_DIR || path.join(WORKSPACE, "scripts")
const ERROR_LOG = path.join(WORKSPACE, "Luna", "logs", "plugin-errors.log")
const DEBUG_LOG = process.env.LUNA_HOOKS_DEBUG_LOG || ""
const PROJECT_MEMORY_DIR = path.join(OPENCODE_DIR, "project-memory")

const ENTRY_KEY = "luna.session-start"
const SESSION_START_TIMEOUT_MS = 30_000
// both run after the turn, off the user's path; 10s was too tight for a cold PowerShell start right after boot
const WORKLOG_TIMEOUT_MS = 30_000
const GATE_TIMEOUT_MS = 30_000
const ENTRY_MAX_BYTES = 200_000 // server rejects instruction entries over 256 KiB of JSON

// opencode v2 file-writing tools -> tool_name the Claude-era scripts expect in the worklog
const EDIT_TOOLS: Record<string, string> = { write: "Write", edit: "Edit", patch: "Patch" }

type PsResult = { ok: boolean; code: number | null; timedOut: boolean; error?: string; stdout: string; stderr: string; ms: number }
type SessionInfo = { directory: string; parentID?: string }

// ---------------------------------------------------------------------------------------------
// small utilities (none of them can throw)

const pad = (n: number) => String(n).padStart(2, "0")
const ymd = (d = new Date()) => `${d.getFullYear()}-${pad(d.getMonth() + 1)}-${pad(d.getDate())}`
const stamp = (d = new Date()) => `${ymd(d)} ${pad(d.getHours())}:${pad(d.getMinutes())}:${pad(d.getSeconds())}`
const sleep = (ms: number) => new Promise<void>((r) => setTimeout(r, ms))

function errText(e: unknown): string {
  let s: string
  try {
    s = e instanceof Error ? e.message : typeof e === "string" ? e : JSON.stringify(e)
  } catch {
    s = String(e)
  }
  return (s ?? "").replace(/\s+/g, " ").slice(0, 2000)
}

function logError(where: string, e: unknown) {
  appendFile(ERROR_LOG, `[${stamp()}] luna-hooks ${where}: ${errText(e)}\n`, "utf8").catch(() => {})
}

function debug(msg: string, data?: unknown) {
  if (!DEBUG_LOG) return
  let s = ""
  try {
    s = data === undefined ? "" : " " + JSON.stringify(data)
  } catch {}
  appendFile(DEBUG_LOG, `[${new Date().toISOString()}] ${msg}${s}\n`, "utf8").catch(() => {})
}

/** resolves to undefined on timeout or rejection - callers decide what "no answer" means */
function withTimeout<T>(p: Promise<T>, ms: number): Promise<T | undefined> {
  return new Promise((resolve) => {
    const t = setTimeout(() => resolve(undefined), ms)
    p.then(
      (v) => (clearTimeout(t), resolve(v)),
      (e) => (clearTimeout(t), logError("withTimeout", e), resolve(undefined)),
    )
  })
}

const normDir = (p?: string) => (p ? path.resolve(p).replace(/[\\/]+$/, "").toLowerCase() : "")

function resolvePath(cwd: string, p: string): string {
  const home = /^~(?=$|[\\/])/
  return path.resolve(cwd, home.test(p) ? p.replace(home, os.homedir()) : p)
}

/**
 * JSON with every non-ASCII char as \uXXXX. Windows PowerShell 5.1 decodes stdin with the OEM
 * code page, which turned Thai file names into mojibake under Claude Code. ASCII survives any
 * code page and ConvertFrom-Json restores the real characters.
 */
function asciiJson(value: unknown): string {
  return JSON.stringify(value).replace(/[\u007f-\uFFFF]/g, (c) => "\\u" + c.charCodeAt(0).toString(16).padStart(4, "0"))
}

function runPs(script: string, args: string[], input: unknown, timeoutMs: number): Promise<PsResult> {
  const started = Date.now()
  return new Promise((resolve) => {
    const out: Buffer[] = []
    const err: Buffer[] = []
    let settled = false
    let timer: ReturnType<typeof setTimeout> | undefined
    const text = (chunks: Buffer[]) => Buffer.concat(chunks).toString("utf8").replace(/^\uFEFF/, "")
    const finish = (r: { ok: boolean; code: number | null; timedOut: boolean; error?: string }) => {
      if (settled) return
      settled = true
      if (timer) clearTimeout(timer)
      resolve({ ...r, stdout: text(out), stderr: text(err), ms: Date.now() - started })
    }
    let child: any
    try {
      child = spawn("powershell.exe", ["-NoLogo", "-NoProfile", "-NonInteractive", "-File", path.join(SCRIPTS_DIR, script), ...args], {
        windowsHide: true,
        stdio: ["pipe", "pipe", "pipe"],
      })
    } catch (e) {
      finish({ ok: false, code: null, timedOut: false, error: errText(e) })
      return
    }
    timer = setTimeout(() => {
      try {
        child.kill()
      } catch {}
      finish({ ok: false, code: null, timedOut: true })
    }, timeoutMs)
    child.stdout?.on("data", (d: Buffer) => out.push(d))
    child.stderr?.on("data", (d: Buffer) => err.push(d))
    child.on("error", (e: unknown) => finish({ ok: false, code: null, timedOut: false, error: errText(e) }))
    child.on("close", (code: number | null) => finish({ ok: code === 0, code, timedOut: false }))
    try {
      child.stdin?.on("error", () => {})
      child.stdin?.end(input === undefined ? "" : asciiJson(input))
    } catch {}
  })
}

const psFailure = (r: PsResult) =>
  r.timedOut ? `timed out after ${r.ms} ms` : r.error ? `spawn error: ${r.error}` : `exit ${r.code}; stderr: ${r.stderr.trim().slice(0, 500)}`

// ---------------------------------------------------------------------------------------------

export default {
  id: "luna-hooks",
  async setup(ctx: any) {
    const here = normDir(ctx.location?.directory)
    const sessions = new Map<string, SessionInfo>()
    const sessionStarts = new Map<string, { day: string; done: Promise<void> }>()
    const continuing = new Set<string>() // sessions currently answering a block we injected
    const gateBusy = new Set<string>()
    let worklogQueue: Promise<void> = Promise.resolve()

    /** one plugin instance runs per location; only handle sessions that belong to this one */
    const mine = (info: SessionInfo) => !here || normDir(info.directory) === here

    function remember(id: string, info: SessionInfo) {
      sessions.set(id, info)
      if (sessions.size > 2000) sessions.delete(sessions.keys().next().value as string)
    }

    async function getSession(sessionID: string): Promise<SessionInfo | undefined> {
      const hit = sessions.get(sessionID)
      if (hit) return hit
      const s: any = await withTimeout(Promise.resolve(ctx.session.get({ sessionID })), 5_000)
      if (!s) return undefined
      const info: SessionInfo = { directory: s.location?.directory || ctx.location?.directory || process.cwd(), parentID: s.parentID || undefined }
      remember(sessionID, info)
      return info
    }

    // ----- SessionStart ------------------------------------------------------------------------

    async function readProjectMemory(directory: string) {
      const file = path.join(PROJECT_MEMORY_DIR, directory.replace(/[^A-Za-z0-9]/g, "-"), "MEMORY.md")
      try {
        const text = (await readFile(file, "utf8")).replace(/^\uFEFF/, "").trim()
        return text ? { file, text } : undefined
      } catch {
        return undefined // most directories have no project memory - not an error
      }
    }

    async function buildSessionStart(directory: string): Promise<string> {
      const [archive, reminders, memory] = await Promise.all([
        runPs("auto-archive.ps1", ["-CheckOnly"], undefined, SESSION_START_TIMEOUT_MS),
        runPs("session-reminders.ps1", [], { cwd: directory }, SESSION_START_TIMEOUT_MS),
        readProjectMemory(directory),
      ])
      const parts: string[] = []
      for (const [name, r] of [["auto-archive.ps1", archive], ["session-reminders.ps1", reminders]] as const) {
        // like Claude Code: stdout of a failed hook never reaches the model (it can be a PS error banner)
        if (!r.ok) {
          logError(`session-start ${name}`, psFailure(r))
          continue
        }
        const out = r.stdout.trim()
        if (out) parts.push(out)
      }
      if (memory) {
        parts.push(
          `[Project memory: ${memory.file}]\n` +
            `(index - the linked .md files live in the same folder; open one only when it is relevant)\n` +
            memory.text,
        )
      }
      debug("session-start.built", { directory, archive: archive.ms, reminders: reminders.ms, memory: Boolean(memory), parts: parts.length })
      if (!parts.length) return ""
      let text = ["Luna SessionStart (luna-hooks plugin - replaces the Claude Code SessionStart hooks)", ...parts].join("\n\n")
      while (Buffer.byteLength(JSON.stringify(text), "utf8") > ENTRY_MAX_BYTES) text = text.slice(0, Math.floor(text.length * 0.9))
      return text
    }

    async function injectSessionStart(sessionID: string, directory: string) {
      const text = await buildSessionStart(directory)
      if (text) {
        await ctx.session.instructions.entry.put({ sessionID, key: ENTRY_KEY, value: text })
        debug("session-start.put", { sessionID, directory, chars: text.length })
        return
      }
      // nothing to say today: drop an entry left over from an earlier day (no-op when absent)
      const entries: any = await ctx.session.instructions.entry.list({ sessionID })
      if (Array.isArray(entries) && entries.some((x: any) => x?.key === ENTRY_KEY)) {
        await ctx.session.instructions.entry.remove({ sessionID, key: ENTRY_KEY })
      }
      debug("session-start.empty", { sessionID, directory })
    }

    function ensureSessionStart(sessionID: string, directory: string): Promise<void> {
      const day = ymd()
      const cur = sessionStarts.get(sessionID)
      if (cur && cur.day === day) return cur.done
      const done = injectSessionStart(sessionID, directory).catch((e) => {
        sessionStarts.delete(sessionID) // let the next prompt retry
        logError(`session-start ${sessionID}`, e)
      })
      sessionStarts.set(sessionID, { day, done })
      return done
    }

    // ----- PostToolUse -------------------------------------------------------------------------

    function editedFiles(snap: any, cwd: string): string[] {
      const files = new Set<string>()
      const add = (p: unknown) => {
        if (typeof p === "string" && p.trim()) files.add(resolvePath(cwd, p.trim()))
      }
      const list = (v: unknown): any[] => (Array.isArray(v) ? v : [])
      if (snap.tool === "write") add(snap.output?.target ?? snap.input?.path)
      else if (snap.tool === "edit") add(snap.input?.path ?? list(snap.output?.files)[0]?.file)
      else for (const f of list(snap.output?.files).length ? list(snap.output?.files) : list(snap.metadata?.files)) add(f?.file)
      return [...files]
    }

    async function recordEdit(snap: any) {
      const info = await getSession(snap.sessionID)
      if (info && !mine(info)) return
      const cwd = info?.directory || ctx.location?.directory || process.cwd()
      for (const file of editedFiles(snap, cwd)) {
        const r = await runPs("worklog-append.ps1", [], { tool_name: snap.toolName, tool_input: { file_path: file }, cwd }, WORKLOG_TIMEOUT_MS)
        if (!r.ok) logError(`worklog-append ${file}`, psFailure(r))
        debug("worklog", { sessionID: snap.sessionID, tool: snap.toolName, file, ok: r.ok, ms: r.ms })
      }
    }

    function onToolAfter(e: any) {
      try {
        if (e?.status !== "completed") return
        const toolName = EDIT_TOOLS[e?.tool]
        if (!toolName) return
        // snapshot now; the hook returns immediately and the append runs in a serial queue
        const snap = { sessionID: e.sessionID, tool: e.tool, toolName, input: e.input, output: e.result?.output, metadata: e.result?.metadata }
        worklogQueue = worklogQueue.then(() => recordEdit(snap)).catch((err) => logError("worklog", err))
      } catch (err) {
        logError("hook execute.after", err)
      }
    }

    // ----- Stop --------------------------------------------------------------------------------

    function parseDecision(stdout: string): { decision?: string; reason?: string } | undefined {
      const line = stdout.split(/\r?\n/).map((l) => l.trim()).filter((l) => l.startsWith("{")).pop()
      if (!line) return undefined
      try {
        return JSON.parse(line)
      } catch (e) {
        logError("log-gate output is not JSON", line.slice(0, 300))
        return undefined
      }
    }

    async function onTurnEnd(sessionID: string) {
      if (gateBusy.has(sessionID)) return
      gateBusy.add(sessionID)
      try {
        const info = await getSession(sessionID)
        if (!info || info.parentID || !mine(info)) return
        await withTimeout(worklogQueue, 20_000) // the gate counts today's worklog - let pending appends land first
        const active = continuing.delete(sessionID) // true only for the turn our own block caused
        const r = await runPs("log-gate.ps1", [], { stop_hook_active: active, cwd: info.directory }, GATE_TIMEOUT_MS)
        debug("gate", { sessionID, active, code: r.code, ms: r.ms, timedOut: r.timedOut, stdout: r.stdout.trim().slice(0, 160) })
        if (!r.ok) return logError(`log-gate ${sessionID}`, psFailure(r))
        const d = parseDecision(r.stdout)
        if (d?.decision !== "block" || typeof d.reason !== "string" || !d.reason.trim()) return
        continuing.add(sessionID)
        try {
          await ctx.session.synthetic({
            sessionID,
            text: `Stop hook feedback (luna-hooks -> log-gate.ps1):\n${d.reason.trim()}`,
            metadata: { source: "luna-hooks", hook: "stop" },
          })
          debug("gate.blocked", { sessionID })
        } catch (e) {
          continuing.delete(sessionID)
          throw e
        }
      } catch (e) {
        logError(`stop-gate ${sessionID}`, e)
      } finally {
        gateBusy.delete(sessionID)
      }
    }

    // ----- events ------------------------------------------------------------------------------

    function onEvent(ev: any) {
      const d = ev?.data
      const id: string | undefined = d?.sessionID
      if (!id) return
      if (ev.type === "session.created") {
        const directory = d.location?.directory || ev.location?.directory
        if (!directory) return
        const info: SessionInfo = { directory, parentID: d.parentID || undefined }
        remember(id, info)
        if (!info.parentID && mine(info)) void ensureSessionStart(id, directory) // pre-warm; the prompt hook awaits it
      } else if (ev.type === "session.moved") {
        const prev = sessions.get(id)
        if (prev && d.location?.directory) remember(id, { ...prev, directory: d.location.directory })
      } else if (ev.type === "session.execution.succeeded") {
        void onTurnEnd(id)
      } else if (ev.type === "session.deleted") {
        sessions.delete(id)
        sessionStarts.delete(id)
        continuing.delete(id)
      }
    }

    const ac = new AbortController()
    void (async () => {
      let idleRounds = 0 // consecutive subscriptions that ended without delivering anything
      while (!ac.signal.aborted && idleRounds < 5) {
        let got = false
        try {
          const types = ["session.created", "session.moved", "session.execution.succeeded", "session.deleted"]
          for await (const ev of ctx.event.subscribe({ types, signal: ac.signal })) {
            got = true
            try {
              onEvent(ev)
            } catch (e) {
              logError("event handler", e)
            }
          }
        } catch (e) {
          if (!ac.signal.aborted) logError("event stream", e)
        }
        idleRounds = got ? 0 : idleRounds + 1
        if (!ac.signal.aborted) await sleep(1_000 * (idleRounds + 1))
      }
      if (!ac.signal.aborted) logError("event stream", "gave up after 5 empty subscriptions - Stop gate inactive until reload")
    })()

    // ----- hooks -------------------------------------------------------------------------------

    const disposers: any[] = []
    const register = async (what: string, fn: () => Promise<any>) => {
      try {
        disposers.push(await fn())
      } catch (e) {
        logError(`register ${what}`, e)
      }
    }

    await register("session prompt hook", () =>
      ctx.session.hook("prompt", async (e: any) => {
        try {
          const sessionID = e?.sessionID
          if (!sessionID) return
          const info = await getSession(sessionID)
          if (!info || info.parentID || !mine(info)) return
          await withTimeout(ensureSessionStart(sessionID, info.directory), SESSION_START_TIMEOUT_MS + 5_000)
        } catch (err) {
          logError("hook prompt", err)
        }
      }),
    )
    await register("tool execute.after hook", () => ctx.tool.hook("execute.after", onToolAfter))

    debug("setup", { location: ctx.location?.directory, scripts: SCRIPTS_DIR })

    return async () => {
      ac.abort()
      for (const d of disposers) {
        try {
          await d?.dispose?.()
        } catch {}
      }
      debug("cleanup", { location: ctx.location?.directory })
    }
  },
}
