@echo off
title 清除威金（logo_1,熊猫烧香）病毒最新变种工具
@echo 清除VIKING病毒最新变种工具
pause
if exist %windir%\rundl132.exe echo ---报告老大，发现有威金病毒埋伏! 让我来干掉它-----
if exist %windir%\logo_1.exe echo ---报告老大，发现有威金病毒埋伏!让我来干掉它 -----
//杀viking进程
tskill logo_1
tskill rundl132
tskill zt
tskill wow
tskill logo1_
tskill Ravmon
tskill Eghost
tskill Mailmon
tskill KAVPFW
tskill IPARMOR
tskill Ravmond
taskkill /f /im 0sy.exe
taskkill /f /im 1sy.exe
taskkill /f /im 2sy.exe
taskkill /f /im 3sy.exe
taskkill /f /im 4sy.exe
taskkill /f /im 5sy.exe
taskkill /f /im 6sy.exe
taskkill /f /im 7sy.exe
taskkill /f /im 8sy.exe
taskkill /f /im 9sy.exe

//删除木马
del d:\_desktop.ini /f/s/q/a
del c:\Program Files\_desktop.ini
del %Windir%\MickNew\MickNew.dll
del %Windir%\MH_FILE\MH_DLL.dll
del %Windir%\_desktop.ini
del %Windir%\TODAYZTKING\TODAYZTKING.DLL
attrib -h -r -s c:\go.exe
del c:\go.exe
del c:\setup.exe
attrib -h -s -r c:\autorun.inf
del c:\autorun.inf
attrib -h -r -s d:\go.exe
del d:\go.exe
del d:\setup.exe
attrib -h -s -r d:\autorun.inf
del d:\autorun.inf
del e:\setup.exe
attrib -h -r -s e:\go.exe
del e:\go.exe
attrib -h -s -r e:\autorun.inf
del e:\autorun.inf
attrib -h -r -s f:\go.exe
del f:\go.exe
del f:\setup.exe
attrib -h -s -r f:\autorun.inf
del f:\autorun.inf
attrib -h -r -s g:\go.exe
del g:\go.exe
del g:\setup.exe
attrib -h -s -r g:\autorun.inf
del g:\autorun.inf
del h:\go.exe
del h:\setup.exe
attrib -h -s -r g:\autorun.inf
del h:\autorun.inf
del i:\go.exe
attrib -h -s -r g:\autorun.inf
del i:\autorun.inf
del i:\setup.exe
del j:\go.exe
attrib -h -s -r g:\autorun.inf
del j:\autorun.inf
del j:\setup.exe
del %windir%\system\Logo1_.exedel %windir%\system\Logo_1.exe
del %windir%\rundl132.exe
del %windir%\vDll.dll
del %windir%\Dll.dll
del %windir%\0Sy.exe
del %windir%\1Sy.exe
del %windir%\2Sy.exe
del %windir%\3Sy.exe
del %windir%\5Sy.exe
del %windir%\1.com
@echo ^_^ 报告老大，VIKING已经全都被处死

@echo 真累哈,再给你的系统免疫下,不需要的话请直接退出
pause
//免疫系统
echo > %windir%\Logo1_.exe
echo > %windir%\rundl132.exe
echo > %windir%\0Sy.exe
echo > %windir%\vDll.dll
echo > %windir%\1Sy.exe
echo > %windir%\2Sy.exe
echo > %windir%\rundll32.exe
echo > %windir%\3Sy.exe
echo > %windir%\5Sy.exe
echo > %windir%\1.com
echo > %windir%\exerouter.exe
echo > %windir%\EXP10RER.com
echo > %windir%\finders.com
echo > %windir%\Shell.sys
echo > %windir%\kill.exe
echo > %windir%\sws.dll
echo > %windir%\sws32.dll
echo > %windir%\uninstall\rundl132.exe
echo > %windir%\SVCHOST.exe
echo > %windir%\WINLOGON.exe
echo > %windir%\RUNDLL32.EXE
echo > C:\"Program Files"\svchost.exe
echo > C:\"Program Files"\"Internet Explorer"\svchost.exe
echo > %windir%\Download\svchost.exe
echo > %windir%\system32\wldll.dll
attrib %windir%\Logo1_.exe +s +r +h
attrib %windir%\rundl132.exe +s +r +h
attrib %windir%\0Sy.exe +s +r +h
attrib %windir%\vDll.dll +s +r +h
attrib %windir%\1Sy.exe +s +r +h
attrib %windir%\2Sy.exe +s +r +h
attrib %windir%\rundll32.exe +s +r +h
attrib %windir%\3Sy.exe +s +r +h
attrib %windir%\5Sy.exe +s +r +h
attrib %windir%\1.com +s +r +h
attrib %windir%\exerouter.exe +s +r +h
attrib %windir%\EXP10RER.com +s +r +h
attrib %windir%\finders.com +s +r +h
attrib %windir%\Shell.sys +s +r +h
attrib %windir%\kill.exe +s +r +h
attrib %windir%\sws.dll +s +r +h
attrib %windir%\sws32.dll +s +r +h
attrib %windir%\uninstall\rundl132.exe +s +r +h
attrib %windir%\SVCHOST.exe +s +r +h
attrib %windir%\WINLOGON.exe +s +r +h
attrib %windir%\RUNDLL32.EXE +s +r +h
attrib C:\"Program Files"\svchost.exe +s +r +h
attrib C:\"Program Files"\"Internet Explorer"\svchost.exe +s +r +h
attrib %windir%\Download\svchost.exe +s +r +h
attrib %windir%\system32\wldll.dll +s +r +h
net share c$ /del
net share d$ /del
net share e$ /del
net share f$ /del
net share admin$ /del
net share ipc$ /del
cls
@echo -------------------------------------
@echo viking已经全部被我杀完拉,哈,厉害吧
@echo 系统已经成功免疫!
@echo 谢谢你的使用,请重启您的电脑!
@echo -------------------------------------
pause
