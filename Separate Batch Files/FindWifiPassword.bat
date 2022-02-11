@ECHO off
ECHO Made by Aidan Patrick Marias
ECHO You're welcome Kennan
:findwifi
netsh wlan show profile
ECHO Press C to leave Find Wifi Password
set choice=
set /p choice=Type the network to find the password.
if '%choice%'=='C' goto goback
netsh wlan show profile %choice% key=clear
goto findwifi

:goback
pause