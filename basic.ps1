winget install --id=Microsoft.DotNet.Framework.DeveloperPack_4 -e -s winget ; 
winget install --id=Google.Chrome -e -s winget ; 
winget install --id=VideoLAN.VLC -e -s winget ; 
winget install --id=PDFgear.PDFgear -e -s winget ; 
winget install --id=M2Team.NanaZip -e -s winget ; 
winget install --id=dotPDN.PaintDotNet -e -s winget ;
winget install --id=CodecGuide.K-LiteCodecPack.Full -e -s winget ;
winget install --id=Microsoft.PowerToys -e -s winget --scope machine 

Write-Host "Fatto."
Read-Host -Prompt "Premi Invio per uscire"
exit
