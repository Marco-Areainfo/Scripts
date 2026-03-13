Write-Host -foregroundcolor red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******   *********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** ********* **********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ****   *** ***   ****  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***       **********  **  **     **  **   ***   ***
************************        ********  ***     *******   *********  **  **     **  **    *******    
'@

Write-Host ""
Write-Host "Cancellare dalle reti memorizzate quelle con SSID contenti questi simboli (>,<,/,\,|,:,*,?)"
Write-Host "o l'esportazione si interrompera'."
Read-Host -Prompt "Premi Invio per iniziare"
New-Item -Path "C:\" -Name "WIFI" -ItemType "Directory"
netsh wlan export profile interface=wi-fi key=clear folder=C:\WIFI
Write-Host ""
Write-Host "Completato, le reti sono state esportate in C:\WIFI, le password sono visibili."
Write-Host "Per importarle in un altro PC copiare la cartella WIFI in C:\ ed eseguire il seguente comando in CMD:"
Write-Host @'
for  %a  in  (C:\WIFI\*.xml)  do  netsh  wlan  add  profile  "%a"
'@
Read-Host -Prompt "Premi Invio per uscire"
exit