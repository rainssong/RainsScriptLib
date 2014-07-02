:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn
:: 9306516整理(非本人原创)
@echo off
for /f %%i in (a.txt) do set /p=%%i <nul
echo.
pause


@echo off
setlocal enabledelayedexpansion
for /f %%i in (a.txt) do set str=!str! %%i
echo %str%
pause 
