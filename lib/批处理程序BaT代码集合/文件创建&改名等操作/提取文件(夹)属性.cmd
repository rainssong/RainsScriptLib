@echo off
rem  ========获取文件(夹)的属性=============
:: code by pengfi,modified by jm 2006-9-13
:: 用for取到的文件属性形如drahs----，所需要的属性在第二到第五个字符位上
:: 该代码速度很快
cd.>attrib.txt
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in ('dir /a /b /s "%systemroot%\system32"') do (
    set var=%%~ai
    set attrib_=
    if not "!var:~1,1!"=="-" set attrib_=+!var:~1,1!
    if not "!var:~3,1!"=="-" set attrib_=!attrib_! +!var:~3,1!
    if not "!var:~4,1!"=="-" set attrib_=!attrib_! +!var:~4,1!
    if not "!attrib_!"=="" echo attrib !attrib_! "%%i">>attrib.txt
)
goto :eof

:: 另外一种方案
:: 通过字符替换来实现
:: 速度较上一个稍慢，上千个文件有几十毫秒的差异
@echo off
:: 获取某个文件夹下所有子文件夹及其文件的属性
:: Code by JM 2006-9-13 Thanks pengfei
rem  ========获取文件(夹)的属性=============
cd.>attrib.txt
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in ('dir /a /b /s "%systemroot%\system32"') do (
    set attrib_=%%~ai
    set attrib_=!attrib_:h=+h !
    set attrib_=!attrib_:r=+r !
    set attrib_=!attrib_:s=+s !
    set attrib_=!attrib_:a=!
    set attrib_=!attrib_:d=!
    set attrib_=!attrib_:-=!
    if not "!attrib_!"=="" echo attrib !attrib_! "%%i">>attrib.txt
)
goto :eof

:: 修改版本：比第二个稍微快了一点点
@echo off
:: 获取某个文件夹下所有子文件夹及其文件的属性
:: Code by JM 2006-9-13 Thanks pengfei
rem  ========获取文件(夹)的属性=============
cd.>attrib.txt
setlocal enabledelayedexpansion
for /f "tokens=*" %%i in ('dir /a /b /s "%systemroot%\system32"') do (
    set attrib_=%%~ai
    set attrib_=!attrib_:~1,4!
    set attrib_=!attrib_:h=+h !
    set attrib_=!attrib_:r=+r !
    set attrib_=!attrib_:s=+s !
    set attrib_=!attrib_:a=!
    set attrib_=!attrib_:-=!
    if not "!attrib_!"=="" echo attrib !attrib_! "%%i">>attrib1.txt
)
