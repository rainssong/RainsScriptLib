@echo off
:: Code by zh159 2006-12-16 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=25112 47楼
title IE 通讯录
mode con cols=15 lines=1

::建立数据库及生成背景图片
if not exist Tel\ md Tel>nul
if not exist Tel\Tel.db call :Tel.db
if exist Tel\bg.gif goto MinRun
mode con cols=50 lines=5
echo.
echo.  初次使用 IE 通讯录，建立数据库及生成背景图片。
echo.
echo.  请稍等. . .&ping -n 1 127.1>nul
echo str="47494638396101000400800000F0F0F0ECECEC2C0000000001000400000203041205003B">>debug.vbs
echo with wscript.stdout:r=vbcrlf:for i=1 to len(str) step 48:.write "e"+hex(256+(i-1)/2):for j=i to i+46 step 2:.write " "+mid(str,j,2):next:.write r:next>>debug.vbs
echo .write "rbx"+r+"0"+r+"rcx"+r+"24"+r+"n debug.tmp"+r+"w"+r+"q"+r:end with>>debug.vbs&&cscript //nologo debug.vbs|debug.exe>nul&&move/y debug.tmp "Tel\bg.gif"&del debug.vbs
start "" "%~nx0"&exit

:MinRun
::最小化命令提示符窗口
if exist "Temp.bat" goto Start
>Temp.bat echo start/min "" "%~nx0"^&exit
start/min Temp.bat&exit

:Start
del "Temp.bat">nul
mode con cols=15 lines=1
setlocal EnableDelayedExpansion

:Main
::配置按键颜色
set "button=border: 1 solid #9ab8f6;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#10bfff,endColorStr=#007db2);cursor:hand;color:#ffffff;"
set "Pagebutton=border: 1 solid #9ab8f6;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#10bfff,endColorStr=#007db2)"
set "Pagedisabled=border: 1 solid #b1b1b1;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f5f5f5,endColorStr=#b1b1b1)"

set "title=IE 界面批处理通讯录 - zh159 制作"
set ieheight=360
set Amount=0
for /f "skip=3 delims=" %%i in (Tel\Tel.db) do (
  if "%%i" == "-End-" set /a Amount+=1)

call :Event

>>%Temp%\Temp.vbs echo with ie.document
>>%Temp%\Temp.vbs echo .write "<html><title>IE 界面批处理通讯录 - zh159 制作</title><meta http-equiv='Content-Type' content='text/html; charset=gbk'>"
>>%Temp%\Temp.vbs echo .write "<style type='text/css' id='css'>.button {font: 15px 宋体, Verdana;height:32px;width:100px;}</style>"
>>%Temp%\Temp.vbs echo .write "<body onload=sf() background='%cd:\=/%/Tel/bg.gif' bgcolor=#e3e5da scroll=no style='font-family:宋体;font-size:15px;'>"
>>%Temp%\Temp.vbs echo .write "<table align=center style='font-family:楷体_gb2312;font-size:24px;'><td><b>IE 界面批处理通讯录</b></td></table>"
>>%Temp%\Temp.vbs echo .write "<table width=550 align=center style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#9ab8f6,endColorStr=#5a7dde)'><td align=left style='font-size:1px;'> </td></table>"
>>%Temp%\Temp.vbs echo .write "<table width=550 align=center borderColor=#698cc2 border=0 cellSpacing=1 cellpadding=8 style='font-size:15px;border:#5a7dde 2px solid;'>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#698cc2 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#9ab8f6,endColorStr=#5a7dde)' colspan=4><b><font style=font-size:18px;color:#ffffff;>= 欢迎使用 IE 界面批处理通讯录 =</font><br><font style=color:#d0d0d0;><a title='中国DOS联盟论坛'>zh159@bbs.cn-dos.net</a>　　<a title='忧郁的蓝色-手机专业论坛'>zh159@bbs.blueshow.net</a></font></b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr align=left><td colspan=4> <b>输入后直接回车[查询/新增]联系人(优先)，也可以从列表选取联系人！</b><br>输入: <input id=input value='点击这里输入联系人姓名或电话' onclick=this.value='' name='messageField' type=text title='输入联系人或电话[优先于]列表查询！' style='font-family:Tahoma,宋体;font-size:15px;border: 1px solid #698cc2;width:300;height:23;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#dee8f4);color:#5a7dde'>　<select id=list name='messagePick' OnChange='messageReveal()' style='font-size:15px;border: 1px solid #698cc2;'>"
>>%Temp%\Temp.vbs echo .write "<option value=''>%Amount% 位联系人"
call :List
>>%Temp%\Temp.vbs echo .write "</select> 列表</td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr align=center><td align=center width=25%%><input id=find type=submit class=button value='查询/新增' title='输入联系人或电话后再[查询人/新增]联系人' style='font-family:楷体_gb2312;font-size:21px;width=110;%button%'></td><td align=center width=25%%><input id=All type=button class=button value='查看全部' title='查看通讯录内所有联系人资料' style='font-family:楷体_gb2312;font-size:21px;width=110;%button%'></td>"
>>%Temp%\Temp.vbs echo .write "<td align=center width=25%%><input id=SortTel type=button class=button value='排序' title='对通讯录数据库按字母顺序进行排序' style='font-family:楷体_gb2312;font-size:21px;width=110;%button%'></td><td align=center width=25%%><input type=button class=button onClick='opener=null;window.close()' value='退出' title='退出程序' style='font-family:楷体_gb2312;font-size:21px;width=110;%button%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#698cc2 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#d2def2,endColorStr=#9ab8f6);' colspan=4>今天日期: %Date:~0,10%</td></tr></table>"
>>%Temp%\Temp.vbs echo .write "<table width=550 align=center style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#5a7dde,endColorStr=#9ab8f6)'><td align=left style='font-size:1px;'> </td></table>"
>>%Temp%\Temp.vbs echo .write "<table width=560><td align=left style='font-family:宋体;font-size:15px;color=f00'><b>&nbsp;注意：不要使用“^! ^& * < > \”等单字节字符；<br>&nbsp;　　　不能按【F5】键刷新界面，否则界面内所有按键将会失效！</b></td><td align=right><input id=help type=button value='使用帮助' title='查看帮助信息' style='font-size:11px;width:60;height:18;%button%'></td></table>"
>>%Temp%\Temp.vbs echo .write "</body></html>"
>>%Temp%\Temp.vbs echo end with

>>%Temp%\Temp.vbs echo dim wmi
>>%Temp%\Temp.vbs echo set wnd=ie.document.parentwindow
>>%Temp%\Temp.vbs echo set id=ie.document.all
>>%Temp%\Temp.vbs echo id.find.onclick=getref("find")
>>%Temp%\Temp.vbs echo id.All.onclick=getref("All")
>>%Temp%\Temp.vbs echo id.SortTel.onclick=getref("SortTel")
>>%Temp%\Temp.vbs echo id.help.onclick=getref("help")

call :SleepCancel

>>%Temp%\Temp.vbs echo sub All
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "All"
>>%Temp%\Temp.vbs echo end sub

>>%Temp%\Temp.vbs echo sub SortTel
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "SortTel"
>>%Temp%\Temp.vbs echo end sub

>>%Temp%\Temp.vbs echo sub help
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "help"
>>%Temp%\Temp.vbs echo end sub

>>%Temp%\Temp.vbs echo sub find
>>%Temp%\Temp.vbs echo ie.visible=0
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo with id
>>%Temp%\Temp.vbs echo if .input.value="点击这里输入联系人姓名或电话" then if not .list.value="" then Wscript.Echo .list.value
>>%Temp%\Temp.vbs echo if .input.value="" then if not .list.value="" then Wscript.Echo .list.value
>>%Temp%\Temp.vbs echo if .input.value="" then Wscript.Echo " "
>>%Temp%\Temp.vbs echo if not .input.value="" then if not .input.value="击这里输入联系人姓名或电话" then Wscript.Echo .input.value
>>%Temp%\Temp.vbs echo    exit sub
>>%Temp%\Temp.vbs echo end with
>>%Temp%\Temp.vbs echo end sub

set input=
for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do (
  if "%%i" == "exit" del "%Temp%\Temp*.*"&exit
    set input=%%i
  if "!input!" == "All" goto All
  if "!input!" == "SortTel" goto SortTel
  if "!input!" == "help" goto help
  if "!input!" == "点击这里输入联系人姓名或电话" goto Remind
  if "!input!" == " " (goto Remind) else goto Info)

:Remind
>%Temp%\Temp.vbs echo intAnswer = Msgbox("请输入联系人姓名或电话！ ", vbExclamation , "提醒！")
%Temp%\Temp.vbs
goto Main

:Add
set "title=新增联系人"
set 录入取消=取消新增联系人
set 录入确定=确定新增联系人
set 记录日期=录入日期
set ieheight=550
set "姓名=%input%"
set "照片="
set "手机号码 1="
set "手机号码 2="
set "住宅电话="
set "办公室电话="
set "传真="
set "电子邮件="
set "家庭地址="
set "修改照片=联系人照片，建议大小: <b>170*200(px)</b><br><br>"
call :Event
call :Input
if "%input%" == "exit" goto Main
call :Newdb
if not "%Source%" == "" copy/y "%Source%" "%Photo%">nul
set input=%Name%

:Info
set "title=联系人资料"
set line=
for /f "tokens=1,2,3* delims=:" %%i in ('findstr /nirc:"%input%" Tel\Tel.db') do (
  if "%%j" == "%input%" set line=%%i
  if "%%k" == "%input%" set line=%%i)
if not "%line%" == "" goto Extract

echo %input%|findstr "^[0-9]*$">nul &&goto NoRecord
>%Temp%\Temp.vbs echo set WshShell = WScript.CreateObject("WScript.Shell")
>>%Temp%\Temp.vbs echo intAnswer = MsgBox("没有找到联系人“%input%”的记录！你是否要新增联系人“%input%”？ ", vbExclamation + vbYesNo, "查询结果！")
>>%Temp%\Temp.vbs echo     If intAnswer = vbYes Then
>>%Temp%\Temp.vbs echo Wscript.Echo "Add"
>>%Temp%\Temp.vbs echo end if
>>%Temp%\Temp.vbs echo     If intAnswer = vbNo Then
>>%Temp%\Temp.vbs echo Wscript.Echo "Main"
>>%Temp%\Temp.vbs echo end if
for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do goto %%i
goto Main

:NoRecord
>%Temp%\Temp.vbs echo intAnswer = Msgbox("没有找到 %input% 电话的记录！ ", vbExclamation , "查询结果！")
%Temp%\Temp.vbs
goto Main

:Extract
call :Sweep
for /f "skip=%line% tokens=1,2* delims=：　[]" %%i in (Tel\Tel.db) do (
    if "%%i" == "-End-" goto Display
    set "%%i=%%j")

:Display
set ieheight=520
if not "%照片%" == "" (set "照片路径=<img src='%cd:\=/%/%照片:\=/%' height=220 border=1>") else set "照片路径=无照片"
call :Event

>>%Temp%\Temp.vbs echo with ie.document
>>%Temp%\Temp.vbs echo .write "<html><title>联系人资料</title>"
>>%Temp%\Temp.vbs echo .write "<body background='%cd:\=/%/Tel/bg.gif' bgcolor=#e3e5da scroll=no style='font-family:宋体;font-size:15px;'>"
>>%Temp%\Temp.vbs echo .write "<style type='text/css' id='css'>.index a:hover{color:#FFDD64;text-decoration: none;}"
>>%Temp%\Temp.vbs echo .write ".button {font: 15px 宋体, Verdana;border: 1px solid #698cc2;height: 24px;width:60%%;}</style>"
>>%Temp%\Temp.vbs echo .write "<table align=center style='font-family:楷体_gb2312;font-size:24px;'><td>联系人 %姓名% 资料</td></table>"
>>%Temp%\Temp.vbs echo .write "<table width=550 align=center border=1 cellSpacing=2 cellpadding=5 borderColor=#698cc2 style='font-size:15px;border:#698cc2 2px solid;'>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#9fbfe3 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3><b>联系人资料</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td width=370 colspan=2>姓名: 　　　<b>%姓名%</b><br>录入日期: 　<b>%录入日期%</b></td><td align=center width=180 rowspan=7>%照片路径%</td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 1: <b>%手机号码 1%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 2: <b>%手机号码 2%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>住宅电话: 　<b>%住宅电话%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>办公室电话: <b>%办公室电话%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>传真: 　　　<b>%传真%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>电子邮件: 　<b>%电子邮件%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3>家庭地址: 　<b>%家庭地址%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "</table>"
>>%Temp%\Temp.vbs echo .write "<table width=550><td align=right><input id=Del type=button value='删除' title='删除本联系人' style='font-size:13px;width:42;height:18;%button%'></td></table>"
>>%Temp%\Temp.vbs echo .write "<p align=center>"
>>%Temp%\Temp.vbs echo .write "<input id=Modify type=button value='修 改' title='修改本联系人的资料' style='font-size:18px;%button%'>　　<input type=submit onClick='opener=null;window.close()' value='返 回' title='返回主界面（默认回车）' style='font-size:18px;%button%'>"
>>%Temp%\Temp.vbs echo .write "</body></html>"
>>%Temp%\Temp.vbs echo end with

>>%Temp%\Temp.vbs echo dim wmi
>>%Temp%\Temp.vbs echo set wnd=ie.document.parentwindow
>>%Temp%\Temp.vbs echo set id=ie.document.all
>>%Temp%\Temp.vbs echo id.Modify.onclick=getref("Modify")
>>%Temp%\Temp.vbs echo id.Del.onclick=getref("Del")

call :SleepCancel

>>%Temp%\Temp.vbs echo sub Modify
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "Modify"
>>%Temp%\Temp.vbs echo end sub

>>%Temp%\Temp.vbs echo sub Del
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "Del"
>>%Temp%\Temp.vbs echo end sub

for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do (
  if "%%i" == "exit" goto Main
  goto %%i)
goto Main

:Del
>%Temp%\Temp.vbs echo set WshShell = WScript.CreateObject("WScript.Shell")
>>%Temp%\Temp.vbs echo intAnswer = MsgBox("您确定删除联系人: %姓名% ？ ", vbExclamation + vbYesNo, "警告！")
>>%Temp%\Temp.vbs echo     If intAnswer = vbYes Then
>>%Temp%\Temp.vbs echo end if
>>%Temp%\Temp.vbs echo     If intAnswer = vbNo Then
>>%Temp%\Temp.vbs echo Wscript.Echo "Info"
>>%Temp%\Temp.vbs echo end if
for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do if not "%%i" == "" goto %%i
call :Deldb
if exist "%照片%" del/q "%照片%"
>%Temp%\Temp.vbs echo intAnswer = Msgbox("联系人 %姓名% 已删除！ ", vbExclamation , "删除！")
%Temp%\Temp.vbs
goto Main

:Modify
set "title=修改联系人 %姓名% 资料"
set 录入取消=取消对本联系人资料的修改
set 录入确定=确定对本联系人资料的修改
set 记录日期=修改日期
set ieheight=550
set "手机号码 1=%手机号码 1:无=%"
set "手机号码 2=%手机号码 2:无=%"
set "住宅电话=%住宅电话:无=%"
set "办公室电话=%办公室电话:无=%"
set "传真=%传真:无=%"
set "电子邮件=%电子邮件:无=%"
set "家庭地址=%家庭地址:无=%"
if not "%照片%" == "" (set "修改照片=&nbsp;<img src='%cd:\=/%/%照片:\=/%' height=220 border=1><br>如需修改则浏览选取照片<br>") else set "修改照片=无照片<br><br>"
set AddN=No
set ModifyN=1
call :Event
call :Input
if "%input%" == "exit" set "input=%姓名%"&goto Info
if "%Source%" == "" (set "Photo=%照片%") else copy/y "%Source%" "%Photo%">nul
call :Deldb
call :Newdb
set "input=%Name%"
goto Info

:All
set "title=所有联系人资料"
set ieheight=720
set start=1
set cease=20
set Page=0

:AllPage
set Count=1
set /a start=%start%+(%Page%)
set /a cease=%cease%+(%Page%)
call :Event
if %cease% LEQ 20 (set Updisabled=disabled&set "Upbutton=%Pagedisabled%") else set Updisabled=&set "Upbutton=%Pagebutton%"
if %cease% GTR %Amount% (set cease$=%Amount%) else set cease$=%cease%

>>%Temp%\Temp.vbs echo with ie.document
>>%Temp%\Temp.vbs echo .write "<html><title>所有联系人资料</title>"
>>%Temp%\Temp.vbs echo .write "<body background='%cd:\=/%/Tel/bg.gif' bgcolor=#e3e5da style='font-family:宋体;font-size:15px;'>"
>>%Temp%\Temp.vbs echo .write "<style type='text/css' id='css'>.index a:hover{color:#FFDD64;text-decoration: none;}"
>>%Temp%\Temp.vbs echo .write ".button {font: 15px 宋体, Verdana;border: 1px solid #698cc2;height: 24px;width:60%%;}</style>"
>>%Temp%\Temp.vbs echo .write "<table align=center style='font-family:楷体_gb2312;font-size:24px;'><td>所有联系人资料(%start%-%cease$%/%Amount%)</td></table>"

for /f "skip=3 tokens=1,2* delims=：　[]" %%i in (Tel\Tel.db) do (
    set List=%%i
  if !Count! GEQ %start% if !Count! LEQ %cease% if "!List:~-2!" == "::" call :Sweep
    set "%%i=%%j"
  if !Count! GEQ %start% if !Count! LEQ %cease% if "%%i" == "-End-" call :Indi
  if "%%i" == "-End-" set /a Count+=1
  if %Amount% GEQ !Count! (set Dodisabled=&set "Dobutton=%Pagebutton%") else set Dodisabled=disabled&set "Dobutton=%Pagedisabled%"
  if !Count! GTR %cease% goto AllAfter)

:AllAfter
>>%Temp%\Temp.vbs echo .write "<table align=center><td><input id=Up type=button value='上一页' title='查看上一页内容' style='font-size:18px;color:#ffffff;%Upbutton%' %Updisabled%>　　<input type=button onClick='opener=null;window.close()' value='返 回' title='返回主界面（默认回车）' style='font-size:18px;%button%'>　　<input id=Down type=submit value='下一页' title='查看下一页内容' style='font-size:18px;color:#ffffff;%Dobutton%' %Dodisabled%></td></table>"
>>%Temp%\Temp.vbs echo .write "</body></html>"
>>%Temp%\Temp.vbs echo end with

>>%Temp%\Temp.vbs echo dim wmi
>>%Temp%\Temp.vbs echo set wnd=ie.document.parentwindow
>>%Temp%\Temp.vbs echo set id=ie.document.all
>>%Temp%\Temp.vbs echo id.Up.onclick=getref("Up")
>>%Temp%\Temp.vbs echo id.Down.onclick=getref("Down")

>>%Temp%\Temp.vbs echo sub Up
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "-20"
>>%Temp%\Temp.vbs echo end sub

>>%Temp%\Temp.vbs echo sub Down
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo Wscript.Echo "20"
>>%Temp%\Temp.vbs echo end sub
call :SleepCancel

for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do (
  if "%%i" == "exit" goto Main
  set Page=%%i&goto AllPage)

:List
set NumN=
for /f "skip=3 delims=" %%i in (Tel\Tel.db) do (
    set NameEnd=%%i
  for /f "tokens=1,2* delims=:" %%n in ("%%i") do (
  if "!NameEnd:~-2!" == "::" set /a NumN+=1&&>>%Temp%\Temp.VBS echo .write "<option value='%%n'>!NumN! - %%n"))
goto :eof

:Tel.db
>Tel\Tel.db echo ::电话本数据库
>>Tel\Tel.db echo --------------------------------------------------
>>Tel\Tel.db echo.
goto :eof

:Event
>%Temp%\Temp.vbs echo set WshShell = Wscript.CreateObject("Wscript.Shell")
>>%Temp%\Temp.vbs echo set ie=wscript.createobject("internetexplorer.application","event_") 
>>%Temp%\Temp.vbs echo ie.menubar=0
>>%Temp%\Temp.vbs echo ie.addressbar=0
>>%Temp%\Temp.vbs echo ie.toolbar=0
>>%Temp%\Temp.vbs echo ie.statusbar=0
>>%Temp%\Temp.vbs echo ie.resizable=0
>>%Temp%\Temp.vbs echo ie.width=600
>>%Temp%\Temp.vbs echo ie.height=%ieheight%
>>%Temp%\Temp.vbs echo ie.navigate "about:blank"
>>%Temp%\Temp.vbs echo ie.left=fix((ie.document.parentwindow.screen.availwidth-ie.width)/2)
>>%Temp%\Temp.vbs echo ie.top=fix((ie.document.parentwindow.screen.availheight-ie.height)/2)
>>%Temp%\Temp.vbs echo ie.visible=1
goto :eof

:Input
>>%Temp%\Temp.vbs echo with ie.document
>>%Temp%\Temp.vbs echo .write "<html><title>%title%</title><body background='%cd:\=/%/Tel/bg.gif' bgcolor=#e3e5da scroll=no style='font-family:宋体;font-size:15px;'>"
>>%Temp%\Temp.vbs echo .write "<style type='text/css' id='css'>"
>>%Temp%\Temp.vbs echo .write ".button {font: 15px 宋体, Verdana;border: 1px solid #698cc2;height: 24px;width:65%%;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#dee8f4)}</style>"
>>%Temp%\Temp.vbs echo .write "<table align=center style='font-family:楷体_gb2312;font-size:24px;'><td>%title%</td></table>"
>>%Temp%\Temp.vbs echo .write "<table width=550 align=center border=1 cellSpacing=2 cellpadding=4 borderColor=#698cc2 style='font-size:15px;border:#698cc2 2px solid;'>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#9fbfe3 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3><b>联系人资料</b></b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td width=370 colspan=2>姓名: 　　　<input class=button id=Name type=test value='%姓名%'><br>%记录日期%: 　<b><u>%Date:~0,10%</u></b></td><td align=center width=180 rowspan=7>%修改照片%<input id=Photo type=file name='attach[]' title='浏览输入联系人的照片' style='font-size:15px;width:200px;height:24px;'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 1: <input class=button id=Mobile1 type=test value='%手机号码 1%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 2: <input class=button id=Mobile2 type=test value='%手机号码 2%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>住宅电话: 　<input class=button id=Phone type=test value='%住宅电话%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>办公室电话: <input class=button id=Office type=test value='%办公室电话%'</td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>传真: 　　　<input class=button id=Fax type=test value='%传真%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>电子邮件: 　<input class=button id=Email  type=test value='%电子邮件%'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=3>家庭地址: 　<input class=button id=Home type=test value='%家庭地址%' style='width:80%%;'></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#9fbfe3 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3>今天日期: %Date:~0,10%</td></tr></table>"
>>%Temp%\Temp.vbs echo .write "<p align=center>"
>>%Temp%\Temp.vbs echo .write "<input id=confirm type=button value='确 定' title='%录入确定%' style='font-size:18px;%button%'>　　<input type=button onClick='opener=null;window.close()' value='取 消' title='%录入取消%' style='font-size:18px;%button%'>"
>>%Temp%\Temp.vbs echo .write "</body></html>"
>>%Temp%\Temp.vbs echo end with

>>%Temp%\Temp.vbs echo dim wmi
>>%Temp%\Temp.vbs echo set wnd=ie.document.parentwindow
>>%Temp%\Temp.vbs echo set id=ie.document.all
>>%Temp%\Temp.vbs echo id.confirm.onclick=getref("confirm")
call :SleepCancel
>>%Temp%\Temp.vbs echo sub confirm
>>%Temp%\Temp.vbs echo ie.visible=0
>>%Temp%\Temp.vbs echo ie.quit
>>%Temp%\Temp.vbs echo with id
>>%Temp%\Temp.vbs echo if not .Name.value="" then Wscript.Echo "Name&",.Name.value
>>%Temp%\Temp.vbs echo if not .Photo.value="" then Wscript.Echo "Photo&",.Photo.value
>>%Temp%\Temp.vbs echo if not .Mobile1.value="" then Wscript.Echo "Mobile1&",.Mobile1.value
>>%Temp%\Temp.vbs echo if not .Mobile2.value="" then Wscript.Echo "Mobile2&",.Mobile2.value
>>%Temp%\Temp.vbs echo if not .Phone.value="" then Wscript.Echo "Phone&",.Phone.value
>>%Temp%\Temp.vbs echo if not .Office.value="" then Wscript.Echo "Office&",.Office.value
>>%Temp%\Temp.vbs echo if not .Fax.value="" then Wscript.Echo "Fax&",.Fax.value
>>%Temp%\Temp.vbs echo if not .Email.value="" then Wscript.Echo "Email&",.Email.value
>>%Temp%\Temp.vbs echo if not .Home.value="" then Wscript.Echo "Home&",.Home.value
>>%Temp%\Temp.vbs echo exit sub
>>%Temp%\Temp.vbs echo end with
>>%Temp%\Temp.vbs echo end sub

set input=&set Num=&set Name=&set Source=&set Photo=&set Mobile1=&set Mobile2=&set Phone=&set Office=&set Fax=&set Email=&set Home=

for /f "tokens=1,2* delims=&" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do (
    set /a Num+=1
  if "!Num!" == "1" if "%%i" == "exit" set input=%%i&goto :eof
    set "input=%%j"&&set "input=!input:~1!"
if not "%%i" == "Photo" (set "%%i=!input!") else set "Source=!input!"&&set "Photo=Tel\!Name!%%~xj")
set input=
goto :eof

:SleepCancel
>>%Temp%\Temp.vbs echo do while true
>>%Temp%\Temp.vbs echo wscript.sleep 500
>>%Temp%\Temp.vbs echo WshShell.AppActivate ("%title% - Microsoft Internet Explorer")
>>%Temp%\Temp.vbs echo loop
>>%Temp%\Temp.vbs echo sub event_onquit
>>%Temp%\Temp.vbs echo Wscript.Echo "exit"
>>%Temp%\Temp.vbs echo wscript.quit
>>%Temp%\Temp.vbs echo end sub
goto :eof

:Newdb
>>Tel\Tel.db echo.%Name%:%Mobile1%::
if not "%Name%" == "" >>Tel\Tel.db echo.姓名：　　　[%Name%]
if not "%Photo%" == "" >>Tel\Tel.db echo.照片：　　　[%Photo%]
if not "%Mobile1%" == "" >>Tel\Tel.db echo.手机号码 1：[%Mobile1%]
if not "%Mobile2%" == "" >>Tel\Tel.db echo.手机号码 2：[%Mobile2%]
if not "%Phone%" == "" >>Tel\Tel.db echo.住宅电话：　[%Phone%]
if not "%Office%" == "" >>Tel\Tel.db echo.办公室电话：[%Office%]
if not "%Fax%" == "" >>Tel\Tel.db echo.传真：　　　[%Fax%]
if not "%Email%" == "" >>Tel\Tel.db echo.电子邮件：　[%Email%]
if not "%Home%" == "" >>Tel\Tel.db echo.家庭地址：　[%Home%]
>>Tel\Tel.db echo.录入日期：　[%Date:~0,10%]
>>Tel\Tel.db echo.-End-
>>Tel\Tel.db echo.
goto :eof

:Deldb
move/y Tel\Tel.db Tel\TelBak.db
call :Tel.db
set Delete=echo
for /f "skip=3 delims=" %%i in (Tel\TelBak.db) do (
  for /f "tokens=1* delims=:" %%n in ("%%i") do (
  if "%%n" == "%姓名%" set Delete=rem
    >>Tel\Tel.db !Delete! %%i
  if "%%i" == "-End-" >>Tel\Tel.db !Delete!.&&set Delete=echo))
goto :eof

:Sweep
set "姓名="
set "照片="
set "手机号码 1=无"
set "手机号码 2=无"
set "住宅电话=无"
set "办公室电话=无"
set "传真=无"
set "电子邮件=无"
set "家庭地址=无"
goto :eof

:Indi
if not "%照片%" == "" (set "照片路径=<img src='%cd:\=/%/%照片:\=/%' height=200 border=1>") else set "照片路径=无照片"
>>%Temp%\Temp.vbs echo .write "<table width=530 align=center border=1 cellSpacing=2 cellpadding=5 borderColor=#698cc2 title='直接回车查看下一页' style='font-size:15px;border:#698cc2 2px solid;'>"
>>%Temp%\Temp.vbs echo .write "<tr><td align=center bgcolor=#9fbfe3 style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3><b>联系人 %姓名% 资料</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td width=370 colspan=2>姓名: 　　　<b>%姓名%</b><br>录入日期: 　<b>%录入日期%</b></td><td align=center width=180 rowspan=7>%照片路径%</td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 1: <b>%手机号码 1%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>手机号码 2: <b>%手机号码 2%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>住宅电话: 　<b>%住宅电话%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>办公室电话: <b>%办公室电话%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>传真: 　　　<b>%传真%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td colspan=2>电子邮件: 　<b>%电子邮件%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "<tr><td style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#f8f8fa,endColorStr=#abc6e3)' colspan=3>家庭地址: 　<b>%家庭地址%</b></td></tr>"
>>%Temp%\Temp.vbs echo .write "</table><table align=center>- %Count% -</table><br><br>"
goto :eof

:SortTel
>%Temp%\Temp.vbs echo set WshShell = WScript.CreateObject("WScript.Shell")
>>%Temp%\Temp.vbs echo intAnswer = MsgBox("是否要对通讯录数据库进行排序？ ", vbExclamation + vbYesNo, "警告！")
>>%Temp%\Temp.vbs echo     If intAnswer = vbYes Then
>>%Temp%\Temp.vbs echo Wscript.Echo "SortTemp"
>>%Temp%\Temp.vbs echo end if
>>%Temp%\Temp.vbs echo     If intAnswer = vbNo Then
>>%Temp%\Temp.vbs echo Wscript.Echo "Main"
>>%Temp%\Temp.vbs echo end if
for /f "delims=" %%i in ('"cscript //nologo %Temp%\Temp.vbs"') do goto %%i
goto Main

:SortTemp
move/y Tel\Tel.db Tel\SortTel.db
for /f "skip=3 delims=" %%i in (Tel\SortTel.db) do (
    set NameEnd=%%i
  if "!NameEnd:~-2!" == "::" for /f "tokens=1,2* delims=:" %%n in ("%%i") do set $%%n=$)
call :Tel.db
for /f "delims=$=" %%i in ('set $^|Sort') do (
    set input=%%i
    call :ExecuteSort)
>%Temp%\Temp.vbs echo intAnswer = Msgbox("通讯录数据库排序完毕！ ", vbExclamation , "完成！")
%Temp%\Temp.vbs
goto Main
:ExecuteSort
set line=
for /f "tokens=1,2* delims=:" %%i in ('findstr /nirc:"%input%" Tel\SortTel.db') do (
  if "%%j" == "%input%" set /a line=%%i-1)
if "%line%" == "" goto :eof
for /f "skip=%line% delims=" %%i in (Tel\SortTel.db) do (
    >>Tel\Tel.db echo %%i
  if "%%i" == "-End-" >>Tel\Tel.db echo.&goto :eof)

:Help
set ieheight=500
call :Event
>>%Temp%\Temp.vbs echo with ie.document
>>%Temp%\Temp.vbs echo .write "<html><head><meta http-equiv='Content-Type' content='text/html; charset=gb_2312-80'>"
>>%Temp%\Temp.vbs echo .write "<title>IE 界面批处理通讯录帮助信息</title><style>em {color: #ffffff;font-style: normal;}</style></head>"
>>%Temp%\Temp.vbs echo .write "<body scroll=no style='FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=1,startColorStr=#5a7dde,endColorStr=#9ab8f6);'>"
>>%Temp%\Temp.vbs echo .write "<table align=center border=0 cellpadding=3 cellspacing=0 width=98%% style='font-family:宋体;font-size:15px;color:#000000;'><td>"
>>%Temp%\Temp.vbs echo .write "<p align=center style='font-size:18px;'><em><b>IE 界面批处理通讯录帮助信息</b></em>"
>>%Temp%\Temp.vbs echo .write "<p><em><b>1、 不能按【F5】键刷新界面，否则界面内所有按键将会失效，只能点击关闭窗口按键重来（好像是系统的 IE 界面与 VBS 脚本之间的问题）！！！"
>>%Temp%\Temp.vbs echo .write "<br>　　在 IE 界面输入、点击相应按键，IE 界面关闭后，批处理命令从 VBS 脚本获取信息时，有时候下一步的提示反应速度会稍慢，好像也是批处理与 VBS 脚本之间的问题。</b></em>"
>>%Temp%\Temp.vbs echo .write "<p>2、 主界面输入框内输入后直接回车<b>[查询/新增]</b>联系人<b>(优先)</b>，也可以从列表选取联系人！"
>>%Temp%\Temp.vbs echo .write "<p>3、 主界面内输入纯数字判断为第一手机号码（目前只能判断第一手机号码），数据库内存在该第一手机号码就会显示该联系人资料；"
>>%Temp%\Temp.vbs echo .write "<br>　　输入除纯数字外其他字符时，如果数据库内存在该联系人，自动显示该联系人资料，如果数据库内不存在该联系人，则自动询问是否要新增联系人。"
>>%Temp%\Temp.vbs echo .write "<p>4、 回车键默认为：<em><b>主界面</b></em>>[查询/新增]；<em><b>联系人资料</b></em>>返回主界面；<em><b>所有联系人资料</b></em>>查看下一页联系人资料。"
>>%Temp%\Temp.vbs echo .write "<p><table width=98%%><td align=right style='font-size:15px;'><em><b>by-zh159</b></em> <input type=submit onClick='opener=null;window.close()' value='关闭' name='button' title='直接回车关闭本帮助信息' style='font-family:宋体;font-size:15px;border: 1 solid #9ab8f6;FILTER: progid:DXImageTransform.Microsoft.Gradient(gradientType=0,startColorStr=#10bfff,endColorStr=#007db2);cursor:hand;color:#ffffff;'></td></table>"
>>%Temp%\Temp.vbs echo .write "</td></table></body>"
>>%Temp%\Temp.vbs echo end with

>>%Temp%\Temp.vbs echo dim wmi
>>%Temp%\Temp.vbs echo set wnd=ie.document.parentwindow
>>%Temp%\Temp.vbs echo set id=ie.document.all

>>%Temp%\Temp.vbs echo sub event_onquit
>>%Temp%\Temp.vbs echo wscript.quit
>>%Temp%\Temp.vbs echo end sub

start %Temp%\Temp.vbs
ping -n 2 127.1>nul
goto :Main
