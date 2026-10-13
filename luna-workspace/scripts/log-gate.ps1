# log-gate.ps1 - Luna System end-of-turn log gates (daily decision log + weekly retro)
#
# Wired to: Stop hook
#
# Two independent gates, at most one block per turn:
#   A. daily gate  - work happened today but no decision log      -> marker .gate-<date>     (1x/day)
#   B. retro gate  - last week has no retro file, and today has work
#                    -> marker .gate-retro-<YYYY-Www>  (1x/week, NOT 1x/day: a daily nag for a
#                       weekly task is noise, and noise is what taught us to ignore reminders)
# Added 2026-08-17: the retro escalation used to be a suffix on the daily gate's message, so it
# could only fire on days the daily log was ALSO missing. Since discipline on daily logs went to
# 100%, that path never ran - which is why retro has been missing since W20.
#
# Why this exists:
#   SessionStart reminders fire at t=0, when there is provably nothing to log yet.
#   By the time real decisions exist, the reminder is buried. This gate fires at the
#   one moment the answer is knowable - the end of a turn - and it costs something to ignore.
#
# Contract (Claude Code Stop hook):
#   - stdin  : hook JSON (stop_hook_active, cwd, ...)
#   - exit 0 + {"decision":"block","reason":"..."} on stdout  -> turn does not end, Claude must respond
#   - exit 0 with no output -> turn ends normally
#
# SAFETY: ships with $Enforce = $false (observe-only).
#   Desktop App Stop-hook support is unverified. Observe mode writes what it WOULD have done
#   to stop-gate-observe.log. Empty after 3 days of real work = Stop hooks do not fire here,
#   the mechanism is dead, and that must be reported - not assumed away.
#   Flip $Enforce to $true only after the observe log has content.

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Enforce = $true           # enabled 2026-08-07 — observe log proved the Stop hook fires in the Desktop App
                           # (HEARTBEAT + WOULD BLOCK on the same day it was installed)
$MinDistinctFiles = 3      # read-only / discussion turns never gate

$LunaRoot = "$env:USERPROFILE\.claude\luna-workspace"
$LogDir   = "$LunaRoot\Luna\logs"
$DailyDir = "$LunaRoot\Luna\team\daily"
$RetroDir = "$LunaRoot\Luna\retrospective"

$today      = Get-Date -Format 'yyyy-MM-dd'
$Marker     = Join-Path $LogDir ".gate-$today"
$SeenMarker = Join-Path $LogDir ".gate-seen-$today"
$ObserveLog = Join-Path $LogDir "stop-gate-observe.log"
$WorkLog    = Join-Path $LogDir "worklog-$today.tsv"

function Note([string]$msg) {
    if (-not (Test-Path $LogDir)) { New-Item -ItemType Directory -Path $LogDir -Force | Out-Null }
    Add-Content -Path $ObserveLog -Value ("[{0}] {1}" -f (Get-Date -Format 'yyyy-MM-dd HH:mm:ss'), $msg) -Encoding UTF8
}

# marker = the only thing stopping a gate from re-firing. If the write fails the gate would nag
# again next turn, so a failure is worth a line in the observe log.
function Set-Marker([string]$path, [string]$text) {
    try {
        Set-Content -Path $path -Value $text -Encoding UTF8 -ErrorAction Stop
    } catch {
        Note ("WARN: could not write marker {0}: {1}" -f $path, $_.Exception.Message)
    }
}

function Get-WeekInfo([datetime]$d) {
    $cal = [System.Globalization.CultureInfo]::InvariantCulture.Calendar
    $w = $cal.GetWeekOfYear($d, [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday)
    return [PSCustomObject]@{ Year = $d.Year; Week = $w; Tag = ("{0}-W{1:D2}" -f $d.Year, $w) }
}

# retro filenames cover one week (2026-W19.md) or a range (2026-W20-W29-retroactive.md)
function Test-RetroExists([int]$year, [int]$week) {
    $hit = Get-ChildItem $RetroDir -File -Filter '*.md' -ErrorAction SilentlyContinue | Where-Object {
        if ($_.Name -match '^(\d{4})-W(\d{1,2})(?:-W(\d{1,2}))?') {
            $fy = [int]$Matches[1]; $fs = [int]$Matches[2]
            $fe = if ($Matches[3]) { [int]$Matches[3] } else { $fs }
            ($fy -eq $year) -and ($week -ge $fs) -and ($week -le $fe)
        } else { $false }
    } | Select-Object -First 1
    return [bool]$hit
}

# --- read hook payload ---
$payload = $null
if ([Console]::IsInputRedirected) {
    try {
        $raw = [Console]::In.ReadToEnd()
        if (-not [string]::IsNullOrWhiteSpace($raw)) { $payload = $raw | ConvertFrom-Json }
    } catch { }
}

# --- guard 1: never re-enter (without this the gate is an infinite loop) ---
if ($payload -and $payload.stop_hook_active) { exit 0 }

# --- heartbeat: prove once per day that this hook runs at all in this environment ---
if (-not (Test-Path $SeenMarker)) {
    Set-Content -Path $SeenMarker -Value (Get-Date -Format 'o') -Encoding UTF8
    Note ("HEARTBEAT: Stop hook fired (enforce={0})" -f $Enforce)
}

# --- guard 2: did this day actually produce work? (both gates require it) ---
if (-not (Test-Path $WorkLog)) { exit 0 }
$touched = Get-Content $WorkLog -ErrorAction SilentlyContinue |
           ForEach-Object { ($_ -split "`t")[2] } |
           Where-Object { $_ } | Sort-Object -Unique
if ($touched.Count -lt $MinDistinctFiles) { exit 0 }

$sample = ($touched | Select-Object -First 8 | ForEach-Object { Split-Path $_ -Leaf }) -join ', '

# --- what each gate is owed ---
# daily: log already written (global, or in the repo we are working in)?
$dailyLogged = (Test-Path (Join-Path $DailyDir "$today.md"))
if ((-not $dailyLogged) -and $payload -and $payload.cwd) {
    $dailyLogged = (Test-Path (Join-Path $payload.cwd "Luna\team\daily\$today.md"))
}
$dailyPending = (-not $dailyLogged) -and (-not (Test-Path $Marker))   # marker = at most 1x/day

# retro: last week's retro file. Within one ISO week, "today - 7 days" always lands in the same
# previous week, so the marker name is stable for the week -> fires at most once per week.
$lastWeek     = Get-WeekInfo (Get-Date).AddDays(-7)
$RetroMarker  = Join-Path $LogDir (".gate-retro-{0}" -f $lastWeek.Tag)
$retroPending = $false
try {
    $retroPending = (-not (Test-RetroExists $lastWeek.Year $lastWeek.Week)) -and (-not (Test-Path $RetroMarker))
} catch {
    Note ("WARN: retro check failed: {0}" -f $_.Exception.Message)
}

if (-not $dailyPending -and -not $retroPending) { exit 0 }

# --- gate A: daily decision log (takes precedence; carries the retro ask as a suffix) ---
if ($dailyPending) {
    $retroLine = ''
    if ($retroPending) {
        $retroLine = ("`nนอกจากนี้ retro ของ {0} ยังไม่มี — รัน /weekly-retro หรือถามพี่แมนตรงๆ ว่าจะ skip สัปดาห์นี้ไหม (อย่าเขียนค้างไว้ในไฟล์)" -f $lastWeek.Tag)
    }

    $reason = @"
วันนี้ ($today) แก้ไฟล์ไปแล้ว $($touched.Count) ไฟล์ ($sample) แต่ยังไม่มี decision log

เลือกอย่างใดอย่างหนึ่ง แล้วจบ turn:
1. ถ้ามี decision / learning / feedback -> รัน /daily-log เขียน $today.md (ดูหลักฐานที่ Luna/logs/worklog-$today.tsv)
2. ถ้าไม่มีจริงๆ -> พูดกับพี่แมนตรงๆ ว่า "วันนี้ไม่มี decision/learning/feedback -> ไม่บันทึก"

ห้ามเงียบ และห้ามแต่งเนื้อหาให้ดูมีของ$retroLine
"@

    $verb = 'BLOCKED'
    if (-not $Enforce) { $verb = 'WOULD BLOCK' }
    Set-Marker $Marker ("{0} {1}" -f $verb, (Get-Date -Format 'o'))
    # the retro ask was delivered in this same message -> spend the weekly marker too,
    # otherwise gate B would fire again tomorrow for a week already asked about
    if ($retroPending) { Set-Marker $RetroMarker ("asked via daily gate {0}" -f (Get-Date -Format 'o')) }
    Note ("{0}: {1} files, no daily log (retroPending={2}). files={3}" -f $verb, $touched.Count, $retroPending, $sample)

    if ($Enforce) { @{ decision = 'block'; reason = $reason } | ConvertTo-Json -Compress }
    exit 0
}

# --- gate B: weekly retro (fires on its own, even when the daily log is done) ---
$retroReason = @"
retro ของสัปดาห์ที่แล้ว ($($lastWeek.Tag)) ยังไม่มี และวันนี้ ($today) แก้ไฟล์ไป $($touched.Count) ไฟล์ ($sample) = สัปดาห์นี้มีงานจริง

เลือกอย่างใดอย่างหนึ่ง แล้วจบ turn:
1. รัน /weekly-retro เขียน Luna/retrospective/$($lastWeek.Tag).md (ถ้าทำย้อนหลัง ให้ flag retroactive ในไฟล์)
2. ถ้าจะข้าม -> ถามพี่แมนตรงๆ ว่า "จะ skip retro $($lastWeek.Tag) ไหมคะ" แล้วทำตามคำตอบ (workflows/weekly-retro.md อนุญาตให้ skip ได้ถ้าสัปดาห์นั้นงานน้อย)

ห้ามเงียบ และห้ามแต่งเนื้อหา retro ให้ดูมีของ
(gate นี้ยิงไม่เกินสัปดาห์ละครั้ง — marker: Luna/logs/.gate-retro-$($lastWeek.Tag))
"@

$verb = 'BLOCKED (retro)'
if (-not $Enforce) { $verb = 'WOULD BLOCK (retro)' }
Set-Marker $RetroMarker ("{0} {1}" -f $verb, (Get-Date -Format 'o'))
Note ("{0}: {1} missing, {2} files today. files={3}" -f $verb, $lastWeek.Tag, $touched.Count, $sample)

if ($Enforce) { @{ decision = 'block'; reason = $retroReason } | ConvertTo-Json -Compress }
exit 0
