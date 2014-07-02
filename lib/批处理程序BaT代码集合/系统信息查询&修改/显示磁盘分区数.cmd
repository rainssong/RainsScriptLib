@echo off
:: 显示磁盘分区数
:: 无奈何@cn-dos.net - 2006-06-11 - CMDWinXP
setlocal ENABLEDELAYEDEXPANSION
rem 获取磁盘信息
for /f "tokens=1,2 delims= " %%a in ('echo list disk ^|diskpart ^|findstr /r /c:"磁盘 [0-9] "') do (
        @echo select disk=%%b>%%b.script
        @echo list partition>>%%b.script
        @echo exit>>%%b.script
        rem 执行脚本,获取磁盘分区信息
        for /f "tokens=1,2 delims= " %%m in ('diskpart /s %%b.script ^|findstr /r /c:"分区 [0-9] "') do (
                rem 减去扩展的分区数
                set /a num=%%n-1
        )
        del %%b.script
        echo 磁盘 %%b        含有 !num! 个分区
)
pause