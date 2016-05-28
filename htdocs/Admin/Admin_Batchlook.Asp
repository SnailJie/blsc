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
   
    Select Case Request.Form("Action")
	    Case "删除"
	            Call bookDel() 
			Case "修改"
			    Call bookedit()
			Case "添加"
			    Call bookadd()
			Case ""
			    Response.Redirect Url
    End Select
End If

Sub bookDel()
    Dim ArticleID
	 ArticleID=Request.Form("ArticleId") 
    If ArticleID="" Then Response.Redirect Url 
	  Sql="Delete From look Where messageid="&ArticleID
	Conn.Execute Sql 
	DataClose()
	Response.Redirect Url
End Sub

Sub bookedit()
    Dim ArticleID 
    ArticleID=Request.Form("ArticleId") 
    If ArticleID="" Then Response.Redirect Url 
	  Set Rs=Server.Createobject("Adodb.Recordset")
        Sql="Select * From look Where messageid="&ArticleID
        Rs.Open Sql,Conn,1,3 
        Rs("guestName")=Request.Form("guestName")
        Rs("gongsi")=Request.Form("gongsi")
				Rs("dizhi")=Request.Form("dizhi")
				Rs("dianhua")=Request.Form("dianhua")
				Rs("shouji")=Request.Form("shouji")
				Rs("youxiang")=Request.Form("youxiang")
				Rs("zhiye")=Request.Form("zhiye")
        Rs.Update
        Rs.Close
        Set Rs=Nothing
	Response.Redirect Url
End Sub

Sub bookadd() 
 
	  Set Rs=Server.Createobject("Adodb.Recordset") 
        Sql="Select * From look"
        Rs.Open Sql,Conn,1,3
        Rs.Addnew
        Rs("guestName")=Request.Form("guestName")
        Rs("gongsi")=Request.Form("gongsi")
				Rs("dizhi")=Request.Form("dizhi")
				Rs("dianhua")=Request.Form("dianhua")
				Rs("shouji")=Request.Form("shouji")
				Rs("youxiang")=Request.Form("youxiang")
				Rs("zhiye")=Request.Form("zhiye")
        Rs.Update
        Rs.Close
        Set Rs=Nothing
         
 Response.Redirect Url
End Sub
%>
</body>
</html>
 