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
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID,shenhe
Dim Title,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor
Dim citiesID,NcitiesID,Ncities,Editor,Author,AddUser,strcities
Dim Action,Rs1,Rs0
Set Rs1=Server.CreateObject("ADODB.RecordSet") 
Set Rs0=Server.CreateObject("ADODB.RecordSet") 
Action=Request.Querystring("Action")
Admin_flag="41"
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
	SQL="SELECT * from userinfo where id="&Request.Querystring("id")&" ORDER BY id DESC"
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
        <th colspan="5"> ��Ϣ </th>
      </tr>
      <tr class="TopTitle">  
        <td> ��Ϣ</td>
        <td>���״̬</td>   
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
             ID=Rs("id")
			 
             If I Mod 2=0 Then 
                Css="Table_row_1"
             Else
                Css="Table_row_2"
             End If
             dim tt
            
%><form name="myform" method="post" action="Admin_Batchbook.Asp">
      <tr class="Table_row_1">  
		    <td valign=top align=right> 
		    	<table width=800 align=center border="1" cellpadding="5" cellspacing="0" bgcolor=#ffffff>
      
	      	<tr>
	      <td align=right valign=top> �û�����</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font>   </td></tr>  
				<td align=right valign=top> ���룺</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px">
					<br>������6-20λ����ʹ��Ӣ��(a-z��A-Z))������(0-9)ע�����ִ�Сд�� 
						<br>���벻�����¼����ͬ���׼ǣ��Ѳ�</td></tr>  
				<tr><td align=right valign=top> ���䣺</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> ��ҵ���ƣ����ģ���</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> ��Ӣ�ģ���</td><td><input type="text" name="dizhi" class="ninput"  value="<%=rs("dizhi")%>" style="height:25px;width:200px"></td></tr>  
				 <tr><td align=right>����ʱ�䣺</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right>��ҵ��վ��</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				 <tr><td align=right>ͨ�ŵ�ַ��</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right> �������룺</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 <tr>  
           	<td align=right>��������<br>(��ַ���˺�)��</td>
             <td bgcolor="#FFFFFF"><textarea name="xingqu" rows="6" cols="70" class="gaikuaung"><%=rs("xingqu")%></textarea>  
            </td> 
    </tr>
				  <tr><td align=right>ע���ʽ�</td><td><input type="text" name="province" class="ninput"  value="<%=rs("province")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right>Ӫҵִ��ע��ţ�</td><td><input type="text" name="xuexiao" class="ninput"  value="<%=rs("xuexiao")%>" style="height:25px;width:200px"></td></tr>  
				 <tr><td align=right>��ҵ��֯�ṹ����ţ�</td><td><input type="text" name="city" class="ninput"  value="<%=rs("shouji")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				
				 <tr><td align=right> ��ҵ�Ǽ�ע�����ͣ�</td><td>
				 	<input type="radio" value="���м����пع���ҵ" name="xingbie" <%if rs("xingbie")="���м����пع���ҵ" then response.write "checked"%>>���м����пع���ҵ
				 	<br><input type="radio" value="�ɷ����޹�˾" name="xingbie" <%if rs("xingbie")="�ɷ����޹�˾" then response.write "checked"%>>�ɷ����޹�˾
				 	<br><input type="radio" value="�۰�̨��Ͷ��" name="xingbie" <%if rs("xingbie")="�۰�̨��Ͷ��" then response.write "checked"%>>�۰�̨��Ͷ��
				 	<br><input type="radio" value="�������ι�˾" name="xingbie" <%if rs("xingbie")="�������ι�˾" then response.write "checked"%>>�������ι�˾
				 	<br><input type="radio" value="�ɷݺ�����ҵ" name="xingbie" <%if rs("xingbie")="�ɷݺ�����ҵ" then response.write "checked"%>>�ɷݺ�����ҵ
				 	<br><input type="radio" value="˽Ӫ��ҵ" name="xingbie" <%if rs("xingbie")="˽Ӫ��ҵ" then response.write "checked"%>>˽Ӫ��ҵ
					<br><input type="radio" value="����Ͷ��" name="xingbie" <%if rs("xingbie")="����Ͷ��" then response.write "checked"%>>����Ͷ��
				</td></tr>   
				<tr>  
           	<td align=right>��Ӫҵ��</td>
             <td bgcolor="#FFFFFF"><textarea name="gaikuang" rows="6" cols="70" class="gaikuang"><%=rs("gaikuang")%></textarea>  
            </td> 
    </tr>
			 
				<tr><td align=right> �ʲ��ܶ</td><td><input type="text" name="shouji" class="ninput"  value="<%=rs("shouji")%>" style="height:25px;width:200px"> ��Ԫ</td></tr>  
				
			  
			  <tr><td align=right> ְ��������</td><td><input type="text" name="zhiwu" class="ninput"  value="<%=rs("zhiwu")%>" style="height:25px;width:200px">��</td></tr>  
       
    
    <tr> 
        
           	<td align=right>�����۶</td>
             <td bgcolor="#FFFFFF"><input type="text" name="touzi" class="ninput"  value="<%=rs("touzi")%>" style="height:25px;width:200px"> ��Ԫ
             	
            </td>
        
    </tr>
    <!--
    <tr> 
      <td align=right>�ϴ���Ƭ��</td>
      <td><input type="text" name="previewimg" value="<%=rs("previewimg")%>" class="editbox" size="36" id="xFilePath"><input type="button" value=" ��� " onclick="BrowseServer();" /><%if rs("previewimg")<>"" then%><img src="<%=rs("previewimg")%>" height=100><%end if%></td>
    </tr>-->
     </table>
 </td> 
   <td valign=top>
   	<table>
		  <tr  valign=top > 			  
    
				<td>
					<input type="radio" name=shenhe value="δ���" <%If InStr(rs("shenhe"),"δ���")<>0 Then Response.Write " checked"%> > δ��� <br>
					<input type="radio" name=shenhe value="���δͨ��" <%If InStr(rs("shenhe"),"���δͨ��")<>0 Then Response.Write " checked"%> > ���δͨ�� <br>
    <input type="radio" name=shenhe value="��ͨ��Ա" <%If InStr(rs("shenhe"),"��ͨ��Ա")<>0 Then Response.Write " checked"%> >  ���Ϊ��ͨ��Ա <br>
		  <input type="radio" name=shenhe value="VIP��Ա" <%If InStr(rs("shenhe"),"VIP��Ա")<>0 Then Response.Write " checked"%> >  ���ΪVIP��Ա <br>
			</td> </tr>
			  
		</table>
 </td> 
        
		    <td align=center> 
		    	<input name="ID" type="hidden" id="ID" value="<%=id%>">
         <input name="Action" type="submit" class="button" id="Submit" value="���" onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){return true;}return false;}">       
        <input name="Action" type="submit" class="button" id="Submit" value="ɾ��" onClick="{if(confirm('��ȷ��ִ�еĲ�����?')){return true;}return false;}"> </td>
		  </tr> 
		  </form>
      <% 
	         Rs.Movenext
  	      Loop
	Else%>
      <tr> 
        <td height="25" colspan="5" align="center"><font color="#006699"><b>��δ�������</b></font></td>
      </tr>
      <%	End If%>
    
    </tbody>
  </table>
 
<%End Sub
 
%>
</body>
</html>