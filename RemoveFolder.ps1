#==== Writen by Jamin Quimby ===========================================#
#==== Copyright jaminquimby.com ========================================#
#==== jPowershell.ps1 is a collection of powershell functions writen my Jamin Quimby. ===#
#---- FunctionRemoveFolder ----#
function RemoveFolder{
[CmdletBinding()]
param(
[Parameter(mandatory=$true)][string]$Path
)
 
    # Check if the folder Exists
 
    if (Test-Path $Path) {
         
        Write-Host "Removing $Path" -Foregroundcolor Green
        Remove-Item $Path | Out-Null
 
            } else {
        Write-Host "Folder: $Path does not exsist." -ForeGroundColor Yellow
    }
 <#
.SYNOPSIS
 Removes a folder
.DESCRIPTION
 RemoveFolder is a function that removes a folder.
.EXAMPLE
CreateFolder -path C:\FolderPath\FolderName
.LINK
http://jaminquimby.com/joomla253/programing/96-powershell/505-code-removefolder
  #>
}
 
#--- End FunctionRemoveFolder ---#