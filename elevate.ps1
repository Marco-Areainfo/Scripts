$url = "https://raw.githubusercontent.com/Marco-Areainfo/Scripts/refs/heads/main/test.ps1" #Complete with script path (local or remote for irm)

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    
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
		Write-Host "Non elevato." -ForegroundColor Yellow
		iex (irm '$url')
		pause
	}

}

Write-Host "In esecuzione come Administrator" -ForegroundColor Green
Write-Host -foregroundcolor red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** *********  *********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ***   **** ****   ***  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***        *********  **  **     **  **   ***   ***
************************        ********  ***     *******    ********  **  **     **  **    *******    
'@


Write-Host ""
Write-Host "TEST"
Read-Host "Premi Invio per uscire"
exit