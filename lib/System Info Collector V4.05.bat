@echo off
mode con: cols=38 lines=19
title System Info Collector
set lang=
ver|find /i "XP">NUL && IF errorlevel 0 Set sys=xp
ver|find /i "°æ±¾">NUL && IF errorlevel 0 Set lang=chs
set /a per=0
set fld=%date:~10,4%-%date:~4,2%-%date:~7,2%
if "%lang%"=="chs" set fld=%date:~0,4%-%date:~5,2%-%date:~8,2%
if "%~nx0"=="0.bat" goto start
:main
cls
echo  *==================================*
call :ti
echo  #                                  #
call :ti
echo  #       System Info Collector      #
call :ti
echo  #                                  #
call :ti
echo  *==================================*
call :ti
echo  #                                  #
call :ti
echo  #          [1]  Collect            #
call :ti
echo  #                                  #
call :ti
echo  #          [2]  History            #
call :ti
echo  #                                  #
call :ti
echo  #          [3]  Exit               #
call :ti
echo  #                                  #
call :ti
echo  *==================================*
echo.
if "%lang%"=="chs" goto main%lang%
set /p=- How <nul
call :ti
call :ti
set /p=may <nul
call :ti
call :ti
set /p=I <nul
call :ti
call :ti
set /p=help <nul
call :ti
call :ti
set /p=you: <nul
call :ti
call :ti
set /p choice=
if "%choice%"=="1" goto collect
if "%choice%"=="2" goto history
if "%choice%"=="3" goto exit
call :mov
goto main
:mainchs
set t= ×ý×ýHow×ýmay×ýI×ýhelp×ýyou:×ý& for /l %%i in (1,1,22) do call set /p=%%t:~%%i,1%%<nul& call :ti
set /p choice=
if "%choice%"=="1" goto collect
if "%choice%"=="2" goto historychs
if "%choice%"=="3" goto exit
call :mov
goto main
:collect
call :mov
cls
title Collecting...
if not exist D:\Sysinfo\%fld% md D:\Sysinfo\%fld%
cd /d D:\Sysinfo\%fld%
type %0>0.bat
for /l %%i in (4,4,96) do if exist D:\Sysinfo\%fld%\%%i.txt del D:\Sysinfo\%fld%\%%i.txt 1>nul 2>nul
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp 1>nul 2>nul
echo createobject("wscript.shell").run"0.bat",vbhide>0.vbs
echo createobject("scripting.filesystemobject").GetFile(WScript.ScriptFullName).Delete(True)>>0.vbs
echo.
echo.
echo.
echo.
echo.
echo     Collecting System Information
echo.
echo.
echo.
echo.
if "%lang%"=="chs" goto collectchs
set /p=-          ^+ ^+ ^+ 04%%% ^+ ^+ ^+          -<nul
for /l %%i in (1,1,26) do set /p=<nul
start D:\Sysinfo\%fld%\0.vbs
set /a per+=4
goto waiting
:collectchs
set /p=^×ý^×ý^×ý^×ý^×ý^¡¤^¡¤^¡¤ 04%%% ^¡¤^¡¤^¡¤<nul
for /l %%i in (1,1,17) do set /p=<nul
start D:\Sysinfo\%fld%\0.vbs
set /a per+=4
goto waitingchs
:start
echo Computer Name: %computername%>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
:os
echo ====================== Operating System ======================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic os get Caption,CSDVersion,osarchitecture
if "%sys%"=="xp" set out=wmic os get Caption,CSDVersion
call :output
:motherboard
echo ========================= Motherboard ========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic BaseBoard get Manufacturer,Product,version
call :output
set out=wmic bios get manufacturer,name,SMBIOSBIOSVersion
call :output
Wmic Path Win32_OnBoardDevice get caption 2>nul|find /i "On">NUL
IF %errorlevel%==1 goto cpu
set out=Wmic Path Win32_OnBoardDevice get description
call :output
:cpu
echo ============================= CPU ============================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic cpu get name
call :output
set out=wmic cpu get socketdesignation,version
call :output
set out=wmic cpu get l2cachesize,l3cachesize,NumberOfCores,NumberOfLogicalProcessors
if "%sys%"=="xp" set out=Wmic cpu get l2cachesize,NumberOfCores,NumberOfLogicalProcessors
call :output
set out=wmic cpu get Currentclockspeed,ExtClock,Maxclockspeed
call :output
:memory
echo =========================== Memory ===========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic memorychip get capacity,devicelocator,speed,totalwidth
if "%sys%"=="xp" set out=wmic memlogical get TotalPhysicalMemory
call :output
:pagefile
echo ========================== Pagefile ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=Wmic Path Win32_PageFileUsage get caption,currentusage,peakusage
call :output
Wmic Path Win32_PageFilesetting get initialsize,maximumsize 2>nul|find /i "InitialSize">NUL 
IF errorlevel 1 goto graphics
set out=Wmic Path Win32_PageFilesetting get initialsize,maximumsize
call :output
:graphics
echo ========================== Graphics ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic path Win32_VideoController get Name
call :output
set out=wmic path Win32_VideoController get AdapterRAM,CurrentRefreshRate,MaxRefreshRate,MinRefreshRate
call :output
set out=wmic path Win32_VideoController get driverdate,driverversion
call :output
set out=wmic path Win32_VideoController get videomodedescription
call :output
:audio
echo ============================ Audio ===========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic sounddev get name
call :output
:network
echo =========================== Network ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic path Win32_NetworkAdapter WHERE PhysicalAdapter='TRUE' get name
if "%sys%"=="xp" set out=wmic path Win32_NetworkAdapter get name
call :output
:hdd
echo ========================= Hard Drive =========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic diskdrive get Model,Size
call :output
set out=wmic path win32_volume get caption,filesystem
if "%sys%"=="xp" set out=wmic path win32_DiskPartition get caption,size 
call :output
if "%sys%"=="xp" goto startup
set out=wmic path win32_volume get blocksize,capacity,freespace
call :output
:startup
echo =========================== Startup ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic startup get caption,command
call :output
:process
echo =========================== Process ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic process get description,executablepath
call :output
:service
echo =========================== Service ==========================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic Service get name,startmode,state
call :output
:user
echo ============================ User ============================>>D:\Sysinfo\%fld%\system-report.log
echo.>>D:\Sysinfo\%fld%\system-report.log
set out=wmic useraccount get disabled,name,status
call :output
:end
(echo --------------------------------------------------------------
echo.
echo  This file was created by System Info Collector V4.0
echo.
echo  %date% %time:~0,8%)>>D:\Sysinfo\%fld%\system-report.log
echo.>D:\Sysinfo\%fld%\flag.tmp
del %0
:output
set /a per+=4
echo %per%>D:\Sysinfo\%fld%\%per%.txt
%out%>D:\Sysinfo\%fld%\tmp.txt
(type D:\Sysinfo\%fld%\tmp.txt & echo.)>>D:\Sysinfo\%fld%\system-report.log
del D:\Sysinfo\%fld%\tmp.txt
goto :eof
:waiting
set /p=^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+ ^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+ ^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+ <nul
if %per% lss 10 set /p=^0<nul
set /p=%per%%%% <nul
set /p=^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+ ^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+ ^- <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
call :wmov
set /p=<nul
set /p=<nul
set /p=^+<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finish
for /l %%i in (1,1,9) do set /p=<nul
if %per% lss 10 set /p=^0<nul
set /p=%per%%%%<nul
for /l %%i in (1,1,9) do set /p=<nul
goto waiting
:waitingchs
set /p=^¡ñ<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤^¡ñ<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤^¡ñ<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤ <nul
if %per% lss 10 set /p=^0<nul
set /p=%per%%%% <nul
set /p=^¡ñ<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤^¡ñ<nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤^¡ñ<nul
call :ti
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
call :ti
set /p=<nul
set /p=<nul
set /p=^¡¤ <nul
if exist D:\Sysinfo\%fld%\%per%.txt (
del D:\Sysinfo\%fld%\%per%.txt
set /a per+=4
)
if exist D:\Sysinfo\%fld%\flag.tmp del D:\Sysinfo\%fld%\flag.tmp & goto finishchs
for /l %%i in (1,1,11) do set /p=<nul
if %per% lss 10 set /p=^0<nul
set /p=%per%%%%<nul
for /l %%i in (1,1,10) do set /p=<nul
goto waitingchs
:wmov
call :ti
call :ti
call :ti
call :ti
goto :eof
:finish
title Finished!
for /l %%i in (1,1,30) do set /p=<nul
set /p=--                                 --<nul
call :wmov
for /l %%i in (1,1,35) do set /p=<nul
set /p=-                               -<nul
call :wmov
for /l %%i in (1,1,32) do set /p=<nul
set /p=-                             -<nul
call :wmov
for /l %%i in (1,1,30) do set /p=<nul
set /p=-                           -<nul
call :wmov
for /l %%i in (1,1,28) do set /p=<nul
set /p=-                         -<nul
call :wmov
for /l %%i in (1,1,26) do set /p=<nul
set /p=-                       -<nul
call :wmov
for /l %%i in (1,1,24) do set /p=<nul
set /p=-                     -<nul
call :wmov
for /l %%i in (1,1,22) do set /p=<nul
set /p=-                   -<nul
call :wmov
for /l %%i in (1,1,20) do set /p=<nul
set /p=-                 -<nul
call :wmov
for /l %%i in (1,1,18) do set /p=<nul
set /p=-               -<nul
call :wmov
for /l %%i in (1,1,16) do set /p=<nul
set /p=-             -<nul
call :wmov
for /l %%i in (1,1,14) do set /p=<nul
set /p=-           -<nul
call :wmov
for /l %%i in (1,1,12) do set /p=<nul
set /p=-         -<nul
call :wmov
for /l %%i in (1,1,10) do set /p=<nul
set /p=-       -<nul
call :wmov
for /l %%i in (1,1,8) do set /p=<nul
set /p=-     -<nul
call :wmov
for /l %%i in (1,1,6) do set /p=<nul
set /p=-   -<nul
call :wmov
for /l %%i in (1,1,4) do set /p=<nul
set /p=- -<nul
call :wmov
for /l %%i in (1,1,2) do set /p=<nul
set /p=-<nul
call :wmov
for /l %%i in (1,1,5) do echo.
echo               All done !
for /l %%i in (1,1,8) do (echo.
call :ti)
for /l %%i in (1,1,100) do call :ti
start D:\Sysinfo\%fld% 2>nul
goto exit
:finishchs
title Finished!
for /l %%i in (1,1,20) do set /p=<nul
set t=^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý^×ý& for /l %%i in (1,1,14) do call set /p=%%t:~%%i,1%%<nul& call :ti
for /l %%i in (1,1,5) do echo.
echo               All done !
for /l %%i in (1,1,8) do (echo.
call :ti)
for /l %%i in (1,1,100) do call :ti
start D:\Sysinfo\%fld% 2>nul
goto exit
:history
if exist D:\Sysinfo start D:\Sysinfo & goto exit
echo.
set /p useless=- No history found !
set choice=
call :mov
goto main
:historychs
if exist D:\Sysinfo start D:\Sysinfo & goto exit
echo.
set /p useless=^×ý^×ýNo history found !
set choice=
call :mov
goto main
:mov
for /l %%i in (1,1,16) do (echo.
call :ti)
goto :eof
:ti
set /a m1=1%time:~6,2%
set /a s1=1%time:~9,2%
set /a t1=(%m1%-100)*100+%s1%-100
set /a t2=%t1%+1
:goon
set /a m2=1%time:~6,2%
if %m1% gtr %m2% set /a m2=%m2%+60
set /a s2=1%time:~9,2%
set /a la=(%m2%-100)*100+%s2%-100
if %la% lss %t2% goto goon
goto :eof
:exit
for /l %%i in (1,1,14) do (echo.
call :ti)
Rem Virus Killer, 2013/07/03 V4.05