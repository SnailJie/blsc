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
Admin_flag="32"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
    Action=Request("Action")
    Select Case Request("Action")
	    Case "add"
             Call Add()
        Case "del"
             Call Del()
        Case "edit"
             Call Edit()
        Case "update"
             Call Update()
        Case Else 
		     Call Main()
    End Select
End If

DataConn()

Sub Main() 
%>
<table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th width="9%" align="center" sytle="line-height:150%"> 编号</th>
      <th width="77%"> &nbsp;管理员名称</th>
      <th width="14%" align="center" sytle="line-height:150%"> 操作</th>
    </tr>
    <%
				sql="select id,username,password,super from admin order by id"
				set rs=conn.execute(sql)
				do while not rs.eof
				%>
    <tr> 
      <td align=center bgcolor=#ffffff height="20"><%=rs("id")%></td>
      <td bgcolor=#ffffff>&nbsp;<a href="javascript:;" onclick="document.myform.username.value='<%=rs("username")%>';document.myform.password.value='<%=rs("password")%>';document.myform.editid.value='<%=rs("id")%>'"><%=htmlencode(rs("username"))%></a></td>
      <td align=center bgcolor=#ffffff> 
        <%if rs("super")=1 then
				response.write "<font color=#999999 title=超级管理员，不能删除>删除</font>"
				else
				response.write "<a href=admin_user.asp?action=del&id="&rs("id")&">删除</a>"
				end if
				%>
        | <a href="admin_user.asp?userid=<%=rs("id")%>&action=edit">权限</a> </td>
    </tr>
    <%
				rs.movenext
				loop
				rs.close
				set rs=nothing
				%>
  </tbody>
</table>
<br>
<table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th sytle="line-height:150%"> <b>&nbsp;人员管理</b></th>
    </tr>
    <tr> 
      <td align=center bgcolor=#ffffff height="40"> <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="10">&nbsp;</td>
          </tr>
          <tr> 
            <td> <form name="myform" method="post" action="admin_user.asp?action=add">
                <font face="Arial, Helvetica, sans-serif" color="#999999">Username</font> 
                <input type="text" name="username" class="editbox" size="15">
                <font face="Arial, Helvetica, sans-serif" color="#999999">Password</font> 
                <input type="text" name="password" class="editbox" size="30" value="">
                <input type="submit" name="Submit" value="提交" class="button">
                <input type="reset" name="Submit2" value="重置" class="button">
                <input type="hidden" name="editid">
              </form></td>
          </tr>
        </table></td>
    </tr>
  </tbody>
</table>
<%
end sub

sub add()
	dim editid
	editid=request.form("editid")
	if checkstr(request.form("username"))="" or checkstr(request.form("password"))="" then
		response.redirect "admin_user.asp"
	end if
    dim username,password
	username=checkstr(request.form("username"))
    password=checkstr(request.form("password"))

	set rs=server.createobject("adodb.recordset")
	if editid<>"" then
	   sql="select username,password from admin where id="&editid
	   rs.open sql,conn,1,3
	   rs("username")=username
	   if rs("password")<>password then
	   rs("password")=md5(password)
	   end if
	   rs.update
	   rs.close
	   set rs=nothing
	   response.redirect url
	else
	   dim crs,count
	   set crs=conn.execute("select top 1 id from admin order by id desc")
	   if crs.eof or crs.bof then
       count=0
	   else
	   count=crs(0)
	   end if
	   crs.close
	   set crs=nothing

	   sql="select id,username,password,flag from admin where username='"&username&"'"
	   rs.open sql,conn,1,3
	   if not(rs.eof or rs.bof) then
	   strMsg=strMsg+"<li>已存在的用户!"
	   call Msg()
	   else
	   rs.addnew
	   rs("id")=count+1
	   rs("username")=username
       rs("password")=md5(password)
	   rs.update
	   rs.close
	   set rs=nothing
	   response.redirect url
	   end if
	end if
end sub
		
sub del()
    set rs=server.createobject("adodb.recordset")
    sql="select id,super from admin where id="&request("id")
	rs.open sql,conn,1,3
	if rs("super")=1 then
	founderr=true
	strMsg=strMsg+"<li>超级管理员，不能删除！"
	end if
	If strMsg<>"" Then
	call Msg()
	else
	rs.delete
	rs.close
	set rs=nothing
	response.redirect url
	end if
end sub

sub edit()
%>
<script language="JavaScript">
<!--
function CheckAll(form)
  {
  for (var i=0;i<form.elements.length;i++)
    {
    var e = form.elements[i];
    if (e.name != 'chkall')
       e.checked = form.chkall.checked;
    }
  }
//-->
</script>
<%
Dim Username,Super,Flag
Sql="Select Username,Flag From Admin Where Id="&Request("Userid")
Set Rs=Conn.Execute(Sql)
Username=Rs(0)
Flag=Rs(1)
Rs.Close
Set Rs=Nothing
%>
<table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th sytle="line-height:150%">给<font color=#ffffff><b> <%=username%> </b></font>分配管理员权限</th>
    </tr>
    <tr> 
      <td align=center bgcolor=#ffffff height="40"> <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="10">&nbsp;</td>
          </tr>
          <tr> 
            <td> <form name="flag" method="post" action="admin_user.asp?action=update">
<%
Dim Admin_menu(7,6),J
Admin_menu(0,0)="内容管理"
Admin_menu(0,1)="<a href=Admin_ArticleAdd.asp target=main>添加内容</a>"
Admin_menu(0,2)="<a href=Admin_Article.Asp target=main>内容管理</a>"
'Admin_menu(0,3)="<a href=Admin_Check.Asp target=main>审核内容</a>"
Admin_menu(0,3)="<a href=Admin_Search.Asp target=main>内容搜索</a>"
'Admin_menu(0,5)="<a href=Admin_Article.Asp?action=CreateIndexJs target=main title=如果基本设置里的首页分类显示方式选择的是JS调用,每次添加,修改,删除内容后请点此处>生成首页分类列表JS</a>"

Admin_menu(1,0)="分类管理" '、专题
Admin_menu(1,1)="<a href=Admin_class.asp target=main>分类管理</a>"
'Admin_menu(1,2)="<a href=Admin_Special.asp target=main>专题管理</a>"
Admin_menu(1,2)="<a href=Admin_class.asp?action=createjs target=main title=生成的JS有顶部分类菜单,搜索分类>生成搜索分类</a>"

'Admin_menu(2,0)="模板管理"
'Admin_menu(2,1)="<a href=Admin_template.asp target=main>模板管理</a>"
'Admin_menu(2,2)="<a href=Admin_template.asp?Action=reload target=main>刷新模板</a>"

Admin_menu(2,0)="文件管理"
Admin_menu(2,1)="<a href=javascript:Upload()>上传文件</a>"
Admin_menu(2,2)="<a href=Admin_file.asp target=main>查看上传文件</a>"

Admin_menu(3,0)="系统管理"
'Admin_menu(3,1)="<a href=Admin_setting.asp target=main>文件目录设置</a>"
'Admin_menu(3,2)="<a href=Admin_user.asp target=main>人员管理</a>"
Admin_menu(3,1)="<a href=Admin_password.asp target=main>密码修改</a>"

Admin_menu(4,0)="证件查询管理" 
Admin_menu(4,1)="<a href=Admin_addbook.asp target=main>证件信息添加</a>"
Admin_menu(4,2)="<a href=Admin_book.asp target=main>证件查询管理</a>"

'Admin_menu(5,0)="程序信息"
'Admin_menu(5,1)="<a href=Admin_e-Soft.asp title='获取关于本程序的最新动态' target=main>程序最新动态</a>"


Dim Admin_menuname
For I=0 To Ubound(Admin_menu,1)
    If IsEmpty(Admin_menu(I,0)) Then Exit For
    Response.Write ("<font class='bold'>"&admin_menu(i,0)&"</font><br>")
    For J=1 To Ubound(Admin_menu,2)
        If Isempty(Admin_menu(I,J)) Then Exit For
        Response.Write ("<input type='checkbox' name='flag' value='"&i&j&"' ")
        If InStr(session("flag"),"02")=0 Then Response.Write " disabled=true"
        If InStr(flag,i&j)<>0 Then Response.Write " checked"
        Response.Write (">")
        Response.Write (admin_menu(i,j)&"&nbsp;&nbsp; ")
    Next
	Response.Write ("<br><br>")
Next%>
                <input type=hidden name=userid value="<%=request("userid")%>">
                <input type="submit" name="Submit" value="更新" class="button">
                 
                <input name=chkall type=checkbox value=on onClick=CheckAll(this.form)>
                选择所有权限 </form></td>
          </tr>
        </table></td>
    </tr>
  </tbody>
</table>
<%End Sub

Sub Update()
   set rs=server.createobject("adodb.recordset")
   sql="select username,flag from admin where id="&request.form("userid")
   rs.open sql,conn,1,3
   rs("flag")=request.form("flag")
   rs.update
   if rs("username")=session("master") then session("flag")=request.form("flag") end if
   rs.close
   set rs=nothing
   response.redirect url
end sub
%>
</body></html>