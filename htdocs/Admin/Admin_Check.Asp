<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Id,NClassID,NClass,strClass
Admin_flag="03"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
	DataConn()
    PageSize=CInt(site_info(8))
    Select Case Request.QueryString("Action")
    Case "edit"
        Call edit()
    Case "check"
        Call check()
    Case Else 
        Call main()
    End Select
End If

DataClose()
  
Sub Main()
    Set Rs=Server.Createobject("Adodb.Recordset")
	SQL="SELECT A.ID,A.ClassID,A.NClassID,A.Title,A.AddUser,C.Class,N.NClass FROM (Article_NoCheck A LEFT JOIN Class C ON C.ID=A.ClassID) LEFT JOIN NClass N ON (A.NClassID=N.ID) ORDER BY A.ID DESC"
	Rs.CursorLocation=3
    Rs.Open Sql,Conn,1,1
    ShowContent
End Sub

Sub ShowContent()%>
<script language=javascript>
function CheckAll(form1)  {
  for (var i=0;i<form1.elements.length;i++)    {
    var e = form1.elements[i];
    if (e.name != 'chkall')       e.checked = form1.chkall.checked; 
   }
  }
</script>
<form name="form1" method="post" action="Admin_Batch.Asp">
  <table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th height=22 colspan="5">文章审核</th>
      </tr>
      <tr class="TopTitle"> 
        <td width="59">编号</td>
        <td width="502">&nbsp;标题（点击标题查看文章）</td>
        <td width="197">分类</td>
        <td width="90">投稿人</td>
        <td width="83">操作</td>
      </tr>
<%
    Dim Css
  	If Not (Rs.Bof And Rs.Eof) Then
	    ArticleCount=Rs.RecordCount
	    For i=1 To ArticleCount
            Id=Rs("Id")
            If I Mod 2=0 Then 
                Css="Table_row_1"
            Else
                Css="Table_row_2"
            End If
%>
      <tr>
        <td align=center class="<%=css%>"><%=ID%></td>
        <td class="<%=css%>">&nbsp;<a href="Admin_ArticleCheckEdit.Asp?ID=<%=ID%>"><%=Server.HtmlEncode(Rs("Title"))%></a></td>
        <td align="center" class="<%=css%>">
		<%
		If Rs("NClassID")=0 Then
			NClass="→无二级分类"
		Else
			NClass="→"&Rs("NClass")
		End If		
		strClass=Rs("Class")&NClass
		Response.Write "<font style='color:#006699' title='"&strClass&"'>"&CutStr(strClass,25)&"</font>"
		%>
		</td>
        <td align=center class="<%=css%>"><%=Server.HtmlEncode(Rs("AddUser"))%></td>
        <td align=center class="<%=css%>"> <input name="ArticleID" type="checkbox" id="ArticleID" value="<%=id%>"></td>
      </tr>
      <%
            Rs.Movenext
	    Next
	Else%>
      <tr bgcolor="#ffffff"> 
        <td height="25" colspan="5" align=center><font color="#006699"><b>没有需要审核的文章</b></font></td>
      </tr>
      <%	End If%>
      <tr> 
        <td height="30" colspan="5" class="table_row_1"> 
          <input type="checkbox" name="chkall" value="on" onClick="CheckAll(this.form)">
          全选/取消 
          <input name="action" type="radio" value="ArticleBatchDel">
          批量删除 
          <input type="radio" name="action" value="ArticleBatchCheck">
          批量审核
<input name="Submit" type="submit" class="button" id="Submit" value="执行" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}">
          <input name="Mode" type="hidden" id="Mode" value="Check"> </td>
      </tr>
    </tbody>
  </table>
</form>
<%End Sub%>
</body>
</html>