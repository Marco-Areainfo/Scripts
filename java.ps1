winget install --id eclipseadoptium.temurin.8.jre ; 
winget install --id karakun.OpenWebStart 

Write-Host "Prima di laciare gli applet Java aprire OpenWebStart Settings > JVM Manager > Find local"
Write-Host "Dopo andare in Settings e cambiare Update strategy con Do not download any version"
Write-Host "Eseguire gli applet Java come Administrator"
Read-Host -Prompt "Premi Invio per uscire"
exit
