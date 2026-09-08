$Computers = Get-ADComputer -Filter {Enabled -eq $true -and OperatingSystem -notlike "*Server*"} | Select-Object -ExpandProperty Name

$Computers
"Total computers found: $($Computers.Count)"

# Ritorna un lista di workstation presenti nel dominio corrente, va eseguito da DC o una workstation con privilegi di Domain Admin.