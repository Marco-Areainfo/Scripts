# Adds Trusted Sites entries for the current user (HKCU)

$TrustedSites = @(
  'server01',
  '192.168.0.1'
)

$basePath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains'

foreach ($site in $TrustedSites) {
    $keyPath = Join-Path -Path $basePath -ChildPath $site
    if (-not (Test-Path $keyPath)) {
        New-Item -Path $keyPath -Force | Out-Null
    }
    # Create the '*' DWORD = 2 (Trusted Sites)
    New-ItemProperty -Path $keyPath -Name '*' -PropertyType DWord -Value 2 -Force | Out-Null
}