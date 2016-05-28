<!--#include file="../inc/Const.asp"-->
<html>
<style type="text/css">
<!--
td {
	font-size: 12px; line-height: 18px
}

body {
	font-size: 12px;
	scrollbar-arrow-color: #ffffff;
	scrollbar-3dlight-color: #006699;
	scrollbar-base-color: #006699;
	scrollbar-track-color: #006699;
}
-->
</style>
<body>
<%
If Session("Master")="" Then
    Response.Redirect "Admin_index.Asp?action=Admin_login"
End If

Dim Action
Action=UCase(Request.Querystring("Action"))

If Action="ARTICLE" Or Action="ARTICLE_NOCHECK" Then
    DataConn()
    Dim ID
    ID=Request.Querystring("ID")
    Set Rs = Conn.Execute ("SELECT Content FROM "&Action&" WHERE ID="&ID)
    If Not (Rs.Eof And Rs.Bof) Then
	    Response.Write Rs(0)
    End If
    Set Rs=Nothing
    DataClose()
End If 
%>
</body>
</html>