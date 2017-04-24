function checkcode(path)
    set inStream=CreateObject("ADODB.Stream") 
    inStream.Type=1 
    inStream.Mode=3 
    inStream.Open 
    inStream.Position=0 
    inStream.LoadFromFile path 
    bom=inStream.Read(2) 
    If AscB(MidB(bom,1,1))=&HEF And AscB(MidB(bom,2,1))=&HBB Then 
        checkcode="UTF-8" 
    ElseIf AscB(MidB(bom,1,1))=&HFF And AscB(MidB(bom,2,1))=&HFE Then 
        checkcode="UNICODE" 
    Else 
        checkcode="GB2312" 
    End If 
    inStream.Close 
    set inStream=nothing 
end function 

inCharset = checkcode(Wscript.Arguments(0)) 
If inCharset<>"UTF-8" Then 
    set fso=CreateObject("Scripting.FileSystemObject") 
    fso.CopyFile Wscript.Arguments(0), Wscript.Arguments(0) & ".bak" 
    set inStream=CreateObject("ADODB.Stream") 
    inStream.Type=2 
    inStream.Mode=3 
    inStream.Charset=inCharset 
    inStream.Open 
    inStream.LoadFromFile Wscript.Arguments(0) 
    buf=inStream.ReadText 
    inStream.Close 
    set inStream=nothing 
    set outStream=CreateObject("ADODB.Stream") 
    outStream.Type=2 
    outStream.Mode=3 
    outStream.Charset="UTF-8" 
    outStream.Open 
    outStream.WriteText buf 
    outStream.SaveToFile Wscript.Arguments(0), 2 
    outStream.Flush 
    outStream.Close 
    set outStream=nothing 
End If 