echo input FileName
set /P C=[File]:
C:\Windows\Microsoft.NET\Framework\v4.0.30319\ilasm /dll /output=%C%.dll /Resource=%C%.res %C%.il