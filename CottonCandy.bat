@ECHO off
c
cls
:start
ECHO.
Echo ----CottonCandy Created by Aidan Patrick Marias----
ECHO 1. Disable Guest and Admin Status
ECHO 2. Rename Guest and Admin Accounts
ECHO 3. Requires Ctrl+Alt+Del to logon
ECHO 4. Turns on Automatic Updates
ECHO 5. Set Account Policies
ECHO 6. Set Audit Policies
ECHO 7. Deletes all files that go against no fun policy (Proceed with Caution)
ECHO 8. UAC Consent Prompt Behavior
ECHO 9. Enable Smart Screen
ECHO B. Resets Windows Firewall to Default Settings
ECHO A. All of the above (Proceed with Caution must be Done Separately)
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
if '%choice%'=='A' goto all
if '%choice%'=='E' goto end

ECHO "%choice%" is not available, try again
ECHO.
goto start

:dgaas
net user guest /active:no
net user administrator /active:no
goto start

:rgaaa
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
goto start

:lcad
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /v DisableCAD  /t REG_DWORD /d 0 /f
goto start

:au
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 3 /f
goto start

:ap
net accounts /lockoutthreshold:5
net accounts /MINPWLEN:14
net accounts /MINPWAGE:30
net accounts /MAXPWAGE:90
net accounts /UNIQUEPW:5
goto start

:aup
auditpol /set /category:"Account Logon" /success:enable /failure:enable
auditpol /set /category:"Account Management" /success:enable /failure:enable
auditpol /set /category:"Policy Change" /success:enable /failure:enable
auditpol /set /category:"Detailed Tracking" /success:enable /failure:enable
auditpol /set /category:"System" /success:enable /failure:enable
auditpol /set /category:"Logon/Logoff" /success:enable /failure:enable
goto start

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
goto start

:uac
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorAdmin  /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Policies\System /v ConsentPromptBehaviorUser /t REG_DWORD /d 1 /f
goto start

:ss
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\System /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKLM\SOFTWARE\Policies\Microsoft\Windows\CurrentVersion\Explorer /v EnableSmartScreen /t REG_DWORD /d 2 /f
REG ADD HKEY_LOCAL_MACHINE\Software\Policies\Microsoft\Windows\CurrentVersion /v EnableWebContentEvaluation /t REG_DWORD /d 1 /f
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft /v SmartScreenForTrustedDownloadsEnabled /t REG_DWORD /d 1 /f
goto start

:rfs
netsh advfirewall reset
goto start

:all
net user guest /active:no
net user administrator /active:no
powershell Rename-LocalUser -Name "Guest" -NewName "Holo"
powershell Rename-LocalUser -Name "Administrator" -NewName "Aegis"
REG ADD HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Winlogon /v DisableCAD  /t REG_DWORD /d 0 /f
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

goto start

:end
pause