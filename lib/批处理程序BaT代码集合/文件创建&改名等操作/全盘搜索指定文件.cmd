@echo off
:: 全盘搜索指定的文件
:: 注意文件夹的跳转，要在盘符后加\,或者先回到根目录之后再用cd /d来跳
:: 否则，在桌面上的时候无法直接用cd /d来跳转到系统盘根目录
:: code by jm 2006-8-30
setlocal enabledelayedexpansion
for %%i in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do (
  if exist %%i:\nul (
    for /f "tokens=3" %%z in ('dir /-c %%i:\') do set freesize=%%z
    if not "!freesize!"=="0" (
      pushd %%i:\
      for /r %%k in (.) do (
        if exist %%k\icon.ico echo %%k
      )
    )
  )
)
popd
pause