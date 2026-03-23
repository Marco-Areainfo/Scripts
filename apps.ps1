Write-Host -foregroundcolor red @'
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

winget install --id Microsoft.DotNet.Framework.DeveloperPack_4 -e -s winget ; 
winget install --id Google.Chrome -e -s winget ; 
winget install --id VideoLAN.VLC -e -s winget ; 
winget install --id PDFgear.PDFgear -e -s winget ; 
winget install --id M2Team.NanaZip -e -s winget ; 
winget install --id dotPDN.PaintDotNet -e -s winget ;
winget install --id CodecGuide.K-LiteCodecPack.Full -e -s winget ;
winget install --id Microsoft.PowerToys -e -s winget --scope machine 

Function Read-YesNoChoice {
	Param (
        [Parameter(Mandatory=$true)][String]$Title,
		[Parameter(Mandatory=$true)][String]$Message,
		[Parameter(Mandatory=$false)][Int]$DefaultOption = 0
    )
	
	$No = New-Object System.Management.Automation.Host.ChoiceDescription '&No', 'No'
	$Yes = New-Object System.Management.Automation.Host.ChoiceDescription '&Yes', 'Yes'
	$Options = [System.Management.Automation.Host.ChoiceDescription[]]($No, $Yes)
	
	return $host.ui.PromptForChoice($Title, $Message, $Options, $DefaultOption)
}
$choice = Read-YesNoChoice -Title "Installare anche LibreOffice?" -Message "Yes or No?" -DefaultOption 0
switch($choice)
{
	# No
	0 {
		Write-Host "LibreOffice non verra' installato."
	}
	# Yes
	1 {
		winget install --id TheDocumentFoundation.LibreOffice -e -s winget --scope machine
	}
}

Write-Host ""
Write-Host "Terminato. Log disponible in C:\Logs."
Write-Host "Per ritentare le installazioni o aggiornare le app eseguire nuovamente lo script."
Stop-Transcript | Out-Null
Read-Host -Prompt "Premi Invio per uscire"
exit
