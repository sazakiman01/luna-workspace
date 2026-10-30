# Setup-LunaRepo.ps1
# ตั้งค่า Luna + Team ให้กับ repo ใหม่ (Hybrid structure)
#
# การใช้งาน:
#   . "C:\Users\sansakritsuk\.config\opencode\luna-workspace\templates\Setup-LunaRepo.ps1" -RepoPath "D:\coding\MyNewRepo" -ProjectName "MyNewRepo"
#
# Parameters:
#   -RepoPath       path ของ repo (required)
#   -ProjectName    ชื่อโปรเจกต์ (default = ชื่อโฟลเดอร์)
#   -Force          overwrite ไฟล์ที่มีอยู่แล้ว

param(
    [Parameter(Mandatory=$true)]
    [string]$RepoPath,

    [string]$ProjectName = "",

    [switch]$Force
)

$ErrorActionPreference = "Stop"
$GlobalRoot = "$env:USERPROFILE\.config\opencode\luna-workspace"

# Validate
if (-not (Test-Path $RepoPath)) {
    Write-Error "Repo path ไม่พบ: $RepoPath"
    exit 1
}

if (-not (Test-Path $GlobalRoot)) {
    Write-Error "Global Luna workspace ไม่พบ: $GlobalRoot`nกรุณาติดตั้ง Luna ก่อน (copy luna-workspace folder ไปที่ $env:USERPROFILE\.config\opencode\)"
    exit 1
}

if ([string]::IsNullOrWhiteSpace($ProjectName)) {
    $ProjectName = Split-Path $RepoPath -Leaf
}

Write-Host "?? Luna Repo Setup" -ForegroundColor Cyan
Write-Host "   Repo: $RepoPath" -ForegroundColor Gray
Write-Host "   Name: $ProjectName" -ForegroundColor Gray
Write-Host ""

# 1. สร้างโครงสร้างโฟลเดอร์ (opencode convention: Luna/team/daily/ ตรง AGENTS.md)
$dirs = @(
    "$RepoPath\.opencode",
    "$RepoPath\Luna\team\daily",
    "$RepoPath\Luna\retrospective"
)

foreach ($d in $dirs) {
    if (-not (Test-Path $d)) {
        New-Item -ItemType Directory -Path $d -Force | Out-Null
        Write-Host "  ? Created: $($d.Replace($RepoPath, '<repo>'))" -ForegroundColor Green
    } else {
        Write-Host "  • Exists:  $($d.Replace($RepoPath, '<repo>'))" -ForegroundColor DarkGray
    }
}

# 2. Copy project-context.md จาก template (opencode ไม่ auto-load → Luna เปิดอ่านเองเมื่อเริ่มงาน)
$ctxDest = "$RepoPath\.opencode\project-context.md"
if ((Test-Path $ctxDest) -and -not $Force) {
    Write-Host "  • Exists:  <repo>\.opencode\project-context.md (ไม่แตะ, ใช้ -Force ถ้าต้องการ overwrite)" -ForegroundColor DarkGray
} else {
    $tpl = Get-Content "$GlobalRoot\templates\project-context.template.md" -Raw
    $tpl = $tpl -replace '\[PROJECT_NAME\]', $ProjectName
    Set-Content -Path $ctxDest -Value $tpl -Encoding UTF8
    Write-Host "  ? Created: <repo>\.opencode\project-context.md (ต้องแก้ tech stack + constraints)" -ForegroundColor Green
}

# 2b. Copy team-local.md จาก template
$teamLocalDest = "$RepoPath\Luna\team\team-local.md"
$teamLocalTpl = "$GlobalRoot\templates\team-local.template.md"
if ((Test-Path $teamLocalDest) -and -not $Force) {
    Write-Host "  • Exists:  <repo>\Luna\team\team-local.md" -ForegroundColor DarkGray
} elseif (Test-Path $teamLocalTpl) {
    $tpl2 = Get-Content $teamLocalTpl -Raw
    $tpl2 = $tpl2 -replace '\[PROJECT_NAME\]', $ProjectName
    Set-Content -Path $teamLocalDest -Value $tpl2 -Encoding UTF8
    Write-Host "  ? Created: <repo>\Luna\team\team-local.md (list specialist ของ repo นี้)" -ForegroundColor Green
}

# 3. สร้างไฟล์เริ่มต้น (ว่างๆ)
$files = @{
    "$RepoPath\Luna\decisions.md"        = "# Decisions - $ProjectName`n`n*บันทึกการตัดสินใจสำคัญของโปรเจกต์*`n"
    "$RepoPath\Luna\feedback.md"         = "# Feedback - $ProjectName`n`n*Feedback จากพี่แมน + บทเรียน*`n"
    "$RepoPath\Luna\team\performance.md" = "# Team Performance - $ProjectName`n`n*Performance ของแต่ละ Role ใน repo นี้*`n"
}

foreach ($f in $files.GetEnumerator()) {
    if ((Test-Path $f.Key) -and -not $Force) {
        Write-Host "  • Exists:  $($f.Key.Replace($RepoPath, '<repo>'))" -ForegroundColor DarkGray
    } else {
        Set-Content -Path $f.Key -Value $f.Value -Encoding UTF8
        Write-Host "  ? Created: $($f.Key.Replace($RepoPath, '<repo>'))" -ForegroundColor Green
    }
}

Write-Host ""
Write-Host "? Luna พร้อมใช้งานที่ $RepoPath แล้วค่ะ ??" -ForegroundColor Cyan
Write-Host ""
Write-Host "ขั้นต่อไป:" -ForegroundColor Yellow
Write-Host "  1. เปิด repo ใน opencode" -ForegroundColor White
Write-Host "  2. แก้ <repo>\.opencode\project-context.md ให้ตรงกับโปรเจกต์" -ForegroundColor White
Write-Host "  3. เริ่มงานได้เลย — Luna จะอ่าน project-context + project-memory ให้เองตอนเริ่มงาน" -ForegroundColor White
