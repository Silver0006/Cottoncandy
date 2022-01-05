@ECHO off
c
cls
:start1
ECHO.
Echo ----CottonCandy 0.1.2 Created by Aidan Patrick Marias----
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
Echo ----CottonCandy 0.1.2 Created by Aidan Patrick Marias----
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
if '%choice%'=='G' goto end
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

cls

goto start2


:Windows_Server
cls
:start2
ECHO.
Echo ----CottonCandy 0.1.2 Created by Aidan Patrick Marias----
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
ECHO J. Stops User from shutdown without being logged in
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
Echo ----CottonCandy 0.1.2 Created by Aidan Patrick Marias----
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
