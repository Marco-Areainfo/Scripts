<#
.SYNOPSIS
  Add machine-wide Trusted Sites entries for a host name and an IP (UNC style).
.DESCRIPTION
  Creates registry keys under HKLM\...\ZoneMap\Domains for both 32-bit and 64-bit registry views.
  Adds a DWORD named '*' = 2 (Trusted Sites) so the machine trusts all shares/hosts under that name.
#>

# List of hosts to add as trusted (hostnames or IPs)
$TrustedHosts = @(
  'server',            # will match \\server
  '192.168.1.3'        # will match \\192.168.1.3
)

# Base registry paths to update (write both normal and Wow6432Node to cover 32-bit apps)
$BasePaths = @(
  'HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains',
  'HKLM:\SOFTWARE\Wow6432Node\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains'
)

foreach ($base in $BasePaths) {
  foreach ($host in $TrustedHosts) {
    try {
      $keyPath = Join-Path -Path $base -ChildPath $host

      if (-not (Test-Path -Path $keyPath)) {
        New-Item -Path $keyPath -Force | Out-Null
      }

      # Create the '*' DWORD = 2 to trust all hosts under that domain/hostname
      New-ItemProperty -Path $keyPath -Name '*' -PropertyType DWord -Value 2 -Force | Out-Null

      Write-Host "Added Trusted Site entry: $keyPath\* = 2"
    }
    catch {
      Write-Warning "Failed to add $host under $base : $($_.Exception.Message)"
    }
  }
}

# Optional: force policy refresh for Internet Explorer/Edge legacy settings (no harmful side effects)
try {
  & gpupdate.exe /target:computer /force | Out-Null
} catch { }