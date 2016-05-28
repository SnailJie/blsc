<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Action
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
    Select Case Request("Action")
        Case "ArticleBatchDel"
            Call ArticleBatchDel()
        Case "ArticleBatchMove"
            Call ArticleBatchMove()
		Case "ArticleBatchCheck"
		    Call ArticleBatchCheck()
		Case ""
		    Response.Redirect Url
    End Select
End If

Sub ArticleBatchDel()
    Dim ArticleID,Mode
	ArticleID=Request.Form("ArticleId")
	Mode=Request.Form("Mode")
    If ArticleID="" Then Response.Redirect Url
	If Mode="Check" Then
	    Sql="Delete From Article_NoCheck Where ID In ("&ArticleID&")"
	Else
	    Sql="Delete From Article Where Id In ("&ArticleID&")"
	End If
	Conn.Execute Sql
	If Mode="" Then
		'删除相关评论
    	Conn.Execute("Delete From Remark Where ArticleID In ("&ArticleID&")")
	End If
	DataClose()
	Response.Redirect Url
End Sub

Sub ArticleBatchMove()
    Dim ArticleID,ClassID,NClassID
	ArticleID=Request.Form("ArticleId")
	ClassID=Request.Form("ClassID")
	NClassID=Request.Form("NClassID")
	If ClassID="" Then ClassID=0
	If ClassID=0 Then 
		strMsg="<li>请选择目的分类"
    	Call Msg()
	Else
        If ArticleID="" Then Response.Redirect Url
        SQL="UPDATE Article SET ClassID="&ClassID&",NClassID="&NClassID&" Where Id In ("&ArticleID&")"
        Conn.Execute SQL
		Set Rs=Nothing
	    DataClose()
	    Response.Redirect Url
	End If 
End Sub

Sub ArticleBatchCheck()
    Dim ArticleID
	ArticleID=Request.Form("ArticleId")
	If ArticleID="" Then Response.Redirect Url
    SQL="Insert Into Article (ClassID,NClassID,Title,Content,sKey,Author,WriteFrom,AddUser) "
    SQL=SQL&"Select ClassID,NClassID,Title,Content,sKey,Author,WriteFrom,AddUser "
    SQL=SQL&"From Article_NoCheck Where Id In ("&ArticleID&")"
    Conn.Execute(SQL)

    Conn.Execute("Delete From Article_NoCheck Where Id In ("&ArticleID&")")
	DataClose()
	Response.Redirect Url
End Sub
%>
</body>
</html>