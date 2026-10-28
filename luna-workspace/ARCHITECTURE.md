# Luna Workspace Architecture — System vs Data Separation

*Designed by **Orion** (System Architect) — Phase 5+ portability enhancement*
*Created: 2026-04-27*

---

## 🎯 หลักการ

```
luna-workspace/
├── 🔧 SYSTEM (portable)     ← ย้ายข้ามเครื่องได้ ไม่เปลี่ยน
├── 📊 DATA (dynamic)         ← เกิดจากการใช้งาน เปลี่ยนทุกวัน
└── 🔗 MIXED (template→data)  ← เริ่มเป็น template ว่าง เติมข้อมูลระหว่างใช้
```

---

## 🌐 Claude Code Instruction Load Order (verified 2026-08-07)

```
โหลดอัตโนมัติทุก session:
1. ~/.config/opencode/AGENTS.md                     ← persona, 4-Tier summary, team table
2. ~/.config/opencode/rules/*.md                    ← user-level rules (luna-core, data-handling, team-protocol)
3. ~/.config/opencode/projects/<project>/memory/MEMORY.md  ← auto memory (200 บรรทัด / 25KB แรก)

โหลดตาม repo ที่เปิด:
4. <repo>/CLAUDE.md  →  <repo>/CLAUDE.local.md
5. <repo>/.claude/rules/*.md               ← rule ที่มี `paths:` โหลดเฉพาะตอนแตะไฟล์ที่ match
```

- **CLAUDE.md ปัจจุบัน *ไม่* ใช้ `@-import`** — ใช้ path ใน backtick แล้วอ่านเมื่อจำเป็น
  (`@path` ยังใช้ได้แต่โหลดเต็มตอน launch — ไม่ประหยัด context)
- เพดานที่แนะนำ: CLAUDE.md < 200 บรรทัด (`auto-archive.ps1` เตือนให้)
- procedure ยาวๆ ควรเป็น **skill** (โหลดตอนใช้) ไม่ใช่ rule (โหลดตลอด)

**Shared between Desktop App + CLI:**
- `~/.config/opencode/AGENTS.md` — global memory
- `~/.config/opencode/settings.json` — permissions, hooks
- `~/.config/opencode/skills/` — native skills
- `~/.config/opencode/agents/` — subagents (advanced)
- `~/.claude.json`, `.mcp.json` — MCP servers

**Migration Note:** `.clauderules` (Windsurf legacy) → `~/.config/opencode/AGENTS.md` · ไฟล์เดิม archived 2026-08-07 เพราะ Claude Code ไม่อ่านมัน และเนื้อหาขัดกับ 4-Tier


**Use cases:**
- **ย้ายเครื่องใหม่:** zip ทั้งชุด → ได้ทั้ง system + data (ดู Scenario 1)
- **ให้คนอื่นใช้:** export เฉพาะ SYSTEM → เขาเริ่ม data ใหม่
- **Reset fresh:** ลบ DATA → keep SYSTEM → เริ่มต้นใหม่สะอาด

---

## 📋 File Classification Map

### 🔧 SYSTEM — Portable Core (ไม่เปลี่ยนตามการใช้งาน)

| Path | คือ | ย้ายข้ามเครื่อง |
|------|-----|----------------|
| `rules/` | กฎหลักของ Luna | ✅ ย้ายทั้ง folder |
| `templates/` | แม่แบบทุกชนิด (daily-log, skill, case-study, scoring-rubric, etc.) | ✅ ย้ายทั้ง folder |
| `workflows/` | workflow definitions ทุกตัว | ✅ ย้ายทั้ง folder |
| `team/roles/` | role definitions (จำนวน: ดู `team/team-config.md`) | ✅ ย้ายทั้ง folder |
| `team/team-config.md` | team structure config | ✅ |
| `team/decision-global-vs-per-repo.md` | decision framework | ✅ |
| `team/onboarding-template.md` | onboarding template | ✅ |
| `team/<role>/skills/*-principal-skill.md` | principal skill ของแต่ละ role | ✅ |
| `team/<role>/skills/*-skill.md` | basic skill ของแต่ละ role | ✅ |
| `team/<role>/skills/*/` | skill packages (e.g. stella/frontend-repo-review/) | ✅ |
| `team/<role>/knowledge/` | role knowledge files | ✅ |
| `team/<role>/learning-paths.md` | learning paths | ✅ |
| `knowledge-package-generic/` | universal coding principles | ✅ ย้ายทั้ง folder |
| `knowledge-package-pmam/` | PMAM-specific standards | ✅ (ถ้าใช้ PMAM) |
| `Luna/skills/` | Luna's own principal skill | ✅ |
| `README.md` | onboarding guide | ✅ |
| `ARCHITECTURE.md` | this file | ✅ |
| `.gitignore` | git config | ✅ |

### 📊 DATA — Dynamic (เกิดจากการใช้งาน เปลี่ยนทุกวัน)

| Path | คือ | ย้ายข้ามเครื่อง |
|------|-----|----------------|
| `Luna/team/daily/` | daily logs | ⚠️ optional (history) |
| `Luna/retrospective/` | **retro ทุกฉบับอยู่ที่นี่ที่เดียว** (รวมจาก team retro 2026-08-07 · team retro แยกไฟล์ retired 2026-08-17) | ⚠️ optional (history) |
| memory tool (Luna ส่วนกลาง — `projects\...\memory\`) | central feedback/learnings (แทน hypothesis/insights/preferences.md — retired 2026-07-23 → `Luna/archive/`) | 🟡 recommended |
| `~/.config/opencode/agent-memory/<role>/` | per-role learnings (`memory: user`) | 🟡 recommended |
| `Luna/claude-updates.md` | Claude Code update notes | ⚠️ optional |
| `team/audits/` | audit reports | ⚠️ optional (history) |
| `team/case-studies/` | real case studies | 🟡 recommended (knowledge) |
| ~~`team/retrospective/`~~ | retired 2026-08-17 — มีแต่ README 15 สัปดาห์ · ย้ายไป `Luna/archive/2026-08-team-retrospective-retired/` | — |
| `team/performance.md` | current scores | ⚠️ reset on new machine |
| ~~`team/health-dashboard.md`~~ | archived 2026-08-07 — snapshot ที่แก้มือแล้วค้าง 2 เดือน · ใช้ `luna-dashboard` (scan อัตโนมัติ) แทน | — |
| `team/skill-gap-analysis.md` | gap analysis | ⚠️ optional |
| `team/onboarding.md` | onboarding instance | ⚠️ optional |
| `plans/` | active plans | ⚠️ optional (may be stale) |
| `repo-index/` | per-repo state | ⚠️ optional |
| `team/_archived/` | archived files | ⚠️ optional |

### 🔗 MIXED — Template Start → Data Fill

| Path | เริ่มต้น | หลังใช้งาน |
|------|----------|-----------|
| `team/preferences/<role>.md` | ⚠️ **retired 2026-07-23** — ยังอยู่บนดิสก์เพราะ `team/context/*.md` และ `*-principal-skill.md` ยังอ้างถึง · learning จริงไปอยู่ที่ `~/.config/opencode/agent-memory/<role>/` | ไม่ต้องเติม |
| `team/<role>/performance-metrics.md` | template structure | เติม metrics |

---

## 🚀 Export Scenarios

### Scenario 1: ย้ายเครื่อง (ทุกอย่าง)

⚠️ **`luna-workspace/` ไม่ใช่ git repo** (ไม่มี `.git` แม้จะมี `.gitignore`) — วิธี `git clone` ที่เคยเขียนไว้ตรงนี้ใช้ไม่ได้ และไม่มี history ให้ clone

```powershell
# zip ทั้งชุด (FileShare::ReadWrite เพราะไฟล์ log อาจถูก lock ชั่วคราว)
Compress-Archive -Path "$env:USERPROFILE\.claude\luna-workspace" `
                 -DestinationPath "$env:USERPROFILE\.claude\backups\luna-$(Get-Date -f yyyyMMdd).zip"
```

> **ไม่มี backup อัตโนมัติ** — การลบไฟล์ใน `luna-workspace/` กู้ไม่ได้
> เพราะงั้นการ cleanup ทุกครั้งให้ **ย้ายเข้า `Luna/archive/`** ไม่ใช่ลบ (นโยบายตั้งแต่ 2026-08-07)

### Scenario 2: ให้คนอื่นใช้ (เฉพาะ system)
```powershell
# ใช้ export script
& "$env:USERPROFILE\.claude\luna-workspace\templates\Export-LunaSystem.ps1" -OutputPath "D:\luna-export"
```
→ ได้เฉพาะ SYSTEM files + empty DATA folders

### Scenario 3: Reset fresh (keep system, clear data)
```powershell
# ใช้ reset script
& "$env:USERPROFILE\.claude\luna-workspace\templates\Reset-LunaData.ps1"
```
→ ลบ DATA files + reset MIXED files กลับเป็น template ว่าง

---

## 📊 Size Breakdown (estimate)

| Category | Files | % of repo |
|----------|-------|-----------|
| 🔧 SYSTEM | ~80 files | ~65% |
| 📊 DATA | ~30 files | ~25% |
| 🔗 MIXED | ~15 files | ~10% |

---

## 🔗 References

- `README.md` — onboarding guide (section "ใช้ Luna บนเครื่องอื่น")
- `templates/Export-LunaSystem.ps1` — export script
- `templates/Reset-LunaData.ps1` — reset script

---
*Orion — System Architecture Decision | Reviewed by Luna*
