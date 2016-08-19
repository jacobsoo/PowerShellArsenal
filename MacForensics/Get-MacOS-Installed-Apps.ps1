#!/usr/local/bin/powershell -File
[OutputType([String])]
$InstalledAppsList = Get-ChildItem -Path /Applications/ |  Select-Object Name, LastWriteTime
Write-Output $InstalledAppsList
