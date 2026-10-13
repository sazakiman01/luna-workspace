# memory-gate.ps1 - Luna System evidence-gated learning gate for roles (subagents)
#
# Wired to: PreToolUse hook, matcher ^SubagentHandback$ (settings.json)
#
# Why PreToolUse (not SubagentStop):
#   Tested 2026-10-13 in the Desktop App: roles deliver their report via SubagentHandback,
#   and SubagentStop fires only AFTER that -> a "block" there never gets a follow-up turn.
#   Gating the handback itself asks the role while it can still act.
#
# Contract:
#   - stdin : hook JSON (tool_name, tool_input.message, agent_type?, ...)
#   - report already contains a line starting with "🧠 Memory:" -> exit 0 silently (allow)
#     (emoji marker on purpose: plain "Memory:" matched frontmatter like 'memory: user' - Polaris 2026-10-13)
#   - otherwise -> deny with reason; role checks lessons, adds the line, hands back again
#     (self-terminating: once the line is present the gate allows)
#
# Scope: only Luna roles. If agent_type is present and not a Luna role -> allow.
# FAIL-SAFE: empty stdin / parse error / any exception -> exit 0 (never block real work).
# Log: luna-workspace\Luna\logs\memory-gate-YYYY-MM.tsv  (time, agent_type, recorded|none|deny) -> weekly-retro metric
# Debug: LUNA_GATE_DEBUG=1 -> logs payload keys (not content) to %TEMP%\luna-memory-gate.log

$ErrorActionPreference = 'Stop'
$LogDir = "$env:USERPROFILE\.claude\luna-workspace\Luna\logs"
$roles = '^(atlas|comet|cosmos|galaxy|lyra|nebula|nova|orion|polaris|rigel|sirius|stella|vega|vela)$'

function Write-GateLog([string]$agent, [string]$result) {
    try {
        if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
        $f = Join-Path $LogDir ("memory-gate-{0}.tsv" -f (Get-Date -Format 'yyyy-MM'))
        $line = "{0}`t{1}`t{2}`r`n" -f (Get-Date -Format 's'), $agent, $result
        [System.IO.File]::AppendAllText($f, $line, (New-Object System.Text.UTF8Encoding $false))
    } catch { }   # logging must never affect the gate
}

try {
    [Console]::InputEncoding  = [System.Text.Encoding]::UTF8
    [Console]::OutputEncoding = [System.Text.Encoding]::UTF8

    if (-not [Console]::IsInputRedirected) { exit 0 }
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $p = $raw | ConvertFrom-Json
    if ($null -eq $p) { exit 0 }

    if ($env:LUNA_GATE_DEBUG -eq '1') {
        $keys = ($p.PSObject.Properties.Name -join ',')
        Add-Content -Path (Join-Path $env:TEMP 'luna-memory-gate.log') -Value ("{0} keys={1} agent_type={2}" -f (Get-Date -Format s), $keys, $p.agent_type) -Encoding UTF8
    }

    if ($p.tool_name -ne 'SubagentHandback') { exit 0 }
    if ($p.agent_type -and ($p.agent_type -notmatch $roles)) { exit 0 }

    $brain = [char]::ConvertFromUtf32(0x1F9E0)
    $msg = [string]$p.tool_input.message
    $m = [regex]::Match($msg, '(?im)^\s*' + [regex]::Escape($brain) + '\s*Memory\s*:\s*(.*)$')
    if ($m.Success) {
        $result = if ($m.Groups[1].Value -match 'ไม่มีบทเรียนใหม่') { 'none' } else { 'recorded' }
        Write-GateLog $p.agent_type $result
        exit 0
    }
    Write-GateLog $p.agent_type 'deny'

    $reason = "ก่อนส่งรายงาน: งานนี้มีบทเรียนที่มีหลักฐานตามเกณฑ์ใน luna-workspace/rules/team-protocol.md (Continuous Learning) ไหม? มี -> บันทึก/แก้ topic file + index ใน agent-memory ของคุณ แล้วเติมบรรทัด '🧠 Memory: บันทึก <หัวข้อ>' ท้ายรายงาน · ไม่มี -> เติม '🧠 Memory: ไม่มีบทเรียนใหม่' (ต้องขึ้นต้นด้วย 🧠) · แล้วส่งรายงานใหม่ (ห้ามบันทึก activity)"

    @{ hookSpecificOutput = @{ hookEventName = 'PreToolUse'; permissionDecision = 'deny'; permissionDecisionReason = $reason } } | ConvertTo-Json -Compress -Depth 4
    exit 0
} catch {
    exit 0
}
