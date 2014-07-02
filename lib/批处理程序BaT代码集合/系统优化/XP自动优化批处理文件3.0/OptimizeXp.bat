@echo off
:: ==============================================================================================================================================================
:: OptimizeXP.cmd		Windows XP 优化减肥批处理文件（原则上本优化程序也可以用于Windows 2003）。
:: Version: 3.1
:: 创建人：Climbing（xclimbing@msn.com，QQ：653668）
:: 创建日期：2003年11月1日
:: 最后修改日期：2004年8月17日
:: 提醒：在运行本批处理文件之前，务必通读一遍整个文件的内容，根据注释去掉你不想要的（或者与你的系统冲突的）部分。
::       由于删除了一些系统文件，如果优化过程中提示插入系统安装光盘，请不要这样做并选择保留不可识别的文件版本。
::       优化完成后请重新启动计算机。
:: 其它：不包括在本批处理中的其它优化内容(大部分都在“我的电脑 -> 鼠标右键 -> 属性”中设置，建议这些操作在运行本优化程序之前进行)：
:: 	1. 关闭系统还原功能。
::	2. 在硬盘正中间的位置建立一个小的分区（我推荐1G以上，2G以内，视你的内存情况而定），然后将pagefile.sys转移到该分区上，设定为固定大小，一般为内存的2－3倍。
::	   当然同时将系统分区(C:)的pagefile.sys设置为无。
::	3. 编辑环境变量，将TEMP及TMP的环境变量指向到上述分区（注意TEMP变量分用户变量及系统变量两种，尽量指向不同的目录）。
::	4. 开始 -> 运行 -> DRWTSN32，去掉所有的Dr. Watson相关选项。
::   5. 修改启动选项，将默认的菜单倒计时时间设置为1或者0。同时将调试信息中的内存转储设置为“无”。
::	6. 在设置管理器中修改主、从IDE接口的高级设置，将没有接设备的接口类型设置为“无”，将接设备的接口的传送模式设置为“DMA(若可用)”。
:: =============================================================================================================================================================

:: 设置本批处理运行时的一些环境变量：tempdir为临时的工作目录，必须可写；bak为备份注册表需要用到的目录，必须可写
set tempdir=%temp%
set bak=f:\syssoft\system\regbak


:: 如果不存在上述目录，则建立相应的目录
if not exist %tempdir%\. md %tempdir%
if not exist %bak%\. md %bak%

:: 删除Windows的DllCache(%windir%\system32\dllcache)
sfc /purgecache

:: 删除%windir%目录下的一些内容（注：这些内容是不建议删除的，用于极度减肥，建议删除之前做备份）
rd /s /q "%windir%\Downloaded Installations"
del /f /q /s "%windir%\Help\*.*"
del /f /q /s "%windir%\ime\CHTIME\*.*"
::del /f /q /s "%windir%\Media\*.*"
del /f /q /s "%windir%\system32\LogFiles\*.*"

:: 微软仓颉输入法
del /f /q /s "%windir%\system32\IME\CINTLGNT\*.*"

:: 微软拼音输入法
::del /f /q /s "%windir%\system32\IME\PINTLGNT\*.*"
::del /f /q /s "%windir%\system32\IMSC40A.IME"

:: 微软注音输入法 
del /f /q /s "%windir%\system32\IME\TINTLGNT\*.*"

:: 其它Windows内置输入法
for %%I in (chajei.ime CINTLGNT.IME dayi.ime imekr61.ime imjp81.ime MSCTFIME.IME phon.ime PINTLGNT.IME quick.ime romanime.ime TINTLGNT.IME unicdime.ime winar30.ime WINGB.IME winime.ime WINPY.IME WINSP.IME WINZM.IME) do if exist "%windir%\system32\%%I" del /f /q "%windir%\system32\%%I"

:: 删除Windows系统分区上的其它垃圾文件
if exist c:\io.sys attrib -s -r -h c:\io.sys
if exist c:\msdos.sys attrib -s -r -h c:\msdos.sys
if exist c:\io.sys del /f /q c:\io.sys
if exist c:\msdos.sys del /f /q c:\msdos.sys
del /f /q /s %windir%\temp\*.*
del /f /q /s %windir%\*.log
del /f /q /s %windir%\*.dmp
del /f /q /s %windir%\*.tmp
del /f /q /s %windir%\*.bak
del /f /q /s %windir%\Help\Tours\*.*
rd  /s /q    %windir%\Help\Tours
del /f /q /s %windir%\minidump\*.*
del /f /q /s %windir%\*.old
del /f /q /s %windir%\*.query
del /f /q    %windir%\*.txt
del /f /q /s "%userprofile%\Recent\*.*"
del /f /q /s "%userprofile%\NetHood\*.*"
del /f /q /s "%userprofile%\Local Settings\Application Data\*.*"

:: 删除Windows打补丁时留下的反安装目录，一般是%windir%目录下以$开头的目录，删除的内容会记录在%tempdir%\rmlist.txt中，下同
lmod > nul
dir /a/b %windir%\$*.* | lmod /l* rd /s /q %windir%\[] > %tempdir%\temp.bat
call %tempdir%\temp.bat
type %tempdir%\temp.bat > %tempdir%\Rmlist.txt
del %tempdir%\temp.bat

:: 删除%windir%\ime目录下的日本、韩国及繁体输入法文件
:: echo sfc /purgecache > %tempdir%\temp.bat
dir /a-d /s /b %windir%\ime\imjp8_1 %windir%\ime\imkr6_1 %windir%\ime\CHTIME | lmod /l* del /f /q [] >> %tempdir%\temp.bat
call %tempdir%\temp.bat
type %tempdir%\temp.bat >> %tempdir%\Rmlist.txt
del %tempdir%\temp.bat

:: 删除%windir%\Prefetch目录下的预读取文件
del /f /q %windir%\Prefetch\*.*

:: Unregist Windows xp's zipfldr.dll去掉zip文件夹功能
:: 操作步骤：首先运行下面的命令，运行完成后千万不要双击zip文件（否则会重新打开XP的zip文件夹功能），立刻打开Winrar，在设置中将所有文件类型都关联到WinRAR。
::regsvr32 /u /s zipfldr.dll

:: 减少Windows XP的启动时间，通过修改注册表中的PrefetchParameters参数（原值为3）
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Session Manager\Memory Management\PrefetchParameters" /v EnablePrefetcher /t REG_DWORD /d 5 /f

:: 加速xp的开关机，缩短杀掉服务和进程的等待时间，原值分别为20000, 20000, 12000
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control" /v WaitToKillServiceTimeout /t REG_SZ /d 1000 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v WaitToKillAppTimeout /t REG_SZ /d 1000 /f
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v HungAppTimeout /t REG_SZ /d 200 /f

:: 关闭计算机时自动结束不响应的任务（原值为0）
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v AutoEndTasks /t REG_SZ /d 1 /f

:: 备份并删除[HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}]
:: 用来加快Windows XP浏览网上邻居
if not exist %bak%\restoreshare.reg regedit /e %bak%\restoreshare.reg "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}"
reg delete "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\RemoteComputer\NameSpace\{D6277990-4C6A-11CF-8D87-00AA0060F5BF}" /f


:: 关掉调试器Dr. Watson
reg add "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows NT\CurrentVersion\AeDebug" /v Auto /t REG_SZ /d 0 /f


:: 减少开机磁盘扫描等待时间为0秒
chkntfs /T:0

:: 禁用一些没用的服务，请根据实际情况决定你不要去掉的服务，大部分情况下下列服务均不需要启动
:: Uninterruptible Power Supply
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\UPS" /v Start /t REG_DWORD /d 4 /f

:: Alerter：如果想接收局域网管理警报，请不要禁用，Internet上建议禁用
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Alerter" /v Start /t REG_DWORD /d 4 /f

:: Application Layer Gateway Service：如果你使用xp的防火墙，请不要禁用这个服务
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ALG" /v Start /t REG_DWORD /d 4 /f

:: Background Intelligent Transfer Service：Windows自动更新会用到这个服务，不能禁用。
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\BITS" /v Start /t REG_DWORD /d 4 /f

:: Indexing Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CiSvc" /v Start /t REG_DWORD /d 4 /f

:: Cryptographic Services：XP升级SP2时会用到这个服务，不能禁用。
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\CryptSvc" /v Start /t REG_DWORD /d 1 /f

:: Error Reporting Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ERSvc" /v Start /t REG_DWORD /d 4 /f

:: COM+ Event System：设为手工启动，不用禁用
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\EventSystem" /v Start /t REG_DWORD /d 3 /f

:: Fast User Switching Compatibility
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\FastUserSwitchingCompatibility" /v Start /t REG_DWORD /d 4 /f

:: Help and Support
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\helpsvc" /v Start /t REG_DWORD /d 4 /f

:: IMAPI CD-Burning COM Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ImapiService" /v Start /t REG_DWORD /d 4 /f

:: TCP/IP NetBIOS Helper
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\LmHosts" /v Start /t REG_DWORD /d 4 /f

:: Messenger
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Messenger" /v Start /t REG_DWORD /d 4 /f

:: Network Location Awareness(NLA)：如果你使用xp的防火墙，请不要禁用这个服务
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\Nla" /v Start /t REG_DWORD /d 4 /f

:: IPSEC Services
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\PolicyAgent" /v Start /t REG_DWORD /d 4 /f

:: Protected Storage 
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ProtectedStorage" /v Start /t REG_DWORD /d 4 /f

:: Remote Access Connection Manager：如果你使用xp的防火墙，请不要禁用这个服务
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RasMan" /v Start /t REG_DWORD /d 4 /f

:: Routing and Remote Access
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteAccess" /v Start /t REG_DWORD /d 4 /f

:: Remote Registry
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\RemoteRegistry" /v Start /t REG_DWORD /d 4 /f

:: Security Accounts Manager
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SamSs" /v Start /t REG_DWORD /d 4 /f

:: Smart Card
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SCardSvr" /v Start /t REG_DWORD /d 4 /f

:: Secondary Logon
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\seclogon" /v Start /t REG_DWORD /d 4 /f

:: Shell Hardware Detection
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\ShellHWDetection" /v Start /t REG_DWORD /d 4 /f

:: SSDP Disconvery Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\SSDPSRV" /v Start /t REG_DWORD /d 4 /f

:: Telephony：如果你使用xp的防火墙，请不要禁用这个服务
:: reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TapiSrv" /v Start /t REG_DWORD /d 4 /f

:: Distrubuted Link Tracking Client
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\TrkWks" /v Start /t REG_DWORD /d 4 /f

:: Upload Manager
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\uploadmgr" /v Start /t REG_DWORD /d 4 /f

:: Windows Time ：如果想让这台机器作时间服务器，请不要禁用
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\W32Time" /v Start /t REG_DWORD /d 4 /f

:: WebClient
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WebClient" /v Start /t REG_DWORD /d 4 /f

:: WMDM PMSP Service
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WMDM PMSP Service" /v Start /t REG_DWORD /d 4 /f

:: Portable Media Serial Number
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WmdmPmSp" /v Start /t REG_DWORD /d 4 /f

:: Wirless Zero Configuration
reg add "HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\WZCSVC" /v Start /t REG_DWORD /d 4 /f

:: 屏蔽3721及其它一些垃圾网站
find /i "www.3721.net" %windir%\system32\drivers\etc\hosts > nul
if errorlevel 1 goto _AddHosts
goto _SkipAddHosts

:_AddHosts
echo 127.0.0.1 http://www.3721.net/ >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 3721.com  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 3721.net  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 cnsmin.3721.com  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 cnsmin.3721.net  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 download.3721.com  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 download.3721.net  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.3721.com  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 www.3721.net  >> %windir%\system32\drivers\etc\hosts
echo 127.0.0.1 bar.baidu.com  >> %windir%\system32\drivers\etc\hosts

:_SkipAddHosts

:_quit
