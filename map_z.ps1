$DriveLetter = "Z:"
$NetworkPath = "\\192.168.0.30\cartella"

if (Get-PSDrive -Name $DriveLetter.Replace(":", "") -ErrorAction SilentlyContinue) {
    (New-Object -ComObject WScript.Network).RemoveNetworkDrive($DriveLetter, $true, $true)
    Start-Sleep -Seconds 1
}

try {
    $net = New-Object -ComObject WScript.Network
    $net.MapNetworkDrive($DriveLetter, $NetworkPath, $true)
    Write-Host "Successfully mapped $DriveLetter to $NetworkPath" -ForegroundColor Green
}
catch {
    Write-Error "Mapping failed: $_"
}

# Inserire in Arguments se usato da taskschd.msc: -NoProfile -ExecutionPolicy Bypass -WindowStyle Hidden -File "C:\Scripts\MAP_Z.ps1"