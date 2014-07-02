@echo off
cls
:列表选择
@echo off
set :=::::::::::::::
set 标题=jacksi(实用批处理)
@title 列表选择-%标题%
@PROMPT jacksi
@color a
cls
echo.
echo.
echo.
echo                  1   恢复专区 ------恢复一切可禁止的恢复.      --杰
echo                  2   禁止专区 ------禁止一切可禁止的东东.      --克
echo                  3   命令禁止 ------自定义禁止CMD下一些命令.   --雷
echo                  4   母盘制作 ------防范与优化.                --斯

echo     -------------------------------------------------------------------------
echo                                   如:输入5然后回车=进程查杀
echo                直接回车=刷新    jacksi然后回车=[杰克雷斯在线]   Q然后回车=退出             
@set yslbxz=""
@set /p yslbxz=
if /I "%yslbxz%"=="1" goto 恢复专区
if /I "%yslbxz%"=="2" goto 禁止专区
if /I "%yslbxz%"=="3" goto 禁止CMD命令
if /I "%yslbxz%"=="4" goto 母盘制作
if /I "%yslbxz%"=="jacksi" start iexplore http://jacksi.tiandi.com
if /I "%yslbxz%"=="q" (exit)
goto 列表选择





echo     ----------------------------1.恢复专区----------------------------------->nul
:恢复专区
title 恢复专区-%以%
cls
echo                           ──            ──
echo                         →     恢 复 专 区    ←
echo     ----------------------------------------------------------------------
echo         %:%  ①　我的电脑-右键管理 %:% 恢复 ::
echo         %:%  ②  网络连接-本地连接 %:% ↓↓ ::
echo         %:%  ③  我的电脑-右键属性 %:%      ::
echo         %:%  ④      注 册 表      %:%      ::
echo         %:%  ⑤     文件夹选项     %:%      ::
echo         %:%  ⑥     任务栏属性     %:%      ::
echo         %:%  ⑦        右键        %:%      ::
echo         %:%  ⑧     任务管理器     %:%      ::
echo         %:%  ⑨        注消        %:%      ::
echo         %:%  ⑩     锁定计算机     %:%      ::
echo         %:%  ⑾      更改密码      %:%      ::
echo         %:%  ⑿       控制台       %:%      ::
echo         %:%  ⒀       IE下载       %:%      ::
echo         %:%  ⒁      C  M   D      %:% ↑↑ ::
echo         %:%  ⒂    INTERNET属性    %:% 恢复 ::
echo         %:%  16      组策略        %:%      ::
echo     ----------------------------------------------------------------------
echo                      如果见不到更改变化-请F5刷新.
echo     ----------------------------------------------------------------------

echo            恢复你需要的请输入对应值. 如:输入14然后回车=恢复使用CMD.
echo               按回车=刷新恢复列表 G=列表选择 jacksi=杰克雷斯 Q=退出

:jzzqzl1
@set jinzhi=""
@set /p jinzhi=
if /I "%jinzhi%"=="1" goto ①1
if /I "%jinzhi%"=="2" goto ②1
if /I "%jinzhi%"=="3" goto ③1
if /I "%jinzhi%"=="4" goto ④1
if /I "%jinzhi%"=="5" goto ⑤1
if /I "%jinzhi%"=="6" goto ⑥1
if /I "%jinzhi%"=="7" goto ⑦1
if /I "%jinzhi%"=="8" goto ⑧1
if /I "%jinzhi%"=="9" goto ⑨1
if /I "%jinzhi%"=="10" goto ⑩1
if /I "%jinzhi%"=="11" goto ⑾1
if /I "%jinzhi%"=="12" goto ⑿1
if /I "%jinzhi%"=="13" goto ⒀1
if /I "%jinzhi%"=="14" goto ⒁1
if /I "%jinzhi%"=="15" goto ⒂1
if /I "%jinzhi%"=="16" goto 16
if /I "%jinzhi%"=="g" goto 列表选择
if /I "%jinzhi%"=="jacksi" start iexplore http://jacksi.tiandi.com
if /I "%jinzhi%"=="q" (EXIT)
goto 恢复专区

:①1
REG ADD HKCU\Software\Policies\Microsoft\MMC\{58221C67-EA27-11CF-ADCF-00AA00A80033} /v Restrict_Run /t REG_DWORD /d 0 /F >nul
compmgmt.msc
echo         %:%  ①　我的电脑右键-管理 恢复 :: OK
goto jinzhijs1
:②1
REG DELETE "HKCU\Software\Policies\Microsoft\Windows\Network Connections" /F >nul 4>nul 2>nul
echo [Version] >%temp%\Netman.inf
echo Signature="$WINDOWS NT$" >>%temp%\Netman.inf
echo [DefaultInstall.Services] >>%temp%\Netman.inf
echo AddService=Netman,,My_AddService_Name >>%temp%\Netman.inf
echo [My_AddService_Name] >>%temp%\Netman.inf
echo ServiceType=0x20 >>%temp%\Netman.inf
echo StartType=2 >>%temp%\Netman.inf
echo ErrorControl=1 >>%temp%\Netman.inf
echo ServiceBinary=%SystemRoot%\System32\svchost.exe -k netsvcs >>%temp%\Netman.inf
rundll32 syssetup,SetupInfObjectInstallAction DefaultInstall 128 %temp%\Netman.inf >nul 4>nul 2>nul
net start netman >nul 4>nul 2>nul
del %temp%\Netman.inf
ncpa.cpl
echo         %:%  ②　网络连接-本地连接 恢复 :: OK
goto jinzhijs1
:③1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NopropertiesMyComputer /t REG_DWORD /d 0 /F >nul
sysdm.cpl
echo         %:%  ③　我的电脑-右键属性 恢复 :: OK
goto jinzhijs1
:④1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 0 /F >nul
regedit
echo         %:%  ④　    注 册 表      恢复 :: OK
goto jinzhijs1
:⑤1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑤　   文件夹选项     恢复 :: OK
goto jinzhijs1
:⑥1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑥　   任务栏属性     恢复 :: OK
goto jinzhijs1
:⑦1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑦        右键        恢复 :: OK
goto jinzhijs1
:⑧1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 0 /F >nul
taskmgr
echo         %:%  ⑧     任务管理器     恢复 :: OK
goto jinzhijs1
:⑨1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogoff /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑨        注消        恢复 :: OK
goto jinzhijs1
:⑩1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑩     锁定计算机     恢复 :: OK
goto jinzhijs1
:⑾1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableChangePassword /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑾      更改密码      恢复 :: OK
goto jinzhijs1
:⑿1
REG ADD HKCU\Software\Policies\Microsoft\MMC /v RestrictAuthorMode /t REG_DWORD /d 0 /F >nul
echo         %:%  ⑿       控制台       恢复 :: OK
goto jinzhijs1
:⒀1
REG ADD HKCU\Software\Policies\Microsoft\MMC /v RestrictAuthorMode /t REG_DWORD /d 0 /F >nul
echo         %:%  ⒀       IE下载       恢复 :: OK
echo    注:已经恢复了IE下载,可是还可以用软件下载. 如:迅雷
goto jinzhijs1
:⒁1
REG ADD HKCU\Software\Policies\Microsoft\Windows\System\ /v DisableCMD /t REG_DWORD /d 0 /F >nul
echo         %:%  ⒁      C  M   D      恢复 :: OK
goto jinzhijs1
:⒂1
  ::常规
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v GeneralTab /t REG_DWORD /d 0 /F >nul
  ::安全
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v SecurityTab /t REG_DWORD /d 0 /F >nul
  ::隐私
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v PrivacyTab /t REG_DWORD /d 0 /F >nul
  ::内容
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ContentTab /t REG_DWORD /d 0 /F >nul
  ::连接
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /t REG_DWORD /d 0 /F >nul
  ::程序
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ProgramsTab /t REG_DWORD /d 0 /F >nul
  ::高级
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v AdvancedTab /t REG_DWORD /d 0 /F >nul
echo         %:%  ⒂    INTERNET属性    恢复 :: OK
goto jinzhijs1
:16
REG ADD HKCU\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}   /v Restrict_Run /t REG_DWORD /d 0 /F >nul
echo         %:%  16.组策略　 禁止 :: OK
goto jinzhijs

:jinzhijs1
gpupdate /force>nul
echo    ───────────────────────────────────
echo                  提醒:看不到恢复列表.直接回车可以刷新哦.
@set jinzhi=""
goto jzzqzl1






echo     ----------------------------2.禁止专区----------------------------------->nul
:禁止专区
@title 禁止专区-%以%
cls
echo                           ──            ──
echo                         →     禁 止 专 区    ←
echo     ----------------------------------------------------------------------
echo         %:%  ①　我的电脑-右键管理 %:% 禁止 ::
echo         %:%  ②  网络连接-本地连接 %:% ↓↓ ::
echo         %:%  ③  我的电脑-右键属性 %:%      ::
echo         %:%  ④      注 册 表      %:%      ::
echo         %:%  ⑤     文件夹选项     %:%      ::
echo         %:%  ⑥     任务栏属性     %:%      ::
echo         %:%  ⑦        右键        %:%      ::
echo         %:%  ⑧     任务管理器     %:%      ::
echo         %:%  ⑨        注消        %:%      ::
echo         %:%  ⑩     锁定计算机     %:%      ::
echo         %:%  ⑾      更改密码      %:%      ::
echo         %:%  ⑿       控制台       %:%      ::
echo         %:%  ⒀       IE下载       %:%      ::
echo         %:%  ⒁      C  M   D      %:% ↑↑ ::
echo         %:%  ⒂    INTERNET属性    %:% 禁止 ::
echo         %:%  16      16.组策略     %:%      ::
echo     ----------------------------------------------------------------------
echo                       如见不到更改变化-请F5刷新.
echo     ----------------------------------------------------------------------

echo            禁止你需要的请输入对应值. 如:输入14然后回车=禁止使用CMD.
echo               按回车=刷新禁止列表 G=列表选择 jacksi=杰克雷斯 Q=退出

:jzzqzl
@set jinzhi=""
@set /p jinzhi=
if /I "%jinzhi%"=="1" goto ①
if /I "%jinzhi%"=="2" goto ②
if /I "%jinzhi%"=="3" goto ③
if /I "%jinzhi%"=="4" goto ④
if /I "%jinzhi%"=="5" goto ⑤
if /I "%jinzhi%"=="6" goto ⑥
if /I "%jinzhi%"=="7" goto ⑦
if /I "%jinzhi%"=="8" goto ⑧
if /I "%jinzhi%"=="9" goto ⑨
if /I "%jinzhi%"=="10" goto ⑩
if /I "%jinzhi%"=="11" goto ⑾
if /I "%jinzhi%"=="12" goto ⑿
if /I "%jinzhi%"=="13" goto ⒀
if /I "%jinzhi%"=="14" goto ⒁
if /I "%jinzhi%"=="15" goto ⒂
if /I "%jinzhi%"=="16" goto 16
if /I "%jinzhi%"=="g" goto 列表选择
if /I "%jinzhi%"=="jacksi" start iexplore http://jacksi.tiandi.com
if /I "%jinzhi%"=="q" (EXIT)
goto 禁止专区

:①
REG ADD HKCU\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}   /v Restrict_Run /t REG_DWORD /d 1 /F >nul
echo         %:%  ①　我的电脑右键-管理 禁止 :: OK
goto jinzhijs
:②
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Network Connections" /v NC_EnableAdminProhibits /t REG_DWORD /d 1 /F >nul
REG ADD "HKCU\Software\Policies\Microsoft\Windows\Network Connections" /v NC_LanProperties /t REG_DWORD /d 1 /F >nul
echo         %:%  ②　网络连接-本地连接 禁止 :: OK
goto jinzhijs
:③
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NopropertiesMyComputer /t REG_DWORD /d 1 /F >nul
echo         %:%  ③　我的电脑-右键属性 禁止 :: OK
goto jinzhijs
:④
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableRegistryTools /t REG_DWORD /d 1 /F >nul
echo         %:%  ④　    注 册 表      禁止 :: OK
goto jinzhijs
:⑤
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoFolderOptions /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑤　   文件夹选项     禁止 :: OK
goto jinzhijs
:⑥
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoSetTaskbar /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑥　   任务栏属性     禁止 :: OK
goto jinzhijs
:⑦
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoViewContextMenu /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑦        右键        禁止 :: OK
goto jinzhijs
:⑧
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableTaskMgr /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑧     任务管理器     禁止 :: OK
goto jinzhijs
:⑨
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\Explorer /v NoLogoff /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑨        注消        禁止 :: OK
goto jinzhijs
:⑩
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableLockWorkstation /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑩     锁定计算机     禁止 :: OK
goto jinzhijs
:⑾
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Policies\System /v DisableChangePassword /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑾      更改密码      禁止 :: OK
goto jinzhijs
:⑿
REG ADD HKCU\Software\Policies\Microsoft\MMC /v RestrictAuthorMode /t REG_DWORD /d 1 /F >nul
echo         %:%  ⑿       控制台       禁止 :: OK
goto jinzhijs
:⒀
REG ADD HKCU\Software\Policies\Microsoft\MMC /v RestrictAuthorMode /t REG_DWORD /d 3 /F >nul
echo         %:%  ⒀       IE下载       禁止 :: OK
echo    注:虽然禁止了IE下载,可是还可以用软件下载. 如:迅雷
goto jinzhijs
:⒁
REG ADD HKCU\Software\Policies\Microsoft\Windows\System\ /v DisableCMD /t REG_DWORD /d 2 /F >nul
echo         %:%  ⒁      C  M   D      禁止 :: OK
goto jinzhijs
:⒂
  ::常规
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v GeneralTab /t REG_DWORD /d 1 /F >nul
  ::安全
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v SecurityTab /t REG_DWORD /d 1 /F >nul
  ::隐私
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v PrivacyTab /t REG_DWORD /d 1 /F >nul
  ::内容
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ContentTab /t REG_DWORD /d 1 /F >nul
  ::连接
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ConnectionsTab /t REG_DWORD /d 1 /F >nul
  ::程序
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v ProgramsTab /t REG_DWORD /d 1 /F >nul
  ::高级
REG ADD "HKCU\Software\Policies\Microsoft\Internet Explorer\Control Panel" /v AdvancedTab /t REG_DWORD /d 1 /F >nul
echo         %:%  ⒂    INTERNET属性    禁止 :: OK
goto jinzhijs
:16
REG ADD HKCU\Software\Policies\Microsoft\MMC\{8FC0B734-A0E1-11D1-A7D3-0000F87571E3}   /v Restrict_Run /t REG_DWORD /d 1 /F >nul
echo         %:%  16.组策略　 禁止 :: OK
goto jinzhijs

:jinzhijs
gpupdate /force>nul
echo    ───────────────────────────────────
echo                  提醒:看不到禁止列表.直接回车可以刷新哦.
goto jzzqzl



echo     ----------------------------3.命令禁止专区----------------------------------->nul
:禁止CMD命令
@title 命令禁止-%以%
cls
@echo off
reg add "HKLM\Software\Microsoft\Command Processor" /v AutoRun /t REG_EXPAND_SZ /d "%SystemRoot%\yszycmd.cmd" /f>nul 2>nul 4>nul
dir %SystemRoot%\yszycmd.cmd>nul 2>nul 4>nul
goto jzcmd2%ERRORLEVEL%
:jzcmd20
find /i "doskey"<%SystemRoot%\yszycmd.cmd>nul 2>nul 4>nul
goto jzcmd%ERRORLEVEL%
:jzcmd1
:jzcmd21
echo @echo off>  %SystemRoot%\yszycmd.cmd
echo doskey doskey =echo doskey已经禁止如有需要请联系管理员.>> %SystemRoot%\yszycmd.cmd
:jzcmd0
echo,
echo,
echo              请输入你要禁止的命令如:输入DIR然后回车=DIR命令禁止使用
echo     -------------------------------------------------------------------------
echo                直接回车=刷新 按G=列表选择 按jacksi=杰克雷斯  按Q=退出
echo     -------------------------------------------------------------------------
echo       按B=去除所有禁止命令 按S=查看当前禁止的命令 按A=自定义不要禁止的命令
echo     -------------------------------------------------------------------------
echo,
echo,
set jzcmd=
set /p jzcmd=
if /I "%jzcmd%"=="g" goto 列表选择
if /I "%jzcmd%"=="jacksi" start iexplore http://jacksi.tiandi.com
if /I "%jzcmd%"=="" goto 禁止CMD命令
if /I "%jzcmd%"=="b" goto jzcmdbo
if /I "%jzcmd%"=="a" goto jzcmdzd
if /I "%jzcmd%"=="2" goto 禁止CMD命令
if /I "%jzcmd%"=="1" goto 禁止CMD命令
if /I "%jzcmd%"=="q" (exit)
if /I "%jzcmd%"=="s" goto jccmdck
%jzcmd% /?>nul 2>nul 4>nul
if /I "%ERRORLEVEL%"=="9009" goto cmdmy
find /i "%jzcmd%"<%SystemRoot%\yszycmd.cmd>nul 2>nul 4>nul
if /I "%ERRORLEVEL%"=="0" goto cmdyy
echo "%jzcmd%"|find /i" " >nul 2>nul 4>nul
if /I "%ERRORLEVEL%"=="0" goto cmdbb
echo doskey %jzcmd% =echo %jzcmd%已经禁止如有需要请联系管理员.>> %SystemRoot%\yszycmd.cmd
goto jzcmdcg



:cmdmy
echo,
echo,
echo,
echo,
echo,
echo                            你输入的命令不可用
echo                              请按任意键继续
pause >nul
goto 禁止CMD命令


:jzcmdcg
echo,
echo,
echo,
echo                      已经禁止-请按任意键继续
pause >nul
goto 禁止CMD命令

:cmdbb
echo,
echo,
echo                       此命令带空格.不可输入
echo                          请按任意键继续
pause >nul
goto 禁止CMD命令


:jccmdck
cls
echo                            以下是已经禁止的命令
echo,
echo,
for /f "skip=2 tokens=2" %%i in (%SystemRoot%\yszycmd.cmd) do echo           →◎→◎→◎→◎→◎→   %%i
echo     -------------------------------------------------------------------------
echo,
echo,
echo,
echo,
goto jzcmd0


:cmdyy
echo,
echo,
echo,
echo,
echo   ------------------此命令已经存在禁止列表中,不需多次禁止--------------------
echo                               请按任意键继续
pause >nul
goto 禁止CMD命令


:jzcmdbo
cls
del %SystemRoot%\yszycmd.cmd
echo,
echo,
echo,
echo,
echo,
echo,
echo,
echo,
echo        →◎→◎→◎→◎→◎→已经去除所有禁止命令←◎←◎←◎←◎←◎←
echo     -------------------------------------------------------------------------
echo           →◎→◎→◎→◎→◎→请按任意键继续←◎←◎←◎←◎←◎←
pause >nul
goto 禁止CMD命令


:jzcmdzd
cls
echo                            以下是已经禁止的命令
echo,
echo,
for /f "skip=2 tokens=2" %%i in (%SystemRoot%\yszycmd.cmd) do echo           →◎→◎→◎→◎→◎→   %%i
echo     -------------------------------------------------------------------------
echo,
echo,
echo,
echo,
echo                       请输入你要从禁止列表中去除的命令 
echo                           G=返回禁止CMD命令 Q=退出
set zcmdzd=
set /p zcmdzd=
if /I "%zcmdzd%"=="g" goto 禁止CMD命令
if /I "%zcmdzd%"=="q" (exit)
if /I "%zcmdzd%"=="" goto jzcmdzd
%zcmdzd% /?>nul 2>nul 4>nul
if /I "%ERRORLEVEL%"=="9009" goto cmdmy
find /i "%zcmdzd%"<%SystemRoot%\yszycmd.cmd>nul 2>nul 4>nul
if /I "%ERRORLEVEL%"=="1" goto jzcmdmy11
type %SystemRoot%\yszycmd.cmd|find /v /i "%zcmdzd%">%SystemRoot%\yszycmd1.cmd
del %SystemRoot%\yszycmd.cmd
ren %SystemRoot%\yszycmd1.cmd yszycmd.cmd
echo,
echo,
echo,
echo,
echo,
echo                          已经从禁止列表中去除%zcmdzd%命令
echo                                 按任意键继续
pause >nul
goto jzcmdzd

:jzcmdmy11
echo,
echo,
echo,
echo,
echo                你输入的命令不存在禁止列表中-请确定后在来吧
echo                                按任意键继续
pause >nul
goto jzcmdzd

:cmdmy
echo,
echo,
echo,
echo,
echo                      你输入的不是命令-不要拿我来开唰哦
echo                                按任意键继续
pause >nul
goto jzcmdzd


echo     ----------------------------4.母盘制作----------------------------------->nul
:母盘制作
@title 母盘制作-%以%
:whzq
cls
echo      ----------------------------------------------------------------------
echo             %:%  ①　ARP工具与欺骗防范    %:% 
echo             %:%  ②    威金病毒防范       %:% 
echo             %:%  ③   关闭 默认 共享      %:%      
echo             %:%  ④    清理无用文件       %:%     
echo             %:%  ⑤     更改IE标题        %:%     
echo             %:%  ⑥显｜隐系统.隐藏文件·夹%:%   
echo             %:%  ⑦ 清除-桌面右键多余菜单 %:%   
echo      ───────────────────────────────────
echo                          请输入你需要的对应值.
echo               按回车=刷新恢复列表 G=列表选择 jacksi=杰克雷斯 Q=退出
:whzq1
gpupdate /force>nul
set whzq=""
set /p   whzq=
if /i  "%whzq%"=="1" goto arpff
if /i  "%whzq%"=="2" goto wjbdff
if /i  "%whzq%"=="3" goto gbgx
if /i  "%whzq%"=="4" goto qlwj
if /i  "%whzq%"=="5" goto ggie
if /i  "%whzq%"=="6" goto xywj
if /i  "%whzq%"=="7" goto qcyj
if /i  "%whzq%"=="jacksi" start iexplore http://jacksi.tiandi.com
if /i  "%whzq%"=="q" goto exit
if /i  "%whzq%"=="g" goto 列表选择
goto whzq


::---------------------①　ARP工具与欺骗防范---------------------
:arpff
 ::使winpacp装不上.让网络执法管等没用
md %windir%\system32\packet.dll  >nul 2>nul
md %windir%\system32\pthreadVC.dll >nul 2>nul
md %windir%\system32\wpcap.dll >nul 2>nul
md %windir%\system32\drivers\npf.sys >nul 2>nul
md %windir%\system32\npptools.dll >nul 2>nul
  ::使以上添加的文件本地用户名没权限访问
echo y|cacls.exe %windir%\system32\packet.dll /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\system32\pthreadVC.dll /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\system32\wpcap.dll /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\system32\drivers\npf.sys /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\system32\npptools.dll /d system administrator guest >nul 1>nul
echo     ----------------------------------------------------------------------
echo                 已经添加防范ARP欺骗与网络执法管等工具的文件
goto whzq1


::---------------------②    威金病毒防范---------------------
:wjbdff
md %windir%\Logo1_.exe  >nul 2>nul
md %windir%\rundl132.exe  >nul 2>nul
md %windir%\0Sy.exe  >nul 2>nul
md %windir%\vDll.dll  >nul 2>nul
md %windir%\1Sy.exe  >nul 2>nul
md %windir%\2Sy.exe  >nul 2>nul
md %windir%\rundll32.exe  >nul 2>nul
md %windir%\3Sy.exe  >nul 2>nul
md %windir%\5Sy.exe  >nul 2>nul
md %windir%\1.com  >nul 2>nul
md %windir%\exerouter.exe  >nul 2>nul
md %windir%\EXP10RER.com  >nul 2>nul
md %windir%\finders.com  >nul 2>nul
md %windir%\Shell.sys  >nul 2>nul
md %windir%\smss.exe  >nul 2>nul
echo y|cacls.exe %windir%\Logo1_.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\rundl132.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\0Sy.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\vDll.dll /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\1Sy.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\2Sy.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\rundll32.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\3Sy.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\5Sy.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\1.com /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\exerouter.exe /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\EXP10RER.com /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\finders.com /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\Shell.sys /d system administrator guest >nul 1>nul
echo y|cacls.exe %windir%\smss.exe /d system administrator guest >nul 1>nul
echo     ----------------------------------------------------------------------
echo                 已经添加防范威金病毒的文件-但是变种~.exe尚是没办法
goto whzq1

::---------------------③   关闭 默认 共享---------------------
:gbgx
net share c$ /delete 2>nul
net share d$ /delete 2>nul
net share e$ /delete 2>nul
net share f$ /delete 2>nul
net share g$ /delete 2>nul
net share h$ /delete 2>nul
net share g$ /delete 2>nul
net share admin$ /delete 2>nul
net share i$ /delete 2>nul
echo Windows Registry Editor Version 5.00> c:/delshare.reg
REG ADD HKLM\SYSTEM\CurrentControlSet\Control\LSA /v RestrictAnonymous /t REG_DWORD /d 1 /F >nul
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters /v AutoShareWks /t REG_DWORD /d 0 /F >nul
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters /v AutoShareServer /t REG_DWORD /d 0 /F >nul
echo     ----------------------------------------------------------------------
echo                               已经关闭默认共享.
goto whzq1

::---------------------④    清理无用文件---------------------
:qlwj
echo 正在清除系统垃圾文件，请稍等......
del /f /s /q %systemdrive%\*.tmp >nul 2>nul
del /f /s /q %systemdrive%\*._mp >nul 2>nul
del /f /s /q %systemdrive%\*.log >nul 2>nul
del /f /s /q %systemdrive%\*.gid >nul 2>nul
del /f /s /q %systemdrive%\*.chk >nul 2>nul
del /f /s /q %systemdrive%\*.old >nul 2>nul
del /f /s /q %systemdrive%\recycled\*.* >nul 2>nul
del /f /s /q %windir%\*.bak >nul 2>nul
del /f /s /q %windir%\prefetch\*.* >nul 2>nul
rd /s /q %windir%\temp & md %windir%\temp >nul 2>nul
del /f /q %userprofile%\cookies\*.* >nul 2>nul
del /f /q %userprofile%\recent\*.* >nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temporary Internet Files\*.*" >nul 2>nul
del /f /s /q "%userprofile%\Local Settings\Temp\*.*" >nul 2>nul
del /f /s /q "%userprofile%\recent\*.*" >nul 2>nul
echo     ----------------------------------------------------------------------
echo                               系统垃圾文件已经清理完成.
goto whzq1

::---------------------⑤     更改IE标题 ---------------------
:ggie
set yszy=""
echo    -------------------请输入你需要的IE标题.复制进去也行-------------------
echo    -------------------     直接回车=母盘专区 Q=退出    -------------------
set /p yszy=
if /i "%yszy%"=="""" (goto whzq)
if /i "%yszy%"=="q" (exit)
REG ADD "HKCU\SOFTWARE\Microsoft\Internet Explorer\Main" /v "Window Title" /t REG_SZ /d "%yszy%" /F >nul
echo     ----------------------------------------------------------------------
echo                        IE标题已经更改为 %yszy%.
goto whzq1

::--------------------- ⑥显｜隐系统.隐藏文件·夹 --------------------
:xywj
set yszy=""
echo           -------------------输入X显示 输入Y隐藏-------------------
echo    -------------------   直接回车与乱输入=母盘专区 Q=退出   -------------------
set /p yszy=
if /i "%yszy%"=="""" (goto whzq)
if /i "%yszy%"=="x" (set xy=1  &set yszy=显示  &goto xywj1)
if /i "%yszy%"=="y" (set xy=0  &set yszy=隐藏  &goto xywj1)
if /i "%yszy%"=="q" (exit)
goto whzq
:xywj1
REG ADD HKCU\Software\Microsoft\Windows\CurrentVersion\Explorer\Advanced\ /v Hidden /t REG_DWORD /d %xy% /F >nul
echo     ----------------------------------------------------------------------
echo              系统·隐藏.文件.文件夹已经 %yszy%.刷新即可见到状态.
goto whzq1

::---------------------⑦ 清除-桌面右键多余菜单 --------------------
:qcyj
regsvr32 /u /s igfxpph.dll >nul 2>nul
reg delete HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers /f >nul
reg add HKEY_CLASSES_ROOT\Directory\Background\shellex\ContextMenuHandlers\new /ve /d {D969A300-E7FF-11d0-A93B-00A0C90F2719} >nul
echo     ----------------------------------------------------------------------
echo                        桌面多余右键菜单已清除完成.
goto whzq1


