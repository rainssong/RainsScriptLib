@echo off
rem South China Agriculture University 
rem version 0.01

rem 使用介绍
rem 功能:试图设置自动连接校内Windows Update服务器
rem 先进行服务检查，没有安装服务的机器先安装服务，重启动后再修改设置

rem History
rem 2004-03-17 0.01b 全校公测
echo [INFO] For Windows 2000,Windows XP,Windows 2003 only. 
echo [INFO] 只在Windows 2000,Windows XP,Windows 2003 上适用
echo [INFO] For Normal user only (computer that runs every day)
set Server=0
rem Server=1
pause
cls

rem 创建临时文件夹
set mhnet=%temp%\mhnet
rmdir /S /Q %mhnet% 2>NUL 1>NUL
mkdir %mhnet%

rem 系统语言环境判断
reg query HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language >%mhnet%\Language.log
find "Default" %mhnet%\Language.log |find "0804" >NUL
IF NOT ERRORLEVEL 1 (
 set Language=Chinese
) else (
 set Language=English
)

if %Language%==Chinese (
 echo [INFO] 本程序专为设置校内 Windows Automatic Updates 服务
) else (
 echo [INFO] This will setup SCAU Windows Automatic Updates Services
)

start readme.txt

rem 检查配套文件完整性
call :AllFiles

rem 检查属于NT系列
call :CheckSystem

rem 检查拥有管理员权限
call :CheckAdmin

rem 检查Automatic Updates服务是否正常安装
call :CheckService

call :SCAURegImport


if %Language%==Chinese (
 echo [INFO] 程序讨论，欢迎到 bbs.scau.edu.cn NC板
 echo [INFO] 程序结束
) else (
 echo [INFO] We welcome you to press your opinion on bbs.scau board:NC
 echo [INFO] Program Exit
)

pause
set mhnet=
set patchfile=
set downloadurl=
goto :eof
exit
:ends
rem 主函数结束




rem *************************
rem *************************
rem 导入:SCAURegImport
rem *************************
rem *************************
:SCAURegImport
ECHO [INFO] 备份注册表(Backup Reg) %temp%
pushd %temp%
set BakFile1=AutoUpdateBak1.reg
set BakFile2=AutoUpdateBak2.reg
if exist %BakFile1% (
 ECHO [INFO] 已经安装了本补丁，按任意键删除原有备份
 PAUSE
 delete %BakFile1% /f /q >NUL 2>NUL
 delete %BakFile2% /f /q >NUL 2>NUL
)
popd

pushd %mhnet%
reg EXPORT "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" %BakFile1% 1>NUL
reg EXPORT "HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate" %BakFile2% 1>NUL
move %BakFile1% %temp% >NUL
move %BakFile2% %temp% >NUL
set BakFile1=
set BakFile2=
popd

ECHO [INFO] 正在停止WindowsUpdate服务(Stopping Update service)......
net stop wuauserv >NUL 2>NUL

ECHO [INFO] 正在修改注册表操作(Modifying Registry)......
ECHO Y |reg DELETE "HKLM\Software\Microsoft\Windows\CurrentVersion\WindowsUpdate\Auto Update" /va /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate /v WUServer /t REG_SZ /d "http://sus.scau.edu.cn" /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate /v WUStatusServer /t REG_SZ /d "http://sus.scau.edu.cn" /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoRebootWithLoggedOnUsers /t REG_DWORD /d 1 /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v NoAutoUpdate /t REG_DWORD /d 0 /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v RescheduleWaitTime /t REG_DWORD /d 1 /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallDay /t REG_DWORD /d 0 /f >NUL
reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v UseWUServer /t REG_DWORD /d 1 /f >NUL



if %Server%==1 (
 ECHO [INFO] Automatic Updates Service installed for server
 reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 4 /f >NUL
 reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallTime /t REG_DWORD /d 11 /f >NUL
) else (
 ECHO [INFO] Automatic Updates Service installed for non-server
 reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v AUOptions /t REG_DWORD /d 2 /f >NUL
 reg add HKLM\Software\Policies\Microsoft\Windows\WindowsUpdate\AU /v ScheduledInstallTime /t REG_DWORD /d 12 /f >NUL
)

rem 服务自动启动
ECHO [INFO] 设置服务为自动启动(Set service to automatic start)
reg add HKLM\SYSTEM\CurrentControlSet\Services\wuauserv /v Start /t REG_DWORD /d 2 /f >NUL
reg add HKLM\SYSTEM\CurrentControlSet\Services\BITS /v Start /t REG_DWORD /d 2 /f >NUL

ECHO [INFO] 正在重新启动WindowsUpdate服务(Starting Update Service)......
net start bits >NUL 2>NUL 
net start wuauserv >NUL 2>NUL

goto :eof







rem *************************
rem *************************
rem 停止/删除服务函数
rem *************************
rem *************************
:StopService
set SrvName=%1
net stop %SrvName% >NUL >NUL2
reg query HKLM\SYSTEM\CurrentControlSet\Services\\%SrvName% >NUL
if not errorlevel 1 (
 reg delete HKLM\SYSTEM\CurrentControlSet\Services\\%SrvName%  /f >NUL
) ELSE (
 if %Language%==Chinese (
  echo [FAIL] 系统服务: %SrvName% *没找到*
 ) else (
  echo [FAIL] System Service: %SrvName% Not Found
 )
)
goto :eof






rem *************************
rem *************************
rem 判断是否NT系列系统，win9x系统则退出
rem *************************
rem *************************
:CheckSystem
if NOT %OS%==Windows_NT (
 if %Language%==Chinese (
  echo [INFO] 本程序专为中文/英文版本的Win2000,WinXP,Win2003设计
  echo [FAIL] Windows 95, Windows 98, Windows ME的用户不必运行
  echo [INFO] 程序退出。
 ) else (
  echo [INFO] Design for Win2k,WinXP,Win2003 with Chinese or English version only.
  echo [FAIL] Windows 95,Windows 98, Windows ME will not be troubled by this bug.
  echo [INFO] Thank you for checking. Please deliver this to someone who need it.
 )
 pause
 exit
) else (
 if %Language%==Chinese (
  echo [INFO] 用户使用基于WindowsNT内核的系统,
 ) else (
  echo [INFO] You are using a system based on WindowsNT kernel,
 )
)
goto :eof



rem *************************
rem *************************
rem 判断是否NT系列系统，win9x系统则退出
rem *************************
rem *************************
:CheckAdmin
net user "%username%"  1> %mhnet%\ifadmin.log
rem 如果不是系统管理员
find "*Administrators " %mhnet%\ifadmin.log >NUL
IF ERRORLEVEL 1 (
 if %Language%==Chinese (
  echo [FAIL] 用户不是系统管理员组成员 ，不能执行相应程序
  echo [INFO] 请更换有足够权限的用户重新运行本程序
 ) else (
  echo [FAIL] This program require administrator right to continue
  echo [INFO] Please switch user and try again
 )
 pause
 exit
 goto :eof
) else (
 if %Language%==Chinese (
  echo [INFO] 用户属于系统管理员组,
 ) else (
  echo [INFO] You have got the right of administrator, 
 )
)
goto :eof






rem *************************
rem *************************
rem 先进行补丁检查，没有安装补丁的机器先安装补丁，重启动后再查杀病毒
rem *************************
rem *************************
:CheckService
rem if %Language%==Chinese (
rem  echo [INFO] 检查 Automatic Updates 
rem ) else (
rem  echo [INFO] Checking Automatic Updates Service
rem )
rem 检查服务的注册表值

reg query "HKLM\SYSTEM\CurrentControlSet\Services" >%mhnet%\Services.log
find "wuauserv" %mhnet%\Services.log >NUL

IF ERRORLEVEL 1 (
 rem 您的计算机未安装Automatic updates服务
 call :InstallService
 pause
 exit
 rem 中止执行
) ELSE (
rem  if %Language%==Chinese (
rem   echo [INFO] 注册表检查显示您的系统已经安装了wuauserv服务。
rem  ) else (
rem   echo [INFO] reg reports that your system has wuauserv service installed
rem  )
)
goto :eof







rem *************************
rem *************************
rem 清空注册表某\Run值
rem *************************
rem *************************
:CleanRun
reg delete HKLM\Software\Microsoft\Windows\CurrentVersion\Run\\%1 /f >NUL
goto :eof








rem *************************
rem *************************
rem 停止不安全服务
rem *************************
rem *************************
:StopUnSafeSrv
rem net stop %1 >NUL
reg add HKLM\SYSTEM\CurrentControlSet\Services\\%1 /v Start /t REG_DWORD /d 0x3 /f >NUL
goto :eof








rem *************************
rem *************************
rem 导入正常注册表的execute文件关联
rem *************************
rem *************************
:Regdefault
reg import regdefault.reg >NUL
goto :eof




rem *************************
rem *************************
rem 安装wuauserv包
rem *************************
rem *************************
:InstallService
rem reg query HKLM\SYSTEM\CurrentControlSet\Control\Nls\Language >%mhnet%\Language.log

rem 中文系统
find "InstallLanguage" %mhnet%\Language.log |find "0804" >NUL
IF NOT ERRORLEVEL 1 (CALL :CNService ) 

rem 英文系统
find "InstallLanguage" %mhnet%\Language.log |find "0409" >NUL
IF NOT ERRORLEVEL 1 (CALL :ENService ) 

rem 其他语言包，以上语言包虽用call调用，但不希望返回
if %Language%==Chinese (
 echo [FAIL] 你并未使用中文/英文操作系统，
 echo [INFO] 请记下下面显示的InstallLanguage及Default的值,请到微软网站下载相应服务
 echo [INFO] 程序退出
) else (
 echo [FAIL] You are not using windows with Chinese/English language
 echo [INFO] We suggest you download the service from microsoft website.
 echo [INFO] Please write down the InstallLanguage & Default value for later use.
 echo [INFO] program terminated
)
find "InstallLanguage" %mhnet%\Languate.log
start http://www.microsoft.com/downloads/details.aspx?FamilyID=799432fb-c196-4f01-8cce-4f9ea58d6177&DisplayLang=en
rem 微软服务安装网页
pause
exit
goto :eof







rem *************************
rem *************************
rem 中文服务包下载安装
rem *************************
rem *************************
:CNService
set patchfile=WUAU22CHS.msi
set downloadurl=http://sus.scau.edu.cn/%patchfile%
call :Download
start %mhnet%\%patchfile%
if %Language%==Chinese (
 echo [INFO] 安装好服务后重启电脑，再运行本程序
) else (
 echo [INFO] Restart your computer when Service installation is done. And run again.
)
pause
exit
goto :eof








rem *************************
rem *************************
rem 英文服务包下载安装
rem *************************
rem *************************
:ENService
set patchfile=WUAU22ENU.msi
set downloadurl=http://sus.scau.edu.cn/%patchfile%
call :Download
start %mhnet%\%patchfile%
if %Language%==Chinese (
 echo [INFO] 安装好服务后重启电脑，再运行本程序
) else (
 echo [INFO] Restart your computer when Service installation is done. And run again.
)
pause
exit
goto :eof









rem *************************
rem *************************
rem 检查部分文件完整性
rem *************************
rem *************************
:AllFiles
if not exist reg.exe (
 echo [WARN] reg.exe NOT FOUND
 pause
 exit
) else (
 copy reg.exe %mhnet% /y >NUL
)

if not exist wget.exe (
 echo [WARN] wget.exe NOT FOUND
 pause
 exit
) else (
 copy wget.exe %mhnet% /y >NUL
)
goto :eof





rem *************************
rem *************************
rem 下载补丁，用%patchfile%传入文件名
rem *************************
rem *************************
:Download
 if %Language%==Chinese (
  echo [INFO] 自动下载 %downloadurl%
 ) else (
  echo [INFO] Downloading %downloadurl%
 )
 pushd %mhnet%
 if exist %patchfile% (
  del %patchfile% /f /q >NUL 2>NUL
 )
 wget %downloadurl%
 IF NOT ERRORLEVEL 1 (
  if %Language%==Chinese (
   echo [INFO] 下载成功。
  ) else (
   echo [INFO] Download Success
  )
 ) else (
  if %Language%==Chinese (
   echo [FAIL] 下载失败。程序退出
  ) else (
   echo [FAIL] Download Failed. Terminated
  )
  pause
  exit
 )
 popd
goto :eof



rem ----- this is the end of this batch file -------
