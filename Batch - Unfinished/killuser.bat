@ECHO OFF

:start
net user
set choice=
set /p choice=Type the user to delete user.

net user %choice% /delete 

goto start