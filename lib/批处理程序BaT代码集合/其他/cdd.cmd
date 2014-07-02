@echo off
:: cdÃüÁîÔöÇ¿°æ  code by bagpipe 2006-7-28
call :test %0.bat
cd /d %*
:test
if "%~$PATH:1"=="" path=%~dp0;%path%
goto :eof