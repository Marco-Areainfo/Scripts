Write-Host -foregroundcolor red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** *********  *********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ***   **** ****   ***  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***        *********  **  **     **  **   ***   ***
************************        ********  ***     *******    ********  **  **     **  **    *******    
'@


$url = "https://raw.githubusercontent.com/Marco-Areainfo/Scripts/refs/heads/main/test.ps1"

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host " NECESSARI PRIVILEGI DI ADMIN" -ForegroundColor Yellow
    Write-Host "==============================" -ForegroundColor Yellow
    Write-Host ""
    Read-Host "Premere Invio per richiedere privilegi di Administrator"
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"iex (irm '$url')`"" -Verb RunAs
    exit
}

Write-Host "In esecuzione come Admin" -ForegroundColor Green

Write-Host ""
Write-Host "TEST"
Read-Host -Prompt "Premi Invio per uscire"
exit