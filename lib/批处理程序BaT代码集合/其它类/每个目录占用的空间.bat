@echo off
for /f "tokens=*" %%b in ('dir') do echo "%%b"|find "个文件">nul&&for /f "tokens=3*" %%c in ("%%b") do echo 当前目录 %%c %%d
for /f %%a in ('dir/ad/s/b') do for /f "tokens=*" %%b in ('"dir %%a\"') do echo "%%b"|find "个文件">nul&&for /f "tokens=3*" %%c in ("%%b") do echo %%a %%c %%d
pause