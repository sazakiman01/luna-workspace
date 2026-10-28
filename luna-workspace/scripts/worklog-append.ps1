# worklog-append.ps1 - Luna System automatic work evidence
#
# Wired to: PostToolUse hook, matcher "Write|Edit|NotebookEdit"
#
# Why this exists:
#   Daily-log discipline collapsed 4 times (2026-W17, W18, W20-W29, and again in Aug).
#   Every previous fix was a better reminder. Reminders lose because writing the log is
#   expensive at the moment it's needed - you have to reconstruct "what did I touch today?".
#   This hook pre-collects that answer with zero model involvement, so /daily-log becomes cheap.
#
# Contract:
#   - stdin  : hook JSON (tool_name, tool_input.file_path, cwd)
#   - stdout : nothing (PostToolUse stdout is not injected as context; keep it silent)
#   - exit   : always 0 - this must never be able to fail a session
#
# Output: luna-workspace\Luna\logs\worklog-YYYY-MM-DD.tsv
#         time <TAB> tool <TAB> file_path <TAB> cwd

$ErrorActionPreference = 'SilentlyContinue'

$LunaRoot = "C:\Users\sansakritsuk\.config\opencode\luna-workspace"
$LogDir   = "$LunaRoot\Luna\logs"

try {
    if (-not [Console]::IsInputRedirected) { exit 0 }
    $raw = [Console]::In.ReadToEnd()
    if ([string]::IsNullOrWhiteSpace($raw)) { exit 0 }

    $p = $raw | ConvertFrom-Json
    $filePath = $p.tool_input.file_path
    if ([string]::IsNullOrWhiteSpace($filePath)) { exit 0 }

    # never record edits to the worklog/gate machinery itself
    if ($filePath -like "$LogDir\*") { exit 0 }

    if (-not (Test-Path $LogDir)) {
        New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
    }

    $out  = Join-Path $LogDir ("worklog-{0}.tsv" -f (Get-Date -Format 'yyyy-MM-dd'))
    $line = "{0}`t{1}`t{2}`t{3}`r`n" -f (Get-Date -Format 'HH:mm:ss'), $p.tool_name, $filePath, $p.cwd

    # PostToolUse fires rapidly and several hook processes can hit this file at once;
    # a transient lock (AV scan, concurrent hook) silently dropped entries with Add-Content.
    # FileShare::ReadWrite + retry makes the append reliable - this file is the evidence
    # base for /daily-log and /weekly-retro, so a lost line is a lost decision.
    $bytes = [System.Text.Encoding]::UTF8.GetBytes($line)
    for ($i = 0; $i -lt 12; $i++) {
        try {
            $fs = New-Object System.IO.FileStream($out, [System.IO.FileMode]::Append, [System.IO.FileAccess]::Write, [System.IO.FileShare]::ReadWrite)
            $fs.Write($bytes, 0, $bytes.Length)
            $fs.Close()
            break
        } catch {
            Start-Sleep -Milliseconds 25
        }
    }
} catch {
    # swallow everything - evidence collection must not disturb the session
}

exit 0
