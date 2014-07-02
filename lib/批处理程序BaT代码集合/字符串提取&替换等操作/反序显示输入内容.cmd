@echo off
:: 反序显示输入，能处理 数字+字母(区分大小写)+符号 格式的混合型输入
:: 区分大小写
:: 稍加改造，可以实现密码的枚举？
:: 不能处理的字符：
:: 管道符号：|
:: 重定向符号：<、>
:: 连接符号：&
:: 脱字或逃逸符号：%、^
:: 其他符号：?、*、)、=、;、"
:: code by jm 2006-9-7 CMD@XP
cls
set input=
set /p input=           请输入一个字符串 
set output=
if not "%input%"=="" set input=%input%
:loop
for %%i in (0 1 2 3 4 5 6 7 8 9 a b c d e f g h i j k l m n o p q r s t u v w x y z A B C D E F G H I J K L M N O P Q R S T U V W X Y Z ` ~ ! @ # $ ^( - + . / \ [ ] { } : ') do (
    (if %input:~-1% equ %%i set output=%output%%%i)&&set input=%input:~0,-1%
)
if not "%input%"=="" goto :loop
echo        反序显示输入，结果是 %output%
pause