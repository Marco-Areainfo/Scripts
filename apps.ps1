Write-Host -ForegroundColor Red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** *********  *********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ***   **** ****   ***  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***        *********  **  **     **  **   ***   ***
************************        ********  ***     *******    ********  **  **     **  **    *******    
'@

$LogPath = "C:\Logs\Install_$(Get-Date -Format 'yyyyMMdd_HHmmss').log"
Start-Transcript -Path $LogPath | Out-Null

$options1 = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
$choice1 = $host.ui.PromptForChoice("", "Installare anche LibreOffice?", $options1, 0)
$options2 = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
$choice2 = $host.ui.PromptForChoice("", "Installare anche Firefox?", $options2, 0)

winget install --id Microsoft.DotNet.Framework.Runtime -e -s winget ; 
winget install --id Google.Chrome -e -s winget ; 
winget install --id VideoLAN.VLC -e -s winget ; 
winget install --id PDFgear.PDFgear -e -s winget ; 
winget install --id M2Team.NanaZip -e -s winget ; 
winget install --id dotPDN.PaintDotNet -e -s winget ;
winget install --id CodecGuide.K-LiteCodecPack.Full -e -s winget ;
winget install --id Microsoft.PowerToys -e -s winget --scope machine 

if ($choice1 -eq 1) {
   winget install --id TheDocumentFoundation.LibreOffice -e -s winget --scope machine
} else {
    Write-Host "LibreOffice non e' stato installato." -ForegroundColor Yellow
}
if ($choice2 -eq 1) {
   winget install --id Mozilla.Firefox.it -e -s winget --scope machine
} else {
    Write-Host "Firefox non e' stato installato." -ForegroundColor Yellow
}

Write-Host ""
Write-Host "Terminato. Log disponible in C:\Logs."
Write-Host "Per ritentare le installazioni o aggiornare le app eseguire nuovamente lo script."
Stop-Transcript | Out-Null
Read-Host "Premi Invio per uscire"
exit
