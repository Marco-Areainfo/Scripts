#Define MAC target address,
# can contain the separators ":" or "-" or the hexadecimal string alone
$MAC = "90-09-D0-3E-CE-74"
#convert MAC to byte array
$ByteArray = $MAC -replace "[:\-]" -split "(..)" -ne '' | ForEach-Object { [Byte] "0x$_"}
#Build Magic Packet according to WOL specs
[Byte[]] $MagicPacket = (,0xFF * 6) + ($ByteArray * 16)
#Use .NET method to build UdpClient object
$Client = New-Object System.Net.Sockets.UdpClient
#Set Magic Packet destination to broadcast address of our network on port 7
$Client.Connect(([System.Net.IPAddress]::Broadcast),7)
#Send Magic Packet
$Client.Send($MagicPacket,$MagicPacket.Length)
#Close UdpClient
$Client.Close()