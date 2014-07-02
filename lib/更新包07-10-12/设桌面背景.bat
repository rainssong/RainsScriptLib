@echo off
:: 转载请注明出处
:: by 非常批处理论坛 bbs.verybat.cn   会员 9306516整理(非本人原创)
:: 此代码出自bbs.cn-dos.net
rem 功能：把一张图片设成桌面背景（图片只能是bmp格式）
rem 假设需要把C:\4.bmp设置为桌面背景
rem 把这段代码保存为MyWall.bat
rem 双击运行MyWall.bat
rem 运行MyWall.bat后，即使删除C:\4.bmp，桌面背景的修改仍有效
cd "%userprofile%\Local Settings\Application Data\Microsoft"
if exist Wallpaper_bak.bmp (
  del Wallpaper_bak.bmp
)
if exist Wallpaper1.bmp (
  ren Wallpaper1.bmp Wallpaper_bak.bmp
)
copy C:\4.bmp Wallpaper1.bmp>nul
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v Wallpaper /t REG_SZ /d "%userprofile%\Local Settings\Application Data\Microsoft\Wallpaper1.bmp" /f>nul
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v OriginalWallpaper /t REG_SZ /d "%userprofile%\Local Settings\Application Data\Microsoft\Wallpaper1.bmp" /f>nul
reg add "HKEY_CURRENT_USER\Control Panel\Desktop" /v ConvertedWallpaper /t REG_SZ /d "C:\4.bmp" /f>nul
RunDll32.exe USER32.DLL,UpdatePerUserSystemParameters