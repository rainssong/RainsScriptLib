:: CMDHelp.cmd - Gather commands' help of CMD to HTML
:: Author: junluck
:: Modify 4: Will Sort - 2006-01-15 - CMD@WinXP
:: 发表于：http://www.cn-dos.net/forum/viewthread.php?tid=18321
@echo off & setlocal EnableDelayedExpansion
echo.========================================
echo 开始创建《CMD命令速查手册》，请稍候……
echo 创建网页文件头……
>CMDHelp.htm echo ^<head^>
>>CMDHelp.htm echo     ^<title^>CMD命令速查手册^</title^> 
>>CMDHelp.htm echo     ^<meta http-equiv="Content-Type" content="text/html^; charset=gb2312" ^/^>
>>CMDHelp.htm echo ^</head^> 
>>CMDHelp.htm echo ^<A NAME="Top"^>
>>CMDHelp.htm echo ^<center^>^<h1^>CMD 命令速查手册^</h1^>%username% - %date%^</center^>^<br^>
>>CMDHelp.htm echo ^<table^>

echo 创建帮助目录……
for /f "delims=:" %%f in ('help^|findstr /n "^ASSOC"') do set head=%%f
set /a head-=1
if "%head%"=="0" (set head=) else set head=skip=%head%
for /f "%head% delims=" %%i in ('help') do (
    set str=%%i & set name=!str:~0,9! & set desc=!str:~9!
    echo.!name! | findstr /v "^[A-Z]" >nul && echo !desc! >>CMDHelp.htm
    if errorlevel 1 echo ^</td^>^</tr^>^<tr^>^<td^>^<a href="#!name!"^>!name!^</a^>^</td^>^<td^>^ ^ ^ !desc!>>CMDHelp.htm
) 
>>CMDHelp.htm echo ^</td^>^</tr^>^</table^>^<br^>^<a href="#top"^>返回页首^</a^>^<br^>

echo 创建帮助正文……
::将默认的脚本宿主改为 cScript.exe,不知还有没有更好的办法
cscript //h:cscript //b
::因为有一些命令需要使用cscript来启动
for /f  %%i in ('help^|findstr "^[A-Z]"') do ( 
    >>CMDHelp.htm echo ^<a name="%%i"^>^<h2^>%%i^</h2^>^<pre^>
    echo 正在创建 %%i 的帮助正文中……
    if /I "%%i"=="SC" echo 请按Y键继续……
    help %%i | findstr "<.*>" >nul
    if not errorlevel 1 (
         for /f "delims=" %%a in ('help %%i') do (
                set st=%%a & set st=!st:^<=^&lt;! & set st=!st:^>=^&gt;!
                echo !st!>> CMDHelp.htm
            )
        ) else help %%i>>CMDHelp.htm 
        >>CMDHelp.htm echo ^</pre^>^<a href="#top"^>返回页首^</a^>^<br^>^<br^>
    )


echo 《CMD命令速查手册》创建完毕，任意键打开
echo.========================================
pause>nul && start CMDHelp.htm 