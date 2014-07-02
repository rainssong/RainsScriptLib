@echo off
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Start Page" /t reg_sz /d http://xmve.com /f 
reg add "HKEY_CURRENT_USER\Software\Microsoft\Internet Explorer\Main" /v "Default_Page_URL" /t reg_sz /d http://xmve.com /f
echo.
cls
color a
echo.
echo.
echo        恭 喜 你。你 被 心 如 止 水 把 主 页 改 成 了  http://xmve.com 哈 哈。
echo.
echo        改 回 请 编 辑 本 BAT 的 键 值， 谢 谢!  玩玩不打不闹，生活是不是很单调
echo.
echo.
pause