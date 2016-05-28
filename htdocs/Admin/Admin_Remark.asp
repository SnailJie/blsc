<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim ID,Admin_Flag,ArticleID
ID=Request.QueryString("ID")
Admin_Flag="01"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If
DataConn()

Set Rs=Conn.Execute("Select ArticleID From Remark Where ID="&ID)
If Rs.EOF Or Rs.BOF Then
    Response.Redirect Url
Else
    ArticleID=Rs(0)
    Set Rs=Nothing
    Conn.Execute("Delete From Remark Where ID="&ID)
    Conn.Execute("Update Article Set Remark=Remark-1 Where ID="&ArticleID)
End If
DataClose()
Response.Redirect Url
%>
</body>
</html>