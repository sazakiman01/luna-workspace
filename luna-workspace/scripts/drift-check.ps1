# drift-check.ps1 - Luna System single-source-of-truth canary
#
# Run monthly (or from /luna-audit). Any hit = a fact escaped its owner again.
#
# Why: role count / Thai names / model-effort tier used to live in 7 files and drifted for
# months without anyone noticing. The fix was to give each fact exactly one owner; this script
# is what proves the fix is still holding.
#
# EXCLUDED ON PURPOSE (historical records - "12 roles" was TRUE when written;
# rewriting them destroys the ability to audit backwards):
#   _archived\  archive\  audits\  retrospective\  plans\
#
# Exit 0 = clean, 1 = drift found.

$ErrorActionPreference = 'SilentlyContinue'
[Console]::OutputEncoding = [System.Text.Encoding]::UTF8

$Root    = "C:\Users\sansakritsuk\.config\opencode"
$W       = "$Root\luna-workspace"
$Exclude = '\\(_archived|archive|audits|retrospective|plans)\\'

$live = Get-ChildItem $W -Recurse -Filter *.md -File |
        Where-Object { $_.FullName -notmatch $Exclude }

$checks = @(
    @{ name = 'hard-coded role count';  pattern = '\b1[2-9]\s+(roles?|Roles?|คน)|\b1[2-9]/1[2-9]\s+roles'
       why  = 'จำนวน role ไม่มีเจ้าของ - derive จาก agents/*.md เท่านั้น (ดู team-config.md)' }
    @{ name = 'ชื่อไทยผิด';              pattern = 'โอไรออน|เนบิวลา|คอสมอส|ศิริยะ|กาแล็กซี|วีกา|ออโรรา'
       why  = 'canonical: อริย/นภา/กสิณ/ศิริ/กัลยา/วิกา/อรุณ (CLAUDE.md + team-config.md)' }
    @{ name = 'Lyra = Windsurf Tooling'; pattern = 'Windsurf [Tt]ooling'
       why  = 'Lyra = Claude Code Tooling Specialist ตั้งแต่ migration' }
    @{ name = 'retired learning system'; pattern = 'hypothesis\.md|insights\.md|preferences\.md'
       why  = 'retired 2026-07-23 - learning อยู่ที่ agent-memory/<role>/ · ถ้าอ้างต้องกำกับว่า retired' }
)

$found = 0
foreach ($c in $checks) {
    # skip lines that are themselves the correction: annotations saying a thing is retired,
    # rules telling you not to hardcode, and notes recording what was removed.
    $exempt = 'retired|archived|ยกเลิกแล้ว|เอา .* ออก|ห้ามเขียน|อย่าเขียน|ถูกลบ|เคยอยู่|hard-coded|แหล่งเดียว'
    $hits = $live | Select-String -Pattern $c.pattern | Where-Object { $_.Line -notmatch $exempt }
    if ($hits) {
        $found += $hits.Count
        Write-Host "DRIFT: $($c.name)  [$($hits.Count) hits]" -ForegroundColor Yellow
        Write-Host "       $($c.why)"
        $hits | ForEach-Object { Write-Host "       $($_.Path.Replace($W,'')):$($_.LineNumber)  $($_.Line.Trim())" }
        Write-Host ""
    }
}

# structural invariants
$agents = Get-ChildItem "$Root\agents\*.md" -File
$noEffort = $agents | Where-Object { $_.BaseName -ne 'lyra' -and -not (Select-String $_.FullName -Pattern '^effort:' -Quiet) }
if ($noEffort) { $found++; Write-Host "DRIFT: agent ไม่มี effort: -> $($noEffort.BaseName -join ', ')" -ForegroundColor Yellow }

$pinned = $agents | Where-Object { Select-String $_.FullName -Pattern '^model:\s*claude-' -Quiet }
if ($pinned) { $found++; Write-Host "DRIFT: agent pin เลขรุ่น model -> $($pinned.BaseName -join ', ')" -ForegroundColor Yellow }

$settings = Get-Content "$Root\settings.json" -Raw | ConvertFrom-Json
if ($settings.PSObject.Properties.Name -contains 'effortLevel') {
    $found++
    Write-Host "DRIFT: settings.json มี effortLevel = '$($settings.effortLevel)' อีกแล้ว" -ForegroundColor Yellow
    Write-Host "       /effort เขียนค่านี้ลงไปและ persist ข้ามทุก session -> กด effort: ของทุก agent ที่ต่ำกว่า"
}

$claudeLines = (Get-Content "$Root\CLAUDE.md" | Measure-Object -Line).Lines
$ruleLines   = (Get-ChildItem "$Root\rules" -File -Filter *.md | ForEach-Object { (Get-Content $_.FullName | Measure-Object -Line).Lines } | Measure-Object -Sum).Sum
$budget = $claudeLines + $ruleLines
if ($budget -gt 250) { $found++; Write-Host "DRIFT: context budget = $budget บรรทัด/session (เพดาน 250)" -ForegroundColor Yellow }

if ($found -eq 0) {
    Write-Host "OK - no drift. context budget = $budget lines/session (CLAUDE.md $claudeLines + rules $ruleLines)" -ForegroundColor Green
    exit 0
}
Write-Host "$found drift item(s) found." -ForegroundColor Yellow
exit 1
