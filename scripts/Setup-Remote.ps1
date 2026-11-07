[CmdletBinding()]
param()
$ErrorActionPreference = 'Stop'
Write-Output 'IBOY CLOUD PC remote-access safety check'
Write-Output 'GitHub-hosted windows-2025 runners are temporary CI workers, not supported interactive RDP hosts.'
Write-Output 'This script does not enable Remote Desktop, change firewall rules, create tunnels, or expose ports.'
try {
    $rdp = Get-ItemProperty -Path 'HKLM:\SYSTEM\CurrentControlSet\Control\Terminal Server' -Name fDenyTSConnections -ErrorAction Stop
    Write-Output "Current RDP deny flag: $($rdp.fDenyTSConnections)"
} catch {
    Write-Warning "Could not inspect RDP state: $($_.Exception.Message)"
}
