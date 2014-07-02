@echo off
:: 全盘删除存在于所有文件夹下的a.ini
:: a.ini可能带有 系统+隐藏+只读 属性
:: fsutil命令必须在管理员权限下运行
:: code by jm 2006-9-12 CMD@XP
setlocal enabledelayedexpansion
for /f "delims=\" %%i in ('fsutil fsinfo drives^|find   ""') do (
    set drive_=%%i
    fsutil fsinfo drivetype !drive_:~0,2!|find "固定">nul && del /a /f /q /s !drive_:~0,2!\a.ini
)
echo        已经把所有分区里的a.ini删除完毕，按任意键退出...
pause>nul 