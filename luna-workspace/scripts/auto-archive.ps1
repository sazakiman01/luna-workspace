# auto-archive.ps1 - Luna System Auto-Archive
# Reduce context bloat: repo-index + daily logs
#
# Modes:
#   -CheckOnly  : check + warn only (default for SessionStart hook)
#   (no flag)   : real archive (manual run — use `/luna-archive` to trigger)
#
# Triggers:
#   daily/         : *.md files > 14 days  -> _archived/YYYY-MM/ + INDEX.md
#   repo-index/    : snapshots not modified > 90 days -> _archived/
#   AGENTS.md      : warn if > 200 lines
#
# NOTE: hypothesis.md / insights.md monitoring removed 2026-07-23 —
# that learning system retired in favor of manual memory + agent-memory.

param(
    [switch]$CheckOnly
)

$ErrorActionPreference = 'Continue'
$LunaRoot = Split-Path -Parent $PSScriptRoot
$ArchiveDir = "$LunaRoot\Luna\archive"
$LogDir = "$LunaRoot\Luna\logs"
$LogFile = "$LogDir\$(Get-Date -Format 'yyyy-MM-dd')-auto-archive.log"
$Today = Get-Date

# -CheckOnly is read-only by contract: no directories, no log file, no stdout noise.
# SessionStart injects this script's stdout into Luna's context, so in CheckOnly mode
# only lines the user can act on are printed (see Write-Log -Actionable).
if (-not $CheckOnly) {
    if (-not (Test-Path $ArchiveDir)) {
        New-Item -ItemType Directory -Path $ArchiveDir -Force | Out-Null
    }
    if (-not (Test-Path $LogDir)) {
        New-Item -ItemType Directory -Path $LogDir -Force | Out-Null
    }
}

# Every file write in this script goes through these two helpers.
#
# 2026-08-17 incident: Add-Content to INDEX.md failed twice with "Stream was not readable"
# while the script still logged "Updated INDEX.md with 1 entries" — files moved, index empty,
# log lied. Two separate defects, both fixed here:
#   1. reporting: -ErrorAction SilentlyContinue + an unconditional success message
#      -> now -ErrorAction Stop inside the scriptblock + the log follows the real result.
#   2. the write itself: reproduced in a sandbox (probe: Set-Content then Add-Content on the
#      same path in the same process) — Add-Content -Encoding UTF8 throws "Stream was not
#      readable" for ~1s afterwards even with nothing else touching the file, i.e. a provider
#      quirk, not a real lock. 3 retries x 200ms did NOT clear it.
#      -> file writes use [System.IO.File]::AppendAllText instead, which is deterministic,
#         still emits the UTF-8 BOM on create, and still throws on a genuine lock (verified).
function Invoke-WriteRetry {
    param([Parameter(Mandatory = $true)][scriptblock]$Action, [int]$Retries = 3, [int]$DelayMs = 200)
    $lastErr = $null
    for ($i = 1; $i -le $Retries; $i++) {
        try {
            & $Action
            return [PSCustomObject]@{ Ok = $true; Error = $null; Attempts = $i }
        } catch {
            $lastErr = $_.Exception.Message
            if ($i -lt $Retries) { Start-Sleep -Milliseconds $DelayMs }
        }
    }
    return [PSCustomObject]@{ Ok = $false; Error = $lastErr; Attempts = $Retries }
}

# append lines as UTF-8 (BOM on create) — throws on failure, so callers can report the truth
function Add-Utf8Lines {
    # AllowEmptyString: blank lines are real content here ("" separators in INDEX.md);
    # a Mandatory [string[]] would reject them with "argument is an empty string"
    param([Parameter(Mandatory = $true)][string]$Path, [AllowEmptyString()][string[]]$Lines = @())
    $text = (($Lines -join "`r`n") + "`r`n")
    [System.IO.File]::AppendAllText($Path, $text, (New-Object System.Text.UTF8Encoding($true)))
}

function Write-Log {
    param([string]$Message, [switch]$Actionable)
    if ($CheckOnly) {
        # context is expensive — emit only what the user must act on, without timestamp noise
        if ($Actionable) { Write-Host $Message }
        return
    }
    $timestamp = Get-Date -Format 'yyyy-MM-dd HH:mm:ss'
    $line = "[$timestamp] $Message"
    Write-Host $line
    $r = Invoke-WriteRetry { Add-Utf8Lines -Path $LogFile -Lines @($line) }
    # cannot log a log-file failure to the log file — say it on stdout instead (no recursion)
    if (-not $r.Ok) { Write-Host "ERROR: could not write log file ${LogFile}: $($r.Error)" }
}

Write-Log "Luna auto-archive starting (CheckOnly=$CheckOnly)"

# === 1. repo-index ===
$RepoIndex = "$LunaRoot\repo-index"
if (Test-Path $RepoIndex) {
    try {
        $size = (Get-ChildItem $RepoIndex -Recurse -ErrorAction SilentlyContinue |
                 Measure-Object -Property Length -Sum).Sum
        $sizeMB = [math]::Round($size / 1MB, 2)
        Write-Log "repo-index: $sizeMB MB"

        if ($sizeMB -gt 5) {
            Write-Log -Actionable "WARNING: repo-index > 5 MB ($sizeMB MB)."
        }

        $cutoff = $Today.AddDays(-90)
        $oldDirs = Get-ChildItem $RepoIndex -Directory -ErrorAction SilentlyContinue |
                   Where-Object { $_.LastWriteTime -lt $cutoff -and $_.Name -ne '_archived' }

        foreach ($dir in $oldDirs) {
            Write-Log "INFO: $($dir.Name) not modified since $($dir.LastWriteTime)"
            if (-not $CheckOnly) {
                $archivedRoot = "$RepoIndex\_archived"
                $prep = Invoke-WriteRetry {
                    if (-not (Test-Path $archivedRoot)) {
                        New-Item -ItemType Directory -Path $archivedRoot -Force -ErrorAction Stop | Out-Null
                    }
                }
                if (-not $prep.Ok) {
                    Write-Log "ERROR: could not create ${archivedRoot}: $($prep.Error). $($dir.Name) NOT moved."
                    continue
                }
                $dest = "$archivedRoot\$($dir.Name)"
                $mv = Invoke-WriteRetry { Move-Item $dir.FullName $dest -Force -ErrorAction Stop }
                if ($mv.Ok) {
                    Write-Log "Moved $($dir.Name) to _archived/"
                } else {
                    Write-Log "ERROR: could not move $($dir.Name) to _archived/: $($mv.Error). Left in place."
                }
            }
        }
    } catch {
        Write-Log "ERROR scanning repo-index: $($_.Exception.Message)"
    }
}

# === 2. Daily Log Archive (14-day rolling) ===
$DailyDir = "$LunaRoot\Luna\team\daily"
if (Test-Path $DailyDir) {
    $cutoff = $Today.AddDays(-14)
    $allDailyFiles = Get-ChildItem $DailyDir -File -Filter "*.md" -ErrorAction SilentlyContinue |
                     Where-Object { $_.Name -match '^\d{4}-\d{2}-\d{2}' }

    $totalLines = 0
    $oldFiles = @()
    foreach ($file in $allDailyFiles) {
        $lc = (Get-Content $file.FullName -ErrorAction SilentlyContinue | Measure-Object -Line).Lines
        $totalLines += $lc

        if ($file.Name -match '^(\d{4})-(\d{2})-(\d{2})') {
            try {
                $fileDate = Get-Date -Year $Matches[1] -Month $Matches[2] -Day $Matches[3]
                if ($fileDate -lt $cutoff) {
                    $oldFiles += [PSCustomObject]@{ File = $file; Date = $fileDate; Lines = $lc }
                }
            } catch {
                Write-Log "WARN: could not parse date from $($file.Name)"
            }
        }
    }

    Write-Log "daily/: $($allDailyFiles.Count) files, $totalLines total lines, $($oldFiles.Count) older than 14 days"

    if ($oldFiles.Count -gt 0) {
        $oldLines = ($oldFiles | Measure-Object -Property Lines -Sum).Sum
        if ($CheckOnly) {
            Write-Log -Actionable "WARNING: $($oldFiles.Count) daily logs older than 14 days ($oldLines lines). Run '/luna-archive' (real mode) to archive them."
        } else {
            Write-Log "WARNING: $($oldFiles.Count) daily logs older than 14 days ($oldLines lines)."
        }

        if (-not $CheckOnly) {
            $archivedRoot = "$DailyDir\_archived"
            $prep = Invoke-WriteRetry {
                if (-not (Test-Path $archivedRoot)) {
                    New-Item -ItemType Directory -Path $archivedRoot -Force -ErrorAction Stop | Out-Null
                }
            }
            if (-not $prep.Ok) {
                Write-Log "ERROR: could not create ${archivedRoot}: $($prep.Error). Nothing archived this run."
                Write-Log "Luna auto-archive completed (with errors)"
                exit 0
            }

            $indexEntries = @()
            foreach ($entry in $oldFiles) {
                $yyyymm = $entry.Date.ToString('yyyy-MM')
                $destDir = "$archivedRoot\$yyyymm"
                $mkdir = Invoke-WriteRetry {
                    if (-not (Test-Path $destDir)) {
                        New-Item -ItemType Directory -Path $destDir -Force -ErrorAction Stop | Out-Null
                    }
                }
                if (-not $mkdir.Ok) {
                    Write-Log "ERROR: could not create ${destDir}: $($mkdir.Error). $($entry.File.Name) NOT archived."
                    continue
                }
                $dest = "$destDir\$($entry.File.Name)"

                $h1 = (Get-Content $entry.File.FullName -ErrorAction SilentlyContinue |
                       Where-Object { $_ -match '^#\s+' } | Select-Object -First 1) -replace '^#\s+',''
                if ([string]::IsNullOrWhiteSpace($h1)) { $h1 = $entry.File.BaseName }

                # index entry is only claimed for files that really moved
                $mv = Invoke-WriteRetry { Move-Item $entry.File.FullName $dest -Force -ErrorAction Stop }
                if (-not $mv.Ok) {
                    Write-Log "ERROR: could not archive $($entry.File.Name): $($mv.Error). Left in daily/."
                    continue
                }
                Write-Log "Archived $($entry.File.Name) to _archived/$yyyymm/"

                $indexEntries += "- [$yyyymm/$($entry.File.Name)]($yyyymm/$($entry.File.Name)) - $h1 ($($entry.Lines) lines)"
            }

            if ($indexEntries.Count -gt 0) {
                $indexPath = "$archivedRoot\INDEX.md"
                $dateStr = Get-Date -Format 'yyyy-MM-dd'
                $indexOk = $true
                $indexErr = $null

                if (-not (Test-Path $indexPath)) {
                    $r = Invoke-WriteRetry { Add-Utf8Lines -Path $indexPath -Lines @("# Daily Logs Archive Index", "") }
                    if (-not $r.Ok) { $indexOk = $false; $indexErr = $r.Error }
                }

                if ($indexOk) {
                    # header + entries in ONE append: a partial write cannot leave a dangling header
                    $block = @("", "## Archived $dateStr", "") + $indexEntries
                    $r = Invoke-WriteRetry { Add-Utf8Lines -Path $indexPath -Lines $block }
                    if (-not $r.Ok) { $indexOk = $false; $indexErr = $r.Error }
                }

                if ($indexOk) {
                    Write-Log "Updated INDEX.md with $($indexEntries.Count) entries"
                } else {
                    # files are already moved — the index is now the only thing missing.
                    # print every lost entry verbatim so it can be pasted back by hand.
                    Write-Log "ERROR: could not update INDEX.md ($indexErr). Files WERE moved. Add these $($indexEntries.Count) entries by hand to ${indexPath} under '## Archived ${dateStr}':"
                    foreach ($e in $indexEntries) { Write-Log "ERROR:   MISSING INDEX ENTRY: $e" }
                }
            } else {
                Write-Log "ERROR: 0 of $($oldFiles.Count) files archived — INDEX.md not touched."
            }
        }
    }
}

# === 3. AGENTS.md ===
$AgentsMd = Join-Path (Split-Path -Parent $LunaRoot) 'AGENTS.md'
if (Test-Path $AgentsMd) {
    $lines = (Get-Content $AgentsMd | Measure-Object -Line).Lines
    Write-Log "AGENTS.md: $lines lines"
    if ($lines -gt 200) {
        Write-Log -Actionable "WARNING: AGENTS.md > 200 lines ($lines)."
    }
}

Write-Log "Luna auto-archive completed"
exit 0
