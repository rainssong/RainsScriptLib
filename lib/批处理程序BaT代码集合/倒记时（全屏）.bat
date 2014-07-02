@echo off
echo exit|%ComSpec% /k prompt e 100 B4 00 B0 12 CD 10 B0 03 CD 10 CD 20 $_g$_q$_|debug>nul

chcp 437>nul
graftabl 936>nul

set all=20
:start
if "%all%"=="0" goto end
cls
set /a all=%all%-1
echo.
echo.
echo.
echo.
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo                           %all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%%all%
echo wscript.sleep 500>>ri.vbs &call ri.vbs &del ri.vbs
goto start
:end
cls
echo                                              The End
pause
 