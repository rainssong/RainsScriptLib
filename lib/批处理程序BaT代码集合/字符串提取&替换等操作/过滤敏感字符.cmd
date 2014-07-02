@echo off
:: 并不能正确处理重定向符号
:: Code by 3742668 2006-9-10
:: Modified by jm 2006-9-12
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=22938
:start
setlocal
    cls
    set /p var=请输入字符:
:: 还应该在此处添加一个过滤掉所有引号的语句
:: 以防止call的时候，把形如a"&b的%var%当作是并列的两个参数  -jm添加
    set "var=%var:"=%"
    call :filter "%var%"
endlocal
goto start

:filter
setlocal
    set "str=%~1★"
    set "str=%str:|=%"
    set "str=%str:&=%"
    set "str=%str:"=%"
    echo 过滤以后的字符为: %str:~0,-1%
    pause
endlocal
goto :eof


相关的文章：


bat过滤任意字符


早在写 bat的一个小游戏猜数字的时候我就研究过这个问题 如何在bat里面实现 对输入的任意字符进行过滤 当时使用的几种方法如下
Codz: 
if "%1"=="要过滤的字符" echo 你输入的是非法字符 
例: if "%1"=="wrongpassword" echo 错误口令 

set errorlevel=0 
echo 要过滤的字符|find "要过滤的字符" 
if "%errorlevel%"=="0" echo 你输入的是是非法字符 
if "%errorlevel%"=="1" echo 该字符串不在非法列表中



主要是使用这两种方法 这两种方法可以过滤数字 和 英文字母 但是 对 特殊字符 不起作用

当要过滤【_+|-=\[]{};':,./">~`!@#$%^&*()_+|-=\[]{};':,./<>? 】(包含空格和tab键值)的时候 我们要这样

Codz: 
echo "anyword"|find "anywrod"

注意到有什么不同了吗 是的 我们加入了""来包含anyword 可是过滤到此并没完成 发现上面要过滤的字符 少了什么吗 是的 少了" 字符本身 遗憾的是 这种方法 无法完美的过滤"字符本身 当" 取值 为奇数 和 偶数的 时候 用find对她进行 过滤 随条件 不同可能会报错

这个问题 困扰了 我半年之久 曾在安焦上 问了一下 没人回答 

事实上要过滤它 并不是那么的简单 我们先写几个验证密码的小程序 看看在不同情况下程序的反应

我们先写一个验证密码登录的小程序

注：当密码验证字符为ph4nt0m的时候 授权登录

Codz: 
@echo off 
cls 
:allyesno 
set errorlevel=>nul 
echo 请输入登录口令 
set/p password= 
echo "%password%"|findstr "ph4nt0m" 
if "%errorlevel%"=="0" echo 口令正确&goto end 
echo 口令错误&goto allyesno 
:end 
echo 你成功登录系统



将bat保存为key.bat执行

执行结果

Codz: 
C:test>key 
请输入登录口令 
test 
口令错误 
请输入登录口令 
ph4nt0m 
"ph4nt0m" 
口令正确 
你成功登录系统



事实 上 上面的代码用来进行一般的口令验证已经足够了 但是 要达到我们的目的 任意字符过滤还不行
我们换个方式执行看看

执行结果
Codz: 
C:test>key 
请输入登录口令 
test 
口令错误 
请输入登录口令 
" 
"""|findstr "ph4nt0m" 
口令错误 
请输入登录口令 
ph4nt0m 
"ph4nt0m" 
口令正确 
你成功登录系统



看见了吗 当我们输入" 字符的时候 程序报错了 并显示了密码 为什么会这样呢？ 我们再看这个语句的语法结构 echo "%password%"|findstr "ph4nt0m" 当%password%="的时候 就是echo """|findstr "ph4nt0m"

之所以会如此 跟echo的特性有关 我们看下面几个语句

Codz: 
I:>echo "|cd 
"|cd 

I:>echo ""|cd 
I: 

I:>echo """|cd 
"""|cd 

I:>echo """"|cd 
I:



当"为奇数的时候 则打印整行 当"为偶数的时候则 执行 | 字符后面的命令 上面程序执行的命令是cd

这里我想了一个办法绕过echo的报错特性 我用set代替了echo 程序如下

Codz: 
@echo off 
cls 
:allyesno 
set errorlevel=>nul 
echo 请输入登录口令 
set/p password= 
set |findstr "ph4nt0m" 
if "%errorlevel%"=="0" echo 口令正确&goto end 
echo 口令错误&goto allyesno 
:end 
echo 你成功登录系统



执行结果如下

Codz: 
请输入登录口令 
test 
口令错误 
请输入登录口令 
" 
口令错误 
请输入登录口令 
ph4nt0m 
password=ph4nt0m 
口令正确 
你成功登录系统 

C:\test>



程序进一步的完美了

但是还是有问题D 我们再来看 换一种方式执行

Codz: 
请输入登录口令 
test 
口令错误 
请输入登录口令 
ph4nt0mallyesno 
password=ph4nt0mallyesno 
口令正确 
你成功登录系统 

C:test>



由于程序的验证方式是 set |findstr "ph4nt0m" 所以只要包含ph4nt0m字符的 密码 都被当成正确密码 所以密码ph4nt0mallyesno 也通过了

为了避免这个问题 我设置了 匹配参数\<\> 对数据进行检验 修改后的程序 如下

Codz: 
@echo off 
cls 
:allyesno 
set errorlevel=>nul 
echo 请输入登录口令 
set/p password= 
set |findstr "\<ph4nt0m\>" 
if "%errorlevel%"=="0" echo 口令正确&goto end 
echo 口令错误&goto allyesno 
:end 
echo 你成功登录系统



执行结果

Codz: 
请输入登录口令 
test 
口令错误 
请输入登录口令 
ph4nt0mallyesno 
口令错误 
请输入登录口令 
ph4nt0m 
password=ph4nt0m 
口令正确 
你成功登录系统 

C:test>



最后再将程序 修整 如下 

Codz: 
@echo off 
cls 
:allyesno 
set errorlevel=>nul 
echo 请输入登录口令 
set/p password= 
rem 如果密码字符串包含此行任一字符_+|-=[]{};':,./">~`!@#$%^&*()_+|-=[]{};':,./<>? 则必须使用匹配模式<> 
rem 需要双写的字符 
rem 不可以作为密码的字符 " 
set password|findstr "\<ph4nt0m\>" 
if "%errorlevel%"=="0" echo 口令正确&goto end 
echo 口令错误&goto allyesno 
:end 
set password=>nul 
echo 你成功登录系统



注：当密码字符串中有字符\的时候 需要将字符双写\\ 
例 set password|findstr "\<\\\>"
登录的时候 只需要写一次\不需要双写

" 字符 不可以作为密码字符串 如果密码字符串包含此行任一字符_+|-=[]{};':,./">~`!@#$%^&*()_+|-=[]{};':,./<>? 则必须使用匹配模式\<\>