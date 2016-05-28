<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; chaRset=gb2312"></head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Action
Admin_flag="11"
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
		Case "createjs"
		    Call CreateJs()
		Case "Up"
			Call Up(1)
		Case "Down"
			Call Down(1)
		Case "NUp"
			Call Up(2)
		Case "NDown"
			Call Down(2)
        Case Else
            Call Main()
    End Select
End If

DataClose()

Sub Main()
%>
<form name="myform" method="post" action="?">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=21 colspan="2" sytle="line-height:150%">添加分类</th>
      </tr>
      <tr> 
        <td width="21%"> 分类名称： <input name="ClassName" type="text" class="editbox" id="ClassName"> <!--<tr> 
        <td>分类模板： </td>
        <td>
          <%Call TemplateList("","Template")%>
        </td>
      </tr>
      -->
     父级分类： <%=BigClass(0)%> <input type="submit" name="Submit" value="提交" class="button"> <input type="reSet" name="Submit2" value="重置" class="button"> 
          <input name="action" type="hidden" id="action" value="add"> </td>
      </tr>
    </tbody>
  </table>
</form>
<table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th height=22 colspan="5" align="center" sytle="line-height:150%">分类列表<!--(分类改动后不要忘了点左边的"生成分类JS")--></th>
    </tr>
    <tr> 
      <td width="44%" height=22 class="TopTitle" sytle="line-height:150%"> 
        <div align="left">分类列表</div></td>
      <!--<td width="10%" height=22 align="center" class="TopTitle" sytle="line-height:150%">添加分类</td>-->
      <td width="10%" height=22 align="center" class="TopTitle" sytle="line-height:150%">添加内容</td>
      <td width="10%" height=22 align="center" class="TopTitle" sytle="line-height:150%">分类排序</td>
      <td width="10%" height=22 align="center" class="TopTitle" sytle="line-height:150%">删除分类</td>
    </tr>
    <%
	Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n
    SQL="SELECT Class.ID,Class.Class,Class.Orders,Class.Orders AS corder,NClass.ID AS NClassID,NClass.NClass,NClass.ParentID,NClass.Orders AS norder FROM Class LEFT JOIN NClass ON NClass.ParentID=Class.ID ORDER BY Class.Orders,NClass.Orders"
    Set Rs=Conn.Execute(SQL)
    If Rs.Eof Or Rs.Bof Then
		Response.Write ("<tr><td colspan='2' align='left'>&nbsp;尚未添加分类</td></tr>")	   
    Else
		strTemp=""
	    Do While Not Rs.EOF
			ClassID=Rs("ID")
			ParentID=Rs("ParentID")
			NClassID=Rs("NClassID")
			strClass=Rs("Class")
			strNClass=Rs("NClass")
			If strClass<>strTemp Then
				strTemp=strClass
	
%>
    <tr class="Table_row_1"> 
      <td align="left"> 
        <%Response.write "<img src='images/collapse.gif' align='absmiddle'>&nbsp;"
		  Response.Write ("<a href=?Action=edit&ClassID="&ClassID&"><font class=bold>" & strClass &"</font></a>")
		  %>
      </td>
      <!--<td width="10%" align="center">&nbsp; 
        <%Response.Write ("<a href=?ClassID="&ClassID&" style='color:#006699'>添加分类</a>")%>
      </td>
      -->
      <td width="10%" align="center">&nbsp; 
        <%Response.Write ("<a href=Admin_ArticleAdd.Asp?ClassID="&ClassID&" style='color:#006699'>添加内容</a> ")%>
      </td>
      <td width="10%" align="center">&nbsp; 
        <%Response.Write "<a href=?Action=Up&Orders="&Rs("corder")&">↑</a> "&" <a href=?Action=Down&Orders="&Rs("corder")&">↓</a>"%>
      </td>
      <td width="10%" align="center"> 
        <%Response.Write ("<a href=?Action=del&ClassID="&ClassID&"  onClick=""{if(confirm('该操作将删除分类『"&strClass&"』下的所有内容，确定执行吗?')){return true;}return false;}"">删除</a>")%>
      </td>
    </tr>
    <%
			End If
			If strNClass<>"" Then			
			%>
    <tr class="Table_row_2"> 
      <td align="left"> 
        <%Response.write "<img hspace=2 src=""images/blank.gIf"" width=""16"" height=""16"" align=absmiddle>"
		  Response.Write (" <a href=?Action=edit&NClassID="&NClassID&"&ParentID="&ParentID&" style='color:#006699'>" & strNClass &"</a>")%>
      </td>
     <!-- <td width="10%" align="center">&nbsp; </td>-->
     <td width="10%" align="center">&nbsp; 
        <%Response.Write ("<a href='Admin_ArticleAdd.Asp?ClassID="&ClassID&"&NClassID="&NClassID&"' style='color:#006699'>添加内容</a>")%>
      </td>
      <td width="10%" align="center">&nbsp; 
        <%Response.Write "<a href=?Action=NUp&classid="&ClassID&"&Orders="&Rs("norder")&">↑</a> "&" <a href=?Action=NDown&classid="&ClassID&"&Orders="&Rs("norder")&">↓</a>"%>
      </td>
      <td width="10%" align="center"> 
        <%Response.Write ("<a href=?Action=del&NClassID="&NClassID&"  onClick=""{if(confirm('该操作将删除分类『"&strNClass&"』下的所有内容，确定执行吗?')){return true;}return false;}"" style='color:#006699'>删除</a>")%>
      </td>
    </tr>
    <%
			End If
			Rs.MoveNext
	    Loop
	End If 
	%>
  </tbody>
</table>
 
<%
End Sub

Sub Edit()
    Dim eRs,ClassID,NClassID,ParentID
	ClassID=Request.QueryString("ClassID")
	NClassID=Request.QueryString("NClassID")
	ParentID=Request.QueryString("ParentID")
	If ClassID="" Then
		SQL="SELECT * From NClass WHERE ID="&NClassID
	Else
		SQL="SELECT * From Class WHERE ID="&ClassID
	End If
	Set eRs=Conn.Execute(SQL)
%>
<form name="myform" method="post" action="?">
  <table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=21 colspan="2" sytle="line-height:150%">修改分类</th>
      </tr>
      <tr> 
        <td width="21%"> 分类名称： </td>
        <td width="79%"> <input name="ClassName" type="text" class="editbox" id="ClassName" value="<%=eRs(1)%>"></td>
      </tr>
     <!-- <tr> 
        <td>分类模板： </td>
        <td>
          <%Call TemplateList(eRs("Template"),"Template")%>
          
        </td>
      </tr>
      -->
      <input name="oldClassID" type="hidden" id="oldClassID" value="<%=ClassID%>"> 
      <%If ClassID="" Then%>
      <tr> 
        <td>父级分类：</td>
        <td> <%=BigClass(ParentID)%> 
          <input name="oldParentID" type="hidden" id="oldParentID" value="<%=ParentID%>">
          <input name="NClassID" type="hidden" id="NClassID" value="<%=NClassID%>"></td>
      </tr>
      <%End If%>
      <tr> 
        <td>&nbsp;</td>
        <td> <input type="submit" name="Submit" value="提交" class="button"> <input type="reSet" name="Submit2" value="重置" class="button"> 
          <input name="action" type="hidden" id="action" value="edit_save"> <input name="GoUrl" type="hidden" id="GoUrl" value="<%=Url%>"></td>
      </tr>
    </tbody>
  </table>
</form>
<%
    Set eRs=Nothing
End Sub

Sub Add()
    Dim strClass,ClassTemplate,ClassID,NClassID,arrClassID,ParentID
	Dim CurrentID,CurrRootID,Orders
	strClass=CheckStr(Request.Form("ClassName"))
	ClassTemplate=CheckStr(Request.Form("Template"))
	ClassID=Request.Form("ClassID")
	If strClass="" Then
		strMsg="<li>分类名称不能为空"
		Call Msg()
	End If
	If ClassID="" Then
		Set Rs=Conn.Execute("SELECT Max(ID) FROM Class")
		If Rs.EOF Or Rs.BOF Then 
			CurrentID=1
		Else
			CurrentID=Rs(0)+1
		End If
		If IsNull(CurrentID) Then CurrentID=1
		Orders=CurrentID
		SQL="Insert Into Class(ID,Class,Orders,Template) Values("
		SQL=SQL&CurrentID&",'"&strClass&"',"&Orders&",'"&ClassTemplate&"')"
	ElseIf IsNumeric(ClassID) Then
	    Set Rs=Conn.Execute("SELECT Max(ID) FROM NClass")
		If Rs.EOF Or Rs.BOF Then 
			CurrentID=1
		Else
			CurrentID=Rs(0)+1
		End If
		If IsNull(CurrentID) Then CurrentID=1
		Orders=CurrentID
		SQL="Insert Into NClass(ID,NClass,ParentID,Orders,Template) Values("
		SQL=SQL&CurrentID&",'"&strClass&"',"&ClassID&","&Orders&",'"&ClassTemplate&"')"
	End If
	Conn.Execute(SQL)
	Set Rs=Nothing
	Response.Redirect Url
End Sub 

Sub Edit_Save()
    Dim strClass,ClassTemplate,ClassID,NClassID,ParentID
	strClass=CheckStr(Request.Form("ClassName"))
	ClassTemplate=CheckStr(Request.Form("Template"))
	ClassID=Request.Form("ClassID")
	ParentID=Request.Form("oldParentID")
	NClassID=Request.Form("NClassID")

	If strClass="" Then
		strMsg="<li>分类名称不能为空"
		Call Msg()
	End If
	If ParentID="" Then
		SQL="UPDATE Class Set Class='"&strClass&"',Template='"&ClassTemplate&"' WHERE ID="&Request.Form("oldClassID")
	Else
		If ClassID="" Then
			strMsg="<li>请选择正确的父级分类"
			Call Msg()
		End If
		SQL="UPDATE NClass Set NClass='"&strClass&"',ParentID="&ClassID&",Template='"&ClassTemplate&"' WHERE ID="&NClassID
		If CInt(ParentID)<>Cint(ClassID) Then '如果变更所属分类则更新相应内容分类
			Conn.Execute("UPDATE Article SET ClassID="&ClassID&" Where ClassID="&ParentID&" and nclassid="&nClassID )
		End If
	End If
	Conn.Execute(SQL)
	Set Rs=Nothing
	Response.Redirect Request.Form("GoUrl")
End Sub

Sub Del()
    Dim ClassID,NClassID
	ClassID=Request.QueryString("ClassID")
	NClassID=Request.QueryString("NClassID")
	If ClassID<>"" Then
		SQL="SELECT Count(ID) FROM NClass WHERE ParentID="&ClassID
		Set Rs=Conn.Execute(SQL)
		If Rs(0)>=1 Then
			strMsg="<li>该分类下含有子分类,请删除子分类后再进行本操作"
			Call Msg()
		End If
	End If
	If ClassID<>"" Then
		Conn.Execute("DELETE FROM Class WHERE ID="&ClassID)
		Conn.Execute("DELETE FROM Article WHERE ClassID="&ClassID)
	ElseIf NClassID<>"" Then
		Conn.Execute("DELETE FROM NClass WHERE ID="&NClassID)
		Conn.Execute("DELETE FROM Article WHERE NClassID="&NClassID)	
	End If
	Response.Redirect Url
End Sub

Sub CreateJs()
    SaveArticleClass()
	strMsg="<li>分类JS生成完毕!"
	Call Msg()
End Sub

Sub SaveArticleClass()
    Dim strArticleClass,strClass,strTemp
    Dim navMenu,navMenu2,ParentID2,ParentID,ClassID,n
	SQL="SELECT Class.ID,Class.Class,NClass.ID As NClassID,NClass.NClass,NClass.ParentID FROM Class LEFT JOIN NClass ON NClass.ParentID=Class.ID ORDER BY Class.Orders,NClass.Orders"
	Set Rs=Conn.Execute(SQL)
	If Not (Rs.EOF Or Rs.BOF) Then
		strTemp=""
		i=-1
		Do Until Rs.EOF
			ClassID=Rs(0)
			strClass=Rs(1)
			ParentID=Rs(2)
			If strClass<>strTemp Then
				strTemp=strClass
				i=i+1
				If Rs("NClass")<>"" Then
					navMenu2=navMenu2&"document.write('<img src=Images/navbar_Separator.gif align=absmiddle> <a class=nav onMouseOver=showmenu(event,"&i&",1,false) onMouseOut=delayhidemenu() href=""List.Asp?ClassID="&ClassID&""">"&strClass&"</a> ');"&vbcrlf
				Else
					navMenu2=navMenu2&"document.write('<img src=Images/navbar_Separator.gif align=absmiddle> <a class=nav href=""List.Asp?ClassID="&ClassID&""">"&strClass&"</a> ');"&vbcrlf
				End If
				navMenu=navMenu&"linkset["&i&"]=new Array()"&vbcrlf
				n=0
			End If
			n=n+1
			navMenu=navMenu&"linkset["&i&"]["&n&"]=""<div class=menuitems><a href=List.Asp?ClassID="&ClassID&"&NClassID="&ParentID&" class=menulink>"&Rs("NClass")&"</a></div>"""&vbcrlf
			ParentID2=Rs("ParentID")
			Rs.MoveNext
		Loop
	End If
    Set Rs=Nothing
	SaveToFile navMenu&navMenu2,"../js/NavMenu.js"
	SaveToFile CataLog_JS(0,-1),"../js/SearchClass.js"
End Sub

Sub Down(Mode)
	Dim OldOrders,NewOrders
	If Mode=1 Then
		SqlStr=" FROM Class where 1=1 and "
	ElseIf Mode=2 Then
		SqlStr=" FROM NClass  where ParentID="&Request("ClassID")&" and "
	End If
	Set Rs=Server.CreateObject("ADODB.RecordSet")
	Sql="Select Top 2 Orders "&SqlStr&"  Orders>="&Request.QueryString("Orders")&" Order By Orders"
	Rs.Open SQL,Conn,1,3
	If Not (Rs.EOF Or Rs.BOF) Then
		OldOrders=rs("orders")
		Rs.MoveNext
		If Not (Rs.EOF Or  Rs.BOF) Then
			NewOrders=Rs("orders")
			Rs("orders")=OldOrders
			Rs.Update
			Rs.MovePrevious
			if NewOrders=OldOrders then
				NewOrders=NewOrders+1
			end if
			Rs("orders")=NewOrders
			Rs.Update
		End If
	End If
	Rs.Close
	Set Rs=Nothing
	Response.Redirect Url
End Sub

Sub Up(Mode)
	Dim OldOrders,NewOrders
	If Mode=1 Then
		SqlStr=" FROM Class where 1=1 and "
	ElseIf Mode=2 Then
		SqlStr=" FROM NClass  where ParentID="&Request("ClassID")&" and "
	End If
	Set Rs=Server.CreateObject("ADODB.RecordSet")
	SQL="Select Top 2 Orders "&SqlStr&"  Orders<="&Request.QueryString("Orders")&" Order By Orders Desc"
	Rs.open sql,conn,1,3
	If Not (Rs.EOF Or Rs.BOF) Then
		OldOrders=Rs("orders")
		Rs.MoveNext
		If Not (Rs.EOF Or Rs.BOF) Then
			NewOrders=Rs("orders")
			Rs("orders")=OldOrders
			Rs.Update
			Rs.MovePrevious
			if NewOrders=OldOrders then
				NewOrders=NewOrders-1
			end if
			Rs("orders")=NewOrders
			Rs.Update
		End If
	End If
	Rs.Close
	Set Rs=Nothing
	Response.Redirect Url
End Sub

Function CataLog_JS(intClassID,intNClassID)
	Dim Result
	SQL="SELECT ID,NClass,ParentID FROM NClass ORDER BY Orders"
	Result=Result&"var nclassid="&intNClassID&";"&vbcrlf
	Set Rs=Server.CreateObject("ADODB.RecordSet")
	Rs.Open SQL,Conn,1
	If Not (Rs.EOF Or Rs.BOF) Then
		i=-1
		Do Until Rs.EOF			
			If intNClassID=Rs(0) Then
				
			End If
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(2)&""""&vbcrlf
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(1)&""""&vbcrlf
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(0)&""""&vbcrlf
			Rs.MoveNext
		Loop
	End If
	Set Rs=Nothing

	Result=Result&"document.write (""<select onChange=\""Kermy_JS('setDynaList(arrNSet)')\"" name=\""ClassID\"" id=\""ClassID\"">"");"&vbcrlf
	SQL="SELECT ID,Class FROM Class ORDER BY Orders"
	Set Rs=Conn.Execute(SQL)
	If Not (Rs.EOF Or Rs.BOF) Then
		Result=Result&"document.write (""<option value=0>→ 无一级分类</option>"");"&vbcrlf
		Do Until Rs.EOF
			If intClassID=Rs(0) Then
				Result=Result&"document.write (""<option value="&Rs(0)&" selected>"&Rs(1)&"</option>"");"&vbcrlf
			Else
				Result=Result&"document.write (""<option value="&Rs(0)&">"&Rs(1)&"</option>"");"&vbcrlf
			End If
			Rs.MoveNext
		Loop
	Else
		Result=Result&"document.write (""<option value=0>尚未添加一级分类</option>"");"&vbcrlf
	End If
	Set Rs=Nothing
	Result=Result&"document.write (""</select>"");"&vbcrlf

	Result=Result&"document.write (""<select name=\""NClassID\"" id=\""NClassID\""></select>"");"&vbcrlf
	CataLog_JS=Result
End Function
%>
</body>
</html>