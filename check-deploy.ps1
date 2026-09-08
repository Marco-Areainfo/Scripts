# Pick one online machine from your AD list to test
$TestPC = "PC01" # Replace with a target computer name from your working list

Invoke-Command -ComputerName $TestPC -ScriptBlock {
    $process = Start-Process msiexec.exe -ArgumentList '/i "\\Server\Share\app.msi" /qn /norestart' -Wait -PassThru
    
    # Return the result and exit code
    [PSCustomObject]@{
        ComputerName = $env:COMPUTERNAME
        ExitCode     = $process.ExitCode
    }
}