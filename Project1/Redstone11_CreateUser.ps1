 
#Load Servers 
$Servers = @("DEV-PC")
#Ask for the Folder Name
$FolderNmae = Read-Host "Enter a Folder Name like: CompanyNmae" 
#Ask for the Security Group to apply to the folder.
$SecurityGroup = Read-Host "Enter a Security Group like: fs-CompanyNmae" 
 
Function Qutera-MakeDataStore(){ 
Param($MachineName = ".");
#Test Folder Pad
    Test-Path \\$MachineName\c$\Redstone11\$FolderNmae   
#Create Folder
    New-Item -type directory -path \\$MachineName\c$\Redstone11\fs_$FolderNmae
#Get ACL from Template    
    $Acl = Get-Acl "\\$MachineName\c$\Redstone11\Template"
#Add to ACL
    $Ar1 = New-Object system.security.accesscontrol.filesystemaccessrule("fs-$SecurityGroup","FullControl","Allow");
#Append Access Rule to ACL    
    $Acl.SetAccessRule($Ar1)

#Set ACL    
    Set-Acl "\\$MachineName\c$\Redstone11\fs_$FolderNmae" $Acl

        
      # $command = " /c mkdir \\$MachineName\c$\Redstone11\fs_$FolderNmae" 
      # [Diagnostics.Process]::Start('cmd',"$command") 
     
  
} 
 
Function Ping-Test(){
Param($TestHost = ".")
$Ping = Test-Connection $TestHost -count 1 -quiet
If(!$Ping){
Write-Host $TestHost "is missing" (Get-Date) -ForegroundColor Red #-BackgroundColor White
}
  
If($Ping){
Write-Host $TestHost "is there" (Get-Date) -ForegroundColor Green #-BackgroundColor White
Qutera-MakeDataStore $Server
}}
ForEach ($Server in $Servers){Ping-Test $Server}