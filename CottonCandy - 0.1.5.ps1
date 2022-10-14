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
    Write-Host "2: Enable Powershell Scripts"
    Write-Host "3: FETCH"
    Write-Host "3: Final Flash"
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
    New-ItemProperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\Software\Microsoft\Windows Script Host\Settings" -Name "Enabled" -Value ”1” 
    New-Item -path "HKLM:\SOFTWARE\Policies\Microsoft\Windows" -Name "PowerShell"
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”1”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\PowerShell" -Name "EnableScripts" -Value ”1” 

    } '3' {
    #Used to allow disable restrictions for script 
      'You chose option #3'
    } '4' {
    
    
    
    
    set-executionpolicy AllSigned
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
    Write-Host "3: Enables Windows Firewall & Defender"
    Write-Host "4: Block Microsoft Account Login & Onedrive"
    Write-Host "5: Login Settings"
    Write-Host "6: Turns on Automatic Updates"
    Write-Host "7: Enable Smart Screen"
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


   ## \SOFTWARE\Policies\Microsoft\Windows Defender Security Center\App and Browser protection
    

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
    New-ItemProperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2”  -PropertyType "DWord"
    Set-Itemproperty -Path "HKLM:\SOFTWARE\Policies\Microsoft\Windows\System" -Name "EnableSmartScreen" -Value ”2” 


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
