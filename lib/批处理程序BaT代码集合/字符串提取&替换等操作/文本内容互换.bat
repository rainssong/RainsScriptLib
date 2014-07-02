@echo off
for /f "delims== tokens=1*" %%a in (1.ini) do (
        if not "%%b"=="" (
                if not "%%a"=="分类辅助" (echo\%%a=%%b>>new.ini) else (
                for /f "delims=" %%v in ('find "分类辅助" ^<2.ini') do echo\%%v>>new.ini
                )
        ) else (echo\%%a>>new.ini)
)
del 1.ini
ren new.ini 1.ini