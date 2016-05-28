<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; chaRset=gb2312"></head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<script language=javascript>
function Upload(){
	window.open("admin_upload.asp?Mode=Special","Upload","left=0,top=0,width=400,height=280,status=1");
}
</script>
<br>
<%
Dim Admin_flag,Action,ID,SpecialName,SpecialRead,ClassID,strClass,Previewimg
Admin_flag="12"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
    SELECT Case Request("Action")
        Case "add"
            Call Add()
		Case "edit"
		    Call Edit()
		Case "edit_save"
		    Call Edit_Save()
        Case "del"
            Call Del()
        Case Else
            Call Main()
    End Select
End If

DataClose()

Sub Main()
%>
<table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th height=22 colspan="4" align="center" sytle="line-height:150%">专题列表（点击专题名称修改专题）</th>
    </tr>
    <tr> 
      <td width="5%" height=22 class="TopTitle" sytle="line-height:150%"> ID</td>
      <td height=22 class="TopTitle" sytle="line-height:150%"><div align="left">专题名称</div></td>
      <td width="20%" height=22 align="center" class="TopTitle" sytle="line-height:150%">所属分类</td>
      <td width="6%" height=22 align="center" class="TopTitle" sytle="line-height:150%">操作</td>
    </tr>
    <%
    SQL="SELECT S.*,C.Class FROM Special S INNER JOIN Class C ON C.ID=S.ClassID ORDER BY S.ID"
    Set Rs=Conn.Execute(SQL)
    If Rs.Eof Or Rs.Bof Then
		Response.Write ("<tr><td colspan='2' align='left'>&nbsp;尚未添加专题</td></tr>")	   
    Else
	    Do While Not Rs.EOF
			ID=Rs("ID")
			SpecialName=Rs("Name")
			strClass=Rs("Class")
			SpecialRead=Rs("SpecialRead")
			
%>
    <tr class="Table_row_1"> 
      <td align="left">&nbsp; <%=ID%></td>
      <td><%="<a href=?Action=edit&ID="&ID&">"&SpecialName&"</a>"%>&nbsp;</td>
      <td width="20%" align="center"><%=strClass%></td>
      <td width="6%" align="center"><a href="?Action=del&ID=<%=ID%>">删除</a> 
      </td>
    </tr>
    <%
			Rs.MoveNext
	    Loop
	End If 
	%>
  </tbody>
</table>
<br>
<form name="myform" method="post" action="?">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=21 colspan="2" sytle="line-height:150%">添加专题</th>
      </tr>
      <tr> 
        <td width="10%"> 专题名称： </td>
        <td width="90%"> <input name="SpecialName" type="text" class="editbox" id="SpecialName"></td>
      </tr>
      <tr> 
        <td>专题介绍：</td>
        <td><textarea name="SpecialRead" cols="40" rows="5" id="SpecialRead"></textarea> </td>
      </tr>
      <tr> 
        <td>所属分类：</td>
        <td><%=BigClass(0)%></td>
      </tr>
      <tr> 
        <td>专题图片：</td>
        <td><input name="previewimg" type="text" class="editbox" id="previewimg" size="40">
          <a href="javascript:Upload()">上传图片</a> （宽80,高最好不要超过80）</td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td><input type="submit" name="Submit" value="提交" class="button"> <input type="reSet" name="Submit2" value="重置" class="button"> 
          <input name="action" type="hidden" id="action" value="add"> </td>
      </tr>
    </tbody>
  </table>
</form>
<%
End Sub

Sub Edit()
    ID=CheckStr(Request.QueryString("ID"))
	SQL="SELECT * From Special WHERE ID="&ID
	Set Rs=Conn.Execute(SQL)
	ClassID=Rs("ClassID")
	SpecialName=Rs("Name")
	SpecialRead=Rs("SpecialRead")
	Previewimg=Rs("Previewimg")
	Set Rs=Nothing
%>
<form name="myform" method="post" action="?">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=21 colspan="2" sytle="line-height:150%">添加专题</th>
      </tr>
      <tr> 
        <td width="10%"> 专题名称： </td>
        <td width="90%"> <input name="SpecialName" type="text" class="editbox" id="SpecialName" value="<%=SpecialName%>"></td>
      </tr>
      <tr> 
        <td>专题介绍：</td>
        <td><textarea name="SpecialRead" cols="40" rows="5" id="SpecialRead"><%=SpecialRead%></textarea> 
        </td>
      </tr>
      <tr> 
        <td>所属分类：</td>
        <td><%=BigClass(ClassID)%></td>
      </tr>
      <tr> 
        <td>专题图片：</td>
        <td><input name="Previewimg" type="text" class="editbox" id="Previewimg" value="<%=Previewimg%>" size="40">
          <a href="javascript:Upload()">上传图片</a> （宽80,高最好不要超过80）</td>
      </tr>
      <tr> 
        <td>&nbsp;</td>
        <td><input type="submit" name="Submit" value="提交" class="button"> <input type="reSet" name="Submit2" value="重置" class="button"> 
          <input name="action" type="hidden" id="action" value="edit_save">
          <input name="GoUrl" type="hidden" id="GoUrl" value="<%=Url%>">
          <input name="ID" type="hidden" id="ID" value="<%=ID%>"></td>
      </tr>
    </tbody>
  </table>
</form>
<%
End Sub

Sub Add()
	SpecialName=CheckStr(Request.Form("SpecialName"))
	SpecialRead=CheckStr(Request.Form("SpecialRead"))
	ClassID=Request.Form("ClassID")
	Previewimg=CheckStr(Request.Form("Previewimg"))
	If SpecialName="" Then
		strMsg="<li>专题名称不能为空!"
		Call Msg()
	End If
	SQL="SELECT MAX(ID) FROM Special"
	Set Rs=Conn.Execute(SQL)
	ID=Rs(0)+1
	If IsNull(ID) Then ID=1

	SQL="INSERT INTO Special(ID,ClassID,Name,SpecialRead,Previewimg) VALUES("
	SQL=SQL&ID&","&ClassID&",'"&SpecialName&"','"&SpecialRead&"','"&Previewimg&"')"
	Response.Write SQL
	Conn.Execute(SQL)
	Set Rs=Nothing
	Response.Redirect Url
End Sub 

Sub Edit_Save()
	SpecialName=CheckStr(Request.Form("SpecialName"))
	SpecialRead=CheckStr(Request.Form("SpecialRead"))
	ClassID=Request.Form("ClassID")
	Previewimg=CheckStr(Request.Form("Previewimg"))
	SQL="UPDATE Special SET ClassID="&ClassID&",Name='"&SpecialName&"',SpecialRead='"&SpecialRead&"',Previewimg='"&Previewimg&"' WHERE ID="&Request.Form("ID")
	Conn.Execute(SQL)
	Set Rs=Nothing
	Response.Redirect Request.Form("GoUrl")
End Sub

Sub Del()
	ID=CheckStr(Request.QueryString("ID"))
	SQL="DELETE FROM Special WHERE ID="&ID
	Conn.Execute(SQL)
	SQL="UPDATE Article SET SpecialID=0 WHERE SpecialID="&ID
	Conn.Execute(SQL)
	Response.Redirect Url
End Sub
%>
</body>
</html>