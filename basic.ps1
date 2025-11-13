winget install --id=Microsoft.DotNet.Framework.DeveloperPack_4 -e  ; 
winget install --id=Google.Chrome -e  ; 
winget install --id=VideoLAN.VLC -e  ; 
winget install --id=PDFgear.PDFgear -e  ; 
winget install --id=M2Team.NanaZip -e  ; 
winget install --id=dotPDN.PaintDotNet -e ;
winget install --id=CodecGuide.K-LiteCodecPack.Full -e ;
winget install --id=Microsoft.PowerToys -e --scope machine --override "/quiet PowertoysAutostart=false"

Write-Host "Fatto."
Read-Host -Prompt "Premi Invio per uscire"
exit
