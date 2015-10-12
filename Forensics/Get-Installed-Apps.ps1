function Get-Installed-Apps
{
<#
.SYNOPSIS
Get the list of installed applications on a system.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Get the list of installed applications on a system.
.EXAMPLE
PS C:\>Get-Installed-Apps
Description
-----------
Get the list of installed applications on a system.
#>

    [OutputType([String])]
    $InstalledAppsList = Get-ItemProperty HKLM:\Software\Microsoft\Windows\CurrentVersion\Uninstall\* |  Select-Object DisplayName, DisplayVersion, Publisher, InstallDate | Format-Table –AutoSize
    Write-Output $InstalledAppsList
}