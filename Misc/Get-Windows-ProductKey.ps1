Function Get-Windows-ProductKey
{
    
<#
.SYNOPSIS
Retrieves the Windows product key from the system.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Retrieves the Windows product key from the system.
.EXAMPLE
PS C:\>Get-Windows-ProductKey
Description
-----------
Retrieves the Windows product key from the system.
#>
    Param(
        [Parameter(Mandatory=$true)]
        [ValidateNotNullOrEmpty()]
        [string]$szComputer
    )

    $szRegistry = [WMIClass] ("\\" + $szComputer + "\root\default:StdRegProv")
    $values = [byte[]]($szRegistry.getbinaryvalue(2147483650,"SOFTWARE\Microsoft\Windows NT\CurrentVersion","DigitalProductId").uvalue)
    $lookup = [char[]]("B","C","D","F","G","H","J","K","M","P","Q","R","T","V","W","X","Y","2","3","4","6","7","8","9")
    $keyStartIndex = [int]52;
    $keyEndIndex = [int]($keyStartIndex + 15);
    $iDecodedLength = [int]29
    $decodeStringLength = [int]15
    $szDecodedChars = new-object char[] $iDecodedLength 
    $hexPid = new-object System.Collections.ArrayList
    for ($i = $keyStartIndex; $i -le $keyEndIndex; $i++){
        [void]$hexPid.Add($values[$i])
    }
    for ( $i = $iDecodedLength - 1; $i -ge 0; $i--){
        if (($i + 1) % 6 -eq 0){
            $szDecodedChars[$i] = '-'
        }else{
            $digitMapIndex = [int]0
            for ($j = $decodeStringLength - 1; $j -ge 0; $j--){
                $byteValue = [int](($digitMapIndex * [int]256) -bor [byte]$hexPid[$j]);
                $hexPid[$j] = [byte] ([math]::Floor($byteValue / 24));
                $digitMapIndex = $byteValue % 24;
                $szDecodedChars[$i] = $lookup[$digitMapIndex];
            }
        }
    }
    $szProductKey = ''     
    $szDecodedChars | % { $szProductKey+=$_}
    Write-Output $szProductKey
}
