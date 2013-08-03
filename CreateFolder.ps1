#==== Writen by Jamin Quimby ===========================================#
#==== Copyright jaminquimby.com ========================================#
#==== jPowershell.ps1 is a collection of powershell functions writen my Jamin Quimby. ===#
#----Loading Message ------- #
$consol = (Get-Host).UI.RawUI
$oldBGColor = $consol.BackgroundColor
$oldFGColor = $consol.ForegroundColor
$consol.BackgroundColor = "Black"
$consol.ForegroundColor = "Yellow"
Write-Output "--------- jPowershell has been loaded ----------"
Write-Output "--------- Writen by Jamin Quimby      ----------"
 
$consol.BackgroundColor = $oldBGColor
$consol.ForegroundColor = $oldFGColor
#--- End Load Message ---#
 
#---- FunctionNewFolder ----#
function CreateFolder{
[CmdletBinding()]
param(
[Parameter(mandatory=$true)][string]$Path
)
 
    # Check if the folder Exists
 
    if (Test-Path $Path) {
        Write-Host "Folder: $Path Already Exists" -ForeGroundColor Yellow
    } else {
        Write-Host "Creating $Path" -Foregroundcolor Green
        New-Item -Path $Path -type directory | Out-Null
    }
 <#
.SYNOPSIS
 Creates a new folder
.DESCRIPTION
 CreatesFolder is a function that creates a new folder.
.EXAMPLE
CreateFolder -path C:\FolderPath\FolderName
.LINK
http://jaminquimby.com/joomla253/programing/96-powershell/504-code-createfolder
  #>
}