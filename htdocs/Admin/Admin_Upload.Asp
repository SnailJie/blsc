<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="UploadClass.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%>-�ļ��ϴ�</title>
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
UpMode=Cint(Site_Info(15))  '1��������ϴ���2��lyfupload����ϴ�

Admin_Flag="31"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>��û�й�����ҳ���Ȩ�ޡ�"
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
      <th align="center">�ļ��ϴ�</th>
    </tr>
    <tr> 
      <td height="30" align="center" ID="strMsg">�����ϴ����ļ����ͣ�<%=file_ext%> </td>
    </tr>
    <tr> 
      <td align="center">�ļ��ϴ���С���ƣ�<%=UploadSize%>K </td>
    </tr>
    <tr> 
      <td align="center"> ��ѡ���ϴ��ļ��� 
        <input type="file" name="file1" size=20 class=editbox>
        <input type="hidden" name="filename">
      </td>
    </tr>
	<%
	Select Case Request.QueryString("Mode")
		Case "Article"
	%>
	<tr> 
      <td align="center">�ϴ�ѡ�         
        <input name="upOption1" type="checkbox" id="upOption1" value="1" checked>        
        <label for=upOption1>����</label>
        <input name="upOption2" type="checkbox" id="upOption2" value="1">
        <label For=upOption2>����ͼ</label>
    </tr>
   
	<%
	Case "Special"
		Response.Write "<input type='hidden' name='upOption2' value='1'>"
	End Select
	%>
    <tr>
      <td align="center">
        <input type="submit" name="Submit" value="�ϴ�" onClick="filename.value=file1.value;" class=button>
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

'������ϴ�
Sub Soft_Upload()
    Dim upload,file,uploadsuc,splitFile
	Dim upName
	set upload=new upfile_class
	upload.GetData (-1)

    filePath=UploadPath
	upOption1=Cint(upload.Form("upOption1"))
    upOption2=CInt(upload.Form("upOption2"))

    '��Ŀ¼���(/)
    If right(filePath,1)<>"/" Then filePath=filePath&"/" 
    
	For Each upName In upload.file
        Set file=upload.file(upName)
        If file.filesize<1 Then
           Response.Write "<script language=javascript>strMsg.innerHTML='����ѡ����Ҫ�ϴ����ļ�'</script>"
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
	        Response.Write "<script language=javascript>strMsg.innerHTML='�ļ���ʽ����ȷ'</script>"
	        Response.end
        End If   
        If file.FileSize>UploadSize*1024 Then
	        Response.Write "<script language=javascript>strMsg.innerHTML='�ļ���С����������'</script>"
	        Response.end
        End If
        Randomize
        If upOption2=1 Then
	        filename=filePath&"s_"&Year(Now)&Month(Now)&Day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
        Else
	        filename=filePath&"ea_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
        End If

        file.SaveToFile Server.mappath("../"&FileName)   ''�����ļ�
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
    Response.Write "<script language=javascript>strMsg.innerHTML='�ļ��ϴ��ɹ���"&_
    "<br>�ļ���ַ��"&filename&"'</script>"
End Sub

'lyfupload����ϴ�
Sub Lyfupload()
    On Error Resume Next
    Dim Obj,Ss
    Set obj = Server.CreateObject("LyfUpload.UploadFile")
	If Err.Number=-2147221005 Then 
	    Response.Write "<script language=javascript>strMsg.innerHTML='<font color=red>* �˷�������֧��LyfUpLoad����ϴ�����ʹ��������ϴ�</font>'</script>"
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
        Response.Write "<script language=javascript>strMsg.innerHTML='����ѡ����Ҫ�ϴ����ļ�'</script>"
        Exit Sub
    End If
    fileExt_a=split(obj.request("filename"),".")
    fileExt=lcase(fileExt_a(ubound(fileExt_a)))
    If upOption2=1 Then
        filename="s_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
    Else 
        filename="ea_"&year(Now)&month(Now)&day(Now)&hour(Now)&minute(Now)&second(Now)&randNum&"."&fileExt
    End If 
  
    ss=obj.SaveFile("file1", Server.MapPath("../"&filePath), True,filename) '�����ļ���������
	Select Case ss
	    Case ""
            Response.Write ("<script language=javascript>strMsg.innerHTML='����ѡ����Ҫ�ϴ����ļ�!��'</script>")
        Case "0"
            Response.Write ("<script language=javascript>strMsg.innerHTML='�ļ���С����������!'</script>")
        Case "1"
            Response.Write ("<script language=javascript>strMsg.innerHTML='�ļ���ʽ����ȷ!��'</script>")
	    Case Else
    	    Response.Write "<script>"
            If upOption2=1 Then
                Response.Write "opener.myform.previewimg.value='"&filePath&filename&"';"
		    End If 
            If upOption1=1 Then 
                Response.Write "opener.myform.content.value+='[upload="&fileExt&"]"&filePath&filename&"[/upload]';"&_
                "opener.frames.HtmlEditor.document.body.innerHTML+='[upload="&fileExt&"]"&filePath&filename&"[/upload]';"
            End If
            Response.Write "strMsg.innerHTML='�ļ��ϴ��ɹ���<br>�ļ���ַ��"&filePath&filename&"'"
            Response.Write "</script>"		
    End Select
End Sub
%>