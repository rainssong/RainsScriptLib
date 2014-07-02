@echo off
setlocal enabledelayedexpansion
for /f "skip=1 tokens=1,2 delims=\" %%a in ('fsutil fsinfo drives^|find /v ""') do (
    set aa=%%a
    set aa=!aa:~-2!
    for %%i in (!aa!) do fsutil fsinfo drivetype %%i
)
pause
