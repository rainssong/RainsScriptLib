::~nx——不显示路径，但显示后缀
"" >FileList.txt
for %%a in (%*) do (
echo %%~nxa >>FileList.txt
)
msg %username% /time:10 "输出完成，请看FileList.txt"