$url = "https://raw.githubusercontent.com/Marco-Areainfo/Scripts/refs/heads/main/test_elevate.ps1"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
$isAdmin = $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)

if (-not $isAdmin) {
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host " NECESSARI PRIVILEGI DI ADMIN" -ForegroundColor Yellow
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host ""

    $optionsE = [System.Management.Automation.Host.ChoiceDescription[]] @("&No", "&Yes")
    $choiceE = $host.ui.PromptForChoice("", "Elevare?", $optionsE, 1)

    if ($choiceE -eq 1) {
        Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"iex (irm '$url')`"" -Verb RunAs
        exit
    } else {
        Write-Host "Non elevato. Continuo con permessi utente..." -ForegroundColor Yellow
    }
} else {
    Write-Host "In esecuzione come Administrator" -ForegroundColor Green
}


Write-Host -ForegroundColor Red @'
        **********                                                     **             ****         
      ***        ******                                                               **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***        **     *********  ****** *********  *********  **  ***   ***  **    ***   ***
**   **      **         **    ****   ***  ***   ***   **** ****   ***  **  **     **  **    **     **
**   **      **        ***     *********  ***    ***        *********  **  **     **  **    ***   ***
************************        ********  ***     *******    ********  **  **     **  **     *******   
'@

Write-Host ""
Write-Host "TEST"
Read-Host "Premi Invio per uscire"