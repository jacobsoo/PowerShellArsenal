function Get-Drivers-List
{
<#
.SYNOPSIS
Get the list of installed drivers on a system.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Get the list of installed drivers on a system.
.EXAMPLE
PS C:\>Get-Drivers-List
Description
-----------
Get the list of installed drivers on a system.
#>

    [OutputType([String])]
    $DriverList = Get-WindowsDriver –Online -All | select OriginalFileName, ProviderName, Version | Format-Table –AutoSize
    Write-Output "The number of drivers on this system is:" $DriverList.count
    Write-Output $DriverList
}
