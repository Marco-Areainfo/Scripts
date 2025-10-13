$hostsFilePath = "C:\Windows\System32\drivers\etc\hosts"

Add-Content -Path $hostsFilePath -Value ""

$line1 = "192.168.1.3 srvpdm.duraldur.local"
$line2 = "192.168.40.2 srvmec"
$line3 = "192.168.1.27 srvswpdm.duraldur.local"

Add-Content -Path $hostsFilePath -Value $line1
Add-Content -Path $hostsFilePath -Value $line2
Add-Content -Path $hostsFilePath -Value $line3

Write-Host "Fatto."
Read-Host -Prompt "Premi Invio per continuare"