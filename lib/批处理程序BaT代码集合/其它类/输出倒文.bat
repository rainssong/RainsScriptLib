@echo off 
:star
set Output=
set /p Enter=ÇëÊäÈë:
:Start
if not "%Enter%"=="" (
set Output=%Output%%Enter:~-1%
set Enter=%Enter:~0,-1%
goto :Start)
echo.
echo        %Output% 
pause >nul&goto :Star