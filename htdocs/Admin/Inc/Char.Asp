<%
Function CheckAdmin(Admin_Flag)
    CheckAdmin=False
    If Session("Master")="" Then 
	    CheckAdmin=False
	    Response.Redirect "Admin_index.Asp?action=Admin_login"
	    Exit Function
	Else
	    If InStr(Session("Flag"),Admin_Flag)=0 Or IsNull(Session("Flag"))=True Then
	        CheckAdmin=False
	    Else
	        CheckAdmin=True
	    End If
	End If
End Function

Function BigClass(intClassID)
	Dim Result
	Result=Result&"<select name=""ClassID"" id=""ClassID"">"&vbcrlf
	SQL="SELECT ID,Class FROM Class ORDER BY Orders"
	Set Rs=Conn.Execute(SQL)
	If Not (Rs.EOF Or Rs.BOF) Then
		Result=Result&"<option value=''>作为根分类</option>"
		Do Until Rs.EOF
			If CInt(intClassID)=Rs(0) Then
				Result=Result&"<option value="&Rs(0)&" selected>"&Rs(1)&"</option>"&vbcrlf
			Else
				Result=Result&"<option value="&Rs(0)&">"&Rs(1)&"</option>"&vbcrlf
			End If
			Rs.MoveNext
		Loop
	Else
		Result=Result&"<option value=''>尚未添加分类</option>"
	End If
	Set Rs=Nothing
	Result=Result&"</select>"&vbcrlf
	BigClass=Result
End Function

Sub SaveToFile(strBody,ByVal File)
    Dim objStream
    Set objStream = Server.CreateObject("ADODB.Stream")
    With objStream
        .Type = 2
        .Open
        .Charset = "GB2312"
        .Position = objStream.Size
		.WriteText = strBody
        .SaveToFile Server.MapPath(File),2
        .Close
    End With
    Set objStream = Nothing
End Sub

Sub TemplateList(Template,sName)
    Dim cRs
    Response.Write "<SELECT name='"&sName&"'>"
	SQL="SELECT T_Name,T_Path FROM Template_List"
    Set cRs=Conn.Execute(SQL)
	Do Until cRs.EOF 
	    If Template=cRs(1) Then 
            Response.Write "<Option value='"&cRs(1)&"' selected>"&cRs(0)&"</Option>"
		Else 
		    Response.Write "<Option value='"&cRs(1)&"'>"&cRs(0)&"</Option>"
		End If
		cRs.MoveNext
	Loop
	Response.Write "</Select>"
	Set cRs=Nothing
End Sub

Sub CheckForm()
    Title=CheckStr(Request.Form("Title"))
    If Title="" Then strMsg=strMsg&"<Li>标题不能为空。"
	ClassID=CheckStr(Request.Form("ClassID"))
	NClassID=CheckStr(Request.Form("NClassID"))
	Content=RTrim(Request.Form("Content"))
	If Content="" Then strMsg=strMsg&"<Li>内容不能为空。"
	Editor=Checkstr(Request.Form("Editor"))
    If Editor="" Then strMsg=strMsg&"<Li>责任编辑不能为空。"

    isHtml=Request.Form("EditMode")
	If isHtml="HTML" Then
	    isHtml=1
	Else 
	    isHtml=0
	End If
	Author=Checkstr(Request.Form("Author"))
    If Author="" Then Author="不详"
    Isindexpic=Request.Form("Indexpic")
	If isIndexPic="" Then isIndexPic=0
	isRecommend=Request.Form("Recommend")
	If isRecommend="" Then isRecommend=0
	Previewimg=Checkstr(Request.Form("Previewimg"))
	TitleColor=Request.Form("TitleColor")
	AddUser=CheckStr(Request.Form("AddUser"))
	SpecialID=Request.Form("SpecialID")
	adddate=Request.Form("adddate")
End Sub

Sub ClearApplication()
    On Error Resume Next
    Dim I
    For I=1 To Application.Contents.Count
        Application.Contents(I)=Empty
    Next
	Err.Clear
End Sub
%>