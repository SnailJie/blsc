 <!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-��̨����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>  
<script src="../js/ubbcode.js"></script>
<script src="../js/selectlist.js"></script>
<script src="editor/checkform.js"></script>
<script src="../ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
 <script type="text/javascript">

function BrowseServer()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField;
	finder.popup();

	// It can also be done in a single line, calling the "static"
	// popup( basePath, width, height, selectFunction ) function:
	// CKFinder.popup( '../', null, null, SetFileField ) ;
	//
	// The "popup" function can also accept an object as the only argument.
	// CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

	</script>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID
Dim Title,Content,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor,SpecialID,contentjianxie
Dim ClassID,NClassID,Editor,Author,AddUser,adddate
Dim Action
Action=Request.Form("Action")
Admin_flag="01"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>��û�й���ҳ���Ȩ�ޡ�"
    Call Msg()
End If

DataConn()
Select Case Action
	Case "Save"
		Call Save()
	Case Else
		Call Main()
End Select 

DataClose()

Sub Main()
	ClassID=CInt(Request.QueryString("ClassID"))
	NClassID=CInt(Request.QueryString("NClassID"))
	If ClassID="" Then ClassID=0
	IF NClassID="" Then NClassID=0
%>
<script src="editor/edit.js" type="text/javascript"></script>
<form name="myform" method="post" action="?" onSubmit="return CheckForm(this);">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr> 
      <th colspan="2" id="succmsg">�������</th>
    </tr>
    <tr class="table_row_2"> 
      <td width="12%"><font color="#FF0000">���ݱ���: 
        <input name="titlecolor" type="hidden" id="titlecolor">
        </font></td>
      <td width="88%"> 
        <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%"><input type="text" name="title" size="50" class="editbox" id="title" style="color:#000000"><!-- ֧��HTML-->
            </td>
          </tr>
         <!-- <tr> 
            <td><script language=JavaScript src="editor/title_color.js"></script> 
              <TABLE id=ColorPanel cellSpacing=0 cellPadding=0 border=0>
                <TBODY>
                  <TR> 
                    <TD id=ColorUsed 
                     onclick="if(this.bgColor.length > 0) insertTag(this.bgColor)" 
                     vAlign=center align=middle> </TD>
                    <SCRIPT language=JavaScript>rgb(pas,width1,height1)</SCRIPT>
                  </TR>
                </TBODY>
              </TABLE></td>
          </tr> 
          -->
        </table></td>
    </tr> 
    </tr>
    <tr> 
      <td width="12%">��������:</td>
      <td> <input id="indexpic" type="checkbox" name="indexpic" value="1" />
        <label for=indexpic title="Ҳ���Գ�����ҳͼƬ����">�ӵ�����</label>
		<input id="Recommend" type="checkbox" name="Recommend" value="1" />
        <label for=Recommend>�Ƽ�����</label>
	  </td>
    </tr>
    <tr>
      <td width="12%">���ݷ���:</td>
      <td>
	  <%=CataLog(ClassID,NClassID)%>
    </tr> 
    <tr>
      <td width="12%">����ʱ��:</td>
      <td><input name="adddate" type="text" value=<%=date()%>>ע�⣺ҳ������ʱ�����򣬲��޸�Ĭ��Ϊ����ʱ��.��ʽ��2012-2-2</td>
    </tr> 
   <!-- <tr>
      <td width="12%">����Ʒ��:</td>
      <td>&nbsp;<%=Special(0)%></td>
    </tr> -->
	<tr>
      <td width="12%"><font color="#FF0000">��������:</font></td>
      <td>  </td>
    </tr>
    <tr id=e1> 
      <td colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0"> 
          <tr> 
            <td bgcolor="#FFFFFF"> 
              <textarea name="content" id="content" rows="5" cols="75"><%=content %></textarea>
	       <script type="text/javascript">
			        var editor=CKEDITOR.replace('content');
			         CKFinder.SetupCKEditor(editor,'../ckfinder/'); 
			  </script>
			 </td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF"><img src="images/editor/bian.gif" width="100%" height="13"></td>
          </tr>
        </table></td>
    </tr> 
     <tr> 
        <td bgcolor="#FFFFFF" colspan="2">
        	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
           <tr> 
           	<td bgcolor="#FFFFFF" align=center width=30>��<br>��<br>��<br>��</td>
             <td bgcolor="#FFFFFF"><textarea name="key" rows="5" cols="75" class="Content"></textarea> 
            </td>
         </tr>
      </table></td>
    </tr>
   
    <tr> 
      <td width="12%">����ͼ:</td>
      <td><input type="text" name="previewimg" class="editbox" size="36" id="xFilePath"><input type="button" value=" ��� " onclick="BrowseServer();" /></td>
    </tr>
    
    <tr> 
      <td width="12%">������:</td>
      <td><input type="text" name="writefrom" class="editbox" size="36"></td>
    </tr>
     
    <!--
    <tr> 
      <td width="12%">�ؼ���:</td>
      <td><input type="text" name="key" size="20" class="editbox"></td>
    </tr>
    <tr> 
      <td width="12%">��������:</td>
      <td><input type="text" name="author" size="20" class="editbox">
        ��<a href="javascript:" onClick="document.myform.author.value='����'">����</a></td>
    </tr>
    <tr> 
      <td width="12%">������Դ:</td>
      <td><input name="writefrom" type="text" class="editbox" value="<%=site_info(0)%>" size="20"></td>
    </tr>
    
    <tr> 
      <td width="12%">���α༭:</td>
      <td><%=session("master")%></td>
    </tr>
    -->
    <tr> 
      <td width="12%">��Դ:</td>
      <td><input type="text" name="author" size="20" class="editbox" value="">
        ��<a href="javascript:" onClick="document.myform.author.value='��վ'">��վ</a></td>
    </tr>
    <tr> 
      <td width="12%">���α༭:</td>
      <td><input name="Editor" type="text" id="Editor" value="<%=session("master")%>"></td>
    </tr>
        <input name="Action" type="hidden" id="Action" value="Save">
    <tr> 
      <th colspan="2"><input type="submit" name="Submit" value="�ύ" class=button> 
        &nbsp; <input type="reset" name="Submit2" value="����" class=button> </th>
    </tr>
  </table>
</form>
<%
End Sub

Sub Save()
    CheckForm()
	If strMsg<>"" Then 
	    Call Msg()
	Else
        Set Rs=Server.Createobject("Adodb.Recordset")
        Sql="Select * From Article"
        Rs.Open Sql,Conn,1,3
        Rs.Addnew
        Rs("ClassID")=ClassID
		Rs("NClassID")=NClassID
        Rs("Title")=Title
        Rs("Content")=Content
        Rs("sKey")=CheckStr(Request.Form("Key"))
        If Checkstr(Request.Form("Author"))="" Then
            Rs("Author")="����"
        Else
            Rs("Author")=Checkstr(Request.Form("Author"))
        End If
        If Checkstr(Request.Form("Writefrom"))="" Then
	        Rs("Writefrom")="��"
        Else
	        Rs("Writefrom")=Checkstr(Request.Form("Writefrom"))
        End If
        adddate=Checkstr(Request.Form("adddate"))
        Rs("isHtml")=isHtml
        Rs("isIndexPic")=isIndexPic
		If Previewimg<>"" Then 
			Rs("isPic")=1
		End If
        Rs("Previewimg")=Previewimg
		Rs("isRecommend")=isRecommend
	    Rs("TitleColor")=TitleColor
        Rs("Editor")=Editor
		Rs("SpecialID")=SpecialID
        Rs.Update
        Rs.Close
        Set Rs=Nothing
		Response.Redirect Url
	End If 
End Sub
%>
</body>
</html>