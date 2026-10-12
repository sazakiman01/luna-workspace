# Luna status line for Claude Code (Windows / PowerShell)
# Reads the session JSON from stdin and prints one Luna-themed line to stdout.
# Source is kept pure-ASCII (emoji built from code points) so PS 5.1 never mangles it.

$ErrorActionPreference = 'SilentlyContinue'

# Read stdin FIRST, before touching Console encoding. Setting
# [Console]::InputEncoding on a redirected (piped) stdin recreates the reader
# and loses the data, so we never touch InputEncoding here.
# [Console]::In.ReadToEnd() reads raw stdin reliably even when the parent
# process is not PowerShell (Claude Code spawns this from Node).
$raw = [Console]::In.ReadToEnd()
if ($raw) { $raw = $raw.TrimStart([char]0xFEFF) }   # drop a leading UTF-8 BOM so ConvertFrom-Json won't choke

# Now it is safe to force emoji / unicode OUT as UTF-8 (PS 5.1 default mangles it)
try { [Console]::OutputEncoding = [System.Text.Encoding]::UTF8 } catch {}
$data = $null
if ($raw.Trim()) { try { $data = $raw | ConvertFrom-Json } catch {} }

# --- fields with safe fallbacks ---
$model = 'Claude'
if ($data.model.display_name) { $model = $data.model.display_name }

$cwd = (Get-Location).Path
if ($data.workspace.current_dir) { $cwd = $data.workspace.current_dir }
elseif ($data.cwd)               { $cwd = $data.cwd }
$dir = Split-Path $cwd -Leaf

$ctx = $data.context_window.used_percentage

# --- prompt cache (v2.1.251+; absent until the first API response) ---
$cache = $null
$pc = $data.prompt_cache
if ($pc -and $null -ne $pc.hit_ratio) {
    $cache = 'cache {0}%' -f [math]::Round([double]$pc.hit_ratio * 100)
    if ($pc.caching_observed -and -not $pc.warm) { $cache += ' cold' }
}

# --- rate limits: gateway spend limit, else claude.ai 5h window (each may be absent) ---
$limit = $null
$rl = $data.rate_limits
if ($rl.spend_limit -and $null -ne $rl.spend_limit.used_percentage) {
    if ($null -ne $rl.spend_limit.used_usd) { $limit = 'spend ${0} / ${1}' -f $rl.spend_limit.used_usd, $rl.spend_limit.limit_usd }
    else { $limit = 'spend {0}%' -f [math]::Round([double]$rl.spend_limit.used_percentage) }
} elseif ($rl.five_hour -and $null -ne $rl.five_hour.used_percentage) {
    $limit = '5h {0}%' -f [math]::Round([double]$rl.five_hour.used_percentage)
}

# --- git branch (only when cwd is inside a repo; silent otherwise) ---
$branch = $null
if ($cwd -and (Test-Path $cwd)) {
    Push-Location $cwd
    $branch = (git rev-parse --abbrev-ref HEAD 2>$null)
    Pop-Location
}

# --- glyphs from code points (keeps this file ASCII-only) ---
$moon   = [char]::ConvertFromUtf32(0x1F319)   # crescent moon
$folder = [char]::ConvertFromUtf32(0x1F4C1)   # folder
$herb   = [char]::ConvertFromUtf32(0x1F33F)   # herb / branch
$dot    = [char]0x00B7                         # middle dot separator

# --- ANSI colors ---
$e   = [char]27
$R   = "$e[0m"
$sep = "$e[90m $dot $R"

$parts  = @()
$parts += "$e[95m$moon Luna$R"
$parts += "$e[36m$model$R"
$parts += "$e[33m$folder $dir$R"
if ($branch)                              { $parts += "$e[32m$herb $branch$R" }
if ($null -ne $ctx -and "$ctx" -ne '')    { $parts += "$e[90mctx $ctx%$R" }
if ($cache)                               { $parts += "$e[90m$cache$R" }
if ($limit)                               { $parts += "$e[90m$limit$R" }

[Console]::Out.WriteLine(($parts -join $sep))
