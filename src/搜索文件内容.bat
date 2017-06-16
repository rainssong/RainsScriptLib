@echo off
set /P C=search: 
set /P F=file(*.*):
findstr /s /i "%C%" %F%
pause

