@ECHO OFF

:start
net user
set choice=
set /p choice=Type the user to change password.

net user %choice% AegisHolo0006!

goto start