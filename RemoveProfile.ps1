Import-Module ActiveDirectory
  
$Servers = @("ranger11","peachtree4")
$MainKey = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList"
$SearchForUser = Read-Host "Enter User Name" 
$ADUser = Get-ADUSER $SearchForUser
Write-Host $ADUser.Name "SID is" $ADuser.SID
$UserSID = $ADuser.SID
  
Function Get-Registry(){
Param($MachineName = ".")
  
    $Reg = [Microsoft.Win32.RegistryKey]::OpenRemoteBaseKey('LocalMachine', $MachineName)
    $RegKey= $Reg.OpenSubKey("$UsersProfileKey")
      
    #Do check you opened the key by checking its name
    If ($RegKey.Name -eq "HKEY_LOCAL_MACHINE\$UsersProfileKey"){
        Write-Host "$MachineName - CAUTION going to execute ::- $Reg.DeleteSubKeyTree($UsersProfileKey)"
        $Reg.DeleteSubKeyTree("$UsersProfileKey")
        Write-Host "$MachineName - CAUTION going to execute ::  &rmdir \\$MachineName\c$\users\$SearchForUser /S /Q"
        Test-Path \\$MachineName\c$\users\$SearchForUser
        $command = " /c rmdir \\$MachineName\c$\users\$SearchForUser /S /Q"
        [Diagnostics.Process]::Start('cmd',"$command")
      
    }
}
  
Function Ping-Test(){
Param($TestHost = ".")
    $Ping = Test-Connection $TestHost -count 1 -quiet
  
    If(!$Ping)
    {
     Write-Host $TestHost "is missing" (Get-Date) -ForegroundColor Red #-BackgroundColor White
    }
  
    If($Ping)
    {
     Write-Host $TestHost "is there" (Get-Date) -ForegroundColor Green #-BackgroundColor White
     Get-Registry $Server
    }
} 
  
  
If ($UserSID -ne ""){
    $UsersProfileKey = "SOFTWARE\Microsoft\Windows NT\CurrentVersion\ProfileList\$UserSID"
    Write-Host $UsersProfileKey
     
        ForEach ($Server in $Servers){
        Ping-Test $Server
    }
      
}