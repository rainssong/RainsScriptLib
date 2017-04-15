@echo off
set /P C=search: 
findstr /s /i "%C%" *.*
pause

