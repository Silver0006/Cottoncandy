

@ECHO off
c
cls
:start1
ECHO.
Echo ----CottonCandy 0.1.3 Created by Aidan Patrick Marias----
ECHO 1. Windows 10
ECHO 2. Windows Server
ECHO 3. Experimental
ECHO 4. End

set choice=
set /p choice=Type the number to load batch file.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto Windows_10
if '%choice%'=='2' goto Windows_Server
if '%choice%'=='3' goto experimental
if '%choice%'=='4' goto End

ECHO "%choice%" is not available, try again
ECHO.
goto start1

:Windows_10
cls
:start2
ECHO.
Echo ----CottonCandy 0.1.3 Created by Aidan Patrick Marias----
ECHO 1. Disable Guest and Admin Status
ECHO 2. Rename Guest and Admin Accounts
ECHO 3. Disable Requirement for Ctrl+Alt+Del to logon
ECHO 4. Turns on Automatic Updates
ECHO 5. Set Account Policies
ECHO 6. Set Audit Policies
ECHO 7. Deletes all files that go against no fun policy (Proceed with Caution)
ECHO 8. UAC Consent Prompt Behavior
ECHO 9. Enable Smart Screen
ECHO B. Resets Windows Firewall to Default Settings
ECHO D. Block Microsoft Account Logon
ECHO G. Change User Password
ECHO H. Kill User
ECHO I. Stops last users to login in from being displayed
ECHO J. Stops last username from displaying on login
ECHO K. Stops User from shutdown without being logged in
ECHO L. Kill services
ECHO M. Start services (Proceed with Caution, may cause cmd to close)
ECHO N. Disable services
ECHO A. All of the above (Proceed with Caution must be Done Separately)
ECHO C. Go Back
ECHO E. End

set choice=
set /p choice=Type the number to load batch file. Listed in recommended order.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto dgaas
if '%choice%'=='2' goto rgaaa
if '%choice%'=='3' goto lcad
if '%choice%'=='4' goto au
if '%choice%'=='5' goto ap
if '%choice%'=='6' goto aup
if '%choice%'=='7' goto nf
if '%choice%'=='8' goto uac
if '%choice%'=='9' goto ss
if '%choice%'=='B' goto rfs
if '%choice%'=='D' goto bml
if '%choice%'=='F' goto ddls
if '%choice%'=='G' goto cup
if '%choice%'=='H' goto ku
if '%choice%'=='I' goto dontdisplaylastusername
if '%choice%'=='J' goto dontdisplayusername
if '%choice%'=='K' goto shutdownwithoutlogon
if '%choice%'=='L' goto killservice
if '%choice%'=='M' goto startservice
if '%choice%'=='N' goto disableservice
if '%choice%'=='A' goto all
if '%choice%'=='C' goto goback
if '%choice%'=='E' goto end



ECHO "%choice%" is not available, try again
ECHO.
goto start2

:dgaas
net user guest /active:no
net user administrator /active:no
goto start2

:rgaaa
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
goto start2

:lcad
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f
goto start2

:au
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
goto start2

:ap
net accounts /lockoutthreshold:5
net accounts /MINPWLEN:14
net accounts /MINPWAGE:30
net accounts /MAXPWAGE:90
net accounts /UNIQUEPW:5

goto start2

:aup
auditpol /set /category:"Account Logon" /success:enable /failure:enable
auditpol /set /category:"Account Management" /success:enable /failure:enable
auditpol /set /category:"Policy Change" /success:enable /failure:enable
auditpol /set /category:"Detailed Tracking" /success:enable /failure:enable
auditpol /set /category:"System" /success:enable /failure:enable
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
goto start2

:nf
C:
cd/
cd users
del /S *.jpg
del /S *.mp4
del /S *.mp3
del /S *.mov
del /S *.png
del /S *.jpeg
del /S *.mkv
del /S *.wav
del /S *.movpkg
del /S *.gif
del /S *.aif
del /S *.cda
del /S *.midi
del /S *.mid
del /S *.mpa
del /S *.ogg
del /S *.wma
del /S *.wpl
del /S *.ai
del /S *.bmp
del /S *.ico
del /S *.ps
del /S *.psd
del /S *.svg
del /S *.tif
del /S *.tiff
del /S *.avi
del /S *.flv
del /S *.h264
del /S *.m4v
del /S *.mpg
del /S *.mpeg
del /S *.mmv
del /S *.acc
del /S *.m2ts
goto start2


:uac
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin  /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
goto start2

:ss
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft /v SmartScreenForTrustedDownloadsEnabled /t REG_DWORD /d 1 /f
goto start2

:rfs
netsh advfirewall reset
goto start2

:bml
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v NoConnectedUser /t REG_DWORD /d 3 /f
goto start2

:ddls
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch /v Enabled /t REG_DWORD /d 1 /f
goto start2

:cup
net user
ECHO Press C to leave Change Password User
set choice=
set /p choice=Type the user to change password.
if '%choice%'=='C' goto start2
net user %choice% AegisHolo0006!

goto cup

:ku
net user
ECHO Press C to leave Kill User
set choice=
set /p choice=Type the user to delete user.
if '%choice%'=='C' goto start2
net user %choice% /delete

goto ku

:dontdisplaylastusername
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f

goto start2

:dontdisplayusername
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DontDisplayUserName /t REG_DWORD /d 1 /f

goto start2
:shutdownwithoutlogon
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v  ShutdownWithoutLogon /t REG_DWORD /d 0 /f

goto start2

:killservice
net stop "BcastDVRUserService" /y
net stop "BcastDVRUserService_8e1b8" /y
net stop "BTAGService" /y 
net stop "bthserv" /y
net stop "Browser" /y
net stop "MapsBroker" /y
net stop "Ifsvc" /y
net stop "IISADMIN" /y
net stop "irmon" /y
net stop "SharedAccess" /y
net stop "lltdsvc" /y
net stop "LxssManager" /y
net stop "FTPSVC" /y
net stop "MSiSCSI" /y
net stop "sshd" /y
net stop "PNRPsvc" /y
net stop "p2psvc" /y
net stop "p2pimsvc" /y 
net stop "PNRPAutoReg" /y
net stop "wercplsupport" /y
net stop "RasAuto" /y
net stop "SessionEnv" /y
net stop "TermService" /y
net stop "UmRdpService" /y
net stop "RpcLocator" /y
net stop "RemoteRegistry" /y
net stop "RemoteAccess" /y
net stop "LanmanServer" /y
net stop "simptcp" /y
net stop "SNMP" /y
net stop "sacsvr" /y
net stop "SSDPSRV" /y
net stop "upnphost" /y
net stop "WMSvc" /y
net stop "WerSvc" /y
net stop "Wecsvc" /y
net stop "WMPNetworkSvc" /y
net stop "icssvc" /y
net stop "WpnService" /y
net stop "PushToInstall" /y
net stop "WS-Management" /y
net stop "W3SVC" /y
net stop "XboxGipSvc" /y
net stop "XblAuthManager" /y
net stop "XblGameSave" /y
net stop "XboxNetApiSvc" /y


goto start2

:startservices
net start "AudioEndpointBuilder"&net start "Audiosrv"

goto start2

:disableservices
sc config "BcastDVRUserService" start= disabled
sc config "BcastDVRUserService_8e1b8" start= disabled
sc config "BTAGService" start= disabled
sc config "bthserv" start= disabled
sc config "Browser" start= disabled
sc config "MapsBroker" start= disabled
sc config "Ifsvc" start= disabled
sc config "IISADMIN" start= disabled
sc config "irmon" start= disabled
sc config "SharedAccess" start= disabled
sc config "lltdsvc" start= disabled
sc config "LxssManager" start= disabled
sc config "FTPSVC" start= disabled
sc config "MSiSCSI" start= disabled
sc config "sshd" start= disabled
sc config "PNRPsvc" start= disabled
sc config "p2psvc" start= disabled
sc config "p2pimsvc" start= disabled
sc config "PNRPAutoReg" start= disabled
sc config "wercplsupport" start= disabled
sc config "RasAuto" start= disabled
sc config "SessionEnv" start= disabled
sc config "TermService" start= disabled
sc config "UmRdpService" start= disabled
sc config "RpcLocator" start= disabled
sc config "RemoteRegistry" start= disabled
sc config "RemoteAccess" start= disabled
sc config "LanmanServer" start= disabled
sc config "simptcp" start= disabled
sc config "SNMP" start= disabled
sc config "sacsvr" start= disabled
sc config "SSDPSRV" start= disabled
sc config "upnphost" start= disabled
sc config "WMSvc" start= disabled
sc config "WerSvc" start= disabled
sc config "Wecsvc" start= disabled
sc config "WMPNetworkSvc" start= disabled
sc config "icssvc" start= disabled
sc config "WpnService" start= disabled
sc config "PushToInstall" start= disabled
sc config "WS-Management" start= disabled
sc config "W3SVC" start= disabled
sc config "XboxGipSvc" start= disabled
sc config "XblAuthManager" start= disabled
sc config "XblGameSave" start= disabled
sc config "XboxNetApiSvc" start= disabled

goto start2

:all
net user guest /active:no
net user administrator /active:no
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
net accounts /lockoutthreshold:5
net accounts /MINPWLEN:14
net accounts /MINPWAGE:30
net accounts /MAXPWAGE:90
net accounts /UNIQUEPW:5
auditpol /set /category:"Account Logon" /success:enable /failure:enable
auditpol /set /category:"Account Management" /success:enable /failure:enable
auditpol /set /category:"Policy Change" /success:enable /failure:enable
auditpol /set /category:"Detailed Tracking" /success:enable /failure:enable
auditpol /set /category:"System" /success:enable /failure:enable
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin  /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft /v SmartScreenForTrustedDownloadsEnabled /t REG_DWORD /d 1 /f
netsh advfirewall reset
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v NoConnectedUser /t REG_DWORD /d 3 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DontDisplayUserName /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v  ShutdownWithoutLogon /t REG_DWORD /d 0 /f
net stop "BcastDVRUserService"
net stop "BcastDVRUserService_8e1b8"
net stop "BTAGService"
net stop "bthserv"
net stop "Browser"
net stop "MapsBroker"
net stop "Ifsvc"
net stop "IISADMIN"
net stop "irmon"
net stop "SharedAccess"
net stop "lltdsvc"
net stop "LxssManager"
net stop "FTPSVC"
net stop "MSiSCSI"
net stop "sshd"
net stop "PNRPsvc"
net stop "p2psvc"
net stop "p2pimsvc
net stop "PNRPAutoReg
net stop "wercplsupport"
net stop "RasAuto"
net stop "SessionEnv"
net stop "TermService"
net stop "UmRdpService"
net stop "RpcLocator"
net stop "RemoteRegistry"
net stop "RemoteAccess"
net stop "LanmanServer"
net stop "simptcp"
net stop "SNMP"
net stop "sacsvr"
net stop "SSDPSRV"
net stop "upnphost"
net stop "WMSvc"
net stop "WerSvc"
net stop "Wecsvc"
net stop "WMPNetworkSvc"
net stop "icssvc"
net stop "WpnService"
net stop "PushToInstall"
net stop "WS-Management"
net stop "W3SVC"
net stop "XboxGipSvc"
net stop "XblAuthManager"
net stop "XblGameSave"
net stop "XboxNetApiSvc"


cls

goto start2


:Windows_Server
cls
:start2
ECHO.
Echo ----CottonCandy 0.1.3 Created by Aidan Patrick Marias----
ECHO 1. Disable Guest and Admin Status
ECHO 2. Rename Guest and Admin Accounts
ECHO 3. Disable Requirement Ctrl+Alt+Del to logon
ECHO 4. Turns on Automatic Updates
ECHO 5. Set Account Policies
ECHO 6. Set Audit Policies
ECHO 7. Deletes all files that go against no fun policy (Proceed with Caution)
ECHO 8. UAC Consent Prompt Behavior
ECHO 9. Enable Smart Screen
ECHO B. Resets Windows Firewall to Default Settings
ECHO D. Block Microsoft Account Logon
ECHO G. Change User Password
ECHO H. Kill User
ECHO I. Stops last users to login in from being displayed
ECHO J. Stops last username from displaying on login
ECHO K. Stops User from shutdown without being logged in
ECHO A. All of the above (Proceed with Caution must be Done Separately)
ECHO C. Go Back
ECHO E. End

set choice=
set /p choice=Type the number to load batch file. Listed in recommended order.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto dgaas
if '%choice%'=='2' goto rgaaa
if '%choice%'=='3' goto lcad
if '%choice%'=='4' goto au
if '%choice%'=='5' goto ap
if '%choice%'=='6' goto aup
if '%choice%'=='7' goto nf
if '%choice%'=='8' goto uac
if '%choice%'=='9' goto ss
if '%choice%'=='B' goto rfs
if '%choice%'=='D' goto bml
if '%choice%'=='F' goto ddls
if '%choice%'=='G' goto cup
if '%choice%'=='H' goto ku
if '%choice%'=='I' goto dontdisplaylastusername
if '%choice%'=='J' goto dontdisplayusername
if '%choice%'=='K' goto shutdownwithoutlogon
if '%choice%'=='A' goto all
if '%choice%'=='C' goto goback
if '%choice%'=='E' goto end


ECHO "%choice%" is not available, try again
ECHO.
goto start2

:dgaas
net user guest /active:no
net user administrator /active:no
goto start2

:rgaaa
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
goto start2

:lcad
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f
goto start2

:au
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
goto start2

:ap
net accounts /lockoutthreshold:5
net accounts /MINPWLEN:14
net accounts /MINPWAGE:30
net accounts /MAXPWAGE:90
net accounts /UNIQUEPW:5
goto start2

:aup
auditpol /set /category:"Account Logon" /success:enable /failure:enable
auditpol /set /category:"Account Management" /success:enable /failure:enable
auditpol /set /category:"Detailed Tracking" /success:enable /failure:enable
auditpol /set /category:"DS Access" /success:enable /failure:enable
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
auditpol /set /category:"Object Access" /success:enable /failure:enable
auditpol /set /category:"Policy Change" /success:enable /failure:enable
auditpol /set /category:"Privilege Use" /success:enable /failure:enable
auditpol /set /category:"System" /success:enable /failure:enable
goto start2

:nf
C:
cd/
cd users
del /S *.jpg
del /S *.mp4
del /S *.mp3
del /S *.mov
del /S *.png
del /S *.jpeg
del /S *.mkv
del /S *.wav
del /S *.movpkg
del /S *.gif
del /S *.aif
del /S *.cda
del /S *.midi
del /S *.mid
del /S *.mpa
del /S *.ogg
del /S *.wma
del /S *.wpl
del /S *.ai
del /S *.bmp
del /S *.ico
del /S *.ps
del /S *.psd
del /S *.svg
del /S *.tif
del /S *.tiff
del /S *.avi
del /S *.flv
del /S *.h264
del /S *.m4v
del /S *.mpg
del /S *.mpeg
del /S *.mmv
del /S *.acc
del /S *.m2ts


goto start2

:uac
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin  /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
goto start2

:ss
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft /v SmartScreenForTrustedDownloadsEnabled /t REG_DWORD /d 1 /f
goto start2

:rfs
netsh advfirewall reset
goto start2

:bml
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v NoConnectedUser /t REG_DWORD /d 3 /f
goto start2

:ddls
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch /v Enabled /t REG_DWORD /d 1 /f
goto start2

:cup
net user
ECHO Press C to leave Change Password User
set choice=
set /p choice=Type the user to change password.
if '%choice%'=='C' goto start2
net user %choice% AegisHolo0006!

goto cup

:ku
net user
ECHO Press C to leave Kill User
set choice=
set /p choice=Type the user to delete user.
if '%choice%'=='C' goto start2
net user %choice% /delete

goto ku

:dontdisplaylastusername
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 0 /f

goto start2

:dontdisplayusername
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DontDisplayUserName /t REG_DWORD /d 1 /f

goto start2

:shutdownwithoutlogon
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v  ShutdownWithoutLogon /t REG_DWORD /d 0 /f

goto start2

:all
net user guest /active:no
net user administrator /active:no
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DisableCAD /t REG_DWORD /d 0 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
net accounts /lockoutthreshold:5
net accounts /MINPWLEN:14
net accounts /MINPWAGE:30
net accounts /MAXPWAGE:90
net accounts /UNIQUEPW:5
auditpol /set /category:"Account Logon" /success:enable /failure:enable
auditpol /set /category:"Account Management" /success:enable /failure:enable
auditpol /set /category:"Detailed Tracking" /success:enable /failure:enable
auditpol /set /category:"DS Access" /success:enable /failure:enable
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
auditpol /set /category:"Object Access" /success:enable /failure:enable
auditpol /set /category:"Policy Change" /success:enable /failure:enable
auditpol /set /category:"Privilege Use" /success:enable /failure:enable
auditpol /set /category:"System" /success:enable /failure:enable
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin  /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft /v SmartScreenForTrustedDownloadsEnabled /t REG_DWORD /d 1 /f
netsh advfirewall reset
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v NoConnectedUser /t REG_DWORD /d 3 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REG ADD HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Authentication\LogonUI\UserSwitch /v Enabled /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v dontdisplaylastusername /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v DontDisplayUserName /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\Policies\System\ /v  ShutdownWithoutLogon /t REG_DWORD /d 0 /f

cls

goto start2


:experimental
ECHO.
Echo ----CottonCandy 0.1.3 Created by Aidan Patrick Marias----
ECHO 1. Unistall Programs (but it only works sometimes)
ECHO 3. Go back
ECHO 4. End


set choice=
set /p choice=Type the number to load batch file.
if not '%choice%'=='' set choice=%choice:~0,1%
if '%choice%'=='1' goto unistallprogram
if '%choice%'=='3' goto start1
if '%choice%'=='4' goto End

ECHO "%choice%" is not available, try again
ECHO.
goto experimental

:unistallprogram
cls
wmic product get Name, Version
ECHO Press C to goto main menu. Add " to Name
set choice=
set /p choice=Type the Program to Delete.
if '%choice%'=='C' goto start1
wmic product where name=%choice% call uninstall

goto unistallprogram

:goback
cls
goto start1

:end
pause