<#
.SYNOPSIS
    Reset dynamic DATA files — keep SYSTEM intact
    ใช้เมื่อต้องการเริ่มต้นใหม่สะอาด (performance scores, daily logs, etc.)

.PARAMETER Confirm
    ต้องใส่ -Confirm เพื่อยืนยัน (ป้องกันลบโดยไม่ตั้งใจ)

.PARAMETER BackupFirst
    Backup data ก่อนลบ (default: true)

.EXAMPLE
    .\Reset-LunaData.ps1 -Confirm
    .\Reset-LunaData.ps1 -Confirm -BackupFirst $false
#>
param(
    [switch]$Confirm,
    [bool]$BackupFirst = $true
)

$WorkspacePath = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not (Test-Path "$WorkspacePath\ARCHITECTURE.md")) {
    $WorkspacePath = Split-Path -Parent $PSScriptRoot
}

if (-not $Confirm) {
    Write-Host "=== Luna Data Reset (DRY RUN) ===" -ForegroundColor Yellow
    Write-Host "Add -Confirm to actually reset. Showing what WOULD be deleted:`n"
} else {
    Write-Host "=== Luna Data Reset ===" -ForegroundColor Red
}

# --- DATA files to delete ---
$dataFiles = @(
    "Luna\hypothesis.md",
    "Luna\insights.md",
    "Luna\preferences.md",
    "Luna\windsurf-updates.md",
    "team\performance.md",
    "team\health-dashboard.md",
    "team\skill-gap-analysis.md",
    "team\onboarding.md"
)

# --- DATA directories to clear (delete contents, keep folder) ---
$dataDirs = @(
    "Luna\team\daily",
    "Luna\retrospective",
    "team\audits",
    "team\case-studies",
    "team\retrospective",
    "team\_archived",
    "plans\archive"
)

# --- MIXED files to reset to template ---
$prefTemplate = Join-Path $WorkspacePath "team\preferences\_TEMPLATE.md"
$roleNames = @("orion","nova","stella","nebula","cosmos","sirius","galaxy","vega","aurora","pulsar","lyra","polaris")

# Backup first
if ($Confirm -and $BackupFirst) {
    $backupName = "luna-data-backup-$(Get-Date -Format yyyyMMdd-HHmmss)"
    $backupPath = Join-Path ([System.IO.Path]::GetTempPath()) $backupName
    Write-Host "[Backup] Saving data to: $backupPath" -ForegroundColor Cyan
    New-Item -ItemType Directory -Force -Path $backupPath | Out-Null

    foreach ($file in $dataFiles) {
        $src = Join-Path $WorkspacePath $file
        if (Test-Path $src) {
            $dst = Join-Path $backupPath $file
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $dst) | Out-Null
            Copy-Item -Path $src -Destination $dst -Force
        }
    }
    foreach ($dir in $dataDirs) {
        $src = Join-Path $WorkspacePath $dir
        if (Test-Path $src) {
            $dst = Join-Path $backupPath $dir
            Copy-Item -Path $src -Destination $dst -Recurse -Force
        }
    }
    Write-Host "[Backup] Done.`n"
}

# Delete DATA files
Write-Host "[1/3] DATA files:" -ForegroundColor Green
foreach ($file in $dataFiles) {
    $fullPath = Join-Path $WorkspacePath $file
    if (Test-Path $fullPath) {
        if ($Confirm) {
            Remove-Item -Path $fullPath -Force
            Write-Host "  DELETED: $file" -ForegroundColor Red
        } else {
            Write-Host "  WOULD DELETE: $file" -ForegroundColor Yellow
        }
    }
}

# Clear DATA directories
Write-Host "`n[2/3] DATA directories (clear contents):" -ForegroundColor Green
foreach ($dir in $dataDirs) {
    $fullPath = Join-Path $WorkspacePath $dir
    if (Test-Path $fullPath) {
        $itemCount = (Get-ChildItem -Path $fullPath -File -Recurse -ErrorAction SilentlyContinue).Count
        if ($Confirm) {
            Get-ChildItem -Path $fullPath -Recurse -File | Remove-Item -Force
            Write-Host "  CLEARED: $dir ($itemCount files)" -ForegroundColor Red
        } else {
            Write-Host "  WOULD CLEAR: $dir ($itemCount files)" -ForegroundColor Yellow
        }
    }
}

# Reset MIXED files (preferences → template)
Write-Host "`n[3/3] MIXED files (reset to template):" -ForegroundColor Green
if (Test-Path $prefTemplate) {
    foreach ($role in $roleNames) {
        $prefFile = Join-Path $WorkspacePath "team\preferences\$role.md"
        if (Test-Path $prefFile) {
            if ($Confirm) {
                Copy-Item -Path $prefTemplate -Destination $prefFile -Force
                Write-Host "  RESET: team\preferences\$role.md" -ForegroundColor Magenta
            } else {
                Write-Host "  WOULD RESET: team\preferences\$role.md" -ForegroundColor Yellow
            }
        }
    }
}

# Summary
Write-Host ""
if ($Confirm) {
    Write-Host "=== Reset Complete ===" -ForegroundColor Green
    Write-Host "SYSTEM files untouched. DATA cleared. MIXED reset to template."
    if ($BackupFirst) {
        Write-Host "Backup at: $backupPath" -ForegroundColor Cyan
    }
} else {
    Write-Host "=== DRY RUN Complete ===" -ForegroundColor Yellow
    Write-Host "No files were changed. Run with -Confirm to apply."
}
Write-Host ""
