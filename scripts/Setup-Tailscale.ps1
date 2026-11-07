[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
Write-Warning 'Tailscale remote access is intentionally not configured on GitHub-hosted runners.'
Write-Output 'This script performs no installation, authentication, tunnel creation, or network exposure.'
Write-Output 'Use Tailscale on a supported Windows VM/device that you administer and that permits remote access.'
