::getvar.bat
@if [%2]==[] goto help
@if [%1]==[/?] goto help
@if [%1]==[/h] goto help
@if [%1]==[invoke] prompt set %2=%3&#36;_
@if [%1]==[invoke] goto end
@if [%temp%]==[] set temp=c:
@%comspec% /c %0 invoke %1 &#36;%2>%TEMP%\tt.bat
@echo off
call %TEMP%\tt.bat
if "%3"=="" DEL %TEMP%\tt.bat
set CMDLINE=
goto end
:help
@echo off
echo.
echo    GET.BAT V1.0  Lydong 030625
echo    ===============================
echo    get curver [Command]
echo    get [/?] or [/h]
echo.
echo    eg: get time t
echo        get dosver v
echo.
echo    Command:
echo          T   Current time
echo          D   Current date
echo          P   Current drive and path
echo          V   Windows version number
echo          N   Current drive
echo    ===============================
echo.
:end
exit

:: GetVar.bat - Get from ';PROMPT'; text to environment variable 
:: Will Sort - 10:29 2005-7-16 - CMD@XP/COMMAND@Win98/MSDOS6.22
@echo off
echo exit | %comspec% /k prompt set %1=%2&#36;_:: > _GetVar.bat
call _GetVar.bat
for %%f in (_GetVar*.*) do del %%f