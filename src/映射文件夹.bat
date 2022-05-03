@echo off
echo Link From :
set /P C=[Import]: 
echo Link To :
set /P T=[Import]: 
mklink /j %T% %C%
pause