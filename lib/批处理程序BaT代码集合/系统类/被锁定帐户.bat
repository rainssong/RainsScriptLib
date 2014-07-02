@echo off
REM This batch file can only be used on windows2000 or later OS in chinese simplified version.
 REM And this batch file can be used on workstations or member servers in a domain.
 REM The function of it is to get a list of all locked or disabled users of a domaim.
 REM Making a little change, you can use this batch file on windows in other language version or on domian controller.
 REM I marked those lines as follow.
 REM author: beginner@yeah.net http://blog.chinaunix.net/index.php?blogId=739 

cd /d %TEMP%
for %%i in (user2.txt lockedusers.txt) do if exist %%i del %%i 
 REM Changing the next 4 lines can meet your special require.
net user /domain |find /v "命令成功完成" >user.txt
for /f "skip=6 tokens=1" %%i in (user.txt) do echo %%i >>user2.txt
for /f "skip=6 tokens=2" %%i in (user.txt) do echo %%i >>user2.txt
for /f "skip=6 tokens=3" %%i in (user.txt) do echo %%i >>user2.txt

 REM Changing the next line can meet your special require.
echo net user %%1 /domain ^|find "帐户启用               No" >user.bat
echo goto answer%%errorlevel%% >>user.bat
echo :answer0 >>user.bat
echo echo %%1 ^>^> lockedusers.txt >>user.bat
echo goto end >>user.bat
echo :answer1 >>user.bat
echo :end >>user.bat

for /f %%i in (user2.txt) do call user.bat %%i
for %%i in (user.txt user2.txt user.bat) do if exist %%i del %%i
cls

@if exist lockedusers.txt (
date /t >> lockedusers.txt
time /t >> lockedusers.txt
notepad.exe lockedusers.txt
) else (
echo   There is no locked user!
pause
)
