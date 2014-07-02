@echo off 
echo "虚拟主机C盘权限设定" 
echo "Author:an85.com" 

echo "删除C盘的everyone的权限" 
cd/ 
cacls "%SystemDrive%" /r "everyone" /e 
cacls "%SystemRoot%" /r "everyone" /e 
cacls "%SystemRoot%/Registration" /r "everyone" /e 
cacls "%SystemDrive%/Documents and Settings" /r "everyone" /e 

echo "删除C盘的所有的users的访问权限" 
cd/ 
cacls "%SystemDrive%" /r "users" /e 
cacls "%SystemDrive%/Program Files" /r "users" /e 
cacls "%SystemDrive%/Documents and Settings" /r "users" /e 

cacls "%SystemRoot%" /r "users" /e 
cacls "%SystemRoot%/addins" /r "users" /e 
cacls "%SystemRoot%/AppPatch" /r "users" /e 
cacls "%SystemRoot%/Connection Wizard" /r "users" /e 
cacls "%SystemRoot%/Debug" /r "users" /e 
cacls "%SystemRoot%/Driver Cache" /r "users" /e 
cacls "%SystemRoot%/Help" /r "users" /e 
cacls "%SystemRoot%/IIS Temporary Compressed Files" /r "users" /e 
cacls "%SystemRoot%/java" /r "users" /e 
cacls "%SystemRoot%/msagent" /r "users" /e 
cacls "%SystemRoot%/mui" /r "users" /e 
cacls "%SystemRoot%/repair" /r "users" /e 
cacls "%SystemRoot%/Resources" /r "users" /e 
cacls "%SystemRoot%/security" /r "users" /e 
cacls "%SystemRoot%/system" /r "users" /e 
cacls "%SystemRoot%/TAPI" /r "users" /e 
cacls "%SystemRoot%/Temp" /r "users" /e 
cacls "%SystemRoot%/twain_32" /r "users" /e 
cacls "%SystemRoot%/Web" /r "users" /e 
cacls "%SystemRoot%/WinSxS" /r "users" /e 

cacls "%SystemRoot%/system32/3com_dmi" /r "users" /e 
cacls "%SystemRoot%/system32/administration" /r "users" /e 
cacls "%SystemRoot%/system32/Cache" /r "users" /e 
cacls "%SystemRoot%/system32/CatRoot2" /r "users" /e 
cacls "%SystemRoot%/system32/Com" /r "users" /e 
cacls "%SystemRoot%/system32/config" /r "users" /e 
cacls "%SystemRoot%/system32/dhcp" /r "users" /e 
cacls "%SystemRoot%/system32/drivers" /r "users" /e 
cacls "%SystemRoot%/system32/export" /r "users" /e 
cacls "%SystemRoot%/system32/icsxml" /r "users" /e 
cacls "%SystemRoot%/system32/lls" /r "users" /e 
cacls "%SystemRoot%/system32/LogFiles" /r "users" /e 
cacls "%SystemRoot%/system32/MicrosoftPassport" /r "users" /e 
cacls "%SystemRoot%/system32/mui" /r "users" /e 
cacls "%SystemRoot%/system32/oobe" /r "users" /e 
cacls "%SystemRoot%/system32/ShellExt" /r "users" /e 
cacls "%SystemRoot%/system32/wbem" /r "users" /e 

echo "添加iis_wpg的访问权限" 
cacls "%SystemRoot%" /g iis_wpg:r /e 
cacls "%SystemDrive%/Program Files/Common Files" /g iis_wpg:r /e 

cacls "%SystemRoot%/Downloaded Program Files" /g iis_wpg:c /e 
cacls "%SystemRoot%/Help" /g iis_wpg:c /e 
cacls "%SystemRoot%/IIS Temporary Compressed Files" /g iis_wpg:c /e 
cacls "%SystemRoot%/Offline Web Pages" /g iis_wpg:c /e 
cacls "%SystemRoot%/System32" /g iis_wpg:c /e 
cacls "%SystemRoot%/Tasks" /g iis_wpg:c /e 
cacls "%SystemRoot%/Temp" /g iis_wpg:c /e 
cacls "%SystemRoot%/Web" /g iis_wpg:c /e 

echo "添加iis_wpg的访问权限[.net专用]" 
cacls "%SystemRoot%/Assembly" /g iis_wpg:c /e 
cacls "%SystemRoot%/Microsoft.NET" /g iis_wpg:c /e 

echo "添加iis_wpg的访问权限[装了MACFEE的软件专用]" 
cacls "%SystemDrive%/Program Files/Network Associates" /g iis_wpg:r /e 

echo "添加users的访问权限" 
cacls "%SystemRoot%/temp" /g users:c /e 