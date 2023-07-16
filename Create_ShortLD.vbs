Set wshell = CreateObject("WScript.Shell")
Set fso = CreateObject("Scripting.FileSystemObject")
Dim sLinkFile : sLinkFile = "Launch_DARK - SC.lnk"
Dim strPD : strPD = wshell.CurrentDirectory
Set oLink = wshell.CreateShortcut(sLinkFile)
Dim pathS : pathS = strPD & "\Launch_DARK.bat"
If (fso.FileExists(pathS)) Then
    oLink.TargetPath = pathS
    oLink.WorkingDirectory = strPD
    oLink.save
End If