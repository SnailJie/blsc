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
Dim Admin_flag,Action
Admin_flag="21"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
    Select Case Request("Action")
	    Case "del"
		    Call Del()
        Case "edit"
            Call Edit()
		Case "save"
		    Call Save()
		Case "add"
		    Call Add()
		Case "reload"
		    Call ReLoad()
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
      <th height=22 colspan="3" align="center" sytle="line-height:150%">模板列表(点击模板名称进入模板文件列表)</th>
    </tr>
    <tr class="TopTitle"> 
      <td width="43%" align="left">模板名称 </td>
      <td width="21%" align="center">模板路径</td>
      <td width="36%" align="right">操作</td>
    </tr>
    <%
	Dim ID,strTname,Css,n
    Sql="Select * From Template_List"
    Set Rs=Conn.Execute(Sql)
    If Not(Rs.Eof Or Rs.Bof) Then
	    Do Until Rs.EOF
			N=N+1
			ID=Rs(0)
			strTname=Rs(1)
			If n Mod 2=0 Then 
				Css="Table_row_2"
			Else
				Css="Table_row_1"
			End If
	%>
    <tr class="<%=Css%>"> 
      <td align="left"><a href="Admin_TemplateList.Asp?TPath=<%=Rs(2)%>"><%=strTname%></a></td>
      <td align="center"><%=Rs(2)%></td>
      <td align="right"> <a href="?Action=edit&ID=<%=ID%>&TPath=<%=Rs(2)%>&TName=<%=strTname%>">编辑</a> 
        | <a href="?Action=del&ID=<%=ID%>&TPath=<%=Rs(2)%>" onClick="{if(confirm('该操作将删除 Template/<%=Rs(2)%> 下的所有模板文件，确定执行吗?')){return true;}return false;}">删除</a> </td>
    </tr>
    <%
	       Rs.MoveNext
	    Loop
	End If 
	%>
    <tr class="Table_row_1"> 
      <td colspan="3" align="left"><font color="#FF0000">注：如果服务器支持FSO，删除模板的同时也将删除<font color="#0000FF">Template/</font>下的相应模板目录，请慎重操作。</font></td>
    </tr>
  </tbody>
</table>
<form name="form1" method="post" action="?action=add">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=22 colspan="2" align="center" sytle="line-height:150%">添加模板</th>
      </tr>
      <tr class="table_row_1"> 
        <td width="11%" align="left">模板名称 </td>
        <td><input name="T_Name" type="text" class="editbox" id="T_Name"></td>
      </tr>
      <tr> 
        <td align="left">模板路径</td>
        <td><input name="T_Path" type="text" class="editbox" id="T_Path">
          <font color="#FF0000">*路径后需加&quot;<font color="#0000FF">/</font>&quot;</font></td>
      </tr>
      <tr class="table_row_1"> 
        <td align="left">&nbsp;</td>
        <td><input name="Submit" type="submit" class="button" value="确认">
        </td>
      </tr>
    </tbody>
  </table>
</form>
<%
End Sub

Sub Edit
%>
<form name="form1" method="post" action="?action=save">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=22 colspan="2" align="center" sytle="line-height:150%">模板编辑(Template/<%=Request.QueryString("TPath")%>)</th>
      </tr>
      <tr class="table_row_1"> 
        <td width="11%" align="left">模板名称 </td>
        <td><input name="T_Name" type="text" class="editbox" id="T_Name" value="<%=Request.QueryString("TName")%>"></td>
      </tr>
      <tr> 
        <td align="left">模板路径</td>
        <td><input name="T_Path" type="text" class="editbox" id="T_Path" value="<%=Request.QueryString("TPath")%>">
          <font color="#FF0000">*路径后需加&quot;<font color="#0000FF">/</font>&quot;</font></td>
      </tr>
      <tr class="table_row_1"> 
        <td align="left">&nbsp;</td>
        <td><input name="Submit" type="submit" class="button" value="确认"> 
          <input name="T_ID" type="hidden" id="T_ID" value="<%=Request.QueryString("ID")%>">
          <input name="Action" type="hidden" id="Action" value="save"></td>
      </tr>
    </tbody>
  </table>
</form>
<%
End Sub

Sub Del()
    Dim ID,Count
	ID=Request.QueryString("ID")
	SQL="Select Count(ID) From Template_List"
	Set Rs=Conn.Execute(SQL)
	Count=Rs(0)
	Set Rs=Nothing
	If Count<=1 Then 
	    strMsg="<Li>这已经是最后一个模板了,再删就没了 :("
        Call Msg()
	Else
  	    Conn.Execute("Delete From Template_List Where ID="&ID)
		DelFolder(Trim(Request.QueryString("TPath")))
	    Response.Redirect Url
	End If 
End Sub

Sub Save()
    Dim ID,TName,TPath
	ID=Request.Form("T_ID")
	TName=Trim(Request.Form("T_Name"))
	TPath=Trim(Request.Form("T_Path"))
	If Right(TPath,1)<>"/" Then
	    strMsg="<li>路径后需加左斜杠： /"
		Call Msg()
	End If
	Conn.Execute("Update Template_List Set T_Name='"&TName&"',T_Path='"&TPath&"' Where ID="&ID)
	Response.Redirect "admin_template.asp"
End Sub

Sub Add()
    Dim ID,TName,TPath
	SQL="Select Max(ID) From Template_List"
	Set Rs=Conn.Execute(SQL)
	ID=Rs(0)+1
	Set Rs=Nothing
	TName=Trim(Request.Form("T_Name"))
	TPath=Trim(Request.Form("T_Path"))
	If Right(TPath,1)<>"/" Then
	    strMsg="<li>路径后需加左斜杠： /"
		Call Msg()
	End If
	Conn.Execute("Insert Into Template_List (ID,T_Name,T_Path) Values("&ID&",'"&TName&"','"&TPath&"')")
	Response.Redirect "admin_template.asp"
End Sub

Sub DelFolder(folder)
    Dim objFS
	On Error Resume Next
    Set objFS=Server.CreateObject("Scripting.FileSystemObject")
	objFS.DeleteFolder Server.MapPath(Article_Url&"Template/"&folder),true
	If Err.Number<>0 Then
	    Err.Clear
		Exit Sub
	End If
	Set objFs=Nothing
End Sub

Sub ReLoad()
    ClearApplication()
	strMsg="<li>模板刷新完毕！"
	Call Msg()
End Sub
%>
</body>
</html>