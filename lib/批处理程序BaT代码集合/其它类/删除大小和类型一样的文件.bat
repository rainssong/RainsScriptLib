@ECHO OFF
SETLOCAL ENABLEDELAYEDEXPANSION
for /f "tokens=*" %%a in ('dir/a-d/b/oe') do set/a c+=1&set a!c!=%%a&set b!c!=%%~za&set c!c!=%%~xa
for /l %%a in (1,1,%c%) do set/a d=%%a+1&for /l %%b in (!d!,1,%c%) do if not !b%%a!.==. call :1 %%a %%b
goto :eof
:1
if !b%1!==!b%2! if !c%1!==!c%2! set b%2=&del "!a%2!"
goto :eof