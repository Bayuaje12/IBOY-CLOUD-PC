[CmdletBinding()]
param(
    [string]$RepositoryRoot = (Split-Path -Parent $PSScriptRoot)
)
$ErrorActionPreference = 'Stop'
Set-StrictMode -Version Latest

$source = Join-Path $RepositoryRoot 'assets\wallpaper.jpg'
$targetDir = Join-Path $env:USERPROFILE 'Pictures\IBOY-CLOUD-PC'
$target = Join-Path $targetDir 'wallpaper.jpg'
$configPath = Join-Path $RepositoryRoot 'config\desktop.json'

if (-not (Test-Path -LiteralPath $source -PathType Leaf)) {
    throw "Wallpaper source not found: $source"
}
if (-not (Test-Path -LiteralPath $configPath -PathType Leaf)) {
    throw "Desktop config not found: $configPath"
}
$config = Get-Content -LiteralPath $configPath -Raw | ConvertFrom-Json
New-Item -ItemType Directory -Path $targetDir -Force | Out-Null
Copy-Item -LiteralPath $source -Destination $target -Force

$state = [ordered]@{
    projectName = $config.projectName
    creator = $config.creator
    wallpaperPath = $target
    installedAtUtc = (Get-Date).ToUniversalTime().ToString('o')
    runnerUser = [System.Security.Principal.WindowsIdentity]::GetCurrent().Name
}
$statePath = Join-Path $targetDir 'desktop-state.json'
$state | ConvertTo-Json -Depth 5 | Set-Content -LiteralPath $statePath -Encoding UTF8

Write-Host "Wallpaper installed: $target"
Write-Host "Desktop state saved: $statePath"
