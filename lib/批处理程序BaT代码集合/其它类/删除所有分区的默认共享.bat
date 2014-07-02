@echo off
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::
::
::     先列举存在的分区，然后再逐个删除以分区名命名的共享；
::     通过修改注册表防止admin$共享在下次开机时重新加载； 
::     IPC$共享需要administritor权限才能成功删除
::
::                             jm 改动于 2006-5-12
::
::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::::

title 默认共享删除器
echo. 
echo ------------------------------------------------------ 
echo. 
echo 开始删除每个分区下的默认共享. 
echo. 
for %%a in (C D E F G H I J K L M N O P Q R S T U V W X Y Z) do @(
    if exist %%a:\nul (
        net share %%a$ /delete>nul 2>nul && echo 成功删除名为 %%a$ 的默认共享 || echo 名为 %%a$ 的默认共享不存在
    ) 
)
net share admin$ /delete>nul 2>nul && echo 成功删除名为 admin$ 的默认共享 || echo 名为 admin$ 的默认共享不存在
echo.
echo ------------------------------------------------------ 
echo.
net stop Server>nul 2>nul && echo Server服务已停止.
net start Server>nul 2>nul && echo Server服务已启动.
echo. 
echo ------------------------------------------------------ 
echo. 
echo 修改注册表以更改系统默认设置. 
echo. 
echo 正在创建注册表文件. 
echo Windows Registry Editor Version 5.00> c:\delshare.reg 
:: 通过注册表禁止Admin$共享，以防重启后再次加载
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Services\lanmanserver\parameters]>> c:\delshare.reg
echo "AutoShareWks"=dword:00000000>> c:\delshare.reg 
echo "AutoShareServer"=dword:00000000>> c:\delshare.reg 
:: 删除IPC$共享，本功能需要administritor权限才能成功删除
echo [HKEY_LOCAL_MACHINE\SYSTEM\CurrentControlSet\Control\Lsa]>> c:\delshare.reg
echo "restrictanonymous"=dword:00000001>> c:\delshare.reg
echo 正在导入注册表文件以更改系统默认设置. 
regedit /s c:\delshare.reg 
del c:\delshare.reg && echo 临时文件已经删除. 
echo. 
echo ------------------------------------------------------ 
echo. 
echo 程序已经成功删除所有的默认共享. 
echo. 
echo 按任意键退出...
pause>nul