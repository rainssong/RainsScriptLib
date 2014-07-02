::echo 特征：在每个盘根目录下自动生成sxs.exe,autorun.inf文件，有的还在windows\system32下生成SVOHOST.exe 或 sxs.exe ，文件属性为隐含属性。自动禁用杀毒软件 

::解决方法：建立批处理文件 （内容） 
@echo off 
taskkill /f /im sxs.exe /t 
taskkill /f /im SVOHOST.exe /t 
c: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf  
d: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf  
e: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf  
f: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf  
g: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
h: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
i: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
j: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
k: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
l: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
m: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
n: 
attrib sxs.exe -a -h -s  
del /s /q /f sxs.exe  
attrib autorun.inf -a -h -s  
del /s /q /f autorun.inf 
reg delete HKLM\Software\Microsoft\windows\CurrentVersion\explorer\Advanced\Folder\Hidden\SHOWALL /V CheckedValue /f 
reg add HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer\Advanced\Folder\Hidden\SHOWALL /v "CheckedValue" /t "REG_DWORD" /d "1" /f 
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /V sxs.exe /f 
REG DELETE HKLM\SOFTWARE\Microsoft\Windows\CurrentVersion\Run /V SVOHOST.exe /f 
exit 
 
 