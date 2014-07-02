%%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a %%a 
cls
@echo off
color 2a
:start
cls
echo *******************************************************************************
echo *                                                    *
echo *              BAT    加    密    最    终    版                  *
echo *                                                    *
echo *******************************************************************************
echo.
echo.
echo BAT加密最终版为"BAT加密工具"的更新版本, 较上一版加密工具而言有诸多优势:
echo.
echo ★ 可以一次性成功加密任何批处理文件, 更省事.
echo.
echo ★ 可以由您输入任意需要加密的批处理, 加密灵活性更大.
echo.
echo ★ 能够自动判断错误输入, 更加人性化.
echo.
echo 说明: 在下面输入需要加密的批处理文件, 直接输入批处理文件名为加密当前目录下的BAT,也可以带路径指定任意BAT. 当前目录下生成的encrypt.bat文件即为加密的批处理. 
echo.
echo 作者:木林森 QQ:573381312 BYE
echo.
echo.
echo.
set /p file=请输入需要加密的批处理后按回车键(q=退出):
if "%file%"=="q" goto quit
echo %file%|findstr /i "\.bat$">nul && goto go
echo %file%|findstr /i "\.cmd$">nul && goto go
cls
echo ==============
echo 请正确输入!
echo ==============
echo.
echo.
echo 按任意键重新输入......
pause>nul
goto start
:go
if not exist "%file%" goto newly
if exist encrypt.bat copy encrypt.bat encryptbak.bat
echo %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a %%%%a >"%tmp%\encrypt.tmp"
echo cls>>"%tmp%\encrypt.tmp"
type "%file%">>"%tmp%\encrypt.tmp"
setlocal enabledelayedexpansion
for %%i in ("%tmp%\encrypt.tmp") do (
echo %%~zi >nul 2>nul
set size=%%~zi
set num=!size:~-1!
set /a mod=!num!%%2
if !mod! equ 0 (goto even) else (goto odd)
)
:even
copy "%tmp%\encrypt.tmp" encrypt.bat
del "%tmp%\encrypt.tmp"
cls
echo ==========================
echo 恭喜你, 批处理加密成功^^!
echo ==========================
echo.
echo.
echo 按任意键退出......
pause>nul
goto quit
:odd
echo. >>"%tmp%\encrypt.tmp"
copy "%tmp%\encrypt.tmp" encrypt.bat
del "%tmp%\encrypt.tmp"
cls
echo ==========================
echo 恭喜你, 批处理加密成功^^!
echo ==========================
echo.
echo.
echo 按任意键退出......
pause>nul
goto quit
:newly
cls
echo ================================
echo 找不到批处理文件, 请重新输入!
echo ================================
echo.
echo.
echo 按任意键开始......
pause>nul
goto start
:quit
exit 
