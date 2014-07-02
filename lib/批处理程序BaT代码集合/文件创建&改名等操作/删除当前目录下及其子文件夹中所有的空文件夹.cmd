@echo off
:: 最简洁的方案：先列出所有的目录之后，然后按照降序排列，删除。
:: 关键在于要从最深层目录倒着删
:: code by bagpipe 2006-12-29 CMD@XP

for /f "tokens=*" %%a in ('dir /b /ad /s "目标路径"^|sort /r') do rd "%%a" 2>nul
pause
goto :eof

@echo off
:: 思路：列举所有目录(包括子目录)路径，然后，删除第一个路径最后一节上的文件夹；
:: 　　如果能删除这个文件夹，则删除上一层文件夹；如果还能删除，则继续上一步……
:: 　　直到当前目录为止；如果其中某一节不能删除，立即跳出，开始删除下一条路径中
:: 　　最后一节上的文件夹……如此反复。
::
:: code by JM 2006-12-25 bbs.cn-dos.net CMD@XP

for /f "delims=" %%i in ('dir /ad /b /s') do call :rd_dir_empty "%%i"
goto :eof


rem ======= 删除空目录 =========
:rd_dir_empty
rd %1 2>nul||goto :eof
set dir_route=%1
for /f "delims=" %%i in (%dir_route%) do (
    set dir_route="%%~dpi"
    for /f "delims=" %%j in ('dir /ad /b "%%~dpi"')do rd "%%~dpi%%j" 2>nul||goto :eof
)
:: 把路径最后的\去掉，以便set route_deepest="%%~dpi"能取到上一层路径
if "%dir_route:~-2,1%"=="\" set dir_route="%dir_route:~1,-2%"
if /i not "%cd%"==%dir_route% call :rd_dir_empty %dir_route%
goto :eof
