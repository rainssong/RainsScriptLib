@echo off
goto _run

XP下的控制面板扩展程序

access.cpl  辅助功能选项/键盘
appwiz.cpl  添加或删除程序
bthprops.cpl
desk.cpl 显示属性/主题
firewall.cpl Windows防火墙
hdwwiz.cpl 添加硬件向导
igfxcpl.cpl 显卡控制面板/设备
inetcpl.cpl Internet属性/常规
intl.cpl 区域和语言选项/区域选项
irprops.cpl
joy.cpl 游戏控制器
main.cpl 鼠标属性/按钮
mmsys.cpl 声音和音频设备属性/音量
ncpa.cpl 网络连接
netsetup.cpl 网络安装向导
nusrmgr.cpl 用户帐户
nwc.cpl
odbccp32.cpl ODBC数据源管理器/用户DSN
powercfg.cpl 电源选项属性/电源使用方案
QuickTime.cpl QuickTime设置/注册
sticpl.cpl 扫描仪和照相机
sysdm.cpl 系统属性/常规
telephon.cpl 信息位置
timedate.cpl 日期和时间属性/日期和时间
wscui.cpl Windows安全中心
wuaucpl.cpl 自动更新

可以用start control *.cpl的格式打开，例如：

:_run
start control sysdm.cpl



                 Rundll.exe高级应用

首先，请你做个小实验（请事先保存好你正在执行的程式的结果）∶ 

点击“开始－程式－Ms－Dos方式”，进入Dos视窗，然後键入“rundll32.exe user.exe,restartwindows”，再按下回车键，这时你将看到，机器被重启了！

当然，Rundll的功能绝不仅仅是重启你的机器。其实，Rundll者，顾名思义，执行Dll也，它的功能就是以命令列的方式呼叫Windows的动态链结库，Rundll32.exe与Rundll.exe的区别就在於前者是呼叫32位的链结库，而後者是运用於16位的链结库，它们的命令格式是∶ 

RUNDLL.EXE ，， 

这里要注意三点∶

1.Dll档案名中不能含有空格，比如该档案位於c:\Program Files目录，你要把这个路径改成c:\Progra～1；

2.Dll档案名与Dll入口点间的逗号不能少，否则程式将出错并且不会给出任何资讯！

3.这是最重要的一点∶Rundll不能用来呼叫含返回值参数的Dll，例如Win32API中的GetUserName(), GetTextFace()等。

在Visual Basic中，提供了一条执行外部程式的指令Shell,格式为∶ 

Shell “命令列” 

如果能配合Rundll32.exe用好Shell指令，会使您的VB程式拥有用其他方法难以甚至无法实现的效果∶仍以重启为例，传统的方法需要你在VB工程中先建立一个模组，然後写入WinAPI的声明，最後才能在程式中呼叫。而现在只需一句: 

Shell “rundll32.exe user.exe,restartwindows”就搞定了！

实际上，Rundll32.exe在呼叫各种Windows控制面板和系统选项方面有著独特的优势。

命令列: rundll32.exe shell32.dll,Control_RunDLL 

功能: 显示控制面板 

命令列: rundll32.exe shell32.dll,Control_RunDLL access.cpl,,1 

功能: 显示“控制面板－辅助选项－键盘”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL access.cpl,,2 

功能: 显示“控制面板－辅助选项－声音”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL access.cpl,,3 

功能: 显示“控制面板－辅助选项－显示”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL access.cpl,,4 

功能: 显示“控制面板－辅助选项－滑鼠”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL access.cpl,,5 

功能: 显示“控制面板－辅助选项－传统”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl @1 

功能: 执行“控制面板－添加新硬体”向导。 

命令列: rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL AddPrinter 

功能: 执行“控制面板－添加新印表机”向导。 

命令列: rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,1 

功能: 显示 “控制面板－添加/删除程式－安装/卸载” 面板。 

命令列: rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,2 

功能: 显示 “控制面板－添加/删除程式－安装Windows” 面板。 

命令列: rundll32.exe shell32.dll,Control_RunDLL appwiz.cpl,,3 

功能: 显示 “控制面板－添加/删除程式－启动盘” 面板。 

命令列: rundll32.exe syncui.dll,Briefcase_Create 

功能: 在桌面上建立一个新的“我的公文包”。 

命令列: rundll32.exe diskcopy.dll,DiskCopyRunDll 

功能: 显示复制软碟视窗 

命令列: rundll32.exe apwiz.cpl,NewLinkHere %1 

功能: 显示“建立快捷方式”的对话框，所建立的快捷方式的位置由%1参数决定。 

命令列: rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,0 

功能: 显示“日期与时间”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL timedate.cpl,,1 

功能: 显示“时区”选项视窗。 

命令列: rundll32.exe rnaui.dll,RnaDial [某个拨号连接的名称] 

功能: 显示某个拨号连接的拨号视窗。如果已经拨号连接，则显示目前的连接状态的视窗。 

命令列: rundll32.exe rnaui.dll,RnaWizard 

功能: 显示“新建拨号连接”向导的视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,0 

功能: 显示“显示属性－背景”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,1 

功能: 显示“显示属性－萤屏保护”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,2 

功能: 显示“显示属性－外观”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL desk.cpl,,3 

功能: 显示显示“显示属性－属性”选项视窗。 

命令列: rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL FontsFolder 

功能: 显示Windows的“字体”档案夹。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @3 

功能: 同样是显示Windows的“字体”档案夹。 

命令列: rundll32.exe shell32.dll,SHformatDrive 

功能: 显示格式化软碟对话框。 

命令列: rundll32.exe shell32.dll,Control_RunDLL joy.cpl,,0 

功能: 显示“控制面板－游戏控制器－一般”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL joy.cpl,,1 

功能: 显示“控制面板－游戏控制器－进阶”选项视窗。 

命令列: rundll32.exe mshtml.dll,PrintHTML (HTML文档) 

功能: 列印HTML文档。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mlcfg32.cpl 

功能: 显示Microsoft Exchange一般选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @0 

功能: 显示“控制面板－滑鼠” 选项 。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @1 

功能: 显示 “控制面板－键盘属性－速度”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @1,,1 

功能: 显示 “控制面板－键盘属性－语言”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @2 

功能: 显示Windows“印表机”档案夹。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @3 

功能: 显示Windows“字体”档案夹。 

命令列: rundll32.exe shell32.dll,Control_RunDLL main.cpl @4 

功能: 显示“控制面板－输入法属性－输入法”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL modem.cpl,,add 

功能: 执行“添加新调制解调器”向导。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,0 

功能: 显示“控制面板－多媒体属性－音频”属性页。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,1 

功能: 显示“控制面板－多媒体属性－视频”属性页。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,2 

功能: 显示“控制面板－多媒体属性－MIDI”属性页。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,3 

功能: 显示“控制面板－多媒体属性－CD音乐”属性页。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl,,4 

功能: 显示“控制面板－多媒体属性－设备”属性页。 

命令列: rundll32.exe shell32.dll,Control_RunDLL mmsys.cpl @1 

功能: 显示“控制面板－声音”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL netcpl.cpl 

功能: 显示“控制面板－网路”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL odbccp32.cpl 

功能: 显示ODBC32资料管理选项视窗。 

命令列: rundll32.exe shell32.dll,OpenAs_RunDLL 

功能: 显示指定档案(driveath ilename)的“打开方式”对话框。 

命令列: rundll32.exe shell32.dll,Control_RunDLL password.cpl 

功能: 显示“控制面板－密码”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL powercfg.cpl 

功能: 显示“控制面板－电源管理属性”选项视窗。 

命令列: rundll32.exe shell32.dll,SHHelpShortcuts_RunDLL 

PrintersFolder 

功能: 显示Windows“印表机”档案夹。(同rundll32.exe shell32.dll,Control_RunDLLmain.cpl @2) 

命令列: rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,0 

功能: 显示“控制面板－区域设置属性－区域设置”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,1 

功能: 显示“控制面板－区域设置属性－数字”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,2 

功能: 显示“控制面板－区域设置属性－货币”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,3 

功能: 显示“控制面板－区域设置属性－时间”选项视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL intl.cpl,,4 

功能: 显示“控制面板－区域设置属性－日期”选项视窗。 

命令列: rundll32.exe desk.cpl,InstallScreenSaver [萤屏保护档案名] 

功能: 将指定的萤屏保护档案设置为Windows的屏保，并显示萤屏保护属性视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,0 

功能: 显示“控制面板－系统属性－传统”属性视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,1 

功能: 显示“控制面板－系统属性－设备管理器”属性视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,2 

功能: 显示“控制面板－系统属性－硬体配置档案”属性视窗。 

命令列: rundll32.exe shell32.dll,Control_RunDLL sysdm.cpl,,3 

功能: 显示“控制面板－系统属性－性能”属性视窗。 

命令列: rundll32.exe user.exe,restartwindows 

功能: 强行关闭所有程式并重启机器。 

命令列: rundll32.exe user.exe,exitwindows 

功能: 强行关闭所有程式并关机。 

命令列: rundll32.exe shell32.dll,Control_RunDLL telephon.cpl 

功能: 显示“拨号属性”选项视窗 

命令列: rundll32.exe shell32.dll,Control_RunDLL themes.cpl 

功能: 显示“桌面主旨”选项面板 

当然，不止是VisualBasic，象Delphi.VisualC++等其他程式设计语言也可以通过呼叫外部命令的方法来使用Rundll的这些功能，具体方法这里就不再详细叙述了。灵活的使用Rundll,一定会使你的程式设计轻轻松松，达到事半功倍的效果！ 

<关机快捷方式>

(1). 在桌面空白位置按鼠标右键 -> <新建> -> 选<快捷方式>

(2). 在<指令行>键入 rundll.exe user.exe,exitwindows

(3). 在<选择快捷方式 的名称>键入<关闭Window>或你想要的名称 -> 按<完成> 

<重新启动快捷方式>

(1). 重复以上 (1)

(2). 在<指令行>键入 rundll.exe user.exe,restartwindowsexec

(3). 在<选择快捷方式的名称>键入<重新启动Restart>或你想要的名称 -> 按<完成> RUN - > cmd 或者command 

