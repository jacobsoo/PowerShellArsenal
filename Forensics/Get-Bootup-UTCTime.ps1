function Get-Bootup-UTCTime
{
<#
.SYNOPSIS
Get the System's bootup time and convert it to UTC time.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Get the System's bootup time and convert it to UTC time.
.EXAMPLE
PS C:\>Get-Bootup-UTCTime
Description
-----------
Get the System's bootup time and convert it to UTC time.
#>

    [OutputType([String])]
    $szBootupTime = (Get-CimInstance -ClassName Win32_OperatingSystem).LastBootUpTime
    $szUTCTime = [System.TimeZoneInfo]::ConvertTimeToUtc($szBootupTime)
    Write-Output $szUTCTime
}