@echo off
:: 检测IP格式是否标准
:: code by jm 2006-10-23
:begin
cls
set input=
set /p input=请输入IP：
echo %input%|findstr "^[0-9]*\.[0-9]*\.[0-9]*\.[0-9]*$">nul||goto fail
set _input=%input:.= %
call :check %_input%

:check
if "%4"=="" goto fail
for %%i in (%1 %2 %3 %4) do (
    if %%i gtr 255 goto fail
)
cls
echo %input% 是正确的IP
echo.
pause
goto begin

:fail
cls
echo %input% 是错误的IP
echo.
pause
goto begin
    