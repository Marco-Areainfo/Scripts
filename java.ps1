winget install --id eclipseadoptium.temurin.8.jre ; 
winget install --id karakun.OpenWebStart 

Write-Host "Prima di laciare gli applet Java aprire " -nonewline
Write-Host "OpenWebStart Settings > JVM Manager > Find local" -foregroundcolor red
Write-Host "Dopo andare in " -nonewline
Write-Host "Settings " -foregroundcolor red -nonewline
Write-Host "e cambiare " -nonewline
Write-Host "Update strategy " -foregroundcolor red -nonewline
Write-Host "con " -nonewline
Write-Host "Do not download any version" -foregroundcolor red
Write-Host "Eseguire gli applet Java come Administrator al primo avvio"
Read-Host -Prompt "Premi Invio per uscire"
exit
