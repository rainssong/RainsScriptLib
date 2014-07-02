@echo off
:: 把下一行的数字复制到前面一行的后面,并用空格分开
setlocal enabledelayedexpansion
for /f %%i in (test.txt) do (
    set /a count+=1
    set first=!second!
    set second=%%i
    if !count! gtr 1 echo !first! !second!
)
pause
