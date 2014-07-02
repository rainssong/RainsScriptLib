@echo off

:: Code by pengfei 2007-2-13 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=27677

mode con: cols=80 lines=25
if exist "%tmp%\win.reg" del /a /f "%tmp%\win.reg"
:index
title WIN安全优化小助手  作者:木林森  QQ:573381312
color 27
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤   Windows 安 全 优 化 小 助 手   ├────────╮
echo    │                │                                  │                │
echo    │ 测试环境:XP    ╰─────────────────╯                │
echo  W │                                                                      │W
echo  W │ ★ 系统优化: 系统垃圾清理; 操作系统优化; 手动优化启动项; 网络优化.   │W
echo  W │                                                                      │W
echo  . │ ★ 系统安全: 操作系统安全漏洞修补; 防火墙状态检测与开启.             │.
echo  C │                                                                      │C
echo  N │ ★ 系统修复: 常见系统错误修复; IE还原初始状态; 系统功能修复.         │N
echo  - │                                                                      │-
echo  D │ ★ 系统设置快速生效: 重启explorer刷新注册表信息, 对某些设置有作用.   │D
echo  O │                                                                      │O
echo  S │ 注意: 小助手的大部分功能都是通过操作注册表来完成的, 如果您的电脑上   │S
echo  . │       安装有注册表监控功能的软件, 请先关闭或者选择同意修改.          │.
echo  N │       完成操作后必须重启电脑才能生效.                                │N
echo  E │                                                                      │E
echo  T │ ☆ 操作选项 ☆                                                       │T
echo    │                                                                      │
echo    │    1.系统优化  2.系统安全  3.系统修复  4.系统设置快速生效  5.退出    │
echo    ╰───────────────────────────────────╯
echo.
set start=
set /p start=    输入(1 2 3 4 5)后按回车键:
if "%start%"=="1" goto YH
if "%start%"=="2" goto AQ
if "%start%"=="3" goto XF
if "%start%"=="4" goto SX
if "%start%"=="5" goto :eof
if /i "%start%"=="q" goto :eof
goto index


:: 系统优化______________________________________________________________________
:YH
title 系统优化  作者:木林森  QQ:573381312
color 1A
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤       系    统    优    化       ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ 虽然Windows未经过调整也可以工作得很正常,但人们总是喜欢从中挖掘出     │
echo    │ 更多的性能来.                                                        │
echo    │                                                                      │
echo    │ 操作系统如果没有经常维护,硬盘上的无用文件越来越多, 注册表变得臃肿,   │
echo    │ 久而久之计算机速度越来越慢.                                          │
echo    │                                                                      │
echo    │ 系统优化功能可以免去手动设置的繁琐, 让你简单的几步操作就能完成优化   │
echo    │ 设置, 这也是我写这款"安全优化小助手"的初衷.                          │
echo    │                                                                      │
echo    │ 完成这些操作还只是电脑优化设置的开始, 接下来应该使用其他工具清理     │
echo    │ 注册表, 整理磁盘碎片等, 这样计算机速度就会提高不少...                │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1.系统垃圾清理 2.优化操作系统 3.优化启动项 4.网络优化 5.返回      │
echo    ╰───────────────────────────────────╯
echo.
set YH=
set /p YH=    输入(1 2 3 4 5 q=exit)后按回车键:
if "%YH%"=="1" goto yh1
if "%YH%"=="2" goto yh2
if "%YH%"=="3" goto yh3
if "%YH%"=="4" goto yh4
if "%YH%"=="5" goto index
if /i "%YH%"=="q"  goto :eof
goto YH

:yh1
set "say=                   ^|　  垃圾正在清理中, 请稍等...  　  　^|"
call :hint
del /s /f /q %systemdrive%\*.tmp >nul 2>nul 
del /s /f /q %systemdrive%\*.gid >nul 2>nul 
del /s /f /q %systemdrive%\*.chk >nul 2>nul 
del /s /f /q %systemdrive%\*.old >nul 2>nul 
del /s /f /q "%userprofile%\Local Settings\Temp\*.*" >nul 2>nul
del /s /f /q "%userprofile%\recent\*.*" >nul 2>nul
del /s /f /q "%userprofile%\cookies\*.*" >nul 2>nul
del /s /f /q "%userprofile%\Local Settings\History\*.*" >nul 2>nul
del /s /f /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" >nul 2>nul
del /s /f /q "%windir%\temp\*.*" >nul 2>nul
del /s /f /q "%windir%\prefetch\*.*" >nul 2>nul
set "say=                   ^|　    垃圾清理完毕!            　  　^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto YH

:yh2
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      优  化  操  作  系  统      ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 操作系统优化可以加快开关机速度, 释放系统资源. 提高系统运行速度.   │
echo    │                                                                      │
echo    │ ★ 初级优化: 针对需要使用网络邻居和打印机共亨等特殊服务的计算机.     │
echo    │                                                                      │
echo    │ ★ 中级优化: 标准个人电脑优化方案, 建议使用此选项.                   │
echo    │                                                                      │
echo    │ ★ 终级优化: 个人电脑的超级优化设置,一般不推荐使用.                  │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1. 初级优化  2.中级优化  3.终极优化  4. 返回                      │
echo    │                                                                      │
echo    │                                                                      │
echo    │                                                pengfei@cn-dos.net    │
echo    ╰───────────────────────────────────╯
echo.
set yh2=
set /p yh2=    输入(1 2 3 4 q=exit)后按回车键:
if "%yh2%"=="1" goto win1
if "%yh2%"=="2" goto win2
if "%yh2%"=="3" goto win3
if "%yh2%"=="4" goto YH
if /i "%yh2%"=="q"  goto :eof
goto yh2

:win1
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      操 作 系 统 初 级 优 化     ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 初级优化项目: 停止或关闭一些不用的服务; 缩短XP的开关机时间;       │
echo    │    加快程序运行速度; 不加载多余的DLL文件; 彻底关闭Dr.Watson调试;     │
echo    │    开启硬件优化; 增加右键菜单选项; 减少程序出错后的等待时间;         │
echo    │    自动关闭停止响应的程序;停止漫游Windows XP窗口; 禁用桌面清理向导;  │
echo    │    禁用错误报告但在发生严重错误时通知我; 让欢迎窗口更清晰;           │
echo    │    加快菜单弹出速度;禁用IMAPi光盘刻录服务; 优化CMOS实时时钟...       │
echo    │                                                                      │
echo    │ ★ 同时开启了硬盘共享; 网络打印机共享; 打开445端口; 开启的服务也相对 │
echo    │    要多, 如果优化后某些系统功能无法使用, 请进入"系统修复"版块来恢复. │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1. 确认  2. 返回                                                  │
echo    │                                                                      │
echo    ╰───────────────────────────────────╯
echo.
set win1=
set /p win1=    输入(1 2 q=exit)后按回车键:
if "%win1%"=="1" goto wina
if "%win1%"=="2" goto yh2
if /i "%win1%"=="q" goto :eof
goto win1
:wina
set "say=                   ^|　   初级优化中, 请稍等...   　    　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "AutoEndTasks"=dword:00000001
echo "HungAppTimeout"="800"
echo "WaitToKillAppTimeout"="1200"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
echo "WaitToKillServiceTimeout"="800"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "AutoEndTasks"="1"
echo "HungAppTimeout"="800"
echo "WaitToKillAppTimeout"="1200"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
echo "EnablePrefetcher"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
echo "AlwaysUnloadDLL"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug]
echo "Auto"="0"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "CreateCrashDump"=dword:00000000
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "AppendToLogFile"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "MenuShowDelay"="0"
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
echo "MinAnimate"="0"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "FontSmoothing"="2"
echo "FontSmoothingType"=dword:00000002
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="300"
echo "WaitToKillAppTimeout"="800"
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="200"
echo "WaitToKillAppTimeout"="1000"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vxd\BIOS]
echo "CPUPriority"=dword:00000001
echo "PCIConcur"=dword:00000001
echo "FastDRAM"=dword:00000001
echo "AGPConcur"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer]
echo "NoLowDiskSpaceChecks"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
echo "ConfigFileAllocSize"=dword:000001f4
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz]
echo "NoRun"=dword:00000001 
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting]
echo "DoReport"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ImapiService]
echo "Start"=dword:00000004 
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Tour]
echo "RunCount"=dword:00000000               
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Cdrom]
echo "Autorun"=dword:00000001
echo.
echo [HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer]
echo "Link"=hex:00,00,00,00
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
echo "IRQ8Priority"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
echo "AutoReboot"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "ClearPageFileAtShutdown"=dword:00000001
echo.
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers]
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To]
echo @="{7BA4C740-9E81-11CF-99D3-00AA004AE837}"
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To]
echo @="{C2FBB631-2971-11D1-A18c-00C04FD75D13}"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mnmsrvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FastUserSwitchingCompatibility]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TlntSvr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysmonLog]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDSessMgr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LmHosts]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Alerter]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\helpsvc]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CiSvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\seclogon]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SamSs]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidServ]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSrv]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\C-DillaCdaC11BA]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]
echo "AutoShareWKs"=dword:00000001
echo "AutoShareServer"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]
echo "SMBDeviceEnabled"=dword:00000001)>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
set "say=                   ^|　    恭喜, 初级优化完成!      　  　^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto YH

:win2
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      操 作 系 统 中 级 优 化     ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 中级优化项目: 停止或关闭一些不用的服务; 缩短XP的开关机时间;       │
echo    │    取消关机时整理页面文件; 不加载多余的DLL文件; 增加右键菜单选项;    │
echo    │    开启硬件优化; 彻底关闭Dr.Watson调试; 减少程序出错后的等待时间;    │
echo    │    自动关闭停止响应的程序; 加快程序运行速度; 禁用桌面清理向导;       │
echo    │    禁用错误报告但在发生严重错误时通知我; 禁用磁盘剩余空间低的警告;   │
echo    │    停止漫游Windows XP窗口; 让欢迎窗口更清晰; 加快菜单弹出速度;       │
echo    │    禁用IMAPi光盘刻录服务; 优化CMOS实时时钟...                        │
echo    │                                                                      │
echo    │ ★ 和终级优化相比,中级优化中一些服务可以在需要的时候启动它, 而不是   │
echo    │    禁止, 如果优化后某些系统功能无法使用, 请选择初级优化或进入"系统   │
echo    │    修复"版块来恢复.                                                  │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆    1. 确认  2. 返回                                   │
echo    │                                                                      │
echo    ╰───────────────────────────────────╯
echo.
set win2=
set /p win2=    输入(1 2 q=exit)后按回车键:
if "%win2%"=="1" goto winb
if "%win2%"=="2" goto yh2
if /i "%win2%"=="q" goto :eof
goto win2
:winb
set "say=                   ^|　   中级优化中, 请稍等...   　    　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "AutoEndTasks"=dword:00000001
echo "HungAppTimeout"="800"
echo "WaitToKillAppTimeout"="1000"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
echo "WaitToKillServiceTimeout"="800"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "AutoEndTasks"="1"
echo "HungAppTimeout"="800"
echo "WaitToKillAppTimeout"="1000"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
echo "EnablePrefetcher"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
echo "AlwaysUnloadDLL"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug]
echo "Auto"="0"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "CreateCrashDump"=dword:00000000
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "AppendToLogFile"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "MenuShowDelay"="0"
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
echo "MinAnimate"="0"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "FontSmoothing"="2"
echo "FontSmoothingType"=dword:00000002
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="200"
echo "WaitToKillAppTimeout"="800"
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="200"
echo "WaitToKillAppTimeout"="1000"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vxd\BIOS]
echo "CPUPriority"=dword:00000001
echo "PCIConcur"=dword:00000001
echo "FastDRAM"=dword:00000001
echo "AGPConcur"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer]
echo "NoLowDiskSpaceChecks"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
echo "ConfigFileAllocSize"=dword:000001f4
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz]
echo "NoRun"=dword:00000001 
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting]
echo "DoReport"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ImapiService]
echo "Start"=dword:00000004 
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Tour]
echo "RunCount"=dword:00000000               
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Cdrom]
echo "Autorun"=dword:00000001
echo.
echo [HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer]
echo "Link"=hex:00,00,00,00
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
echo "IRQ8Priority"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
echo "AutoReboot"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "ClearPageFileAtShutdown"=dword:00000000
echo.
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers]
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To]
echo @="{7BA4C740-9E81-11CF-99D3-00AA004AE837}"
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To]
echo @="{C2FBB631-2971-11D1-A18c-00C04FD75D13}"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mnmsrvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FastUserSwitchingCompatibility]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TlntSvr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysmonLog]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDSessMgr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LmHosts]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Alerter]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\helpsvc]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CiSvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\seclogon]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SamSs]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidServ]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSrv]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]
echo "Start"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\C-DillaCdaC11BA]
echo "Start"=dword:00000004)>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
set "say=                   ^|　    恭喜, 中级优化完成!      　  　^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto YH

:win3
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      操 作 系 统 终 级 优 化     ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 终级优化项目: 关闭一些不用的系统服务; 取消关机时整理页面文件;     │
echo    │    缩短XP的开关机时间; 不加载多余的DLL文件; 彻底关闭Dr.Watson调试;   │
echo    │    开启硬件优化; 减少程序出错后的等待时间; 自动关闭停止响应的程序;   │
echo    │    加快程序运行速度; 禁止出错后自动重启; 增加右键菜单选项;           │
echo    │    禁用桌面清理向导; 禁止CDROM自动运行; 禁用磁盘剩余空间低的警告;    │
echo    │    开启CPU(512k)二级缓存; 修复AMD处理器的AGP内存分页问题;            │
echo    │    禁用错误报告但在发生严重错误时通知我; 禁用漫游Windows XP窗口;     │
echo    │    让欢迎窗口更清晰; 加快菜单弹出速度; 禁用IMAPi光盘刻录服务;        │
echo    │    停用安全中心, 优化CMOS实时时钟...                                 │
echo    │                                                                      │
echo    │ ★ 如果优化后某些系统功能无法使用, 请选择中级优化或进入"系统修复"    │
echo    │    版块来恢复.                                                       │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆    1. 确认  2. 返回                                   │
echo    │                                                                      │
echo    ╰───────────────────────────────────╯
echo.
set win3=
set /p win3=    输入(1 2 q=exit)后按回车键:
if "%win3%"=="1" goto winc
if "%win3%"=="2" goto yh2
if /i "%win3%"=="q" goto :eof
goto win3
:winc
set "say=                   ^|　   终级优化中, 请稍等...   　    　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "AutoEndTasks"=dword:00000001
echo "HungAppTimeout"="500"
echo "WaitToKillAppTimeout"="800"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control]
echo "WaitToKillServiceTimeout"="800"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "AutoEndTasks"="1"
echo "HungAppTimeout"="500"
echo "WaitToKillAppTimeout"="800"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters]
echo "EnablePrefetcher"=dword:00000003
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer]
echo "AlwaysUnloadDLL"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug]
echo "Auto"="0"
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "CreateCrashDump"=dword:00000000
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\DrWatson]
echo "AppendToLogFile"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "MenuShowDelay"="0"
echo [HKEY_CURRENT_USER\Control Panel\Desktop\WindowMetrics]
echo "MinAnimate"="0"
echo.
echo [HKEY_USERS\.DEFAULT\Control Panel\Desktop]
echo "FontSmoothing"="2"
echo "FontSmoothingType"=dword:00000002
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="200"
echo "WaitToKillAppTimeout"="800"
echo.
echo [HKEY_CURRENT_USER\Control Panel\Desktop]
echo "HungAppTimeout"="200"
echo "WaitToKillAppTimeout"="1000"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Vxd\BIOS]
echo "CPUPriority"=dword:00000001
echo "PCIConcur"=dword:00000001
echo "FastDRAM"=dword:00000001
echo "AGPConcur"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\policies\Explorer]
echo "NoLowDiskSpaceChecks"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\FileSystem]
echo "ConfigFileAllocSize"=dword:000001f4
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Desktop\CleanupWiz]
echo "NoRun"=dword:00000001 
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\PCHealth\ErrorReporting]
echo "DoReport"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ImapiService]
echo "Start"=dword:00000004 
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Applets\Tour]
echo "RunCount"=dword:00000000                 
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Cdrom]
echo "Autorun"=dword:00000000
echo.
echo [HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Explorer]
echo "Link"=hex:00,00,00,00
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\PriorityControl]
echo "IRQ8Priority"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\CrashControl]
echo "AutoReboot"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "ClearPageFileAtShutdown"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "DisablePagingExecutive"=dword:00000001
echo "SecondLevelDataCache"=dword:00000200
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management]
echo "LargePageMinimum"=dword:ffffffff
echo.
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers]
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Copy To]
echo @="{7BA4C740-9E81-11CF-99D3-00AA004AE837}"
echo [HKEY_CLASSES_ROOT\AllFilesystemObjects\shellex\ContextMenuHandlers\Move To]
echo @="{C2FBB631-2971-11D1-A18c-00C04FD75D13}"
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mnmsrvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\upnphost]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FastUserSwitchingCompatibility]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TlntSvr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SysmonLog]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RDSessMgr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LmHosts]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Alerter]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wuauserv]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\helpsvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CiSvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\seclogon]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SamSs]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SENS]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\HidServ]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ClipSrv]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\wscsvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\C-DillaCdaC11BA]
echo "Start"=dword:00000004)>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
set "say=                   ^|　    恭喜, 终级优化完成!      　  　^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto YH

:yh3
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      优   化   启   动   项      ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 启动项介绍: 操作系统启动时, 有一些特殊功能的程序需要随机启动.     │
echo    │    但启动项中真正需要随机启动的程序只有2-3个, 其他的都没有必要随机   │
echo    │    开启,它不但占用系统资源, 还大大减慢了操作系统的启动速度.          │
echo    │                                                                      │
echo    │ ★ 要是你的电脑没有其他用途, 建议只保留两个启动项; 一个是"输入法",   │
echo    │    另一个是"杀毒软件实时监控"(如果还装了防火墙,也请保留).            │
echo    │    在确认后打开的窗口中选择启动标签, 然后保留输入法和杀毒软件的启动  │
echo    │    项, 把其他启动项目前面的勾都去掉并确认.                           │
echo    │                                                                      │
echo    │ ★ 下面是常见的启动项名:                                             │
echo    │                                                                      │
echo    │ 卡巴斯基==kav 瑞星==RavTask 金山==KAVStart 江民==KV 输入法==ctfmon   │
echo    │                                                                      │ 
echo    │ ☆ 操作选项 ☆    1. 确认  2. 返回                                   │
echo    │                                                                      │
echo    ╰───────────────────────────────────╯
echo.
set yh3=
set /p yh3=    输入(1 2 q=exit)后按回车键:
if "%yh3%"=="1" (
  start "" msconfig.exe
  set /p ii=    按任意键返回......<nul
  pause >nul 2>nul
  goto YH
)
if "%yh3%"=="2" goto YH
if /i "%yh3%"=="q" goto :eof
goto yh3

:yh4
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤       网    络    优    化       ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 通过更改操作系统的参数, 加速网页的打开和文件的下载.               │
echo    │                                                                      │
echo    │ ★ 自动优化: 加快局域网访问速度; 让IE6可以8线程下载.                 │
echo    │                                                                      │
echo    │ ★ 手动优化(手动解除微软对宽带20%%的速度限制):  选择手动优化, 在打开  │
echo    │    的窗口中依次选择^>                                                 │
echo    │    计算机配置 --^> 管理模板 --^> 网络 --^> Qos 数据包计划程序 --^> 右边  │
echo    │    窗体中的限制可保留带宽 --^> 已启用 --^> 将带宽限制改为1%% --^> 确定.  │
echo    │                                                                      │
echo    │ 注意:  当选择未配置或已禁用,操作系统都将默认为限制20%%的带宽.         │
echo    │        所以必须选择启用并将其值调整为1%%.                             │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1. 自动优化  2.手动优化  3.返回                                   │
echo    ╰───────────────────────────────────╯
echo.
set yh4=
set /p yh4=    输入(1 2 3 q=exit)后按回车键:
if "%yh4%"=="1" (
  set "say=                   ^|　    网络优化中, 请稍等...  　  　  ^|"
  call :hint
  (
  echo Windows Registry Editor Version 5.00
  echo.
  echo [-HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}]
  echo.
  echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings]
  echo "MaxConnectionsPer1_0Server"=dword:00000008
  echo "MaxConnectionsPerServer"=dword:00000008
  )>"%tmp%\win.reg"
  start /w regedit /s "%tmp%\win.reg"
  del /a /f "%tmp%\win.reg"
  set "say=                   ^|　    恭喜, 网络优化完成!    　  　  ^|"
  call :hint
  echo.
  echo.
  set /p ii=     按任意键返回......<nul
  pause >nul 2>nul
  goto yh4
)
if "%yh4%"=="2" (
  start "" gpedit.msc
  set /p ii=    按任意键返回......<nul
  pause >nul 2>nul
  goto YH
)
if "%yh4%"=="3" goto YH
if /i "%yh4%"=="q" goto :eof
goto yh4


:: 系统安全______________________________________________________________________
:AQ
title 系统安全  作者:木林森  QQ:573381312
color 0A
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤       系    统    安    全       ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 自动修补安全漏洞: 取消默认共享; 关闭445端口; 限制LSA匿名访问, 禁  │
echo    │    止建立空连接; 禁止远程修改注册表; 禁止IE自动安装组件; 关闭存在安  │
echo    │    全漏洞的系统服务; 检查并开启系统内置防火墙等...                   │
echo    │                                                                      │
echo    │ ★ 手动关闭自动播放功能: 自动播放功能可以在双击盘符时运行指定文件,   │
echo    │    这个功能被许多病毒利用, 每次都会因为浏览文件夹将潜伏的病毒激活.   │
echo    │    在确认后在打开的窗口依次选择^>                                     │
echo    │    计算机配置 --^> 管理模板 --^> 系统 --^> 右边的窗体中选择关闭自动     │
echo    │    播放 --^> 已启用 --^> 在下拉框中选择所有驱动器. --^> 确定.           │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1. 安全漏洞自动修补   2. 手动关闭自动播放   3. 返回               │
echo    │                                                                      │
echo    │                                           作者:木林森  QQ:573381312  │
echo    ╰───────────────────────────────────╯
echo.
set AQ=
set /p AQ=    输入(1 2 3 q=exit)后按回车键:
if "%AQ%"=="1" goto aq1
if "%AQ%"=="2" (
  start "" gpedit.msc
  set /p ii=    按任意键返回......<nul
  pause >nul 2>nul
  goto index
)
if "%AQ%"=="3" goto index
if /i "%AQ%"=="q" goto :eof
goto AQ

:aq1
set "say=                   ^|　  安全漏洞修补中, 请稍等...      　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]
echo "AutosafetyWKs"=dword:00000000
echo "AutosafetyServer"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]
echo "restrictanonymous"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\NetBT\Parameters]
echo "SMBDeviceEnabled"=dword:00000000
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\SecurePipeServers\winreg]
echo "RemoteRegAccess"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Policies\Microsoft\Internet Explorer\Infodelivery\Restrictions]
echo "NoJITSetup"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\mnmsrvc]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TlntSvr]
echo "Start"=dword:00000004
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Schedule]
echo "Start"=dword:00000004)>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
set "say=                   ^|　    恭喜, 安全漏洞修补成功!  　  　^|"
call :hint
echo.
echo.
set /p ii=     按任意键检查防火墙状态......<nul
pause >nul 2>nul
net start | find "Windows Firewall/Internet Connection Sharing (ICS)" >nul 2>nul && set wall=1 || set wall=0
set wall_=1
if "%wall%"=="0" (
  net start "Windows Firewall/Internet Connection Sharing (ICS)" >nul 2>nul || (
    set wall_=0
    set "say=                   ^|　  出现异常错误, 防火墙无法启动!  　^|"
    call :hint
    echo.
    echo.
    set /p ii=     按任意键返回......<nul
    pause >nul 2>nul
  )
  (echo Windows Registry Editor Version 5.00
  echo.
  echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SharedAccess]
  echo "Start"=dword:00000002)>"%tmp%\win.reg"
  start /w regedit /s "%tmp%\win.reg"
  del /a /f "%tmp%\win.reg"
) else (
  set "say=                   ^|　     恭喜, 防火墙状态正常!       　^|"
  call :hint
  echo.
  echo.
  set /p ii=     按任意键返回......<nul
  pause >nul 2>nul
  goto AQ
)
if "%wall_%"=="1" (
  set "say=                   ^|　     恭喜, 防火墙成功启动!       　^|"
  call :hint
  echo.
  echo.
  set /p ii=     按任意键返回......<nul
  pause >nul 2>nul
)
goto AQ

:: 系统修复______________________________________________________________________
:XF
title 系统修复  作者:木林森  QQ:573381312
color 1F
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤       系    统    修    复       ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 常见系统错误修复: 文件关联修复(com exe pif scr txt ini vbs...);   │
echo    │    恢复显示隐藏的文件或文件夹, 把消失的"文件夹选项"找回来;           │
echo    │    解除被禁止访问的任务栏属性; 解除被禁止的IE下载功能;               │
echo    │    删除IE工具栏广告.                                                 │
echo    │                                                                      │
echo    │ ★ IE恢复初始状态: 用来将IE恢复到初始状态(慎用! 建议只在IE出现严重   │
echo    │    错误时才使用此功能).                                              │
echo    │                                                                      │
echo    │ ★ 小助手功能修复: 修复使用本工具优化或错误操作导致电脑部分功能无法  │
echo    │    使用的问题.                                                       │
echo    │                                                                      │
echo    │ ☆ 操作选项 ☆                                                       │
echo    │                                                                      │
echo    │    1.常见系统错误修复  2.IE恢复初始状态  3.小助手功能修复  4.返回    │
echo    │                                                                      │
echo    ╰───────────────────────────────────╯
echo.
set XF=
set /p XF=    输入(1 2 3 4 q=exit)后按回车键:
if "%XF%"=="1" goto xf1
if "%XF%"=="2" goto xf2
if "%XF%"=="3" goto xf3
if "%XF%"=="4" goto index
if /i "%XF%"=="q" goto :eof
goto XF

:xf1
set "say=                   ^|　 常见系统错误修复中, 请稍等...   　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CLASSES_ROOT\batfile\shell\open\command]
echo @="\"%%1\" %%*"
echo.
echo [HKEY_CLASSES_ROOT\cmdfile\shell\open\command]
echo @="\"%%1\" %%*"
echo.
echo [HKEY_CLASSES_ROOT\comfile\shell\open\command]
echo @="\"%%1\" %%*"
echo.
echo [HKEY_CLASSES_ROOT\exefile\shell\open\command]
echo @="\"%%1\" %%*"
echo.
echo [HKEY_CLASSES_ROOT\piffile\shell\open\command]
echo @="\"%%1\" %%*"
echo.
echo [HKEY_CLASSES_ROOT\scrfile\shell\open\command]
echo @="\"%%1\" /S"
echo.
echo [HKEY_CLASSES_ROOT\txtfile\shell\open\command]
echo @=hex^(2^):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,4e,00,4f,00,\
echo   54,00,45,00,50,00,41,00,44,00,2e,00,45,00,58,00,45,00,20,00,25,00,31,00,00,\
echo   00
echo.
echo [HKEY_CLASSES_ROOT\inifile\shell\open\command]
echo @=hex^(2^):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,4e,00,4f,00,\
echo   54,00,45,00,50,00,41,00,44,00,2e,00,45,00,58,00,45,00,20,00,25,00,31,00,00,\
echo   00
echo.
echo [HKEY_CLASSES_ROOT\.vbs]
echo @="vbsfile"
echo.
echo [HKEY_CLASSES_ROOT\VBSFile\Shell\Open\Command]
echo @=hex^(2^):25,00,53,00,79,00,73,00,74,00,65,00,6d,00,52,00,6f,00,6f,00,74,00,25,\
echo   00,5c,00,53,00,79,00,73,00,74,00,65,00,6d,00,33,00,32,00,5c,00,57,00,53,00,\
echo   63,00,72,00,69,00,70,00,74,00,2e,00,65,00,78,00,65,00,20,00,22,00,25,00,31,\
echo   00,22,00,20,00,25,00,2a,00,00,00
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\NOHIDDEN]
echo "CheckedValue"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\Software\Microsoft\Windows\CurrentVersion\explorer\Advanced\Folder\Hidden\SHOWALL]
echo "CheckedValue"=dword:00000001
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced]
echo "hidden"=dword:00000001
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
echo "NoFolderOptions"=dword:00000000
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer]
echo "NoSetTaskbar"=dword:00000000
echo.
echo [-HKEY_LOCAL_MACHINE\Software\Microsoft\Internet Explorer\Extensions]
echo.
echo [-HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Extensions]
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3]
echo "1803"=dword:00000000
echo.
echo [HKEY_USERS\.DEFAULT\Software\Microsoft\Windows\CurrentVersion\Internet Settings\Zones\3]
echo "1803"=dword:00000000)>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
set "say=                   ^|　 恭喜, 常见系统错误修复成功!       ^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto XF

:xf2
set "say=                   ^|　  IE初始状态恢复中, 请稍等...    　^|"
call :hint
(echo Windows Registry Editor Version 5.00
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main]
echo "NoUpdateCheck"=dword:00000001
echo "NoJITSetup"=dword:00000001
echo "Disable Script Debugger"="yes"
echo "Start Page"="www.hao123.com"
echo "NotifyDownloadComplete"="no"
echo "Enable AutoImageResize"="yes"
echo "Show_ChannelBand"="No"
echo "Anchor Underline"="yes"
echo "Cache_Update_Frequency"="Once_Per_Session"
echo "Display Inline Images"="yes"
echo "Do404Search"=hex:01,00,00,00
echo "Local Page"="C:\\WINDOWS\\system32\\blank.htm"
echo "Save_Session_History_On_Exit"="no"
echo "Show_FullURL"="no"
echo "Show_StatusBar"="yes"
echo "Show_ToolBar"="yes"
echo "Show_URLinStatusBar"="yes"
echo "Show_URLToolBar"="yes"
echo "Use_DlgBox_Colors"="yes"
echo "Search Page"="http://www.microsoft.com/isapi/redir.dll?prd=ie&ar=iesearch"
echo "FullScreen"="no"
echo "Window_Placement"=hex:2c,00,00,00,02,00,00,00,03,00,00,00,ff,ff,ff,ff,ff,ff,\
echo   ff,ff,ff,ff,ff,ff,ff,ff,ff,ff,ae,00,00,00,ae,00,00,00,b6,04,00,00,ad,03,00,\
echo   00
echo "Disable Display Inline Images"="no"
echo "Disable Display Inline Videos"="no"
echo "Display Inline Videos"="yes"
echo "Disable Play_Animations"="no"
echo "Disable Play_Background_Sounds"="no"
echo "Use FormSuggest"="yes"
echo "AddToFavoritesExpanded"=dword:00000001
echo "FormSuggest PW Ask"="no"
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl]
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN]
echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main\FeatureControl\FEATURE_LOCALMACHINE_LOCKDOWN\Settings]
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions]
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\ACCESSIBILITY]
echo "Text"="辅助功能"
echo "PlugUIText"="@inetcplc.dll,-4746"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4497"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\ACCESSIBILITY\ALTTEXT]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="始终扩展图像的说明文字"
echo "PlugUIText"="@inetcplc.dll,-4731"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Expand Alt Text"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50298"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\ACCESSIBILITY\MOVSYSCARET]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="随焦点(或选择)的更改移动系统插入标记"
echo "PlugUIText"="@inetcplc.dll,-4732"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Move System Caret"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50299"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE]
echo "Text"="浏览"
echo "PlugUIText"="@inetcplc.dll,-4745"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4482"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\AUTOAPPEND]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoComplete"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Explorer\\AutoComplete"
echo "Text"="对 Web 地址使用联机自动完成功能"
echo "PlugUIText"="@inetcplc.dll,-4852"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Append Completion"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50538"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FAVINTELLI]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用个性化收藏夹菜单"
echo "PlugUIText"="@inetcplc.dll,-4856"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="FavIntelliMenus"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50583"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FORCE_OFFSCREEN]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="%%FORCE_OFFSCREEN_TEXT%%"
echo "PlugUIText"="@inetcplc.dll,-4866"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="Force Offscreen Composition"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50597"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FRIENDLY_ERRORS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="显示友好 http 错误信息"
echo "PlugUIText"="@inetcplc.dll,-4833"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Friendly http errors"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50537"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FRIENDLY_URLS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer"
echo "Text"="显示友好的 URL"
echo "PlugUIText"="@inetcplc.dll,-4734"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="Show_FullURL"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50111"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FTPPASV]
echo "PlugUIText"="@inetcplc.dll,-4743"
echo "RegPath"="Software\\Microsoft\\Ftp"
echo "Text"="使用被动 FTP (用于防火墙和 DSL 调制解调器的兼容)"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Use PASV"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50588"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\FTPUI]
echo "PlugUIText"="@inetcplc.dll,-4737"
echo "Text"="对 FTP 站点启用文件夹视图"
echo "RegPath"="Software\\Microsoft\\Ftp"
echo "Type"="checkbox"
echo "CheckedValue"="no"
echo "UncheckedValue"="yes"
echo "ValueName"="Use Web Based FTP"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50560"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\GOBUTTON]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="在地址栏中显示“转到”按钮"
echo "PlugUIText"="@inetcplc.dll,-4840"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="ShowGoButton"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50536"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\IEUPDATECHECK]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="自动检查 Internet Explorer 更新"
echo "PlugUIText"="@inetcplc.dll,-4837"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "DefaultValue"=dword:00000000
echo "ValueName"="NoUpdateCheck"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50503"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\IOD]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用即需即装(Internet Explorer)"
echo "PlugUIText"="@inetcplc.dll,-4836"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "DefaultValue"=dword:00000000
echo "ValueName"="NoJITSetup"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50502"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\NOTIFYDOWNLOADCOMPLETE]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="下载完成后发出通知"
echo "PlugUIText"="@inetcplc.dll,-4835"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="NotifyDownloadComplete"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50501"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\NSCSINGLEEXPAND]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="关闭“历史记录”和“收藏夹”中所有未使用的文件夹(需要重新启动)"
echo "PlugUIText"="@inetcplc.dll,-4838"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="NscSingleExpand"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50528"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\PT]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="允许页面转换"
echo "PlugUIText"="@inetcplc.dll,-4829"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="Page_Transitions"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50242"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\REUSEWINDOWS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="重新使用启动快捷方式的窗口"
echo "PlugUIText"="@inetcplc.dll,-4861"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "DefaultValue"=dword:00000001
echo "ValueName"="AllowWindowReuse"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50582"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\SCHEDULED_UPDATES]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Webcheck"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Webcheck"
echo "Text"="允许脱机项目按计划同步"
echo "PlugUIText"="@inetcplc.dll,-4736"
echo "Type"="checkbox"
echo "ValueName"="NoScheduledUpdates"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50527"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\SCRIPT_DEBUGGER]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="禁用脚本调试(其他)"
echo "PlugUIText"="@xpsp2res.dll,-4892"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Disable Script Debugger"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50252"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\SCRIPT_DEBUGGER_IE]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="禁用脚本调试 (Internet Explorer)"
echo "PlugUIText"="@xpsp2res.dll,-4891"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="DisableScriptDebuggerIE"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50252"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\SCRIPT_ERROR_CACHE]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="显示每个脚本错误的通知"
echo "PlugUIText"="@inetcplc.dll,-4832"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Error Dlg Displayed On Every Error"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50526"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\SMOOTH_SCROLLING]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="使用平滑滚动"
echo "PlugUIText"="@inetcplc.dll,-4735"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="SmoothScroll"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50107"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\ULINKS]
echo "Text"="给链接加下划线的方式"
echo "PlugUIText"="@inetcplc.dll,-4828"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4482"
echo "HelpID"="iexplore.hlp#50243"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\ULINKS\ALWAYS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="始终"
echo "PlugUIText"="@inetcplc.dll,-4825"
echo "Type"="radio"
echo "CheckedValue"="yes"
echo "ValueName"="Anchor Underline"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50243"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\ULINKS\HOVER]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="悬停"
echo "PlugUIText"="@inetcplc.dll,-4827"
echo "Type"="radio"
echo "CheckedValue"="hover"
echo "ValueName"="Anchor Underline"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50243"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\ULINKS\NEVER]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="从不"
echo "PlugUIText"="@inetcplc.dll,-4826"
echo "Type"="radio"
echo "CheckedValue"="no"
echo "ValueName"="Anchor Underline"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50243"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\USEBHO]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用第三方浏览器扩展(要求重启动)"
echo "PlugUIText"="@inetcplc.dll,-4874"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Enable Browser Extensions"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50606"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\USE_THEMES]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="对网页上的按钮和控件启用视觉样式"
echo "PlugUIText"="@inetcplc.dll,-4873"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="UseThemes"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50604"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\UTF8]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="始终以 UTF-8 发送 URL (需要重新启动)"
echo "PlugUIText"="@inetcplc.dll,-4839"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "ValueName"="UrlEncoding"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50535"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\BROWSE\WEBJIT]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用即需安装(其它)"
echo "PlugUIText"="@inetcplc.dll,-4875"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "DefaultValue"=dword:00000000
echo "ValueName"="NoWebJITSetup"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50618"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO]
echo "Text"="安全"
echo "PlugUIText"="@inetcplc.dll,-4747"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4442"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CACHE_FLUSH]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Cache"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings\\Cache"
echo "Text"="关闭浏览器时清空 Internet 临时文件夹"
echo "PlugUIText"="@inetcplc.dll,-4750"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "ValueName"="Persistent"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50293"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CACHE_PAGES]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="不将加密的页存盘"
echo "PlugUIText"="@inetcplc.dll,-4749"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="DisableCachingOfSSLPages"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50127"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CD_LMZ_LOCKDOWN]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE_LOCALMACHINE_LOCKDOWN\\Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE_LOCALMACHINE_LOCKDOWN\\Settings"
echo "Text"="允许来自 CD 的活动内容在我的计算机上运行"
echo "PlugUIText"="@xpsp2res.dll,-5710"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="LOCALMACHINE_CD_UNLOCK"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CERTREV]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\WinTrust\\Trust Providers\\Software Publishing"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\WinTrust\\Trust Providers\\Software Publishing"
echo "Text"="检查发行商的证书是否撤销"
echo "PlugUIText"="@inetcplc.dll,-4761"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000200
echo "ValueName"="State"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "Mask"=dword:00000200
echo "HelpID"="iexplore.hlp#50184"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\CHECK_SIG]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Download"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Download"
echo "Text"="检查下载的程序的签名"
echo "PlugUIText"="@inetcplc.dll,-4762"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="CheckExeSignatures"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50605"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\LMZ_LOCKDOWN]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE_LOCALMACHINE_LOCKDOWN"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main\\FeatureControl\\FEATURE_LOCALMACHINE_LOCKDOWN"
echo "Text"="允许活动内容在本地计算机区域中运行"
echo "PlugUIText"="@xpsp2res.dll,-5700"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000000
echo "UncheckedValue"=dword:00000001
echo "ValueName"="iexplore.exe"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\NEGOTIATE]
echo "DefaultValue"=dword:00000001
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="启用集成的 Windows 身份验证 (需要重新启动)"
echo "PlugUIText"="@inetcplc.dll,-4863"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="EnableNegotiate"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50592"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\P3PROFILE]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Security\\P3Global"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Security\\P3Global"
echo "Text"="启动配置文件助理"
echo "PlugUIText"="@inetcplc.dll,-4756"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="Enabled"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50286"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\RUN_INV_SIG]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Download"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Download"
echo "Text"="允许安装包含无效签名的 ActiveX 控件"
echo "PlugUIText"="@xpsp2res.dll,-10505"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="RunInvalidSignatures"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"=""
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SECURE]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="在安全和非安全模式之间转换时发出警告"
echo "PlugUIText"="@inetcplc.dll,-4757"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="WarnonZoneCrossing"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50089"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SITECERT]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="对无效站点证书发出警告"
echo "PlugUIText"="@inetcplc.dll,-4759"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="WarnonBadCertRecving"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50119"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSL2.0]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="SSL 2.0"
echo "PlugUIText"="@inetcplc.dll,-4752"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000008
echo "UncheckedValue"=dword:00000000
echo "ValueName"="SecureProtocols"
echo "DefaultValue"=dword:00000008
echo "HKeyRoot"=dword:80000001
echo "Mask"=dword:00000008
echo "HelpID"="iexplore.hlp#50128"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSL3.0]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="SSL 3.0"
echo "PlugUIText"="@inetcplc.dll,-4753"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000020
echo "UncheckedValue"=dword:00000000
echo "ValueName"="SecureProtocols"
echo "DefaultValue"=dword:00000020
echo "HKeyRoot"=dword:80000001
echo "Mask"=dword:00000020
echo "HelpID"="iexplore.hlp#50129"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SSLREV]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="检查服务器证书是否撤销(需要重新启动)"
echo "PlugUIText"="@inetcplc.dll,-4760"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="CertificateRevocation"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50550"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\SUBMIT]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="重定向提交的表单时发出警告"
echo "PlugUIText"="@inetcplc.dll,-4758"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="WarnOnPostRedirect"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50288"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\CRYPTO\TLS1.0]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="TLS 1.0"
echo "PlugUIText"="@inetcplc.dll,-4754"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000080
echo "UncheckedValue"=dword:00000000
echo "ValueName"="SecureProtocols"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "Mask"=dword:00000080
echo "HelpID"="iexplore.hlp#50511"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\HTTP]
echo "Text"="HTTP 1.1 设置"
echo "PlugUIText"="@inetcplc.dll,-4822"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4443"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\HTTP\GENABLE]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="使用 HTTP 1.1"
echo "PlugUIText"="@inetcplc.dll,-4823"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="EnableHttp1_1"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50297"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\HTTP\PROXY]
echo "RegPath"="SOFTWARE\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Windows\\CurrentVersion\\Internet Settings"
echo "Text"="通过代理连接使用 HTTP 1.1"
echo "PlugUIText"="@inetcplc.dll,-4824"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="ProxyHttp1.1"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50296"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\JAVA_VM]
echo "Text"="Microsoft VM"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4441"
echo "HelpID"="iexplore.hlp#50041"
echo "Type"="group"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\JAVA_VM\CONSOLE]
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Java VM"
echo "Text"="启用 Java 控制台(需要重启动)"
echo "CheckedValue"=hex:01,00,00,00
echo "DefaultValue"=hex:00,00,00,00
echo "HelpID"="iexplore.hlp#50301"
echo "HKeyRoot"=hex:01,00,00,80
echo "RegPath"="SOFTWARE\\Microsoft\\Java VM"
echo "PlugUIText"="@vmhelper.dll,-4000"
echo "Type"="checkbox"
echo "UncheckedValue"=hex:00,00,00,00
echo "ValueName"="EnableJavaConsole"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\JAVA_VM\JIT]
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Java VM"
echo "Text"="启用 Java JIT 编译器(需要重启动)"
echo "CheckedValue"=hex:01,00,00,00
echo "DefaultValue"=hex:01,00,00,00
echo "HelpID"="iexplore.hlp#50110"
echo "HKeyRoot"=hex:01,00,00,80
echo "RegPath"="SOFTWARE\\Microsoft\\Java VM"
echo "PlugUIText"="@vmhelper.dll,-4001"
echo "Type"="checkbox"
echo "UncheckedValue"=hex:00,00,00,00
echo "ValueName"="EnableJIT"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\JAVA_VM\LOGGING]
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Java VM"
echo "Text"="启用 Java 记录"
echo "CheckedValue"=hex:01,00,00,00
echo "DefaultValue"=hex:00,00,00,00
echo "HelpID"="iexplore.hlp#50109"
echo "HKeyRoot"=hex:01,00,00,80
echo "RegPath"="SOFTWARE\\Microsoft\\Java VM"
echo "PlugUIText"="@vmhelper.dll,-4002"
echo "Type"="checkbox"
echo "UncheckedValue"=hex:00,00,00,00
echo "ValueName"="EnableLogging"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA]
echo "Text"="多媒体"
echo "PlugUIText"="@inetcplc.dll,-4744"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,1312"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\ANIMAT]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="在网页中播放动画"
echo "PlugUIText"="@inetcplc.dll,-4741"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Play_Animations"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50176"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\AUTOIMAGERESIZE]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用自动图像大小调整"
echo "PlugUIText"="@inetcplc.dll,-4871"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Enable AutoImageResize"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50598"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\MYPICS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="启用图片工具栏(要求重启动)"
echo "PlugUIText"="@inetcplc.dll,-4865"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Enable_MyPics_Hoverbar"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50596"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\PICTS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="显示图片"
echo "PlugUIText"="@inetcplc.dll,-4742"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Display Inline Images"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50042"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\PLACEHOLDERS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="显示图像下载占位符"
echo "PlugUIText"="@inetcplc.dll,-4843"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="Show image placeholders"
echo "DefaultValue"=dword:00000000
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50559"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\SMART_DITHERING]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer"
echo "Text"="优化图像抖动"
echo "PlugUIText"="@inetcplc.dll,-4738"
echo "Type"="checkbox"
echo "CheckedValue"=dword:00000001
echo "UncheckedValue"=dword:00000000
echo "ValueName"="SmartDithering"
echo "DefaultValue"=dword:00000001
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50177"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\SOUNDS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="在网页中播放声音"
echo "PlugUIText"="@inetcplc.dll,-4739"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Play_Background_Sounds"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50043"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\MULTIMEDIA\VIDEOS]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="在网页中播放视频"
echo "PlugUIText"="@inetcplc.dll,-4740"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Display Inline Videos"
echo "DefaultValue"="yes"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50044"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\PRINT]
echo "Text"="打印"
echo "PlugUIText"="@inetcplc.dll,-4769"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4447"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\PRINT\BACKGROUND]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="打印背景颜色和图像"
echo "PlugUIText"="@inetcplc.dll,-4770"
echo "Type"="checkbox"
echo "CheckedValue"="yes"
echo "UncheckedValue"="no"
echo "ValueName"="Print_Background"
echo "DefaultValue"="no"
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50191"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING]
echo "Text"="从地址栏中搜索"
echo "PlugUIText"="@inetcplc.dll,-4771"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4483"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING\AUTOSEARCH]
echo "Text"="搜索时"
echo "PlugUIText"="@inetcplc.dll,-4844"
echo "Type"="group"
echo "Bitmap"="C:\\WINDOWS\\system32\\inetcpl.cpl,4483"
echo "HelpID"="iexplore.hlp#50041"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING\AUTOSEARCH\DISPLAY_AND_GO]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="显示结果，然后转到最相似的站点"
echo "PlugUIText"="@inetcplc.dll,-4845"
echo "Type"="radio"
echo "CheckedValue"=dword:00000006
echo "ValueName"="AutoSearch"
echo "DefaultValue"=dword:00000005
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50570"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING\AUTOSEARCH\JUST_DISPLAY]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="只在主窗口中显示结果"
echo "PlugUIText"="@inetcplc.dll,-4847"
echo "Type"="radio"
echo "CheckedValue"=dword:00000004
echo "ValueName"="AutoSearch"
echo "DefaultValue"=dword:00000005
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50573"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING\AUTOSEARCH\JUST_GO]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="转到最相似的站点"
echo "PlugUIText"="@inetcplc.dll,-4846"
echo "Type"="radio"
echo "CheckedValue"=dword:00000005
echo "ValueName"="AutoSearch"
echo "DefaultValue"=dword:00000005
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50571"
echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Internet Explorer\AdvancedOptions\SEARCHING\AUTOSEARCH\NO_SEARCH]
echo "RegPath"="SOFTWARE\\Microsoft\\Internet Explorer\\Main"
echo "RegPoliciesPath"="SOFTWARE\\Policies\\Microsoft\\Internet Explorer\\Main"
echo "Text"="不从地址栏中搜索"
echo "PlugUIText"="@inetcplc.dll,-4848"
echo "Type"="radio"
echo "CheckedValue"=dword:00000000
echo "ValueName"="AutoSearch"
echo "DefaultValue"=dword:00000005
echo "HKeyRoot"=dword:80000001
echo "HelpID"="iexplore.hlp#50572")>"%tmp%\win.reg"
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
regsvr32 /s Shdocvw.dll >nul 2>nul
regsvr32 /s Oleaut32.dll >nul 2>nul
regsvr32 /s Actxprxy.dll >nul 2>nul
regsvr32 /s Mshtml.dll >nul 2>nul
regsvr32 /s Urlmon.dll >nul 2>nul
regsvr32 /s browseui.dll >nul 2>nul
set "say=                   ^|　  恭喜, IE恢复初始状态成功!      　^|"
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto XF

:
:xf3
cls
echo                      ╭─────────────────╮
echo                      │                                  │
echo    ╭────────┤      系  统  功  能  修  复      ├────────╮
echo    │                │                                  │                │
echo    │                ╰─────────────────╯                │
echo    │                                                                      │
echo    │ ★ 1. 修复局域网内无法访问本机或不能共享打印机的问题.                │
echo    │                                                                      │
echo    │ ★ 2. 修复vbs脚本运行错误,无法创建对象的问题.                        │
echo    │                                                                      │
echo    │ ★ 3. 修复任务管理器中没有显示用户名的问题.                          │
echo    │                                                                      │
echo    │ ★ 4. 修复开关机时没有声音的问题.                                    │
echo    │                                                                      │
echo    │ ★ 5. 修复共享文件夹消失的问题.                                      │
echo    │                                                                      │
echo    │ ★ 6. 解锁注册表.                                                    │
echo    │                                                                      │
echo    │ ☆ 操作方法 ☆                                                       │
echo    │                                                                      │
echo    │    可以同时选择多个修复项目(1 2 3 4 5 6), 中间用空格间隔.  7. 返回   │
echo    ╰───────────────────────────────────╯
echo.
set xf3=
set rehab=
set num=0
set /p xf3=    输入(1-6 q=exit)后按回车键:
if /i "%xf3%"=="q" goto :eof
if /i "%xf3%"=="7" goto XF
set "say=                   ^|　  系统功能修复中, 请稍等...      　^|"
call :hint
echo Windows Registry Editor Version 5.00>"%tmp%\win.reg"
for %%i in (%xf3%) do (
    for %%j in (1 2 3 4 5 6) do (
        if "%%i"=="%%j" call :xf3%%j
    )
)
start /w regedit /s "%tmp%\win.reg"
del /a /f "%tmp%\win.reg"
for %%i in (%rehab%) do set /a num+=1
if "%num%"=="0" (
    set "say=                   ^|　  输入有误, 没有修复任何项目!    　^|"
    goto show
)
set rehab=%rehab% !
:plus
if %num% lss 6 (
    set "rehab=%rehab%  "
    set /a num+=1
    goto plus
)
set "say=                   ^|　  成功修复项目%rehab%       ^|"
:show
call :hint
echo.
echo.
set /p ii=     按任意键返回......<nul
pause >nul 2>nul
goto XF

:xf31
(echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver]
echo "Start"=dword:00000002
echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]
echo "AutoShareWKs"=dword:00000001
echo "AutoShareServer"=dword:00000001
echo.
echo [HKEY_LOCAL_MACHINE\System\CurrentControlSet\Services\NetBT\Parameters]
echo "SMBDeviceEnabled"=dword:00000001)>>"%tmp%\win.reg"
set rehab=%rehab% 1
goto :eof

:xf32
regsvr32 /s WSHom.Ocx >nul 2>nul
regsvr32 /s scrrun.dll >nul 2>nul
regsvr32 /s "C:\Program Files\Common Files\System\ado\msado15.dll" >nul 2>nul
set rehab=%rehab% 2
goto :eof

:xf33
(echo.
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TermService]
echo "Start"=dword:00000002)>>"%tmp%\win.reg"
set rehab=%rehab% 3
goto :eof

:xf34
(echo.
echo [HKEY_CURRENT_USER\Control Panel\Sound]
echo "Beep"="yes"
echo "ExtendedSounds"="yes")>>"%tmp%\win.reg"
set rehab=%rehab% 4
goto :eof

:xf35
(echo.
echo [HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\MyComputer\NameSpace\DelegateFolders\{59031a47-3f72-44a7-89c5-5595fe6b30ee}])>>"%tmp%\win.reg"
set rehab=%rehab% 5
goto :eof

:xf36
(echo.
echo [HKEY_CURRENT_USER\Software\Microsoft\Windows\CurrentVersion\Policies\System]
echo "DisableRegistryTools"=dword:00000000)>>"%tmp%\win.reg"
set rehab=%rehab% 6
goto :eof


:: 系统设置快速生效______________________________________________________________
:SX
title 系统设置快速生效  作者:木林森  QQ:573381312
color F0
set "say=                   ^|　  正在刷新系统设置, 请稍等...      ^|"
call :hint
tasklist | find /i "explorer.exe" >nul 2>nul && taskkill /f /im explorer.exe >nul 2>nul
ping 127.1 -n 2 >nul 2>nul
start "" "%windir%\explorer.exe"
"%windir%\system32\gpupdate.exe" >nul 2>nul
set "say=                   ^|　  恭喜, 成功刷新系统设置!        　^|"
call :hint
echo.
echo.
set /p ii=     按任意键退出......<nul
pause >nul 2>nul
goto :eof


:hint
cls
echo.
echo 　　          　　　　            \\\^|/// 
echo 　　　　　          　         \\　.-.-　// 
echo  　　　　          　         　(　.@.@　) 
echo                    +-------oOOo-----(_)-----oOOo---------+   
echo                    ^|　　　 　　　　　　　　　　　　　　　^|
echo %say%
echo                    ^|　　　　　　　　　　　　　　　　 　　^|     
echo                    +----------oooO-------Oooo------------+  
goto :eof
