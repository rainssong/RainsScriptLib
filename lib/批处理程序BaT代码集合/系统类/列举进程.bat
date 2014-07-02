@echo for each ps in getobject _ >ps.vbs
@echo ("winmgmts:\\.\root\cimv2:win32_process").instances_ >>ps.vbs
@echo wscript.echo ps.handle^&vbtab^&ps.name^&vbtab^&ps.executablepath:next >>ps.vbs
cscript //nologo ps.vbs & del ps.vbs
pause