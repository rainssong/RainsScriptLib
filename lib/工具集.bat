@echo off&title BAT工具箱V0.30(by sam)
color 4f
:caidan
cls
echo ========================================
echo            bat 工具箱 V0.30
echo           by       sam(samkt)
echo 2010.3.24                   19.39(24h)
echo QQ:455051563 E-mail:samkt@163.com
echo BAT 讨论群:25753814   百度BAT/CMD/DOS吧
echo 转        载         请         注        明
echo ========================================
echo 请选择需要使用的工具!
echo 1.备份工具V0.67（用于备份重要数据）
echo 2.磁盘格式化工具V0.1（格式化磁盘）
echo 3.删除隐藏/难删文件工具V0.5（删除隐藏/难删文件）
echo 4.终止进程工具V0.5（终止进程）
echo 5.取消关机工具V0.2（如果提示您将要关机/重起/注销，运行后会取消）
echo 6.测试网速工具v0.5（测试网速）
echo 7.关机/注销/重起工具V0.3
echo 8.退出（退出）
set choose =
set /p choose=
if '%choose%'=='1' goto bkup
if '%choose%'=='2' goto fomr
if '%choose%'=='3' goto delt
if '%choose%'=='4' goto task
if '%choose%'=='5' goto nshu
if '%choose%'=='6' goto ping
if '%choose%'=='7' goto shut
if '%choose%'=='8' goto exit
goto ping
:ping
pause
ping www.qq.com
echo.
echo.
echo 测试完毕！数据（***MS）小于100为快，101-500中等，501以上慢
echo 任意键返回菜单
pause>nul
goto caidan
goto shut
:shut
echo 请选择：
echo s是关机
echo l是注销
echo r是重起
set /p ml01=
echo 任意键开始
pause>nul
shutdown /%ml01% /t 5
echo 5秒后关机
pause>nul
goto caidan
goto nshu
:nshu
shutdown /a
echo 已完成！！任意键返回菜单！
pause>nul
goto caidan
goto bkup
:bkup
echo 请选择要备份的文件/文件夹/分区（如：D/E/A）【一定要输入正确！否则无法备份!】
set /p yp=
echo 请选择备份保存位置，如（A:\备份）【一定要输入正确！否则无法备份!】
set /p bcwz=
copy '%yp%' '%bcwz%'
echo 备份完毕！是否再次备份？y=yes n=no 不选择为随机
set choose =
set /p choose=请选择（Y.N）：
if '%choose%'=='y' goto bkup
if '%choose%'=='n' goto caidan
goto fomr
:fomr
echo 请选择要格式化的磁盘,但不能格式化本程序所在的磁盘！，如:A/C/G
set /p cp=
echo 请确认要使用此程序！如丢失重要数据,本人不承担任何责任！(任意键确认)
pause>nul
format %cp%:/q
echo 已格式化完毕！是否格式化其他磁盘？y=yes n=no 不选择为随机
set choose =
set /p choose=请选择（Y.N）：
if '%choose%'=='y' goto fomr
if '%choose%'=='n' goto caidan
goto delt
:delt
echo 请输入文件路径（如:c:\525894\io\55.exe、d:\23\）
set /p dellujing=
echo 请选择是不断删除还是只删除1次？（A=不断删除B=删除1次）
set choose =
set /p choose=请选择（A,B）：
if '%choose%'=='a' goto buduandel
if '%choose%'=='b' goto delonce
goto delonce
:delonce
del /f /s /q %dellujing%
del %dellujing%
echo 删除完毕，A，选择别的文件删除，B回到菜单
set choose =
set /p choose=请选择:
if '%choose%'=='a' goto delt
if '%choose%'=='b' goto caidan
goto buduandel
:buduandel
del /f /s /q %dellujing%
del %dellujing%
goto buduandel
goto task
:task
echo 请输入要关闭的进程
set /p taskjincheng=
echo 请选择是不断关闭还是只关闭1次？（A=不断关闭B=关闭1次）
set choose =
set /p choose=请选择（A,B）：
if '%choose%'=='a' goto taskbuduan
if '%choose%'=='b' goto taskonce
goto taskbuduan
:taskbuduan
taskill /f /im %taskjincheng%
taskill %taskjincheng%
goto taskbuduan
goto taskonce
:once
taskill /f /im %taskjincheng%
taskill %taskjincheng%
echo 关闭完毕，A，选择别的文件关闭，B回到菜单
set choose =
set /p choose=请选择（A,B）：
if '%choose%'=='a' goto task
if '%choose%'=='b' goto caidan
goto caidan
goto exit
:exit
echo 任意键退出
pause>nul