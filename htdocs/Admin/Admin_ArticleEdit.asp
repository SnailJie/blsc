<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-��̨����</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet> 
<script src="../ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script> 
<script src="../js/ubbcode.js"></script>
<script src="editor/checkform.js"></script>
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
Dim Admin_flag,ID,NID
Dim Title,Content,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor,Key,WriteFrom,SpecialID,contentjianxie
Dim ClassID,NClassID,Editor,Author,AddUser,adddate
Dim Action
Action=Request.Form("Action")
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>��û�й���ҳ���Ȩ�ޡ�"
    Call Msg()
End If
ID=CheckStr(Request.QueryString("ID"))

DataConn()

Select Case Action
	Case "Save"
		Call Save()
	Case Else
		Call Main()
End Select 
DataClose()

Sub Main()
	Sql="Select * From Article Where ID="&ID
	Set Rs=Conn.Execute(Sql)
	ID=Rs("ID")
	ClassID=Rs("ClassID")
	NClassID=Rs("NClassID")
	Title=Rs("Title")
	Content=Rs("Content")
	Key=Rs("sKey")
	Author=Rs("Author")
	WriteFrom=Rs("WriteFrom")
	AddUser=Rs("AddUser")
	isHtml=Site_Info(13)
	isHtml=Rs("isHtml")
	isIndexPic=Rs("isIndexPic")
	Previewimg=Rs("Previewimg")
	isRecommend=Rs("isRecommend")
	TitleColor=Rs("TitleColor")
	Editor=Rs("Editor")
	SpecialID=Rs("SpecialID")
	adddate=Rs("adddate")
	contentjianxie=Rs("contentjianxie")
	If Trim(Editor)="" Or IsNull(Editor) Then Editor=Session("Master")
	Set Rs=Nothing
%>
<script src="../js/selectlist.js"></script>
<script src="editor/edit.js" type="text/javascript"></script>
<form name="myform" method="post" action="?ID=<%=ID%>" onSubmit="return CheckForm(this);">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr> 
      <th colspan="2" id="succmsg">�޸�����</th>
    </tr>
    <tr> 
      <td width="12%" height="20"><font color="#FF0000">���ݱ���: 
        <input name="titlecolor" type="hidden" id="titlecolor" value="<%=TitleColor%>">
        </font></td>
      <td height="20"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%"><input name="title" type="text" class="editbox" id="title" style="color:#000000" value="<%=title%>" size="50">
              <!--֧��HTML --> </td>
          </tr>
         <!--  <tr> 
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
              </TABLE>
             
              </td>
          </tr>-->
        </table></td>
    </tr>
    
    <tr> 
      <td width="12%" height="20">��������:</td>
      <td height="20"><input id="indexpic" type="checkbox" name="indexpic" value="1" 
		<%if isindexpic=1 then response.write "checked"%> /> <label for=indexpic>�ӵ�����</label>
        <input id="Recommend" type="checkbox" name="Recommend" value="1" <%if isRecommend=1 then response.write "checked"%> /> 
        <label for=Recommend>�Ƽ�����</label> </td>
    </tr> 
    <tr> 
      <td width="12%" height="20">���ݷ���:</td>
      <td height="20"> <%=CataLog(ClassID,NClassID)%></td>
    </tr> 
     <tr> 
      <td width="12%" height="20">����ʱ��:</td>
      <td height="20"> <input name="adddate" type="text" value=<%= adddate %>>ע�⣺ҳ������ʱ�����򣬲��޸�Ĭ��Ϊ����ʱ��.��ʽ��2012-2-2
      	</td>
    </tr> 
    <!--<tr> 
      <td width="12%">����Ʒ��:</td>
      <td>22Special1(SpecialID)%></td>
    </tr> 
    -->
    <tr> 
      <td width="12%"><font color="#FF0000">��������:</font></td>
      <td> </td>
    </tr>
     
    <tr> 
      <td height="20" colspan="2"> <textarea name="content" id="content"><%=content %></textarea>
	    <script type="text/javascript">
			        var editor=CKEDITOR.replace('content');
			         CKFinder.SetupCKEditor(editor,'../ckfinder/'); 
			  </script>
			  </td>
    </tr>
    <tr> 
        <td bgcolor="#FFFFFF" colspan="2">
        	<table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
           <tr> 
           	<td bgcolor="#FFFFFF" align=center width=30>��<br>��<br>��<br>��</td>
             <td bgcolor="#FFFFFF"><textarea name="key" rows="5" cols="75" class="Content"><%=key%></textarea> 
            </td>
         </tr>
      </table></td>
    </tr>
    <tr> 
      <td width="12%" height="20">����ͼ:</td>
      <td height="40"> <input type="text" name="previewimg" class="editbox" size="36" value="<%=previewimg%>" id="xFilePath"><input type="button" value=" ��� " onclick="BrowseServer();" />
      </td>
    </tr>
   <tr> 
      <td width="12%">������:</td>
      <td><input type="text" name="writefrom" class="editbox" size="36" value="<%=writefrom%>"></td>
    </tr>
    <!--
    <tr> 
      <td width="12%" height="20">�ؼ���:</td>
      <td height="20"> <input type="text" name="key" size="20" class="editbox" value="<%=key%>"> 
      </td>
    </tr>
    <tr> 
      <td width="12%" height="20">��������:</td>
      <td height="20"> <input type="text" name="author" size="20" class="editbox" value="<%=author%>">
        ��<a href="javascript:" onClick="document.myform.author.value='����'">����</a></td>
    </tr>
    <tr> 
      <td width="12%" height="20">������Դ:</td>
      <td height="20"> <input type="text" name="writefrom" size="20" class="editbox" value="<%=writefrom%>"> 
      </td>
    </tr>
    <%If AddUser<>"" Then%>
    <tr> 
      <td width="12%" height="20">Ͷ����:</td>
      <td height="20"> <input type="text" name="AddUser" size="20" class="editbox" value="<%=AddUser%>"> 
      </td>
    </tr>
    <%End If%>
    
    <tr> 
      <td width="12%" height="20">���α༭:</td>
      <td height="20" width="88%"><%=Editor%> </td>
    </tr>
    -->
    <tr> 
      <td width="12%">��Դ:</td>
      <td><input type="text" name="author" size="20" class="editbox" value="<%=author%>">
        ��<a href="javascript:" onClick="document.myform.author.value='��վ'">��վ</a></td>
    </tr>
    <tr> 
      <td width="12%" height="20">���α༭:</td>
      <td height="20" width="88%"><input name="Editor" type="text" id="Editor" value="<%=Editor%>"></td>
    </tr>
     
        <input name="Action" type="hidden" id="Action" value="Save">
        <input name="GoUrl" type="hidden" id="GoUrl" value="<%=Url%>">
    <tr> 
      <th colspan="2"> <input type="submit" name="Submit" value="�ύ" class=button> 
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
        Sql="Select * From Article Where Id="&ID
        Rs.Open Sql,Conn,1,3
        Rs("ClassID")=ClassID
        Rs("Title")=Title
        Rs("Content")=Content
		Rs("NClassID")=NClassID
        Rs("sKey")=Checkstr(Request.Form("Key"))
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
       
		Rs("AddUser")=AddUser
		Rs("isHtml")=isHtml
		Rs("Isindexpic")=Isindexpic
		If Previewimg="" Then 
			Rs("isPic")=0
		End If
		Rs("Previewimg")=Previewimg
		Rs("isRecommend")=isRecommend
		Rs("TitleColor")=TitleColor
		Rs("Editor")=Editor
		Rs("SpecialID")=SpecialID
		Rs("adddate")=adddate
        Rs.Update
        Rs.Close
        Set Rs=Nothing
		Response.Redirect Url
	End If 
End Sub
%>
</body></html>