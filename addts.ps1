# Asks the user for hostnames/IPs to add to Trusted Sites (HKCU)

Write-Host "Inserisci i siti (host o IP) da aggiungere ai Siti attendibili."
Write-Host "Separali con la virgola, es: server,192.168.1.3"
$inputSites = Read-Host "Siti"

# Suddivide la stringa in array, rimuove spazi vuoti
$TrustedSites = $inputSites.Split(",") | ForEach-Object { $_.Trim() } | Where-Object { $_ -ne "" }

$basePath = 'HKCU:\Software\Microsoft\Windows\CurrentVersion\Internet Settings\ZoneMap\Domains'

foreach ($site in $TrustedSites) {
    $keyPath = Join-Path -Path $basePath -ChildPath $site
    if (-not (Test-Path $keyPath)) {
        New-Item -Path $keyPath -Force | Out-Null
    }
    # Crea valore '*' = 2 (Trusted Sites)
    New-ItemProperty -Path $keyPath -Name '*' -PropertyType DWord -Value 2 -Force | Out-Null
    Write-Host "Aggiunto $site ai Siti attendibili (HKCU)."
}