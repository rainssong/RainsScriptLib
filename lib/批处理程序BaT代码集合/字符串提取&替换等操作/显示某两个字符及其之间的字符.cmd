::比如我输入 af  就显示
::a
::b
::c
::d
::e
::f
::每个字母占一行啊``不知能不能实现.. 

@echo off
:: Code by JM 2007-1-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26491
:begin
cls
set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
set input=
set /p input=      请输入字母范围(如af)：
call set str=%%str:%input:~0,1%=-☆%input:~0,1%%%
call set str=%%str:%input:~-1%=%input:~-1%☆%%
for /f "tokens=2 delims=☆" %%i in ("%str%") do set str=%%i
for %%i in (%str%) do echo %%i
pause
goto begin

@echo off
:: Code by JM 2007-1-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26491
set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
:begin
cls
set flag=0
set var=
set input=
set /p input=      请输入字母范围(如af)：
for %%i in (%str%) do call :pickup %%i

:end
pause
goto begin

:pickup
if /i "%1"=="%input:~0,1%" set flag=1
if /i "%1"=="%input:~-1%" set flag=2
if %flag% equ 1 echo %1
if %flag% equ 2 echo %1&goto end
goto :eof

@echo off
:: 先把字符串的每一个元素编码，然后再转换
:: Code by youxi01 2007-1-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26491
setlocal enabledelayedexpansion

set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
for %%i in (%str%) do set/a dec+=1 & set %%i=!dec! & set str!dec!=%%i
set en=
set /p en=请输入字母范围(如af)：
set/a num1=!%en:~0,1%!,num2=!%en:~-1%!
for /l %%i in (%num1%,1,%num2%) do echo !str%%i!
pause>nul
goto :eof

@echo off
:: 通过比较字符内部编码的大小来实现，局限性很大
:: Code by youxi01 2007-1-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26491
setlocal enabledelayedexpansion

set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
set en=
set /p en=请输入字母范围(如af)：
set str1=%en:~0,1%
set str2=%en:~-1%
for %%i in (%str%) do if %%i geq !str1! if %%i leq !str2! echo %%i
pause>nul
goto :eof

@echo off
:: 缺点：速度比较慢
:: Code by PPdos 2007-1-9 CMD@XP
:: 出处：http://www.cn-dos.net/forum/viewthread.php?tid=26491
:begin
set /p a="老规矩 嘻嘻 :"
set str=a b c d e f g h i j k l m n o p q r s t u v w x y z
for %%i in (%str%) do echo %%i|findstr [%a:~0,1%-%a:~-1%]
pause
goto begin
