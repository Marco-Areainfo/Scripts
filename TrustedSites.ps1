# Add-TrustedSites-HKLM.ps1
# Adds machine-wide Trusted Sites entries for local servers

$TrustedSites = @(
  'server',
  '192.168.1.3'
)

$BasePaths = @(
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains',
  'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains'
)

foreach ($base in $BasePaths) {
  foreach ($site in $TrustedSites) {
    $keyPath = Join-Path -Path $base -ChildPath $site
    if (-not (Test-Path -Path $keyPath)) {
      New-Item -Path $keyPath -Force | Out-Null
    }
    # Create the '*' DWORD = 2 (Trusted Sites)
    New-ItemProperty -Path $keyPath -Name '*' -PropertyType DWord -Value 2 -Force | Out-Null
  }
}