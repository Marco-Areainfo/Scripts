Write-Host -foregroundcolor red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** *********  *********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ***   **** ****   ***  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***        *********  **  **     **  **   ***   ***
************************        ********  ***     *******    ********  **  **     **  **    *******    
'@

# 1. Define the URL where this script is hosted
$url = "https://raw.githubusercontent.com/Marco-Areainfo/Scripts/refs/heads/main/test.ps1"

# 2. Elevation Check
$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    
    Write-Host "===========================" -ForegroundColor Yellow
    Write-Host " ADMIN PRIVILEGES REQUIRED" -ForegroundColor Yellow
    Write-Host "===========================" -ForegroundColor Yellow
    Write-Host "This script needs to modify system settings."
    Write-Host "A UAC prompt will appear after you press Enter."
    Write-Host ""
    
    # The Pause
    Read-Host "Press Enter to request Admin rights or close this window to cancel"
    
    # 3. Trigger Elevation
    Start-Process powershell.exe -ArgumentList "-NoProfile -ExecutionPolicy Bypass -Command `"iex (irm '$url')`"" -Verb RunAs
    
    exit
}

# --- YOUR ACTUAL SCRIPT STARTS HERE ---
Write-Host "Running with Admin rights!" -ForegroundColor Green

Write-Host ""
Write-Host "TEST"
Read-Host -Prompt "Premi Invio per uscire"
exit