@echo off
color 0a
cls
set 路径=\\game\xz$

echo.正在检测是否连上保存区... 
@net use J: "%路径%"
if exist J:\ goto nno
echo 末连接上保存区,请与网管联系.
pause>nul
exit
:nno
@net use /del J: >nul
:koko
cls
echo  ┏━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┓
echo  ┃  本网吧亲爱的顾客：                                                      ┃
echo  ┃                                                                          ┃
echo  ┃    你好~！                                                               ┃
echo  ┃    你有需要保存的图片、文档、软件,游戏存档....等资料吗？                 ┃
echo  ┃                                                                          ┃
echo  ┃    因我们网吧电脑装有还原系统，你的资料在重启后就会消失掉。              ┃
echo  ┃    请把你需要保存的资料放到本网吧为你准备的【保存区】好吗？              ┃
echo  ┃                                                                          ┃
echo  ┃                                                                          ┃
echo  ┃               注：【保存区】的资料不会被还原，并且任何一台电脑都可以访问 ┃
echo  ┗━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━┛
echo.
echo.
echo 请输入你的账号后回车!如果你没有账号请您在下面新建一个后按回车键，帐号建好后请您牢记。以便您下次登陆使用。
echo ---------------------------------------------------
set/p 用户名=用户名:
echo ---------------------------------------------------
if %用户名% geq 1 goto start
echo MSGBox "用户名不能为特殊符号,请重新输入!",48,"错误提示：" >nos.vbs &&call nos.vbs &&del nos.vbs &&goto koko 
:start
set 用户名|findstr "\<%search%\>" >nul
set search=%用户% >nul
echo 正在验证用户『%用户名%』
echo 请稍候........
if exist %路径%\%用户名% goto pass >nul
if not exist %路径%\%用户名% goto md >nul
:pass
rem 密码验证
set errorlevel=>nul
echo → 『%用户名%』这个用户已经存在,请输入您的密码:
echo ---------------------------------------------------
set/p 密码=密码:
if %密码% geq 1 goto yes
echo MSGBox "不能用特殊符号,请重新输入!",48,"温馨提示：" >nos.vbs &&call nos.vbs &&del nos.vbs &&call %0
:yes
set 密码|findstr "\<%pass%\>" >nul
set pass=%密码% >nul
if errorlevel=1 cls &&echo MSGBox "密码不能为空哦,请重新输入吧！！^_^",48,"温馨提示：" >kong.vbs &&call kong.vbs  &&del kong.vbs &&call %0 
if exist %路径%\%用户名%\pass\%密码% goto login >nul
if not exist %路径%\%用户名%\pass\%密码% echo  MSGBox "你输入的密码错咯！请重新输入吧！！",48,"温馨提示:" >run.vbs &&call run.vbs  &&del run.vbs &&call %0
:login
echo MSGBox "恭喜~！密码验证成功！欢迎您的登录! **请不要上传木马病毒哦 谢谢您的合作！***^_^",48,"温馨提示：" 
cls
echo 请稍侯.......
echo 正在为你打开【保存区】
NET USE u: /DELETE /YES >nul
net use u: %路径%\%用户名% /YES >nul
@explorer.exe u:\ 
exit
:md
echo     用户名不存在，是否创建新用户?
echo.
echo   A: 创建新用户         B: 重新输入
echo.
set /p tw= >nul
if "%tw%"=="a" goto yesok
if "%tw%"=="A" goto yesok
if "%tw%"=="b" goto koko
if "%tw%"=="B" goto koko
:yesok
set errorlevel=>nul
echo 请为你的新用户设置一个密码:
echo ---------------------------------------------------
echo.
set/p 密码=密     码:
if %密码% geq 1 goto oks
echo MSGBox "不能用特殊符号,请重新输入!",48,"温馨提示：" >run.vbs &&call run.vbs  &&del run.vbs &&goto yesok 
:oks
set /p 密码0=请再次输入:
if "%密码0%"=="%密码%" goto okss
echo MSGBox "您的两次密码不同,请重新输入!",48,"错误提示：">no.vbs &&call no.vbs  &&del no.vbs &&goto yesok 
goto :yesok
:okss
set 密码|findstr "\<%pass%\>" >nul
set pass=%密码% >nul
if errorlevel=1 cls &&echo  MSGBox " 密码不能为空哦,请重新输入吧！！^_^",48,"温馨提示：" >run.vbs &&call run.vbs &&del run.vbs &&call %0 
md %路径%\%用户名% >nul
md %路径%\%用户名%\pass
attrib +h +s %路径%\%用户名%\pass
attrib +h +s %路径%\%用户名%
md %路径%\%用户名%\pass\%密码%
echo MSGBox "恭喜~！你已成为本网吧【保存区】的新用户，赶快把你的资料放进去吧！~*_^",48,"温馨提示："  >run.vbs &&call run.vbs &&del run.vbs >nul
cls
echo 请稍侯.......
echo 正在为你打开【保存区】
NET USE u: /DELETE /YES >nul
net use u: %路径%\%用户名% /YES >nul
@explorer.exe u:\ 
exit

