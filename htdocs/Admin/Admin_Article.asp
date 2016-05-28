<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID
Dim Title,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor
Dim ClassID,NClassID,NClass,Editor,Author,AddUser,strClass
Dim Action
Action=Request.Querystring("Action")
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If

DataConn()
PageSize=CInt(site_info(9))

Select Case Action
	Case "CreateIndexJs"
		Call CreateIndexJs()
	Case Else 
		Call Main()
End Select

DataClose()

Sub Main()
    Set Rs=Server.Createobject("Adodb.Recordset")
	SQL="SELECT A.NClassID,A.ID,A.Title,A.Author,A.AddDate,A.Hits,A.Remark,A.TitleColor,A.isIndexPic,A.isPic,C.Class,N.NClass FROM (Article A LEFT JOIN Class C ON C.ID=A.ClassID) LEFT JOIN NClass N ON (A.NClassID=N.ID) ORDER BY A.ID DESC"
	Rs.CursorLocation=3
    Rs.Open Sql,Conn,1
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
function load_tree(v_id){
  var targetImg =eval("document.all.followImg" + v_id);
  var targetDiv =eval("document.all.follow" + v_id);
  if (targetImg.src.indexOf("nofollow")!=-1){return false;}
    if ("object"==typeof(targetImg)){
      if (targetDiv.style.display!='block'){
        targetDiv.style.display="block";
        targetImg.src="images/expand.gif";
        if (targetImg.loaded=="no"){
          document.frames["hiddenframe"].location.replace("Admin_RemarkTree.asp?ID="+v_id);
        }
      }else{
      targetDiv.style.display="none";
      targetImg.src="images/collapse.gif";
    }
  }
}
</script>
<script src="../js/selectlist.js"></script>
<form name="myform" method="post" action="Admin_Batch.Asp">
  <table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th colspan="5">内容列表</th>
      </tr>
      <tr class="TopTitle"> 
        <td width="7%">编号</td>
        <td width="52%">&nbsp;标题</td>
        <td width="29%">所属分类</td>
        <!--<td width="6%">评论</td>-->
        <td width="6%">操作</td>
      </tr>
    <%
	ArticleCount=Rs.RecordCount
    Dim Css
    Page=Request.QueryString("Page")
    If Page="" Or Page<1 Then 
        Page=1
    Else
        Page=Cint(Page)
    End If 
	I=1
	If ArticleCount Mod Cint(PageSize)=0 Then
	    PageCount= ArticleCount \ Cint(PageSize)
	Else
	    PageCount= ArticleCount \ Cint(PageSize)+1
  	End If

  	If Not (Rs.Bof And Rs.Eof) Then
	   Rs.Movefirst
	   If Page > PageCount Then Page = PageCount
	   If Page<1 Then Page=1
	      Rs.Move (Page-1) * Cint(PageSize)
  	      Do While Not Rs.Eof And I<=PageSize
	         I=I+1      
             ID=Rs("ID")
			 
             If I Mod 2=0 Then 
                Css="Table_row_1"
             Else
                Css="Table_row_2"
             End If
%>
      <tr class="<%=Css%>"> 
        <td align=center><%=ID%></td>
        <td>&nbsp;<img src="images/collapse.gif" name="followImg<%=ID%>" width="15" height="15" id="followImg<%=ID%>" onclick="load_tree(<%=ID%>)" loaded="no" style="CURSOR: hand" align="absmiddle" title="点击显示该内容的前10条评论"> 
          &nbsp;<a href="Admin_ArticleEdit.Asp?ID=<%=ID%>"><%=CutStr(Rs("Title"),37)%></a> 
          <%if Rs("isindexpic")=1 then Response.Write " <img src=images/img.gif alt=视点内容 align=absmiddle>"%>
          <%if Rs("isPic")=1 then Response.Write " <img src=images/jpg.gif alt=图片内容 align=absmiddle>"%>
          &nbsp;&nbsp;</td>
        <td>
		<%
		If Rs("NClassID")=0 Then
			NClass="→无二级分类"
		Else
			NClass="→"&Rs("NClass")
		End If		
		strClass=Rs("Class")&NClass
		Response.Write "<font style='color:#006699' title='"&strClass&"'>"&CutStr(strClass,25)&"</font>"
		%></td>
        <!--<td align=center><%="<a href=../Remark.asp?id="&id&" target=_blank><b><font color=red>"&rs("Remark")&"</font></b></a>"%></td>-->
        <td align=center> 
          <input name="ArticleID" type="checkbox" id="ArticleID" value="<%=id%>"></td>
      </tr>
      <tr class="<%=Css%>" id=follow<%=id%> style="DISPLAY: none"> 
        <td colspan="5" id=followTd<%=id%> style="PADDING-RIGHT: 0px; PADDING-LEFT: 0px; PADDING-BOTTOM: 0px; PADDING-TOP: 0px"> 
          <DIV style="BORDER-RIGHT: black 1px solid; PADDING-RIGHT: 2px; BORDER-TOP: black 1px solid; PADDING-LEFT: 2px; PADDING-BOTTOM: 2px; MARGIN-LEFT: 18px; BORDER-LEFT: black 1px solid; WIDTH: 240px; COLOR: #000000; PADDING-TOP: 2px; BORDER-BOTTOM: black 1px solid; BACKGROUND-COLOR: #ededed" onclick="load_tree(<%=id%>)">正在读取本内容的评论，请稍侯……</DIV></td>
      </tr>
      <%
	         Rs.Movenext
  	      Loop
	Else%>
      <tr> 
        <td height="25" colspan="5" align="center"><font color="#006699"><b>尚未添加内容</b></font></td>
      </tr>
      <%	End If%>
      <tr> 
        <td height="30" colspan="5" class="table_row_1"> 
          <%
    Response.Write (ShowPage(PageCount,ArticleCount,Page,PageSize,"?Classid="&Request.QueryString("Classid")&"&"))
%>
        </td>
      </tr>
      <tr> 
        <td height="35" colspan="5" class="table_row_2"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
            <tr> 
              <td>移动内容:</td>
              <td><%=CataLog(0,-1)%> 
                <input type="checkbox" name="chkall" value="on" onClick="CheckAll(this.form)">
                全选/取消 
                <input name="action" type="radio" value="ArticleBatchDel">
                批量删除 
                <input type="radio" name="action" value="ArticleBatchMove">
                批量移动 
                <input name="Submit" type="submit" class="button" id="Submit" value="执行" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}"> 
              </td>
            </tr>
          </table></td>
      </tr>
    </tbody>
  </table>
</form>
<iframe width=0 height=0 src="" id="hiddenframe"></iframe>
<%End Sub

Sub CreateIndexJs()
	Dim Result
	Result=index_list
	Result=Replace(Result,vbcrlf,"")
	Result=Replace(Result,"""","\""")
	SaveToFile "document.write("""&Result&""");"&vbcrlf,"../js/index.js"
	strMsg="<li>首页分类列表JS生成完毕!"
	Call Msg()
End Sub
%>
</body>
</html>