function Shutdown-Computer {
 
param ($computer, $type, $cred)
    switch ($type) {
    'Log Off' {$ShutdownType = "0"}
    'Shutdown' {$ShutdownType = "1"}
    'Reboot' {$ShutdownType = "2"}
    'Forced Log Off' {$ShutdownType = "4"}
    'Forced Shutdown' {$ShutdownType = "5"}
    'Forced Reboot' {$ShutdownType = "6"}
    'Power Off' {$ShutdownType = "8"}
    'Forced Power Off' {$ShutdownType = "12"}
    }
     
    $Error.Clear()
    if ($cred -eq $null) {
  trap { continue }
  (Get-WmiObject win32_operatingsystem -ComputerName $computer -ErrorAction SilentlyContinue).Win32Shutdown($ShutdownType)
    }
     
    if ($cred -eq "other") {
  trap { continue }
  (Get-WmiObject win32_operatingsystem -ComputerName $computer -ErrorAction SilentlyContinue -Credential (get-Credential)).Win32Shutdown($ShutdownType)
    }
}