<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
	<%
  dim messageid,messageback
  messageid=cint(request("messageid"))
  messageback=request("messageback")


Dim Admin_flag,Action
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn() 
   if messageback<>"" then
	sql="update book set messageback='"&messageback&"' where messageid="&messageid
	Conn.Execute sql 
  response.write "<script language='javascript'>" & chr(13)
	response.write "alert('回复成功！');" & Chr(13)
	response.write "window.document.location.href='admin_book.asp'"&Chr(13)
	response.write "</script>" & Chr(13)
end if
DataClose()
end if
%>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td>&nbsp;</td>
  </tr>
</table>
<table width="80%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr><form name="form1" method="post" action="">
    <td>
    	回复留言：<br>
    	 <textarea name="messageback" class="ninput" cols="60" rows="10">回复留言</textarea>
    	 <input name="messageid" value="<%=messageid%>" type="hidden"><input type="submit" value="回复">
    </td>
  </tr></form>
</table>
  

</body>
</html>
