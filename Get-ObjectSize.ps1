#---- Function Get-ObjectSize ----#
 
function Get-ObjectSize
 
{
[CmdletBinding()]
param(
[Parameter(mandatory=$true)][alias("p")][string]$path,
[Parameter(mandatory=$false)][string]$size,
[Parameter(mandatory=$false)][bool]$ext
 
)
process{
$colItems = (Get-ChildItem $path -recurse | Measure-Object -property length -sum)
if($ext){
if ($colItems.sum -lt 1KB -or $size -eq "Bytes") { "{0:N2}" -f ($colItems.sum) + " Bytes" }
elseif ($colItems.sum -gt 1KB -and $colItems.sum  -lt 1MB -or $size -eq "KB"){ "{0:N2}" -f ($colItems.sum / 1KB) + "KB"}
elseif ($colItems.sum -gt 1MB -and $colItems.sum  -lt 1GB -or $size -eq "MB") { "{0:N2}" -f ($colItems.sum / 1MB) + " MB" }
elseif ($colItems.sum -gt 1GB -and $colItems.sum  -lt 1PB -or $size -eq "GB") { "{0:N2}" -f ($colItems.sum / 1GB) + " GB" }
}else{
if ($colItems.sum -lt 1KB -or $size -eq "Bytes") { "{0:N2}" -f ($colItems.sum)  }
elseif ($colItems.sum -gt 1KB -and $colItems.sum  -lt 1MB -or $size -eq "KB"){ "{0:N2}" -f ($colItems.sum / 1KB) }
elseif ($colItems.sum -gt 1MB -and $colItems.sum  -lt 1GB -or $size -eq "MB") { "{0:N2}" -f ($colItems.sum / 1MB) }
elseif ($colItems.sum -gt 1GB -and $colItems.sum  -lt 1PB -or $size -eq "GB") { "{0:N2}" -f ($colItems.sum / 1GB) }
}
}
 <#
.SYNOPSIS
Find a folder(s) and child contents size or a file size.
.DESCRIPTION
Get a folder and child contents size or a file size and return results in Bytes, KB, GB, and PB or specefied.
If you would like to have the text extentions Bytes, KB, GB, or PB added to the output use the boolen operatior -ext
.EXAMPLE
Get-ObjectSize c:\folder
.EXAMPLE
Get-ObjectSize -p c:\folder\ -ext $true
.EXAMPLE
Get-ObjectSize -p c:\folder\ -ext $false
.LINK
http://jaminquimby.com/joomla253/programing/96-powershell/506-code-customsendmail
  #>
}
#---  End Function Get-ObjectSize ---#