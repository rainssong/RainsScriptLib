@echo off
:: 把多行文本拼接成用;连接的一行
:: <nul 不能省略，省略掉就无法运行下去
for /f "tokens=*" %%i in (源文件.txt) do set /p "var=%%i;" <nul >>目标文件.txt
exit

另一种方法：
set tmpstr=
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in (1.txt) do set tmpstr=!tmpstr! %%i
echo %tmpstr%
pause
exit

还有一种不启用变量延迟的方法，能兼容除英文双引号外的所有特殊字符：
@echo off
:: code by jm 2006-12-14
for /f "delims=" %%i in (1.txt) do call set "var=%%var%%%%i"
echo "%var%"
pause