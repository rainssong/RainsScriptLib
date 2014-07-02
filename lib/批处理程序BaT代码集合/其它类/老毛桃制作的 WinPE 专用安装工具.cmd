@Echo Off
:: 来源于 无忧启动论坛(bbs.wuyou.com)
COLOR 2F
Set Prog=老毛桃制作的 WinPE 专用安装工具
Set L1=　　　　　　╭══════════════════╮
Set L2=　　　　　　║　　　　　　　　　　　　　　　　　　║
Set L3=　　　╭══┤　%Prog%　 ├══╮
Set L4=　　　║　　║　　　　　　　　　　　　　　　　　　║　　║
Set L5=　　　║　　╰══════════════════╯　　║
Set L6=　　　║　　　　　　　　　　　　　　　　　　　　　　　　║
Set L7=　　　╟════════════════════════╢
Set L8=　　　║　版权所有：老毛桃　　仅供网友们交流　翻版不究　║
Set L9=　　　╰────────────────────────╯
Title %Prog%
Set RP=RP
For %%I In (Z Y X W V U T S R Q P O N M L K J I H G F E D C) Do If Exist %%I:\BOOT.INI Set RP=%%I:
If %RP%==RP Goto NoSys
Set PEDIR=%RP%\MAOTAO
If Exist %PEDIR% Goto Err1
FIND /I "C:\MAOTAO" %RP%\BOOT.INI >NUL
If %Errorlevel%==0 Goto Err1
Goto Start

:Err1
CLS
Title %Prog%——卸载
Echo.
Echo %L1%
Echo %L2%
Echo %L3%
Echo %L4%
Echo %L5%
Echo %L6%
Echo 　　　║ 您的机器中好像已经安装了 WinPE 了，您想怎么办？║
Echo %L6%
Echo 　　　║　　[1] 卸载原有的 WinPE，并且重新安装。　　　　║
Echo 　　　║　　[2] 卸载原有的 WinPE，并且不再安装。　　　　║
Echo 　　　║　　[Q] 退出安装　　　　　　　　　　　　　　　　║
Echo %L6%
Echo %L7%
Echo %L8%
Echo %L9%
Echo.
Set Choice=
Set /P Choice=　　　请选择要进行的操作 (1/2/Q) ，然后按回车：
If %Choice%Choice==Choice Goto Err1
If Not '%Choice%'=='' SET Choice=%Choice:~0,1%
If /I '%Choice%'=='1' SET Choi=1&&GOTO UnInstall
If /I '%Choice%'=='2' GOTO UnInstall
If /I '%Choice%'=='Q' EXIT
Goto Err1
Exit

:UnInstall
If Exist %RP%\LDRXPE ATTRIB -S -H -R %RP%\LDRXPE&&Del %RP%\LDRXPE /Q>NUL
If Exist %RP%\WINNT.XPE ATTRIB -S -H -R %RP%\WINNT.XPE&&Del %RP%\WINNT.XPE /Q>NUL
If Exist %RP%\XPEMENU.INI ATTRIB -S -H -R %RP%\XPEMENU.INI&&Del %RP%\XPEMENU.INI /Q>NUL
If Exist %RP%\MTLDR.PE ATTRIB -S -H -R %RP%\MTLDR.PE&&Del %RP%\MTLDR.PE /Q>NUL
If Exist %RP%\MTLDR ATTRIB -S -H -R %RP%\MTLDR&&Del %RP%\MTLDR /Q>NUL
If Exist %RP%\外置程序 RD %RP%\外置程序 /S /Q>NUL
If Exist %RP%\MAOTAO RD %RP%\MAOTAO /S /Q>NUL
Attrib %RP%\BOOT.INI -S -H -R
If Exist %RP%\BOOT.BAK (
Attrib %RP%\BOOT.BAK -S -H -R
TYPE %RP%\BOOT.BAK|FIND /I /V "C:\MAOTAO">%RP%\BOOT.INI
) Else (
Copy %RP%\BOOT.INI %RP%\BOOT.BAK /Y>NUL
TYPE %RP%\BOOT.BAK|FIND /I /V "C:\MAOTAO">%RP%\BOOT.INI
)
Copy %RP%\BOOT.INI %RP%\BOOT.BAK /Y>NUL
If Exist %RP%\BOOT.BAK ATTRIB -S -H -R %RP%\BOOT.BAK&&Del %RP%\BOOT.BAK>NUL
Attrib %RP%\BOOT.INI +S +H +R
Title %Prog%——卸载完成
If %Choi%Choi==1Choi (Echo.&&Echo.&&Echo　　　　卸载完成，请按任意键准备安装 。。。&&PAUSE>NUL&&Goto Start)
Echo.&&Echo.&&Echo　　　　卸载完成，请按任意键退出 。。。
PAUSE>NUL
Exit

:Start
CLS
Title %Prog%——安装
Echo.
Echo %L1%
Echo %L2%
Echo %L3%
Echo %L4%
Echo %L5%
Echo %L6%
Echo 　　　║ 　　请选择安装方式：　　　　　　　　　　　　　 ║
Echo %L6%
Echo 　　　║　　　　[1] 普通安装/启动 　　　　　　　　　　　║
Echo 　　　║　　　　[2] Grub安装/启动 (支持 MD5 密码) 　　　║
Echo 　　　║　　　　[3] Aero安装/启动 (支持密码)　　　　　　║
Echo 　　　║　　　　[Q] 退出安装　　　　　　　　　　　　　　║
Echo %L6%
Echo %L7%
Echo 　　　║ 注意: Aero 安装项只适合系统分区在(HD0,0)分区 　║
Echo %L7%
Echo %L8%
Echo %L9%
Echo.
Set Choice=
Set /P Choice=　　　请选择要进行的操作 (1/2/3/Q) ，然后按回车：
If %Choice%Choice==Choice Goto Start
If Not '%Choice%'=='' SET Choice=%Choice:~0,1%
If /I '%Choice%'=='1' GOTO Install
If /I '%Choice%'=='2' GOTO GInstall
If /I '%Choice%'=='3' GOTO AInstall
If /I '%Choice%'=='q' EXIT
Goto Start

:Install
Title %Prog%——普通安装
If Not Exist %PEDIR% MD %PEDIR%>NUL
If Exist %RP%\LDRXPE ATTRIB -S -H -R %RP%\LDRXPE
If Exist %RP%\WINNT.XPE ATTRIB -S -H -R %RP%\WINNT.XPE
Echo.
Echo　　　　正在复制文件，请稍候 。。。
MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR% MAOTAO.BIN -r -y>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%RP%\ WINNT.XPE -r -y>NUL
Copy ..\WXPE\SETUPLDR.BIN %RP%\LDRXPE /Y>NUL
Copy ..\WINPE.IS_ %PEDIR% /Y>NUL
ATTRIB -S -H -R %RP%\BOOT.INI
If Exist %RP%\BOOT.BAK ATTRIB -S -H -R %RP%\BOOT.BAK
Copy %RP%\BOOT.INI %RP%\BOOT.BAK>NUL
TYPE %RP%\BOOT.BAK|FIND /I /V "C:\MAOTAO">%RP%\BOOT.INI
Echo C:\MAOTAO\MAOTAO.BIN="WinPE  By: 老毛桃">>%RP%\BOOT.INI
XCOPY ..\外置程序 /E %RP%\外置程序\ /Y /R>NUL
If Exist %RP%\XPEMENU.INI ATTRIB -S -H -R %RP%\XPEMENU.INI
TYPE ..\XPEMENU.INI|FIND /I /V "安装.EXE">%RP%\XPEMENU.INI
ATTRIB +S +H +R %RP%\LDRXPE
ATTRIB +S +H +R %RP%\WINNT.XPE
ATTRIB +S +H +R %RP%\BOOT.INI
ATTRIB +S +H +R %RP%\外置程序 /S /D
ATTRIB +S +H +R %RP%\MAOTAO /S /D
ATTRIB +S +H +R %RP%\MAOTAO\*.*
ATTRIB +S +H +R %RP%\XPEMENU.INI
Goto SUCCESS

:GInstall
Title %Prog%——高级安装
If Not Exist %PEDIR% MD %PEDIR%>NUL
CLS
Echo 请输入您要设定的密码
Echo 注意：密码必须超过 2 个字符，且不许有空格、"\"、引号等特殊字符
Echo.
Set /P Pass1=请输入：
If %Pass1%Pass1==Pass1 Goto GInstall
Echo.
Echo.
Echo 请再一次输入您的密码
Echo.
Set /P Pass2=请再次输入：
If %Pass2%Pass2==Pass2 Goto GInstall
If Not %Pass2%==%Pass1% Echo.&&Echo 您两次输入的密码不一致，请重新输入&&Echo 请按任意键重新开始设置密码&&PAUSE >NUL&&Goto GInstall
<nul Set/p=%Pass2%>%PEDIR%\MD5P.TMP
MD5.EXE %PEDIR%\MD5P.TMP %PEDIR%\MD5R.TXT>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%RP% MTLDR -r -y>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR% MTLDR.BIN -r -y>NUL
For /f %%i In ('type %PEDIR%\md5r.txt') do echo password --md5 %%i>>%RP%\MTLDR
Echo fontfile /maotao/muifont.gz>>%RP%\MTLDR
Echo splashimage /maotao/bj2008.xpm.gz>>%RP%\MTLDR
Echo title WinPE  By: Maotao>>%RP%\MTLDR
For /f %%i In ('type %PEDIR%\md5r.txt') do echo password --md5 %%i>>%RP%\MTLDR
Copy /b %RP%\MTLDR+%PEDIR%\MTLDR.bin %RP%\MTLDR>NUL
Del %PEDIR%\MD5?.* /Q>NUL
Del %PEDIR%\MTLDR.bin /Q>NUL
Echo.
Echo 密码设置完成，请牢记您的密码，并按任意键继续 。。。
PAUSE>NUL
If Exist %RP%\LDRXPE ATTRIB -S -H -R %RP%\LDRXPE
If Exist %RP%\WINNT.XPE ATTRIB -S -H -R %RP%\WINNT.XPE
If Exist %RP%\MTLDR ATTRIB -S -H -R %RP%\MTLDR
Echo.
Echo 正在复制文件，请稍候 。。。
MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR% BJ2008.XPM.GZ -r -y>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR% muifont.gz -r -y>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR%\ maotaog.bin -r -y>NUL
MyIns\MyIns.exe e MyIns\MyIns.dll -o%RP%\ WINNT.XPE -r -y>NUL
Ren %PEDIR%\maotaog.bin maotao.bin
Copy ..\WXPE\SETUPLDR.BIN %RP%\LDRXPE /Y>NUL
Copy ..\WINPE.IS_ %PEDIR% /Y>NUL
ATTRIB -S -H -R %RP%\BOOT.INI
If Exist %RP%\BOOT.BAK ATTRIB -S -H -R %RP%\BOOT.BAK
Copy %RP%\BOOT.INI %RP%\BOOT.BAK>NUL
TYPE %RP%\BOOT.BAK|FIND /I /V "老毛桃">%RP%\BOOT.INI
Echo C:\MAOTAO\MAOTAO.BIN="WinPE  By: 老毛桃">>%RP%\BOOT.INI
XCOPY ..\外置程序 /E %RP%\外置程序\ /Y /R>NUL
If Exist %RP%\XPEMENU.INI ATTRIB -S -H -R %RP%\XPEMENU.INI
TYPE ..\XPEMENU.INI|FIND /I /V "安装.EXE">%RP%\XPEMENU.INI
ATTRIB +S +H +R %RP%\LDRXPE
ATTRIB +S +H +R %RP%\WINNT.XPE
ATTRIB +S +H +R %RP%\BOOT.INI
ATTRIB +S +H +R %RP%\MTLDR
ATTRIB +S +H +R %RP%\MAOTAO /S /D
ATTRIB +S +H +R %RP%\MAOTAO\*.*
ATTRIB +S +H +R %RP%\外置程序 /S /D
ATTRIB +S +H +R %RP%\XPEMENU.INI
Goto SUCCESS

:AInstall
Title %Prog%——高级安装
If Not Exist %PEDIR% MD %PEDIR%>NUL
CLS
Echo 请输入您要设定的密码
Echo 注意：密码必须超过 2 个字符，且不许有空格、"\"、引号等特殊字符
Echo.
Set /P Pass1=请输入：
If %Pass1%Pass1==Pass1 Goto AInstall
Echo.
Echo.
Echo 请再一次输入您的密码
Echo.
Set /P Pass2=请再次输入：
If %Pass2%Pass2==Pass2 Goto AInstall
If Not %Pass2%==%Pass1% Echo.&&Echo 您两次输入的密码不一致，请重新输入&&Echo 请按任意键重新开始设置密码&&PAUSE >NUL&&Goto AInstall
For /f %%i In (MyIns\Aero.sys) Do MyIns\MyIns.exe e MyIns\MyIns.dll -o%PEDIR% %%i -r -y>NUL
Ren %PEDIR%\maotao.bin avldr.xpe
Ren %PEDIR%\maotaoa.bin maotao.bin
<nul Set/p=%Pass2%>%PEDIR%\airL.gz
Copy /B %PEDIR%\airT.gz+%PEDIR%\airL.gz+%PEDIR%\airW.gz %PEDIR%\airmenu.ini>NUL&&Del %PEDIR%\air?.gz /Q>NUL>NUL
MyIns\MyIns.exe a -tGZip %PEDIR%\airmenu.gz %PEDIR%\airmenu.ini -w%PEDIR%>NUL&&Del %PEDIR%\airmenu.ini /Q>NUL&&Ren %PEDIR%\airmenu.gz airmenu.ini>NUL
Echo.
Echo 密码设置完成，请牢记您的密码，并按任意键继续 。。。
PAUSE>NUL
If Exist %RP%\LDRXPE ATTRIB -S -H -R %RP%\LDRXPE
If Exist %RP%\WINNT.XPE ATTRIB -S -H -R %RP%\WINNT.XPE
Echo.
Echo 正在复制文件，请稍候 。。。
Copy ..\WXPE\SETUPLDR.BIN %RP%\LDRXPE /Y>NUL
Copy ..\WINPE.IS_ %PEDIR% /Y>NUL
MOVE %PEDIR%\MTLDR.PE %RP%\>NUL
MOVE %PEDIR%\WINNT.XPE %RP%\>NUL
ATTRIB -S -H -R %RP%\BOOT.INI
If Exist %RP%\BOOT.BAK ATTRIB -S -H -R %RP%\BOOT.BAK
Copy %RP%\BOOT.INI %RP%\BOOT.BAK>NUL
TYPE %RP%\BOOT.BAK|FIND /I /V "C:\MAOTAO">%RP%\BOOT.INI
Echo C:\MAOTAO\MAOTAO.BIN="WinPE  By: 老毛桃">>%RP%\BOOT.INI
XCOPY ..\外置程序 /E %RP%\外置程序\ /Y /R>NUL
If Exist %RP%\XPEMENU.INI ATTRIB -S -H -R %RP%\XPEMENU.INI
TYPE ..\XPEMENU.INI|FIND /I /V "安装.EXE">%RP%\XPEMENU.INI
ATTRIB +S +H +R %RP%\MTLDR.PE
ATTRIB +S +H +R %RP%\LDRXPE
ATTRIB +S +H +R %RP%\WINNT.XPE
ATTRIB +S +H +R %RP%\BOOT.INI
ATTRIB +S +H +R %RP%\MAOTAO /S /D
ATTRIB +S +H +R %RP%\MAOTAO\*.*
ATTRIB +S +H +R %RP%\外置程序 /S /D
ATTRIB +S +H +R %RP%\XPEMENU.INI
Goto SUCCESS

:NoSys
CLS
Echo 好像您的机器中没有安装操作系统哦，请确认后再执行本安装程序。
Echo.
Echo 请按任意键退出 。。。
PAUSE >NUL
Exit

:SUCCESS
Title %Prog%——安装完成
CLS
Echo 已经成功将镜像 WinPE.IS_ 安装到您的 %RP% 盘。
Echo.
Echo 系统分区中的 BOOT.INI 备份为 BOOT.BAK。
Echo.
Echo 如果您需要将外挂程序放置到非系统分区，
Echo 直接将 XPEMENU.INI 和 外置程序 文件夹剪切到目标分区根目录即可
Echo.
Echo 请按任意键退出 。。。
PAUSE >NUL
Exit