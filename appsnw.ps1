$url = "https://raw.githubusercontent.com/Marco-Areainfo/Scripts/refs/heads/main/appsnw.ps1"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host " NECESSARI PRIVILEGI DI ADMIN" -ForegroundColor Yellow
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host ""

    $options1 = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
    $choice1 = $host.ui.PromptForChoice("", "Elevare?", $options1, 1)

    if ($choice1 -eq 1) {
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"iex (irm '$url')`"" -Verb RunAs
        exit
    } else {
        Write-Host "Non elevato. Continuo con permessi utente..." -ForegroundColor Yellow
    }
} else {
    Write-Host "In esecuzione come Administrator" -ForegroundColor Green
}


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
$options3 = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
$choice3 = $host.ui.PromptForChoice("", "Installare anche PDF24?", $options3, 0)

winget install --id Microsoft.DotNet.Framework.Runtime -e -h -s winget ; 
winget install --id Google.Chrome -e -h -s winget ; 
winget install --id M2Team.NanaZip -e -h -s winget ; 
winget install --id VideoLAN.VLC -e -h -s winget ; 
winget install --id PDFgear.PDFgear -e -h -s winget ; 
winget install --id dotPDN.PaintDotNet -e -h -s winget ;
winget install --id CodecGuide.K-LiteCodecPack.Full -e -h -s winget ;
winget install --id Microsoft.PowerToys -e -h -s winget --scope machine 

if ($choice1 -eq 1) {
   winget install --id TheDocumentFoundation.LibreOffice -e -h -s winget 
} else {
    Write-Host "LibreOffice non e' stato installato." -ForegroundColor Yellow
}
if ($choice2 -eq 1) {
   winget install --id Mozilla.Firefox.it -e -h -s winget 
} else {
    Write-Host "Firefox non e' stato installato." -ForegroundColor Yellow
}
if ($choice3 -eq 1) {
   winget install --id geeksoftwareGmbH.PDF24Creator -e -h -s winget 
} else {
    Write-Host "PDF24 non e' stato installato." -ForegroundColor Yellow
}

start ms-settings:defaultapps

Write-Host ""
Write-Host "Terminato. Log disponible in C:\Logs."
Write-Host "Per ritentare le installazioni o aggiornare le app eseguire nuovamente lo script."
Stop-Transcript | Out-Null
$optionsexit = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
$choiceexit = $host.ui.PromptForChoice("", "Uscire?", $optionsexit, 1)
if ($choiceexit -eq 1) {
   exit 
} else {
    Write-Host "Terminato." -ForegroundColor Yellow
}