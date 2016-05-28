<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/md5.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Action
 
    Action=Request("Action")
    Select Case Request("Action")
        Case "save"
             Call Save()
        Case Else 
		     Call Main()
    End Select
 
DataClose()

Sub Main() 
%>
<br>
<form name="form1" method="post" action="?">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th colspan="2" sytle="line-height:150%"> <b>管理员密码重设置</b></th>
      </tr>
      <tr> 
        <td width="12%" height="20" bgcolor=#ffffff>用户名：</td>
        <td width="88%" bgcolor=#ffffff> <input name="UserName" type="text" class="editbox" value="admin">  
        </td>
      </tr> 
      <tr> 
        <td height="20" bgcolor=#ffffff>新密码：</td>
        <td bgcolor=#ffffff><input name="PassWord" type="password" class="editbox" id="PassWord"></td>
      </tr>
      <tr>
        <td height="20" bgcolor=#ffffff>&nbsp;</td>
        <td bgcolor=#ffffff><input name="Submit" type="submit" class="button" value="提交"> 
          <input name="Action" type="hidden" id="Action" value="save"></td>
      </tr>
    </tbody>
  </table>
</form>
<%
End Sub

Sub Save()
    DataConn()
    Dim UserName,PassWord 
	UserName= Request("UserName") 
	PassWord= Request("PassWord") 
 
	If PassWord="" Then
	    strMsg=strMsg&"<li>请输入新密码!"
	End If    
	If strMsg<>"" Then
	    Call Msg()
	End If
	Set Rs=Server.CreateObject("ADODB.RecordSet")
 
    SQL="SELECT PassWord  FROM Admin WHERE UserName='"&UserName&"'"
    Rs.Open SQL,Conn,1,3 
    Rs("PassWord")=MD5(PassWord)
    Rs.Update
    Rs.Close
    Set Rs=Nothing
	strMsg="<li>密码修改完毕!"
    Call Msg()
End Sub
%>
</body>
</html>