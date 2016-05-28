<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<body>
<%
Response.Expires=0
Dim ID,Admin_Flag,Css
ID=Request.QueryString("ID")
Admin_flag="01"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If
DataConn()
SQL="Select Top 10 ID,ReUser,ReContent,AddDate From Remark Where ArticleID="&ID&" Order By ID Desc"
Set Rs=Conn.Execute(SQL)
If Not (Rs.EOF Or Rs.bof) then
    Response.Write "<script>"
	Response.Write "parent.followTd"&ID&".innerHTML=""<table width=100% border=0 cellspacing=1 cellpadding=2>"&_
    "<tr><th width=10% height=22 align=center>评论人</th>"&_
    "<th>评论内容(前10条,点击红色的评论数显示更多)</td></th>"&_
	"<th>操作</td></th>"
	i=0
	Do Until Rs.EOF
	    I=I+1
	    If I Mod 2=0 Then 
            Css="Table_row_2"
        Else
            Css="Table_row_1"
        End If
	    Response.Write "<tr class="&Css&"><td height=22 align=center>"&Server.HtmlEncode(Rs(1))&"</td>"
		Response.Write "<td width=79% align=left>"&HtmlEncode(Rs(2))&"</td>"
		Response.Write "<td width=11% align=center><a href='Admin_Remark.asp?Action=del&ID="&Rs(0)&"'>删除该评论</a></td></tr>"
		Rs.MoveNext
	Loop
End If
DataClose()
Response.Write "</table>"";"
Response.Write "</script>"
%>
</body>
</html>