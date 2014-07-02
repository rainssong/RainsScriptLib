:: ÈËÃñ±Ò´óĞ¡Ğ´»¥×ª³ÌĞò R3
:: qzwqzw http://bbs.cn-dos.net
:: 2007-01-03 11:15
:: ³ö´¦£ºhttp://www.cn-dos.net/forum/viewthread.php?tid=26288
@echo off
setlocal EnableDelayedExpansion

for /l %%i in (1,1,100) do (
    set /a numin=!random!*50001-50000000
    set numin=!numin:~0,-2!.!numin:~-2!
    set in=!numin!
    call :Num2RMB
    set in=!out!
    call :RMB2Num
    echo.%%i [!numin!:!in!:!out!]
    if !numin! neq !out! set /p=--- Invalid ---
    set out=
)
if "%~0"=="%~f0" pause
endlocal
goto :eof

:Num2RMB
setlocal
set num=%in%
set num=0%num%
for /f "tokens=1,2,* delims=." %%f in ("%num%") do (
    set num2=%%g00
    set num=%%f!num2:~0,2!
    if not "%%h"=="" goto :eof
)

:del_pre0
if "%num:~0,1%"=="0" (
    set num=%num:~1%
    goto del_pre0
)

:checknum
set num=%num:,=%
set /a num2=num+0
if not "%num%"=="%num2%" goto :eof
if %num% geq 1000000000000 goto :eof
if %num% leq 0 goto :eof 

set tbl1=ÁãÒ¼·¡ÈşËÁÎéÂ½Æâ°Æ¾Á
set tbl2=·Ö½ÇÔªÊ°°ÛÇªÍòÊ°°ÛÇªÒÚÊ°°ÛÇª

:n2r_loop
call set rmb=%%tbl1:~%num:~-1,1%,1%%%%tbl2:~%bit%,1%%%rmb%
set /a bit+=1
set num=%num:~0,-1%
if not "%num%"=="" goto n2r_loop

set rmb=%rmb:ÁãÊ°=Áã%
set rmb=%rmb:Áã°Û=Áã%
set rmb=%rmb:ÁãÇª=Áã%
set rmb=%rmb:ÁãÁã=Áã%
set rmb=%rmb:ÁãÁã=Áã%

set rmb=%rmb:ÁãÔª=ÔªÁã%
set rmb=%rmb:ÁãÍò=ÍòÁã%
set rmb=%rmb:ÁãÒÚ=ÒÚÁã%
set rmb=%rmb:ÁãÁã=Áã%

set rmb=%rmb:Áã·Ö=Áã%
set rmb=%rmb:Áã½Ç=Áã%
set rmb=%rmb:½ÇÁã=½Ç%
set rmb=%rmb:ÁãÁã=Õû%

endlocal & set out=%rmb%
goto :eof
::Num2RMB

:RMB2Num
setlocal
set rmb=%in%
set rmb=%rmb:Áã=%
set rmb=%rmb:Õû=%

set tbl1=ÁãÒ¼·¡ÈşËÁÎéÂ½Æâ°Æ¾Á
set tbl2=·Ö½ÇÔªÊ°°ÛÇªÍòÊ°°ÛÇªÒÚÊ°°ÛÇª
for /l %%i in (1,1,9) do call set rmb%%tbl1:~%%i,1%%=%%i

:r2n_loop
if "%tbl2:~0,1%"=="%rmb:~-1,1%" (
    set rmb=!rmb:~0,-1!
    call set tmp=%%rmb!rmb:~-1,1!%%
    if not "!tmp!"=="" (
        set num=!tmp!!num!
        set rmb=!rmb:~0,-1!
    ) else (
        set num=0!num!
    )
) else (
    set num=0!num!
)
set tbl2=%tbl2:~1%
if not "%rmb%"=="" if not "%tbl2%"=="" goto r2n_loop

set num=%num:~0,-2%.%num:~-2%
endlocal & set out=%num%
goto :eof
::RMB2Num