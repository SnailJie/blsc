<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-��̨����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<script src="../ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
 
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID
Dim Title,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor
Dim citiesID,NcitiesID,Ncities,Editor,Author,AddUser,strcities
Dim Action
Action=Request.Querystring("Action")
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>��û�й���ҳ���Ȩ�ޡ�"
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
	SQL="SELECT * from look ORDER BY messageid DESC"
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
        targetImg.src="../images/expand.gif";
        if (targetImg.loaded=="no"){
          document.frames["hiddenframe"].location.replace("Admin_RemarkTree.asp?ID="+v_id);
        }
      }else{
      targetDiv.style.display="none";
      targetImg.src="../images/collapse.gif";
    }
  }
}
</script>
<script src="../js/selectlist.js"></script>

  <table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th colspan="4">��Ϣ�б�</th>
      </tr>
      <tr class="TopTitle"> 
        <td  >���</td> 
        <td > ��վLOGO</td> 
        <td>��վ��ַ</td>  
        <td>����</td>
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
             ID=Rs("messageid")
			 
             If I Mod 2=0 Then 
                Css="Table_row_1"
             Else
                Css="Table_row_2"
             End If
%><form name="myform" method="post" action="Admin_Batchlook.Asp">
      <tr class="Table_row_1"> 
        <td align=center><%=ID%></td>  

      	<td align=center>
		<img src="../<%=rs("guestName")%>" width=140> 
		<input type="text" name="guestName" class="ninput" size="25" value="<%=rs("guestName")%>" id="xFilePath<%=rs("messageid")%>"><input type="button" value=" ��� " onclick="BrowseServer<%=rs("messageid")%>();"></td> 
		<script type="text/javascript">

function BrowseServer<%=rs("messageid")%>()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField<%=rs("messageid")%>;
	finder.popup();

	// It can also be done in a single line, calling the "static"
	// popup( basePath, width, height, selectFunction ) function:
	// CKFinder.popup( '../', null, null, SetFileField ) ;
	//
	// The "popup" function can also accept an object as the only argument.
	// CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField<%=rs("messageid")%>( fileUrl )
{
	document.getElementById( 'xFilePath<%=rs("messageid")%>' ).value = fileUrl;
}

	</script>
		    <td valign=top> 
<input type="hidden" name="gongsi" value="��" checked>
                <input type="hidden" name="dizhi" class="ninput" size="40" value="0"> 
                <input type="hidden" name="dianhua" class="ninput" size="40"  value="0">
                <input type="hidden" name="shouji" class="ninput" size="40"  value="0">
                <input type="hidden" name="youxiang" class="ninput" size="40"  value="0"> 
 <input type="text" name="zhiye" class="ninput" size="25" value="<%=rs("zhiye")%>"> </td> 
        
		    <td align=center> 
		    	<input name="ArticleID" type="hidden" id="ArticleID" value="<%=id%>">
         <input name="Action" type="submit" class="button" id="Submit" value="�޸�" onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){return true;}return false;}">       
        <input name="Action" type="submit" class="button" id="Submit" value="ɾ��" onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){return true;}return false;}"> </td>
		  </tr> 
		  </form>
      <%
	         Rs.Movenext
  	      Loop
	Else%>
      <tr> 
        <td height="25" colspan="4" align="center"><font color="#006699"><b>��δ�������</b></font></td>
      </tr>
      <%	End If%>
      <tr> 
        <td height="30" colspan="4" class="table_row_1"> 
          <%
    Response.Write (ShowPage(PageCount,ArticleCount,Page,PageSize,"?citiesid="&Request.QueryString("citiesid")&"&"))
%>
        </td>
      </tr> 
    </tbody>
  </table>

<iframe width=0 height=0 src="" id="hiddenframe"></iframe>
<%End Sub

Sub CreateIndexJs()
	Dim Result
	Result=index_list
	Result=Replace(Result,vbcrlf,"")
	Result=Replace(Result,"""","\""")
	SaveToFile "document.write("""&Result&""");"&vbcrlf,"../js/index.js"
	strMsg="<li>��ҳ�����б�JS�������!"
	Call Msg()
End Sub
%>
</body>
</html>