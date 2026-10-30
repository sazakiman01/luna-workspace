<#
.SYNOPSIS
    Export เฉพาะ SYSTEM files จาก luna-workspace (ไม่รวม dynamic data)
    เพื่อใช้บนเครื่องอื่นหรือแจกให้คนอื่น

.PARAMETER OutputPath
    โฟลเดอร์ปลายทางที่จะ export ไป

.EXAMPLE
    .\Export-LunaSystem.ps1 -OutputPath "D:\luna-export"
#>
param(
    [Parameter(Mandatory=$true)]
    [string]$OutputPath
)

$SourcePath = Split-Path -Parent (Split-Path -Parent $PSScriptRoot)
if (-not (Test-Path "$SourcePath\ARCHITECTURE.md")) {
    $SourcePath = Split-Path -Parent $PSScriptRoot
}

Write-Host "=== Luna System Export ===" -ForegroundColor Cyan
Write-Host "Source: $SourcePath"
Write-Host "Output: $OutputPath"
Write-Host ""

# --- SYSTEM directories (copy entirely) ---
$systemDirs = @(
    "rules",
    "templates",
    "workflows",
    "knowledge-package-generic",
    "knowledge-package-pmam",
    "team\roles",
    "Luna\skills",
    "skills"
)

# --- SYSTEM files (copy individually) ---
$systemFiles = @(
    "README.md",
    "ARCHITECTURE.md",
    ".gitignore",
    "team\team-config.md",
    "team\decision-global-vs-per-repo.md",
    "team\onboarding-template.md",
    "team\README.md",
    "Luna\README.md",
    "Luna\skills\luna-principal-skill.md"
)

# --- SYSTEM patterns (glob within team/<role>/) ---
$roleNames = @("orion","nova","stella","nebula","cosmos","sirius","galaxy","vega","aurora","pulsar","lyra","polaris")

# --- DATA directories to create empty (for structure) ---
$emptyDataDirs = @(
    "Luna\team\daily",
    "Luna\retrospective",
    "team\audits",
    "team\case-studies",
    "team\preferences",
    "plans",
    "repo-index"
)

# Create output root
if (Test-Path $OutputPath) {
    Write-Host "WARNING: Output path exists. Files may be overwritten." -ForegroundColor Yellow
}
New-Item -ItemType Directory -Force -Path $OutputPath | Out-Null

# Copy SYSTEM directories
Write-Host "`n[1/4] Copying SYSTEM directories..." -ForegroundColor Green
foreach ($dir in $systemDirs) {
    $src = Join-Path $SourcePath $dir
    $dst = Join-Path $OutputPath $dir
    if (Test-Path $src) {
        Copy-Item -Path $src -Destination $dst -Recurse -Force
        Write-Host "  + $dir"
    } else {
        Write-Host "  - $dir (not found, skipping)" -ForegroundColor Yellow
    }
}

# Copy SYSTEM files
Write-Host "`n[2/4] Copying SYSTEM files..." -ForegroundColor Green
foreach ($file in $systemFiles) {
    $src = Join-Path $SourcePath $file
    $dst = Join-Path $OutputPath $file
    if (Test-Path $src) {
        $dstDir = Split-Path -Parent $dst
        New-Item -ItemType Directory -Force -Path $dstDir | Out-Null
        Copy-Item -Path $src -Destination $dst -Force
        Write-Host "  + $file"
    }
}

# Copy role skills + knowledge (SYSTEM parts of team/<role>/)
Write-Host "`n[3/4] Copying role skills & knowledge..." -ForegroundColor Green
foreach ($role in $roleNames) {
    $roleSrc = Join-Path $SourcePath "team\$role"
    if (Test-Path $roleSrc) {
        # Copy skills/ directory
        $skillsSrc = Join-Path $roleSrc "skills"
        if (Test-Path $skillsSrc) {
            $skillsDst = Join-Path $OutputPath "team\$role\skills"
            Copy-Item -Path $skillsSrc -Destination $skillsDst -Recurse -Force
            Write-Host "  + team\$role\skills"
        }
        # Copy knowledge/ directory
        $knowledgeSrc = Join-Path $roleSrc "knowledge"
        if (Test-Path $knowledgeSrc) {
            $knowledgeDst = Join-Path $OutputPath "team\$role\knowledge"
            Copy-Item -Path $knowledgeSrc -Destination $knowledgeDst -Recurse -Force
            Write-Host "  + team\$role\knowledge"
        }
        # Copy learning-paths.md if exists
        $lpSrc = Join-Path $roleSrc "learning-paths.md"
        if (Test-Path $lpSrc) {
            $lpDst = Join-Path $OutputPath "team\$role\learning-paths.md"
            New-Item -ItemType Directory -Force -Path (Split-Path -Parent $lpDst) | Out-Null
            Copy-Item -Path $lpSrc -Destination $lpDst -Force
            Write-Host "  + team\$role\learning-paths.md"
        }
    }
}

# Create empty DATA directories (for structure)
Write-Host "`n[4/4] Creating empty DATA directories..." -ForegroundColor Green
foreach ($dir in $emptyDataDirs) {
    $dst = Join-Path $OutputPath $dir
    New-Item -ItemType Directory -Force -Path $dst | Out-Null
    # Create placeholder README
    $readme = Join-Path $dst "README.md"
    if (-not (Test-Path $readme)) {
        Set-Content -Path $readme -Value "# $(Split-Path -Leaf $dir)`n`n*Data directory — files will be created during usage*"
    }
    Write-Host "  + $dir (empty)"
}

# Copy preferences template
$prefTemplate = Join-Path $SourcePath "team\preferences\_TEMPLATE.md"
if (Test-Path $prefTemplate) {
    $prefDst = Join-Path $OutputPath "team\preferences\_TEMPLATE.md"
    Copy-Item -Path $prefTemplate -Destination $prefDst -Force
    # Create empty preference files for each role
    foreach ($role in $roleNames) {
        $emptyPref = Join-Path $OutputPath "team\preferences\$role.md"
        Copy-Item -Path $prefTemplate -Destination $emptyPref -Force
    }
    Write-Host "  + team\preferences\ (templates for all roles)"
}

# Summary
$systemCount = (Get-ChildItem -Path $OutputPath -File -Recurse).Count
Write-Host "`n=== Export Complete ===" -ForegroundColor Cyan
Write-Host "Total files: $systemCount"
Write-Host "Output: $OutputPath"
Write-Host ""
Write-Host "To use on another machine:" -ForegroundColor Yellow
Write-Host "  1. Copy $OutputPath to the target machine at %USERPROFILE%\.config\opencode\luna-workspace\"
Write-Host "  2. Open opencode -> ready to use!"
Write-Host ""
