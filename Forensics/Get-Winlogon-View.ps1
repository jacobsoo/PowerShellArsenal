Function Get-Winlogon-View
{
    
<#
.SYNOPSIS
Retrieves the date/time that users logged on and logged off on the system.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Retrieves the date/time that users logged on and logged off on the system.
.EXAMPLE
PS C:\>Get-Winlogon-View
Description
-----------
Retrieves the date/time that users logged on and logged off on the system.
#>

    $UserProperty = @{n="User";e={(New-Object System.Security.Principal.SecurityIdentifier $_.ReplacementStrings[1]).Translate([System.Security.Principal.NTAccount])}}
    $TypeProperty = @{n="Action";e={if($_.EventID -eq 7001) {"Logon"} else {"Logoff"}}}
    $TimeProeprty = @{n="Time";e={$_.TimeGenerated}}
    $Results = Get-EventLog System -Source Microsoft-Windows-Winlogon | Select-Object $UserProperty,$TypeProperty,$TimeProeprty
    Write-Output $Results
}
