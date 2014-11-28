@echo off&setlocal enabledelayedexpansion
for /f "delims=" %%f in ('dir /s /b *.aud *.amr') do (
set fn=!n!%%~xf
copy Audhead.txt/b +"%%f" "%%f.amr"
)
pause