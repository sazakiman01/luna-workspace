# set-role-model.ps1 - switch the gosoft model of Luna roles (opencode agents/*.md)
# Usage:
#   set-role-model.ps1 -Group think -Model gothink3
#   set-role-model.ps1 -Role nova -Model gothink2#high
# Start a new opencode session afterwards.
param(
    [ValidateSet('think', 'dev')][string]$Group,
    [string]$Role,
    [Parameter(Mandatory = $true)][ValidatePattern('^(godev[123]|gothink[123])(#(low|medium|high|xhigh|max))?$')][string]$Model
)
$ErrorActionPreference = 'Stop'
$AgentsDir = 'C:\Users\sansakritsuk\.config\opencode\agents'
$Groups = @{
    think = @('orion', 'nova', 'nebula', 'polaris', 'atlas', 'galaxy', 'rigel', 'sirius')
    dev   = @('stella', 'vega', 'cosmos', 'comet', 'vela')
}
if ($Role) { $targets = @($Role) } elseif ($Group) { $targets = $Groups[$Group] } else { throw 'Specify -Group or -Role' }

$utf8 = New-Object System.Text.UTF8Encoding($false)
$rx = [regex]'(?m)^model: gosoft/\S+'
foreach ($r in $targets) {
    $path = Join-Path $AgentsDir "$r.md"
    if (-not (Test-Path $path)) { Write-Warning "missing: $path"; continue }
    $text = [IO.File]::ReadAllText($path, $utf8)
    $m = $rx.Match($text)
    if (-not $m.Success) { Write-Warning "${r}: no 'model: gosoft/...' line (inherits main agent) - skipped"; continue }
    [IO.File]::WriteAllText($path, $rx.Replace($text, "model: gosoft/$Model", 1), $utf8)
    Write-Output ("{0}: {1} -> gosoft/{2}" -f $r, $m.Value.Substring(7), $Model)
}
