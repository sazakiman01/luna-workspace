# session-reminders.ps1 - Luna System SessionStart reminder aggregator
# Purpose: รวม reminder ที่ "ควรเตือนทุก session" ไว้ที่เดียว (daily log / weekly retro)
# Designed for: SessionStart hook (additionalContext) — ไม่ block, แค่ inject ข้อความ
#
# Contract (Claude Code hook):
#   - รับ JSON ทาง stdin (ใช้ field `cwd` เพื่อหา <repo>/Luna/active-task.md)
#   - print ข้อความที่ stdout -> ถูก inject เป็น context ให้ Luna เห็นตอนเปิด session
#   - exit 0 เสมอ (reminder ห้าม block session)
#
# Read-only by design: ไม่สร้าง/แก้ไฟล์ใดๆ แค่ "อ่าน + เตือน"

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$LunaRoot   = Split-Path -Parent $PSScriptRoot
$DailyDir   = "$LunaRoot\Luna\team\daily"
# Retro อยู่ที่ Luna\retrospective\ ที่เดียว (รวมจาก team\retrospective\ เมื่อ 2026-08-07)
# ต้องตรงกับปลายทางที่ commands\weekly-retro.md เขียน ไม่งั้น reminder จะเตือนตลอดกาล
$RetroDir   = "$LunaRoot\Luna\retrospective"
$Today      = Get-Date

# --- stdin: hook payload (cwd ใช้หา active-task ราย repo) ---
$HookCwd = $null
if ([Console]::IsInputRedirected) {
    try {
        $raw = [Console]::In.ReadToEnd()
        if ($raw) { $HookCwd = ($raw | ConvertFrom-Json).cwd }
    } catch { }
}

$reminders = @()

# === 1. Daily log: เตือนถ้าวันนี้ยังไม่มี daily log และเป็นวันทำงาน ===
# CLAUDE.md: ทำงานในโปรเจกต์ -> decision log อยู่ที่ <repo>\Luna\team\daily\ ไม่ใช่ global
# เดิมเช็ค global ที่เดียว -> 2026-08-17 เตือนผิดทั้งที่มี log 115 บรรทัดใน D:\coding\eat-team
# (pattern เดียวกับ log-gate.ps1 guard 4 ที่ทำถูกอยู่แล้ว)
$todayStr = $Today.ToString('yyyy-MM-dd')
$dailyDirs = @()
if ($HookCwd) { $dailyDirs += (Join-Path $HookCwd 'Luna\team\daily') }
$dailyDirs += $DailyDir
$dailyDirs = @($dailyDirs | Where-Object { Test-Path $_ })

$todayLog = $null
foreach ($d in $dailyDirs) {
    $cand = Join-Path $d "$todayStr.md"
    if (Test-Path $cand) { $todayLog = $cand; break }
}

if (($dailyDirs.Count -gt 0) -and (-not $todayLog)) {
    # หา daily log ล่าสุด (ไม่นับ .log) — ดูได้แค่ global + repo ปัจจุบัน
    # ไม่สแกนทุก repo ทั้งเครื่อง (ไม่มี registry ของ repo และ hook ต้องเร็ว) -> ถ้อยคำจึงพูดว่า
    # "ที่เห็น" ไม่ใช่ "ล่าสุด" เพราะ repo อื่นอาจมี log ใหม่กว่าที่ hook นี้มองไม่เห็น
    $lastLog = $dailyDirs |
               ForEach-Object { Get-ChildItem $_ -File -Filter '*.md' -EA SilentlyContinue } |
               Where-Object { $_.Name -match '^\d{4}-\d{2}-\d{2}\.md$' } |
               Sort-Object Name -Descending | Select-Object -First 1
    $lastTxt = if ($lastLog) { "ล่าสุดที่เห็น: $($lastLog.BaseName)" } else { "ยังไม่เห็น daily log ใน global + repo นี้" }
    $reminders += "DAILY LOG: วันนี้ ($todayStr) ยังไม่มี decision log ($lastTxt). ถ้า session นี้มี decision/learning/feedback ให้สร้าง $todayStr.md ใน Luna/team/daily/ ของ repo ที่ทำงานอยู่ (อย่าจดถ้าเป็นแค่ activity)."
}

# === 2. Weekly retro: เตือนถ้าสัปดาห์ที่แล้วยังไม่มี retro file ===
if (Test-Path $RetroDir) {
    # ISO week ของสัปดาห์ที่แล้ว
    $cal = [System.Globalization.CultureInfo]::InvariantCulture.Calendar
    $lastWeekDate = $Today.AddDays(-7)
    $isoWeek = $cal.GetWeekOfYear($lastWeekDate, [System.Globalization.CalendarWeekRule]::FirstFourDayWeek, [System.DayOfWeek]::Monday)
    $isoYear = $lastWeekDate.Year
    $weekTag = "{0}-W{1:D2}" -f $isoYear, $isoWeek

    # ชื่อไฟล์ retro รองรับทั้งสัปดาห์เดียว (2026-W19.md) และช่วง (2026-W20-W29-retroactive.md)
    # substring match เดิม (-Filter "*$weekTag*") match ช่วงไม่ได้ -> W21-W28 ถูกเตือนตลอดกาล
    $retroFile = Get-ChildItem $RetroDir -File -Filter '*.md' -EA SilentlyContinue | Where-Object {
        if ($_.Name -match '^(\d{4})-W(\d{1,2})(?:-W(\d{1,2}))?') {
            $fy = [int]$Matches[1]
            $fs = [int]$Matches[2]
            $fe = if ($Matches[3]) { [int]$Matches[3] } else { $fs }
            ($fy -eq $isoYear) -and ($isoWeek -ge $fs) -and ($isoWeek -le $fe)
        } else { $false }
    } | Select-Object -First 1

    if (-not $retroFile) {
        $reminders += "WEEKLY RETRO: ยังไม่มี retro ของสัปดาห์ที่แล้ว ($weekTag). พิจารณารัน /weekly-retro (real-time = เย็นอาทิตย์/เช้าจันทร์). ถ้า skip ไปแล้วให้ flag retroactive."
    }
}

# === 3. Active task: เตือนถ้ามีงานค้างข้าม session ===
# luna-core.md กำหนดไว้ที่ <repo>/Luna/active-task.md (ราย repo) — เช็ค cwd ก่อน แล้วค่อย fallback global
$activeCandidates = @()
if ($HookCwd) { $activeCandidates += (Join-Path $HookCwd 'Luna\active-task.md') }
$activeCandidates += (Join-Path $LunaRoot 'Luna\active-task.md')
$activeTask = $activeCandidates | Where-Object { Test-Path $_ } | Select-Object -First 1
if ($activeTask) {
    $reminders += "ACTIVE TASK: มีงานค้างใน $activeTask — อ่านเพื่อ resume สถานะงานก่อนเริ่มใหม่ (ถ้าเสร็จแล้วให้ลบ/archive)."
}

# === Output ===
if ($reminders.Count -gt 0) {
    Write-Output "[Luna reminders @ $todayStr]"
    foreach ($r in $reminders) { Write-Output "- $r" }
}

exit 0
