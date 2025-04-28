#I hate Powershell 
set-executionpolicy Unrestricted
$start = function Show-Menu {
    
        $Title = 'CottonCandy 0.1.5 Designed by Aidan Patrick Marias'
   
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1. Tools"
    Write-Host "2: Install"
    Write-Host "3: Settings"
    Write-Host "Q: Press 'Q' to quit."
}
do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
#Tools Menu
    {
    '1' {
    $tools = function Show-Menu {

    
        $Subtitle1 = 'Tools'
   
    Clear-Host
    Write-Host "================ $Subtitle1 ================"
    
    Write-Host "1. Show Disabled Features"
    Write-Host "2: FETCH"
    Write-Host "3: Final Flash"
    Write-Host "4: Change User Passwords"
    Write-Host "5: Create User"
    Write-Host "6: Delete User"
    Write-Host "7: Give Administrator Access"
    Write-Host "8: Special Beam Cannon (Needs Chocolatey)"
    Write-Host "9: FIND MY FILE"
    Write-Host "10: Check for file shares"
    Write-Host "11: Clear DNS"
    Write-Host "12: Enable System Protection for 2GB"
    Write-Host "B: Press 'B' to Return to Menu."
    Write-Host "Q: Press 'Q' to quit."
}
do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    '1' {
    Get-WindowsOptionalFeature –Online | Where-Object {$_. State –eq “Disabled”} 
    } '2' {
    #Disable restrictions on Script
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”1” 
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”1” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”1” 


    } '3' {
    #End the Script
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”0” 
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”0” 
    set-executionpolicy AllSigned

    } '4' {
    $users = Get-LocalUser | Select-Object -ExpandProperty Name
    foreach ($user in $users) {
    Enable-LocalUser -Name "$User"
    Set-LocalUser -Name $User -Password (ConvertTo-SecureString -AsPlainText "CyberPatriot123!" -Force)
    Set-LocalUser -Name "$User" -PasswordNeverExpires 0
    Set-LocalUser -Name "$User" -NoChangePassword 0
    Write-Output $user
} 


    
    } '5' {
    Get-LocalUser | Out-Host
    $User = Read-Host -Prompt 'Input the user name'
    New-LocalUser -Name "$User"


    } '6' {
    Get-LocalUser | Out-Host
    $User = Read-Host -Prompt 'Input the user name'
    Remove-LocalUser -Name $User 

    } '7' {
    Get-LocalUser | Out-Host
    $User = Read-Host -Prompt 'Input the user name'
    Add-LocalGroupMember -Group "Administrators" -Member "$User"

    } '8' {
    try {
        winget list --accept-source-agreements
    }
    Catch {
        Write-Host "Installing Winget"
        choco install winget -y
        choco install winget.powershell -y
        winget list --accept-source-agreements 
    }
    $app = Read-Host -Prompt 'Input the App Name (Also try Id)'
    try {
        $MyApp = Get-WmiObject -Class Win32_Product | Where-Object{$_.Name -eq "$app"}
        $MyApp.Uninstall()
    }
    Catch {
        try {
        winget uninstall --id $app
        }
        Catch {
        Get-Package -Provider Programs -IncludeWindowsInstaller -Name "$app" | ForEach-Object {
            Uninstall-Package -Name $_.Name -ProviderName $_.ProviderName -Force}
        }
    }
    

    
    } '9' {
    Write-Output "Put space and Y after file type to avoid problematic directories (Ex: mp4 Y)"
    $file = Read-Host -Prompt 'Input the file type (Ex: mp4)' 
    $file, $confirm = $file -split ' ', 2
    Write-Output $file, $confirm
    if ($confirm -eq "Y") {
    Get-ChildItem -Path C:\ -Filter "*$file" -Recurse -ErrorAction SilentlyContinue | Where-Object { $_.FullName -notlike 'C:\Windows\*' }
    }
    else{Get-ChildItem -path C:\ -filter *.$file -file -ErrorAction silentlycontinue -recurse}
    } '10' {
    net share
    } '11' {
    ipconfig /flushdns
    } '12' {
    Enable-ComputerRestore -Drive C:
    Start-Process cmd "vssadmin resize shadowstorage /for=C: /on=C: /maxsize=10GB"


    } 'B' {
    if ($selection -eq 'B') {return $start}
    else {return $tools}
    }
    }
    pause
 }
 until ($selection -eq 'q')

 #Install Menu
    } '2' {
    $install = function Show-Menu {
    
        $Subtitle2 = 'Install'
   
    Clear-Host
    Write-Host "================ $Subtitle2 ================"
    
    Write-Host "1. Install Chocolatey"
    Write-Host "2: Update Chocolatey"
    Write-Host "3: Uninstall Chocolatey"
    Write-Host "4: Update All Packages"
    Write-Host "5: Install Firefox"
    Write-Host "6: Install Notepad++"
    Write-Host "7: Install Malwarebytes" 
    Write-Host "8: Install 7Zip" 
    Write-Host "9: Install Google Chrome (Not Working Install Manually)" 
    Write-Host "10: Install MyEventViewer" 
    Write-Host "11: Install VLC"
    Write-Host "12: Install Edge" 
    Write-Host "13: Install Audacity"
    Write-Host "14: Install Powershell 7"
    Write-Host "B: Press B to Return to Menu."
    Write-Host "Q: Press Q to quit."
}
do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    {
    "1" {
    Set-ExecutionPolicy Bypass -Scope Process -Force; `
  iex ((New-Object System.Net.WebClient).DownloadString("https://chocolatey.org/install.ps1"))
    } "2" {
    choco upgrade chocolatey -y
    } "3" {
    choco uninstall chocolatey -y
    } "4" {
    choco upgrade all -y
    } "5" {
    choco install firefox -y
    } "6" {
    choco install notepadplusplus.install -y
    } "7" {
    choco install malwarebytes -y
    } "8" {
    choco install 7zip -y
    } "9" {
    choco install googlechrome -y
    } "10" {
    choco install myeventviewer -y
    } "11" {
    choco install vlc -y
    } "12" {
    choco install microsoft-edge -y
    } "13" {
    choco install audacity -y
    } "14" {
    choco install powershell-core --pre -y


    } 'b' {
    if ($selection = 'b') {return $start}
    }
    }
    pause
 }
 until ($selection -eq 'q')
    } '3' {
    $settings = function Show-Menu {
    
        $Subtitle1 = 'Settings'
   
    Clear-Host
    Write-Host "================ $Subtitle1 ================"
    
    Write-Host "1. Disable Guest and Admin Accounts"
    Write-Host "2: Rename Guest and Admin Accounts"
    Write-Host "3: Enables Windows Firewall, WAC, & Defender"
    Write-Host "4: Block Microsoft Account Login & Onedrive"
    Write-Host "5: Login Settings"
    Write-Host "6: Turns on Automatic Updates"
    Write-Host "7: Enable Smart Screen"
    Write-Host "8: Disable Vulnerable Services"
    Write-Host "9: Enable Secure Services (WIP Still run)"
    Write-Host "10: Deletes all files that go against no fun policy (Proceed with Caution)"
    Write-Host "11: Set Audit Policies"
    Write-Host "12: Sets Default Browser to Firefox (WIP)" 
    Write-Host "13: Disable features" 
    Write-Host "B: Press 'B' to Return to Menu."
    Write-Host "Q: Press 'Q' to quit."
}
do
 {
    Show-Menu
    $selection = Read-Host "Please make a selection"
    switch ($selection)
    { "1" {
    Disable-LocalUser -Name "Guest"
    Disable-LocalUser -Name "Administrator"
    } "2" {
    Rename-LocalUser -Name "administrator" -NewName "Aegis"
    Rename-LocalUser -Name "guest" -NewName "Holo"
    } "3" {
    (New-Object -ComObject HNetCfg.FwPolicy2).RestoreLocalFirewallDefaults()
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center"
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSpyware" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender" -Name "DisableAntiSyware" -Value ”0” 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection"
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableIOAVProtection" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableIOAVProtection" -Value ”0” 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender\Real-Time Protection" -Name "DisableRealtimeMonitoring" -Value ”0” 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer"
    New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer"
    New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0” 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0"
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" -Name "UILockdown" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" -Name "UILockdown" -Value ”0” 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection"
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "DisallowExploitProtectionOverride" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "DisallowExploitProtectionOverride" -Value ”1” 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "UILockdown" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\App and Browser protection" -Name "UILockdown" -Value ”0” 
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" -Name "HideRansomwareRecovery" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Virus and threat protection" -Name "HideRansomwareRecovery" -Value ”0” 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Device performance and health"
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Device performance and health" -Name "UILockdown" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Device performance and health" -Name "UILockdown" -Value ”0” 
    New-Item -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Notifications"
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" -Name "DisableEnhancedNotifications" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows Defender Security Center\Notifications" -Name "DisableEnhancedNotifications" -Value ”0” 
    New-Item -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer"
    New-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKCU:\Software\Policies\Microsoft\Windows\Explorer" -Name "DisableNotificationCenter" -Value ”0”
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateDASD" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateDASD" -Value ”1”
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateCDRoms" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateCDRoms" -Value ”1”
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateFloppies" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon" -Name "AllocateFloppies" -Value ”1”
    New-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" -Name "AddPrinterDrivers" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Control\Print\Providers\LanMan Print Services\Servers" -Name "AddPrinterDrivers" -Value ”1”
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”1”

   

    

    

    } "4" {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "NoConnectedUser" -Value ”3”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "NoConnectedUser" -Value ”3” 
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\OneDrive" -Name "DisableFileSyncNGSC" -Value ”1” 
    
    } "5" {
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DisableCAD" -Value ”0”  
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLastUserName" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayLastUserName" -Value ”1” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs" -Value ”900”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "InactivityTimeoutSecs" -Value ”900” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ShutdownWithoutLogon" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ShutdownWithoutLogon" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayUserName" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayUserName" -Value ”1”
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -Value ”1”
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch" -Name "Enabled" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch" -Name "Enabled" -Value ”1”
    net accounts /lockoutthreshold:5
    net accounts /MINPWLEN:14
    net accounts /MINPWAGE:30
    net accounts /MAXPWAGE:90
    net accounts /UNIQUEPW:5
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\System\CurrentControlSet\Control\Lsa" -Name "LimitBlankPasswordUse" -Value ”1”
    




    } "6" {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value ”4”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "AUOptions" -Value ”4” 
    New-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU" -Name "NoAutoUpdate" -Value ”0” 
    New-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetDisableUXWUAccess" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetDisableUXWUAccess" -Value ”0” 
    New-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetupdateNotificationLevel" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetupdateNotificationLevel" -Value ”0” 
    New-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetupdateNotificationLevel" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate" -Name "SetupdateNotificationLevel" -Value ”0” 
    } "7" {
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer"
    New-Item -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2” 
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableSmartScreen" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableSmartScreen" -Value ”2” 
    New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion" -Name "EnableWebContentEvaluation" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion" -Name "EnableWebContentEvaluation" -Value ”1” 
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft" -Name "SmartScreenForTrustedDownloadsEnabled" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Policies\Microsoft" -Name "SmartScreenForTrustedDownloadsEnabled" -Value ”1” 

    } "8" {
    get-service | Where-Object {$_.Name -eq "BTAGService"} |  Stop-Service -Force 
    Set-Service "BTAGService" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "bthserv"} |  Stop-Service -Force
    Set-Service "bthserv" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "Browser"} |  Stop-Service -Force
    Set-Service "Browser" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "MapsBroker"} |  Stop-Service -Force
    Set-Service "MapsBroker" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "lfsvc"} |  Stop-Service -Force
    Set-Service "lfsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "IISADMIN"} |  Stop-Service -Force
    Set-Service "IISADMIN" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "irmon"} |  Stop-Service -Force
    Set-Service "irmon" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "SharedAccess"} |  Stop-Service -Force
    Set-Service "SharedAccess" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "lltdsvc"} |  Stop-Service -Force
    Set-Service "lltdsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "LxssManager"} |  Stop-Service -Force
    Set-Service "LxssManager" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "FTPSVC"} |  Stop-Service -Force
    Set-Service "FTPSVC" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "MSiSCSI"} |  Stop-Service -Force
    Set-Service "MSiSCSI" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "sshd"} |  Stop-Service -Force
    Set-Service "sshd" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "PNRPsvc"} |  Stop-Service -Force
    Set-Service "PNRPsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "p2psvc"} |  Stop-Service -Force
    Set-Service "p2psvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "p2pimsvc"} |  Stop-Service -Force
    Set-Service "p2pimsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "PNRPAutoReg"} |  Stop-Service -Force
    Set-Service "PNRPAutoReg" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "Spooler"} |  Stop-Service -Force
    Set-Service "Spooler" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "wercplsupport"} |  Stop-Service -Force
    Set-Service "wercplsupport" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RasAuto"} |  Stop-Service -Force
    Set-Service "RasAuto" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "SessionEnv"} |  Stop-Service -Force
    Set-Service "SessionEnv" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "TermService"} |  Stop-Service -Force
    Set-Service "TermService" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "UmRdpService"} |  Stop-Service -Force
    Set-Service "UmRdpService" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RpcLocator"} |  Stop-Service -Force
    Set-Service "RpcLocator" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RemoteRegistry"} |  Stop-Service -Force
    Set-Service "RemoteRegistry" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RemoteAccess"} |  Stop-Service -Force
    Set-Service "RemoteAccess" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "LanmanServer"} |  Stop-Service -Force
    Set-Service "LanmanServer" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "simptcp"} |  Stop-Service -Force
    Set-Service "simptcp" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "SNMP"} |  Stop-Service -Force
    Set-Service "SNMP" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "sacsvr"} |  Stop-Service -Force
    Set-Service "sacsvr" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "SSDPSRV"} |  Stop-Service -Force
    Set-Service "SSDPSRV" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "upnphost"} |  Stop-Service -Force
    Set-Service "upnphost" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "WMSvc"} |  Stop-Service -Force
    Set-Service "WMSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "WerSvc"} |  Stop-Service -Force
    Set-Service "WerSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "Wecsvc"} |  Stop-Service -Force
    Set-Service "Wecsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "icssvc"} |  Stop-Service -Force
    Set-Service "icssvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "WMPNetworkSvc"} |  Stop-Service -Force
    Set-Service "WMPNetworkSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "WpnService"} |  Stop-Service -Force
    Set-Service "WpnService" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "PushToInstall"} |  Stop-Service -Force
    Set-Service "PushToInstall" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "WinRM"} |  Stop-Service -Force
    Set-Service "WinRM" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "W3SVC"} |  Stop-Service -Force
    Set-Service "W3SVC" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XboxGipSvc"} |  Stop-Service -Force
    Set-Service "XboxGipSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XblAuthManager"} |  Stop-Service -Force
    Set-Service "XblAuthManager" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XblGameSave"} |  Stop-Service -Force
    Set-Service "XblGameSave" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XboxNetApiSvc"} |  Stop-Service -Force
    Set-Service "XboxNetApiSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "PlugPlay"} |  Stop-Service -Force
    Set-Service "PlugPlay" -StartupType  Disabled

    


   
    } "9" {
    ##Access denied for some reason? Need to recheck
   
    get-service | Where-Object {$_.Name -eq "BDESVC"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\BDESVC" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\BDESVC" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "wbengine"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\wbengine" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\wbengine" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "BFE"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\BFE" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\BFE" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "AppIDSvc"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\AppIDSvc" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\AppIDSvc" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "WaaSMedicSvc"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\WaaSMedicSvc" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\WaaSMedicSvc" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "EventLog"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\EventLog" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\EventLog" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "Wecsvc"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Wecsvc" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\Wecsvc" -Name "Start" -Value ”2”
    get-service | Where-Object {$_.Name -eq "Sense"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\Sense" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\Sense" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "svsvc"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\svsvc" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\svsvc" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "mpssvc"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\mpssvc" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\mpssvc" -Name "Start" -Value ”2”  
    get-service | Where-Object {$_.Name -eq "wuauserv"} |  Start-Service 
    New-ItemProperty -Path "HKLM:\System\CurrentControlSet\Services\wuauserv" -Name "Start" -Value ”2” -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\System\CurrentControlSet\Services\wuauserv" -Name "Start" -Value ”2”  
    
    



    } "10" {
    Start-Process cmd "/c del /S C:\Users\*.jpg"
    Start-Process cmd "/c del /S C:\Users\*.mp4"
    Start-Process cmd "/c del /S C:\Users\*.mp3"
    Start-Process cmd "/c del /S C:\Users\*.mov"
    Start-Process cmd "/c del /S C:\Users\*.png"
    Start-Process cmd "/c del /S C:\Users\*.jpeg"
    Start-Process cmd "/c del /S C:\Users\*.mkv"
    Start-Process cmd "/c del /S C:\Users\*.wav"
    Start-Process cmd "/c del /S C:\Users\*.movpkg"
    Start-Process cmd "/c del /S C:\Users\*.gif"
    Start-Process cmd "/c del /S C:\Users\*.aif"
    Start-Process cmd "/c del /S C:\Users\*.cda"
    Start-Process cmd "/c del /S C:\Users\*.midi"
    Start-Process cmd "/c del /S C:\Users\*.mid"
    Start-Process cmd "/c del /S C:\Users\*.mpa"
    Start-Process cmd "/c del /S C:\Users\*.ogg"
    Start-Process cmd "/c del /S C:\Users\*.wma"
    Start-Process cmd "/c del /S C:\Users\*.wpl"
    Start-Process cmd "/c del /S C:\Users\*.ai"
    Start-Process cmd "/c del /S C:\Users\*.bmp"
    Start-Process cmd "/c del /S C:\Users\*.ico"
    Start-Process cmd "/c del /S C:\Users\*.ps"
    Start-Process cmd "/c del /S C:\Users\*.psd"
    Start-Process cmd "/c del /S C:\Users\*.svg"
    Start-Process cmd "/c del /S C:\Users\*.tif"
    Start-Process cmd "/c del /S C:\Users\*.tiff"
    Start-Process cmd "/c del /S C:\Users\*.avi"
    Start-Process cmd "/c del /S C:\Users\*.flv"
    Start-Process cmd "/c del /S C:\Users\*.h264"
    Start-Process cmd "/c del /S C:\Users\*.m4v"
    Start-Process cmd "/c del /S C:\Users\*.mpg"
    Start-Process cmd "/c del /S C:\Users\*.mpeg"
    Start-Process cmd "/c del /S C:\Users\*.mmv"
    Start-Process cmd "/c del /S C:\Users\*.acc"
    Start-Process cmd "/c del /S C:\Users\*.m2ts"
    Start-Process cmd "/c del /S C:\Users\*.dts"
    Start-Process cmd "/c del /S C:\Users\*.wmv"
    Start-Process cmd "/c del /S C:\Users\*.webp"
    Start-Process cmd "/c del /S C:\Users\*.3GP"
    Start-Process cmd "/c del /S C:\Users\*.ADTS"
    Start-Process cmd "/c del /S C:\Users\*.FLAC"
    Start-Process cmd "/c del /S C:\Users\*.mpeg-2"
    Start-Process cmd "/c del /S C:\Users\*.mpeg-4"
    Start-Process cmd "/c del /S C:\Users\*.WebM"
    Start-Process cmd "/c del /S C:\Users\*.DivX"
    Start-Process cmd "/c del /S C:\Users\*.ASF"
    Start-Process cmd "/c del /S C:\Users\*.jfif"




	
	

    } "11" {
    auditpol /set /category:"System" /failure:enable /success:enable
    auditpol /set /category:"Account Management" /failure:enable /success:enable
    auditpol /set /category:"Account Logon" /failure:enable /success:enable
    auditpol /set /category:"Logon/Logoff" /failure:enable /success:enable
    auditpol /set /category:"Policy Change" /failure:enable /success:enable
    auditpol /set /category:"Detailed Tracking" /failure:enable /success:enable
    auditpol /set /category:"DS Access" /failure:enable /success:enable
    auditpol /set /category:"Object Access" /failure:enable /success:enable
    auditpol /set /category:"Privilege Use" /failure:enable /success:enable
    } "12" {
    Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\http\UserChoice' -name ProgId FireFoxHTML
    Set-ItemProperty 'HKCU:\Software\Microsoft\Windows\Shell\Associations\UrlAssociations\https\UserChoice' -name ProgId FireFoxHTML

    } "13" {
    Disable-WindowsOptionalFeature -Online -FeatureName "SimpleTCP" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol-Client" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "SMB1Protocol-Server" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "TelnetClient" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "TFTP" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "IIS-WebServer" -Verbose -NoRestart
    Disable-WindowsOptionalFeature -Online -FeatureName "IIS-FTPServer" -Verbose -NoRestart


    }
    }
    pause
 }
 until ($selection -eq 'q')
    }
    }
    pause
 }
 until ($selection -eq 'q')