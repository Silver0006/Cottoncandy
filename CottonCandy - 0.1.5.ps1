#I hate Powershell 
set-executionpolicy Unrestricted
$start = function Show-Menu {
    
        $Title = 'CottonCandy 0.1.5 Designed by Aidan Patrick Marias'
   
    Clear-Host
    Write-Host "================ $Title ================"
    
    Write-Host "1. Tools"
    Write-Host "2: Install"
    Write-Host "3: Press '3' for this option."
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
    #End the Image
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”0” 
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "EnableLUA" -Value ”0” 
    set-executionpolicy AllSigned

    } '4' {

    Get-LocalUser | Out-Host
    Write-Host "Doesn't work on disabled Users"
    $User = Read-Host -Prompt 'Input the user name'
    Set-LocalUser -Name $User -Password (ConvertTo-SecureString -AsPlainText "AegisHolo0006!" -Force)

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
    Write-Host "9: Install Google Chrome" 
    Write-Host "10: Install MyEventViewer" 
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
    Write-Host "9: Enable Secure Services (WIP)"
    Write-Host "10: Deletes all files that go against no fun policy (Proceed with Caution)"
    Write-Host "11: Set Audit Policies"
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
    New-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\Software\Policies\Microsoft\Windows\Installer" -Name "AlwaysInstallElevated" -Value ”0” 
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
    New-Item -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System"
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”2” 
    New-ItemProperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0” 



    

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
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorAdmin" -Value ”1” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "ConsentPromptBehaviorUser" -Value ”0” 
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayUserName" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "DontDisplayUserName" -Value ”1”
    New-ItemProperty -Path "HKCU:\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKCU:\Software\Microsoft\Windows\CurrentVersion\Policies\System" -Name "HideFastUserSwitching" -Value ”1”
    New-Item -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch" -Name "Enabled" -Value ”1”  -PropertyType "DWord"
    Set-ItemProperty -Path "HKLM:\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch" -Name "Enabled" -Value ”1”





    } "6" {
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
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2” 
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableSmartScreen" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer" -Name "EnableSmartScreen" -Value ”2” 
    New-ItemProperty -Path "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion" -Name "EnableWebContentEvaluation" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\Software\Policies\Microsoft\Windows\CurrentVersion" -Name "EnableWebContentEvaluation" -Value ”1” 
    New-ItemProperty -Path "HKLM\SOFTWARE\Policies\Microsoft" -Name "SmartScreenForTrustedDownloadsEnabled" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM\SOFTWARE\Policies\Microsoft" -Name "SmartScreenForTrustedDownloadsEnabled" -Value ”1” 

    } "8" {
    get-service | Where-Object {$_.Name -eq "Spooler"} |  Stop-Service
    Set-Service "Spooler" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RetailDemo"} |  Stop-Service
    Set-Service "RetailDemo" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "seclogon"} |  Stop-Service
    Set-Service "seclogon" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "SNMPTRAP"} |  Stop-Service
    Set-Service "SNMPTRAP" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XboxNetApiSvc"} |  Stop-Service
    Set-Service "XboxNetApiSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XblGameSave"} |  Stop-Service
    Set-Service "XblGameSave" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XblAuthManager"} |  Stop-Service
    Set-Service "XblAuthManager" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "XboxGipSvc"} |  Stop-Service
    Set-Service "XboxGipSvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "upnphost"} |  Stop-Service
    Set-Service "upnphost" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "RemoteRegistry"} |  Stop-Service
    Set-Service "RemoteRegistry" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "PlugPlay"} |  Stop-Service
    Set-Service "PlugPlay" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "lfsvc"} |  Stop-Service
    Set-Service "lfsvc" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "bthserv"} |  Stop-Service
    Set-Service "bthserv" -StartupType  Disabled
    get-service | Where-Object {$_.Name -eq "BTAGService"} |  Stop-Service
    Set-Service "BTAGService" -StartupType  Disabled
   
    } "9" {
    ##Access denied for some reason
    get-service | Where-Object {$_.Name -eq "BDESVC"} |  Start-Service 
    Set-Service "BDESVC" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "wbengine"} |  Start-Service 
    Set-Service "wbengine" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "BFE"} |  Start-Service 
    Set-Service "BFE" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "AppIDSvc"} |  Start-Service 
    Set-Service "AppIDSvc" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "WaaSMedicSvc"} |  Start-Service 
    Set-Service "WaaSMedicSvc" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "EventLog"} |  Start-Service 
    Set-Service "EventLog" -StartupType  Boot -force
    get-service | Where-Object {$_.Name -eq "Wecsvc"} |  Start-Service 
    Set-Service "Wecsvc" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "mpssvc"} |  Start-Service 
    Set-Service "mpssvc" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "Sense"} |  Start-Service 
    Set-Service "Sense" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "svsvc"} |  Start-Service 
    Set-Service "svsvc" -StartupType  Boot 
    get-service | Where-Object {$_.Name -eq "mpssvc"} |  Start-Service 
    Set-Service "mpssvc" -StartupType  Boot 
    
    } "10" {
    C:
    cd ..
    cd users
    Remove-Item C:\Users\hidden-RO-file*.jpg
    Remove-Item C:\Users\hidden-RO-file*.mp4
    Remove-Item C:\Users\hidden-RO-file*.mp3
    Remove-Item C:\Users\hidden-RO-file*.mov
    Remove-Item C:\Users\hidden-RO-file*.png
    Remove-Item C:\Users\hidden-RO-file*.jpeg
    Remove-Item C:\Users\hidden-RO-file*.mkv
    Remove-Item C:\Users\hidden-RO-file*.wav
    Remove-Item C:\Users\hidden-RO-file*.movpkg
    Remove-Item C:\Users\hidden-RO-file*.gif
    Remove-Item C:\Users\hidden-RO-file*.aif
    Remove-Item C:\Users\hidden-RO-file*.cda
    Remove-Item C:\Users\hidden-RO-file*.midi
    Remove-Item C:\Users\hidden-RO-file*.mid
    Remove-Item C:\Users\hidden-RO-file*.mpa
    Remove-Item C:\Users\hidden-RO-file*.ogg
    Remove-Item C:\Users\hidden-RO-file*.wma
    Remove-Item C:\Users\hidden-RO-file*.wpl
    Remove-Item C:\Users\hidden-RO-file*.ai
    Remove-Item C:\Users\hidden-RO-file*.bmp
    Remove-Item C:\Users\hidden-RO-file*.ico
    Remove-Item C:\Users\hidden-RO-file*.ps
    Remove-Item C:\Users\hidden-RO-file*.psd
    Remove-Item C:\Users\hidden-RO-file*.svg
    Remove-Item C:\Users\hidden-RO-file*.tif
    Remove-Item C:\Users\hidden-RO-file*.tiff
    Remove-Item C:\Users\hidden-RO-file*.avi
    Remove-Item C:\Users\hidden-RO-file*.flv
    Remove-Item C:\Users\hidden-RO-file*.h264
    Remove-Item C:\Users\hidden-RO-file*.m4v
    Remove-Item C:\Users\hidden-RO-file*.mpg
    Remove-Item C:\Users\hidden-RO-file*.mpeg
    Remove-Item C:\Users\hidden-RO-file*.mmv
    Remove-Item C:\Users\hidden-RO-file*.acc
    Remove-Item C:\Users\hidden-RO-file*.m2ts
    Remove-Item C:\Users\hidden-RO-file*.dts
    Remove-Item C:\Users\hidden-RO-file*.wmv

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
