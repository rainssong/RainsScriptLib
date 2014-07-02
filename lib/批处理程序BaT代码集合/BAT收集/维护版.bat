@echo off
echo.
echo.
color a
echo                     ┏━━┓我      ●╭○╮   我┏━━┓
echo                     ┃天长┃愛  ★ /█∨█\ ★ 想┃永远┃
echo                     ┃地久┃你      ∏  ∏     你┃拥有┃
echo                     ┗━━┛．   我爱你一万年    ┗━━┛
echo   感情进度条......
echo  ┏─────────────────────────────────────┓
echo  │▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉▉  100 │
echo  ┗─────────────────────────────────────┛
echo.                                                                    
echo             欢  迎 进 入 心 如 止 水 的 维 护 工 具 菜 单 !
echo.
echo. 
pause
cls
@echo off
:start
echo.
echo                欢 迎 来 到 心 如 止 水 制 作 的 DIY 批 处 理
echo 请选择
echo.
echo 0-离开/1-转到命令行/2-注册表/3-组策略/4-设备管理器/5-计算机管理/6-任务管理器
echo.
echo /7-启动项管理/8-远程桌面/9-服务管理/a-控制面版/b-磁盘管理/c-本机共享查看
echo.
echo /d-查看局域网共享/e-打开网络连接/f-摄象头/g-刷新注册表/q-检查网络连接ping网易
echo.
echo /h-网吧系统服务优化/i-清理系统垃圾/j-注销计算机/k--我的电脑属性/l-关闭计算机
echo 000000000000000000000000000000000000000000000000000000000000000000000000000000
echo   /m-本地磁盘C/n-本地磁盘D/o-本地磁盘E/p-本地磁盘F/q-保留（空）
echo.
echo 000000000000000000000000000000000000000000000000000000000000000000000000000000
echo   提示：改IP选择 e     改电脑名选择 k        
echo.                                           用了。又喜欢，而没有顶贴的。烂JJ    
echo                                          (维护版)如需添加或错误，请联系我谢谢！
echo                                                                  QQ:24500012
echo.
echo.
set /p UserChoice=
if "%UserChoice%"=="0" goto 0
if "%UserChoice%"=="1" goto 1
if "%UserChoice%"=="2" goto 2
if "%UserChoice%"=="3" goto 3
if "%UserChoice%"=="4" goto 4
if "%UserChoice%"=="5" goto 5
if "%UserChoice%"=="6" goto 6
if "%UserChoice%"=="7" goto 7
if "%UserChoice%"=="8" goto 8
if "%UserChoice%"=="9" goto 9
if "%UserChoice%"=="a" goto a
if "%UserChoice%"=="b" goto b
if "%UserChoice%"=="c" goto c
if "%UserChoice%"=="d" goto d
if "%UserChoice%"=="e" goto e
if "%UserChoice%"=="f" goto f
if "%UserChoice%"=="g" goto g
if "%UserChoice%"=="h" goto h
if "%UserChoice%"=="i" goto i
if "%UserChoice%"=="j" goto j
if "%UserChoice%"=="k" goto k
if "%UserChoice%"=="l" goto l
if "%UserChoice%"=="m" goto m
if "%UserChoice%"=="n" goto n
if "%UserChoice%"=="o" goto o
if "%UserChoice%"=="p" goto p
if "%UserChoice%"=="q" goto q
if "%UserChoice%"=="r" goto r
if "%UserChoice%"=="s" goto s
if "%UserChoice%"=="t" goto t
if "%UserChoice%"=="u" goto u
if "%UserChoice%"=="v" goto v
if "%UserChoice%"=="w" goto w
if "%UserChoice%"=="x" goto x
if "%UserChoice%"=="y" goto y
if "%UserChoice%"=="z" goto z
cls
echo.
echo.
echo 请正确选择，如果是字母请注意大小写。
echo 你打的虾米东西呀？乱敲不起作用撒。呵呵。
goto start

:0
exit
:1
@color 07
@%windir%\system32\cmd.exe
@cls
@exit
:2
@%windir%\system32\regedt32.exe
cls
goto start
:3
@%windir%\system32\gpedit.msc
cls
goto start
:4
@%windir%\system32\devmgmt.msc
cls
goto start
:5
@%windir%\system32\compmgmt.msc
cls
goto start
:6
@%windir%\system32\taskmgr.exe
cls
goto start
:7
@%windir%\PCHealth\HelpCtr\Binaries\msconfig.exe
cls
goto start
:8
@%windir%\system32\mstsc.exe
cls
goto start
:9
@%windir%\system32\services.msc
cls
goto start
:a
@%windir%\system32\control.exe
cls
goto start
:b
@%windir%\system32\diskmgmt.msc
cls
goto start
:c
@%windir%\system32\fsmgmt.msc
cls
goto start
:d
net share >>%windir%\system32\share.txt
type %windir%\system32\share.txt
pause
cls
goto start
:e
@%windir%\system32\ncpa.cpl
cls
goto start
:f
%systemroot%\amcap.exe
cls
goto start
:g
@echo off
@gpupdate
@taskkill /f /IM explorer.exe
start explorer
cls
goto start
:k
sysdm.cpl
cls
goto start
:h
cls
echo 网吧服务优化中…………OK!
echo 你要优化服务是吗，此优化只适合网吧，如果ISCIS没装请装好再选择此服务优化。
pause
echo 网吧服务优化中…………OK!
sc config   Alerter start= DISABLED 
sc config   ALG start= DISABLED 
sc config   AppMgmt start= DEMAND 
sc config   aspnet_state start= DEMAND 
sc config   AudioSrv start= AUTO 
sc config   BITS start= DEMAND 
sc config   Browser start= DISABLED 
sc config   CiSvc start= DEMAND 
sc config   ClipSrv start= DISABLED 
sc config   COMSysApp start= DEMAND 
sc config   CryptSvc start= DEMAND 
sc config   DcomLaunch start= AUTO 
sc config   Dhcp start= DISABLED 
sc config   dmadmin start= DEMAND 
sc config   dmserver start= DEMAND 
sc config   Dnscache start= DISABLED 
sc config   ERSvc start= DISABLED 
sc config   Eventlog start= AUTO 
sc config   EventSystem start= DEMAND 
sc config   FastUserSwitchingCompatibility start= DISABLED 
sc config   helpsvc start= DISABLED 
sc config   HidServ start= DISABLED 
sc config   HTTPFilter start= DEMAND 
sc config   ImapiService start= DEMAND 
sc config   lanmanserver start= DISABLED 
sc config   lanmanworkstation start= AUTO 
sc config   LmHosts start= DISABLED 
sc config   Messenger start= DISABLED 
sc config   mnmsrvc start= DEMAND 
sc config   MSDTC start= DEMAND 
sc config   MSiSCSI start= DISABLED 
sc config   MSIServer start= DEMAND 
sc config   NBExpl start= DISABLED 
sc config   NetDDE start= DISABLED 
sc config   NetDDEdsdm start= DISABLED 
sc config   Netlogon start= DEMAND 
sc config   Netman start= DEMAND 
sc config   Nla start= DISABLED 
sc config   NtLmSsp start= DEMAND 
sc config   NtmsSvc start= DEMAND 
sc config   NVSvc start= DISABLED 
sc config   ose start= DEMAND 
sc config   PlugPlay start= AUTO 
sc config   PolicyAgent start= DISABLED 
sc config   ProtectedStorage start= DISABLED 
sc config   RasAuto start= DEMAND 
sc config   RasMan start= DISABLED 
sc config   RDSessMgr start= DEMAND 
sc config   RemoteAccess start= DISABLED 
sc config   RemoteRegistry start= DISABLED 
sc config   RpcLocator start= DEMAND 
sc config   RpcSs start= AUTO 
sc config   RSVP start= DEMAND 
sc config   SamSs start= DEMAND 
sc config   SCardSvr start= DEMAND 
sc config   Schedule start= DISABLED 
sc config   seclogon start= DISABLED 
sc config   SENS start= DEMAND
sc config   SharedAccess start= DISABLED 
sc config   ShellHWDetection start= DISABLED 
sc config   Spooler start= DISABLED 
sc config   srservice start= DISABLED 
sc config   SSDPSRV start= DISABLED 
sc config   stisvc start= DEMAND
sc config   SwPrv start= DEMAND 
sc config   SysmonLog start= DEMAND 
sc config   TapiSrv start= DISABLED 
sc config   TermService start= DISABLED 
sc config   Themes start= DEMAND 
sc config   TlntSvr start= DISABLED 
sc config   TrkWks start= DISABLED 
sc config   UMWdf start= DISABLED 
sc config   upnphost start= DEMAND 
sc config   UPS start= DEMAND 
sc config   usnsvc start= DEMAND 
sc config   VSS start= DEMAND 
sc config   W32Time start= DISABLED 
sc config   WebClient start= DISABLED 
sc config   winmgmt start= AUTO 
sc config   WmdmPmSN start= DEMAND 
sc config   Wmi start= DEMAND 
sc config   WmiApSrv start= DEMAND 
sc config   wscsvc start= DISABLED 
sc config   wuauserv start= DISABLED 
sc config   WZCSVC start= DISABLED 
sc config   xmlprov start= DEMAND 
cls 
goto start
:i
@echo off
echo 正在帮您清除系统垃圾文件,请稍等......
del /f /s /q %systemdrive%\*.tmp
del /f /s /q %systemdrive%\*._mp
del /f /s /q %systemdrive%\*.log
del /f /s /q %systemdrive%\*.gid
del /f /s /q %systemdrive%\*.chk
del /f /s /q %systemdrive%\*.old
del /f /s /q %systemdrive%\recycled\*.*
del /f /s /q %windir%\*.bak
del /f /s /q %windir%\prefetch\*.*
rd /s /q %windir%\temp & md %windir%\temp
del /f /q %userprofile%\cookies\*.*
del /f /q %userprofile%\recent\*.*
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*"
del /f /s /q "%userprofile%\Local Settings\Temp\*.*"
del /f /s /q "%userprofile%\recent\*.*"
cls
echo 清除系统垃圾完成！
goto start
:j
shutdown -l -t 60
:l
shutdown -s -t 0
:m
start c:\
cls
goto start
:n
start d:\
cls
goto start
:o
start e:\
cls
goto start
:p
start f:\
cls
goto start
:q
ping www.163.com >d:\PING网易公司连接情况.txt
cls
start d:\PING网易公司连接情况.txt
goto start

