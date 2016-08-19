#!/usr/local/bin/powershell -File
[OutputType([String])]
$cmd = "users"
$output = &$cmd
$curUser = $output -split "\s+"
foreach( $user in $curUser){
    if($user -ne "_mbsetupuser"){
        $ThrashLocation = "/Users/" + $user + "/.Trash"
        Write-Output "[+] Grabbing list of items in $ThrashLocation`n"
        $ThrashList = Get-ChildItem -Path $ThrashLocation |  Select-Object Name, LastWriteTime
        Write-Output $ThrashList
    }
}
