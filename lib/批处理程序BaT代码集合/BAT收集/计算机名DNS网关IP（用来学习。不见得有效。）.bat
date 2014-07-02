@echo off
:main
cls
echo.
echo.
echo          1.生成自动配置计算机名,DNS,网关,IP脚本,IPX内部网络号
echo.
echo          2.网刻服务器自动配置
echo.
echo          3.电信网通线路切换生成器
echo.
echo          4.退出脚本
echo.
echo 请输入1,2,3或4,输入其他字符,后果自负.


:restart1
set /p select=请输入:
set /a select=%select%-0
if %select%==1 goto ipdnsipx
if %select%==2 goto netghost
if %select%==3 goto dianxin
if %select%==4 goto endend
if %select% gtr 4 goto errorselect1

:ipdnsipx

cls
echo              -------------------------------------------------------
echo.
echo                                      说明
echo                      本批处理可以根据不同使用场合按照提示
echo                      输入IP,DNS(最多支持两个DNS),网关,计算
echo                      机名.生成配置相关信息的脚本功能.
echo              -------------------------------------------------------

:restart5
color 0a
echo.
echo 请输入1或者2,输入其他字符,后果自负.
echo.
echo              1.生成自动配置计算机名,DNS,网关,IP脚本,IPX内部网络号
echo.
echo              2.返回主菜单
echo.
set /p select=请输入:
set /a select=%select%-0
if %select%==1 goto config5 
if %select%==2 goto  main
if %select% gtr 2 goto errorselect5
:config5

echo 开始生成配置计算机名,网关,DNS,IP,IPX协议内部网络号的脚本,请根据提示输入必要的参数
echo.

set ipaddr=192.168.0.
set mask1=254
set submask1=255.255.255.0
set qz=pc
set dns1=61.177.7.1
set dns2=192.168.0.254
echo 默认计算机名前缀为:%qz%,IP地址前三字段为:%ipaddr%,网关为:%ipaddr%%mask1%,子网掩码为%submask1%,第一DNS为%dns1%,第二DNS为%DNS2%.如需修改这里的信息,请注意下面的提示,按照提示输入即可完成相关信息的修改.否则,直接敲回车键将使用默认配置.
echo.
set /p ipaddr=请输入IP地址的前三个字段例如:192.168.0. 一定要按照这个格式输入:
color 70
set /p mask1=请输入网关最后一个字段,例如192.168.0.254中的254:
color 71
set /p submask1=请输入子网掩码,格式为255.255.255.0:
color 74
set /p qz=请输入计算机名前缀:
color 72
set /p dns1=请输入第一DNS地址：
color 73
set /p dns2=请输入第二DNS地址：
color fc
echo 正在生成配置脚本


echo @echo off>%systemroot%\ipconfig.bat
echo cls>>%systemroot%\ipconfig.bat
echo echo              --------------------------------------------------------->>%systemroot%\ipconfig.bat
echo echo                              QQ:66596854欢迎交流>>%systemroot%\ipconfig.bat
echo echo                              Mail:fan2800@hotmail.com>>%systemroot%\ipconfig.bat
echo echo.>>%systemroot%\ipconfig.bat
echo echo                                      说明>>%systemroot%\ipconfig.bat
echo echo                      本批处理可以实现根据需要自动配置IP，>>%systemroot%\ipconfig.bat
echo echo                      DNS，网关，计算机名,最多支持两个DNS>>%systemroot%\ipconfig.bat
echo echo                      批处理启动密码为wuliaodefei,可以根据>>%systemroot%\ipconfig.bat
echo echo                      需要修改变量PW来改变启动密码。修改适>>%systemroot%\ipconfig.bat
echo echo                      合自己的DNS，网关，计算机名.可以看批>>%systemroot%\ipconfig.bat
echo echo                      处理的相关注释的地方，在批处理的结尾>>%systemroot%\ipconfig.bat
echo echo                      还可以继续进行添加命令，实现更多功能，>>%systemroot%\ipconfig.bat
echo echo                      例如，导入CS的CD-KEY，自动安装冰点等.>>%systemroot%\ipconfig.bat
echo echo              ------------------------------------------------------->>%systemroot%\ipconfig.bat

echo set sz=3 >>%systemroot%\ipconfig.bat
echo :pw>>%systemroot%\ipconfig.bat
echo set /p pw=请输入密码：>>%systemroot%\ipconfig.bat
echo set /a sz=%%sz%%-1 >>%systemroot%\ipconfig.bat
echo if %%pw%%==wuliaodefei goto config>>%systemroot%\ipconfig.bat
echo echo 密码错误,还有%%sz%%次机会>>%systemroot%\ipconfig.bat
echo if %%sz%%==0 exit>>%systemroot%\ipconfig.bat
echo color ca >>%systemroot%\ipconfig.bat
echo goto pw>>%systemroot%\ipconfig.bat


echo :config>>%systemroot%\ipconfig.bat
echo cls>>%systemroot%\ipconfig.bat
echo color 0A>>%systemroot%\ipconfig.bat
echo echo 欢迎使用>>%systemroot%\ipconfig.bat
echo echo.>>%systemroot%\ipconfig.bat
echo cls>>%systemroot%\ipconfig.bat
echo :ipconfigstart>>%systemroot%\ipconfig.bat
echo set ip=0 >>%systemroot%\ipconfig.bat
echo set /p ip=请输入IP:>>%systemroot%\ipconfig.bat
echo if %%ip%%==0 goto errorip >>%systemroot%\ipconfig.bat
echo set /a ip=%%ip%%-0>>%systemroot%\ipconfig.bat

echo if %%ip%% lss 10 goto 1to9 >>%systemroot%\ipconfig.bat
echo if %%ip%% lss 100 goto 10to99>>%systemroot%\ipconfig.bat
echo if %%ip%% lss 255 goto 100to254>>%systemroot%\ipconfig.bat
echo if %%ip%% geq 255 goto error1>>%systemroot%\ipconfig.bat

echo :1to9>>%systemroot%\ipconfig.bat
echo set a=00>>%systemroot%\ipconfig.bat
echo goto ipconfig>>%systemroot%\ipconfig.bat


echo :10to99>>%systemroot%\ipconfig.bat
echo set a=00>>%systemroot%\ipconfig.bat
echo set /a a=%%a%%-0>>%systemroot%\ipconfig.bat
echo goto ipconfig>>%systemroot%\ipconfig.bat

echo :100to254>>%systemroot%\ipconfig.bat
echo set a=>>%systemroot%\ipconfig.bat

echo :ipconfig>>%systemroot%\ipconfig.bat
echo echo 您设置的计算机名为：%qz%%%a%%%%ip%% IP地址为：%ipaddr%%%ip%% 网关为：%ipaddr%%mask1%>>%systemroot%\ipconfig.bat
echo echo 开始配置计算机名>>%systemroot%\ipconfig.bat
echo color 1a >>%systemroot%\ipconfig.bat
echo reg add HKLM\system\currentcontrolset\control\computername\computername\ /v computername /t reg_sz /d %qz%%%a%%%%ip%% /f ^>nul>>%systemroot%\ipconfig.bat

echo reg add HKLM\system\currentcontrolset\services\tcpip\Parameters\ /v "NV Hostname" /t reg_sz /d %qz%%%a%%%%ip%% /f ^>nul>>%systemroot%\ipconfig.bat
echo echo 计算机名配置完成>>%systemroot%\ipconfig.bat
echo set /a ip=%%ip%%-0>>%systemroot%\ipconfig.bat
echo echo 开始配置IP,网关>>%systemroot%\ipconfig.bat
echo color 2a >>%systemroot%\ipconfig.bat
echo netsh interface ip set address "本地连接" source=static %ipaddr%%%ip%% %submask1% %ipaddr%%mask1% 1 ^>nul>>%systemroot%\ipconfig.bat

echo echo IP配置完成>>%systemroot%\ipconfig.bat
echo echo 开始配置DNS>>%systemroot%\ipconfig.bat
echo netsh interface ip set dns name="本地连接" source=static %dns1% primary ^>nul>>%systemroot%\ipconfig.bat
echo netsh interface ip add dns name="本地连接" %dns2% ^>nul>>%systemroot%\ipconfig.bat
echo echo DNS配置完成>>%systemroot%\ipconfig.bat
echo echo 开始配置IPX协议内部网络号>>%systemroot%\ipconfig.bat
echo color 3a >>%systemroot%\ipconfig.bat
echo reg add HKLM\SYSTEM\CurrentControlSet\Services\NwlnkIpx\Parameters /f /v VirtualNetworkNumber /t REG_DWORD /d %%ip%%>>%systemroot%\ipconfig.bat
echo echo IPX协议内部网络号配置完成>>%systemroot%\ipconfig.bat
echo echo 删除注册表自启动项>>%systemroot%\ipconfig.bat
echo reg delete HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v computerconfigscript >>%systemroot%/ipconfig.bat
echo echo 删除注册表启动项目完毕>>%systemroot%\ipconfig.bat


echo echo 系统将在30秒后自动重新启动，输入N取消重起，并在稍后手动重起计算机 >>%systemroot%\ipconfig.bat
echo start %%systemroot%%\system32\shutdown -r -t 30>>%systemroot%\ipconfig.bat
echo set /p restart1=>>%systemroot%\ipconfig.bat
echo if %%restart1%%==n start %%systemroot%%\system32\shutdown -a>>%systemroot%\ipconfig.bat
echo goto end>>%systemroot%\ipconfig.bat

echo :error1>>%systemroot%\ipconfig.bat
echo echo 您输入的IP违反了IP地址使用规则，请根据需要务必输入1--254之间的数字>>%systemroot%\ipconfig.bat
echo goto ipconfigstart>>%systemroot%\ipconfig.bat

echo :errorip>>%systemroot%\ipconfig.bat
echo echo 您没有输入IP,请重新输入>>%systemroot%\ipconfig.bat
echo goto ipconfigstart>>%systemroot%\ipconfig.bat
echo color fc >>%systemroot%\ipconfig.bat

echo :end>>%systemroot%\ipconfig.bat
echo rem 11月19日晚版>>%systemroot%\ipconfig.bat
echo exit>>%systemroot%\ipconfig.bat
echo 配置脚本生成完毕
echo 正在设置注册表自启动脚本
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /f /v computerconfigscript /t REG_SZ /d %systemroot%\ipconfig.bat >nul
echo 注册表启动项目添加完成
echo 10秒后程序自动退出或直接关闭程序退出
ping /n 15 127.0.0.1 >nul
exit


:errorselect5
echo 选择错误,请重新选择
goto restart5

:errorselect1
echo 选择错误,请重新选择
goto restart1


:netghost
color 0a
cls
echo              --------------------------------------------------------
echo.
echo                                      说明
echo                      本批处理可以按要求设置GHOST服务器的
echo                      相关信息,并自动调用GHOSTSERVER程序
echo                      以方便设置.本批处理只支持单网卡,网
echo                      络属性名称为"本地连接".否则此批处理
echo                      不适用或者达不到预期的效果.此脚本为
echo                      现场使用版,即当前的设置只对脚本运行
echo                      中起作用,脚本运行时非正常退出时也达
echo                      不到预期的效果,谢谢使用
echo              -------------------------------------------------------
echo.
echo          1.进入设置GHOST服务器
echo.
echo          2.自动还原以前设置
echo.
echo          3.返回主菜单
echo.
echo 请输入1,2或3,输入其他字符,后果自负.


:restart
set /p select=请输入:
set /a select=%select%-0
if %select%==1 goto config1 
if %select%==2 goto config2
if %select%==3 goto  main
if %select% gtr 3 goto errorselect

:config1
set /p ip1=请输入当前GHOST服务器需要使用的IP地址:
set /p mask1=请输入当前GHOST服务器需要使用的子网掩码:
echo @echo off >%systemroot%\netghost.bat
echo echo 备份当前的网络设置 >>%systemroot%\netghost.bat
echo ipconfig /all ^>%systemroot%\ipconfigbackup.txt>>%systemroot%\netghost.bat
echo echo 当前网络设置备份完成>>%systemroot%\netghost.bat
echo echo 清除当前DNS,网关设置>>%systemroot%\netghost.bat
echo netsh interface ip delete address "本地连接" gateway=all ^>nul >>%systemroot%\netghost.bat
echo netsh interface ip delete dns "本地连接" all ^>nul >>%systemroot%\netghost.bat
echo echo 配置当前网络设置 >>%systemroot%\netghost.bat
echo netsh interface ip set address "本地连接" source=static %ip1% %mask1% ^>nul >>%systemroot%\netghost.bat
echo echo 当前网络设置完毕 >>%systemroot%\netghost.bat
echo echo 启动GHOST服务端程序 >>%systemroot%\netghost.bat
echo start ghostsrv83.exe >>%systemroot%\netghost.bat
echo del %%systemroot%%\netghost.bat >>%systemroot%\netghost.bat
echo exit >>%systemroot%\netghost.bat
%systemroot%\netghost.bat
exit


:config2
find /i "IP Address" %systemroot%\ipconfigbackup.txt >ipaddr.txt
for /f "skip=2 tokens=15" %%p in (ipaddr.txt) do set ipaddr=%%p
find /i "Subnet Mask" %systemroot%\ipconfigbackup.txt >subnetmask.txt
for /f "skip=2 tokens=15" %%b in (subnetmask.txt) do set sub=%%b
find /i "Default Gateway" %systemroot%\ipconfigbackup.txt >gateway.txt
for /f "skip=2 tokens=13" %%g in (gateway.txt) do set gate=%%g
find /i "DNS Servers" %systemroot%\ipconfigbackup.txt >dnss.txt
for /f "skip=2 tokens=15" %%d in (dnss.txt) do set dns1=%%d
for /f %%n in (%systemroot%\ipconfigbackup.txt) do set dns2=%%n
del ipaddr.txt
del subnetmask.txt
del gateway.txt
del dnss.txt
echo %ipaddr% %sub% %gate% %dns1% %dns2%
echo @echo off >%systemroot%\restore.bat
echo echo 恢复IP,DNS,子网掩码,网关设置 >>%systemroot%\restore.bat
echo netsh interface ip set address "本地连接" source=static %ipaddr% %sub% %gate% 1 ^>nul >>%systemroot%\restore.bat
echo netsh interface ip set dns name="本地连接" source=static %dns1% primary ^>nul >>%systemroot%\restore.bat
echo netsh interface ip add dns name="本地连接" %dns2% ^>nul >>%systemroot%\restore.bat
echo echo 恢复完成>>%systemroot%\restore.bat
echo  del %%systemroot%%\restore.bat >>%systemroot%\restore.bat
echo exit >>%systemroot%\restore.bat
%systemroot%\restore.bat
exit

:errorselect
echo 选择错误,请重新选择
goto restart

:dianxin
color 0a
cls
echo              -------------------------------------------------------
echo.
echo                                      说明
echo                      本批处理可以按要求设置进行电信与网
echo                      通之间的线路切换.本批处理只支持单否
echo                      网卡,网络属性名称为"本地连接".则此
echo                      批处理不适用或者达不到预期的效果.
echo                      此脚本为现场使用版,即当前的设置只
echo                      对脚本运行中起作用,脚本运行时非正常
echo                      退出时也达不到预期的效果,谢谢使用                     
echo              -------------------------------------------------------
echo.
echo 请输入1或者2,输入其他字符,后果自负.
echo.
echo              1.进入电信网通线路切换生成器
echo.
echo              2.返回主菜单
echo.

:restart2
set /p select=请输入:
set /a select=%select%-0
if %select%==1 goto config3 
if %select%==2 goto  main
if %select% gtr 2 goto errorselect3

:config3
echo 特别注意:使用本脚本切换网关以后,在网络属性里面看到网关地址有出入,但不影响使用,此时在网络属性里面看到的网关,不起任何作用，但不要做任何操作.
echo.
set /p gateway1=请输入要切换的网关:
set /p dns1=请输入要切换的DNS地址:
echo @echo off >gatewaychange.bat
echo echo 切换中,请稍等.  >>gatewaychange.bat
echo netsh interface ip delete dns "本地连接" all ^>nul >>gatewaychange.bat
echo netsh interface ip set dns name="本地连接" source=static %dns1% primary ^>nul >>gatewaychange.bat
echo route delete 0.0.0.0 >>gatewaychange.bat
echo route add 0.0.0.0 mask 0.0.0.0 %gateway1% >>gatewaychange.bat
rem 到这里本脚本以实现了,生成切换电信与网通线路的脚本文件.只是生成脚本文件不会自动运行,方便只需要脚本文件然后自己处理生成后的脚本文件的朋友使用.
rem 把下面2行前面的rem字符删除,可以实现即时的线路切换(输入相关信息后会自动运行生成的脚本,无需要再次运行生成的脚本就可以完成线路切换)
rem echo del gatewaychange.bat >>gatewaychange.bat
rem gatewaychange.bat
exit

:errorselect3
echo 选择错误,请重新选择
goto restart2




:endend
exit




