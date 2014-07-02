@echo off
if exist test\nul (echo 是文件夹) else echo 是文件
pause
goto :eof

@echo off
pushd test 2>nul&&echo 是文件夹||echo 是文件
popd
pause
goto :eof

@echo off
set "cur_dir=%cd%"
cd /d test 2>nul&&echo 是文件夹||echo 是文件
cd /d "%cur_dir%"
pause
goto :eof