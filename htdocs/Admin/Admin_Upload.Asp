<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="UploadClass.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%>-文件上传</title>
<link href="xfok.css" type=text/css rel=stylesheet>
<body bgcolor="#FFFFFF" leftmargin="5" topmargin="20">
<%
Dim Admin_Flag,action
Dim File_ext,UploadSize,Uploadpath
Dim Filepath,Filename,upOption1,upOption2,Randnum
Dim Fileext_a,Fileext,UpMode
UploadPath=Site_info(6)
UploadSize=Cint(Site_info(11))
File_ext=Site_info(12)
UpMode=Cint(Site_Info(15))  '1：无组件上传，2：lyfupload组件上传

Admin_Flag="31"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    Select Case Request.QueryString("action")
	    Case "upload"
		    Call Main()
		    Call UpLoad()
		Case Else
		    Call Main()
	End Select
End If

Sub Main()
%>
<Form name="myform" method="post" action="?action=upload&Mode=<%=Request.QueryString("Mode")%>" enctype="multipart/Form-data" >
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr> 
      <th align="center">文件上传</th>
    </tr>
    <tr> 
      <td height="30" align="center" ID="strMsg">允许上传的文件类型：<%=file_ext%> </td>
    </tr>
    <tr> 
      <td align="center">文件上传大小限制：<%=UploadSize%>K </td>
    </tr>
    <tr> 
      <td align="center"> 请选择上传文件： 
        <input type="file" name="file1" size=20 class=editbox>
        <input type="hidden" name="filename">
      </td>
    </tr>
	<%
	Select Case Request.QueryString("Mode")
		Case "Article"
	%>
	<tr> 
      <td align="center">上传选项：         
        <input name="upOption1" type="checkbox" id="upOption1" value="1" checked>        
        <label for=upOption1>内容</label>
        <input name="upOption2" type="checkbox" id="upOption2" value="1">
        <label For=upOption2>缩略图</label>
    </tr>
   
	<%
	Case "Special"
		Response.Write "<input type='hidden' name='upOption2' value='1'>"
	End Select
	%>
    <tr>
      <td align="center">
        <input type="submit" name="Submit" value="上传" onClick="filename.value=file1.value;" class=button>
      </td>
    </tr>
  </table>
</Form>
</body>
</html>
<%
End Sub

Sub UpLoad()
    Select Case UpMode
        Case 1
             soft_upload()
        Case 2
             lyfupload()
    End Select 
End Sub

'无组件上传
Sub Soft_Upload()
    Dim upload,file,uploadsuc,splitFile
	Dim upName
	set upload=new upfile_class
	upload.GetData (-1)

    filePath=UploadPath
	upOption1=Cint(upload.Form("upOption1"))
    upOption2=CInt(upload.Form("upOption2"))

    '在目录后加(/)
    If right(filePath,1)<>"/" Then filePath=filePath&"/" 
    
	For Each upName In upload.file
        Set file=upload.file(upName)
        If file.filesize<1 Then
           Response.Write "<script language=javascript>strMsg.innerHTML='请先选择你要上传的文件'</script>"
           Response.end
        End If
		fileExt=LCase(file.FileExt)
        uploadsuc=False
        splitFile=Split(File_ext,",")
        For i=0 to UBound(splitFile)
            If fileEXT=Trim(LCase(splitFile(i))) Then
                uploadsuc=True
                Exit For
            Else
			    uploadsuc=False
            End If
        Next
        If uploadsuc=False Then
	        Response.Write "<script language=javascript>strMsg.innerHTML='文件格式不正确'</script>"
	        Response.end
        End If   
        If file.FileSize>UploadSize*1024 Then
	        Response.Write "<script language=javascript>strMsg.innerHTML='文件大小超过了限制'</script>"
	        Response.end
        End If
        Randomize
        If upOption2=1 Then
	        filename=filePath&"s_"&Year(Now)&Month(Now)&Day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
        Else
	        filename=filePath&"ea_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
        End If

        file.SaveToFile Server.mappath("../"&FileName)   ''保存文件
		Response.Write "<script>"
		If upOption2=1 Then
            Response.Write "opener.myform.previewimg.value='"&filename&"';"
		End If
		If upOption1=1 Then 
            Response.Write "opener.myform.content.value+='[upload="&splitFile(i)&"]"&filename&"[/upload]';"&_
            "opener.frames.HtmlEditor.document.body.innerHTML+='[upload="&splitFile(i)&"]"&filename&"[/upload]';"
		End If
		Response.Write "</script>"			  
	Next
    Set file=Nothing
    Set upload=Nothing
    Response.Write "<script language=javascript>strMsg.innerHTML='文件上传成功！"&_
    "<br>文件地址："&filename&"'</script>"
End Sub

'lyfupload组件上传
Sub Lyfupload()
    On Error Resume Next
    Dim Obj,Ss
    Set obj = Server.CreateObject("LyfUpload.UploadFile")
	If Err.Number=-2147221005 Then 
	    Response.Write "<script language=javascript>strMsg.innerHTML='<font color=red>* 此服务器不支持LyfUpLoad组件上传，请使用无组件上传</font>'</script>"
        Exit Sub
    End If	   
    filePath=Uploadpath
	upOption1=Cint(obj.request("upOption1"))
    upOption2=Cint(obj.request("upOption2"))
    obj.maxsize=UploadSize*1024
    obj.extname=File_ext
    Randomize
    randNum=int(900*rnd)+100
    If obj.request("filename")="" or isnull(obj.request("filename")) Then
        Response.Write "<script language=javascript>strMsg.innerHTML='请先选择你要上传的文件'</script>"
        Exit Sub
    End If
    fileExt_a=split(obj.request("filename"),".")
    fileExt=lcase(fileExt_a(ubound(fileExt_a)))
    If upOption2=1 Then
        filename="s_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
    Else 
        filename="ea_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
    End If 
  
    ss=obj.SaveFile("file1", Server.MapPath("../"&filePath), True,filename) '保存文件到服务器
	Select Case ss
	    Case ""
            Response.Write ("<script language=javascript>strMsg.innerHTML='请先选择你要上传的文件!　'</script>")
        Case "0"
            Response.Write ("<script language=javascript>strMsg.innerHTML='文件大小超过了限制!'</script>")
        Case "1"
            Response.Write ("<script language=javascript>strMsg.innerHTML='文件格式不正确!　'</script>")
	    Case Else
    	    Response.Write "<script>"
            If upOption2=1 Then
                Response.Write "opener.myform.previewimg.value='"&filePath&filename&"';"
		    End If 
            If upOption1=1 Then 
                Response.Write "opener.myform.content.value+='[upload="&fileExt&"]"&filePath&filename&"[/upload]';"&_
                "opener.frames.HtmlEditor.document.body.innerHTML+='[upload="&fileExt&"]"&filePath&filename&"[/upload]';"
            End If
            Response.Write "strMsg.innerHTML='文件上传成功！<br>文件地址："&filePath&filename&"'"
            Response.Write "</script>"		
    End Select
End Sub
%>