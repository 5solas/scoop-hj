param(
    [string] $App = '*',
    [Parameter(ValueFromRemainingArguments = $true)]
    [string[]] $Rest
)

# Thin wrapper around Scoop's checkver.ps1 for this bucket (same as the official bucket template).
# Examples:
#   .\bin\checkver.ps1                       # check every manifest
#   .\bin\checkver.ps1 gitextensions-hj -u   # update the manifest to the latest release
if (!$env:SCOOP_HOME) { $env:SCOOP_HOME = Convert-Path (scoop prefix scoop) }
$checkver = "$env:SCOOP_HOME/bin/checkver.ps1"
$dir = "$PSScriptRoot/../bucket"
& $checkver -App $App -Dir $dir @Rest
