Function Get-Installed-Updates
{
    
<#
.SYNOPSIS
Retrieves the list of installed Windows updates on the system.
Author: Jacob Soo (@jacobsoo)
License: BSD 3-Clause
Required Dependencies: None
Optional Dependencies: None
.DESCRIPTION
Retrieves the list of installed Windows updates on the system.
.EXAMPLE
PS C:\>Get-Installed-Updates
Description
-----------
Retrieves the list of installed Windows updates on the system.
#>
    $Session = New-Object -ComObject Microsoft.Update.Session
    $Searcher = $Session.CreateUpdateSearcher()
    $HistoryCount = $Searcher.GetTotalHistoryCount()
    $Updates = @()
    for ($i = 0; $i -lt $HistoryCount; $i++) {
        $COMUpdate = $Searcher.QueryHistory($i,1)
        $Update = New-Object -TypeName PSCustomObject
        foreach($Property in ($COMUpdate | Get-Member -Type Property)) {
            Add-Member -MemberType NoteProperty -Name $Property.Name -Value ($COMUpdate | Select-Object -ExpandProperty $Property.Name) -InputObject $Update
	    }
        $Updates += $Update
    }
    Write-Output $Updates | Select-Object ClientApplicationID, Title, Description, Date, SupportUrl
}
