#!/usr/local/bin/powershell -File
[OutputType([String])]
$LanuchAgentsList_1 = Get-ChildItem -Path /Library/LaunchAgents/  |  Select-Object Name, LastWriteTime
Write-Output "[+] Grabbing LaunchAgents from /Library/LaunchAgents/"
Write-Output $LanuchAgentsList_1
$LanuchAgentsList_2 = Get-ChildItem -Path /System/Library/LaunchAgents/  |  Select-Object Name, LastWriteTime
Write-Output "`n[+] Grabbing LaunchAgents from /System/Library/LaunchAgents/"
Write-Output $LanuchAgentsList_2
