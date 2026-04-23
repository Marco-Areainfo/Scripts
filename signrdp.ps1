Write-Host -foregroundcolor red @'
        **********                                                     **              ****         
      ***       ******                                                                **            
  ******      ***** ****        ********  ******* *******    ********  **  ********  *****  ******* 
**** **      ***       **      *********  ****** *********  *********  **  ***   ***  **   ***   ***
**   **      **        **     ****   ***  ***   ***   **** ****   ***  **  **     **  **   **     **
**   **      **       ***      *********  ***    ***        *********  **  **     **  **   ***   ***
************************        ********  ***     *******    ********  **  **     **  **    *******    
'@

$currentPrincipal = New-Object Security.Principal.WindowsPrincipal([Security.Principal.WindowsIdentity]::GetCurrent())
if (-not $currentPrincipal.IsInRole([Security.Principal.WindowsBuiltInRole]::Administrator)) {
    Write-Host "ERRORE: Questo script deve essere eseguitom come Administrator" -ForegroundColor Red
    pause
    exit
}

# Create a self-signed certificate, -Subject can be changed to own company name
$cert = New-SelfSignedCertificate `
    -Type CodeSigningCert `
    -Subject "CN=RDP Publisher, O=Your Organisation, C=AU" `
    -KeyUsage DigitalSignature `
    -FriendlyName "RDP Signing Certificate" `
    -CertStoreLocation "Cert:\LocalMachine\My" `
    -NotAfter (Get-Date).AddYears(3)

# Export the certificate to C:\
Export-Certificate `
    -Cert $cert `
    -FilePath "C:\rdp-signing-public.cer"
	
# Import to Trusted Root CA
Import-Certificate `
    -FilePath "C:\rdp-signing-public.cer" `
    -CertStoreLocation "Cert:\LocalMachine\Root"
	
# Import to Trusted Publishers
Import-Certificate `
    -FilePath "C:\rdp-signing-public.cer" `
    -CertStoreLocation "Cert:\LocalMachine\TrustedPublisher"

Write-Host "Prima di proseguire copiare il valore mostrato nel capo Thumbprint" -foregroundcolor yellow
Pause

Write-Host "Incolla di seguito il valore copiato precedentemente" -foregroundcolor green
$thumbprint = Read-Host -Prompt "Thumbprint"
Write-Host $thumbprint
Write-Host "Incolla di seguito il percorso del file .rdp (CTRL+MAIUSC+C per copiarlo dal File)" -foregroundcolor green
$rdppath = Read-Host -Prompt "Percorso file .rdp"
Write-Host $rdppath

rdpsign.exe /sha256 $thumbprint $rdppath