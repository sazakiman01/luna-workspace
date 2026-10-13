# agent-log.ps1 - Luna System: log every subagent call (model/effort trial evidence)
#
# Wired to: PostToolUse hook, matcher ^Agent$ (settings.json)
# Why: Haiku trial (luna-core.md -> Haiku trial) needs real numbers per model, not memory.
# Output: luna-workspace\Luna\logs\agent-calls-YYYY-MM.tsv
#         time <TAB> subagent_type <TAB> model <TAB> effort <TAB> description
#         (model/effort "-" = not passed per-call -> frontmatter/session default applies)
# Contract: silent, always exit 0 (must never affect a session)

$ErrorActionPreference = 'SilentlyContinue'
$LogDir = "$env:USERPROFILE\.claude\luna-workspace\Luna\logs"

try {
    [Console]::InputEncoding = [System.Text.Encoding]::UTF8
    if (-not [Console]::IsInputRedirected) { exit 0 }
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }
    $p = $raw | ConvertFrom-Json
    if ($p.tool_name -ne 'Agent') { exit 0 }

    $i = $p.tool_input
    $f = { param($v) if ([string]::IsNullOrWhiteSpace([string]$v)) { '-' } else { ([string]$v) -replace "[\t\r\n]", ' ' } }
    $type = & $f $i.subagent_type
    if ($type -eq '-') { $type = 'general-purpose' }
    $line = "{0}`t{1}`t{2}`t{3}`t{4}`r`n" -f (Get-Date -Format 's'), $type, (& $f $i.model), (& $f $i.effort), (& $f $i.description)

    if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
    $out = Join-Path $LogDir ("agent-calls-{0}.tsv" -f (Get-Date -Format 'yyyy-MM'))
    [System.IO.File]::AppendAllText($out, $line, (New-Object System.Text.UTF8Encoding $false))
} catch { }
exit 0
