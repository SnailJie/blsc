<!--#include file="head.asp"-->
<script src="ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="ckfinder/ckfinder.js"></script>
<script src="js/selectlist.js"></script>
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
<%
 classid=14
 bigclassname="��Ա����"
 smallclassname="��Աע��"	 
  if  session("Master")="" then response.write("<script>alert('���ȵ�½!������ǻ�Ա����ע��Ϊ��Ա');history.go(-1);</script>") 
%>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=150>    
    	</td>
    	</tr>
    	</table>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td width=200>  
       <!--#include file="left.asp" -->
		 </td>
		 <td width=17>     
		 </td>
      <td class="bg2-r">
      <div class="ymenu">&nbsp;&nbsp;�����ڵ�λ���ǣ�
               �� ҳ  > <%=bigclassname%> >  <%=smallclassname%> </div>
              </div>
              <table width="0" border="0" cellspacing="0" cellpadding="0" width=750 align=center>
                  <tr>
                    <td> 
                
        ���������ڶ�������ʵ�Ա�������ŵ����й¶��<br />
 
 
        
       <div class=tt13 style="background:url(/images/sep_1.png) repeat-x top center;width:600px;"> ��Ա��Ϣ</div>
        <div style="height:1000px">
<form action="SaveUser.asp" method="post"id="form1" name="creator">
 
    <%
      	sql="select top 1 *  from userinfo where username='"&session("Master")&"' "
	      rs.open sql,conn,1,1  
	      %> 
	      <table width=700>
	      	<tr>
	      <td align=right valign=top> �û�����</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px">  </td></tr>  
				<td align=right valign=top> ���룺</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px">
					<br>������6-20λ����ʹ��Ӣ��(a-z��A-Z))������(0-9)ע�����ִ�Сд�� 
						<br>���벻�����¼����ͬ���׼ǣ��Ѳ�</td></tr>  
				<tr><td align=right valign=top> ���䣺</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right>��ϵ�ˣ�</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
				
				 <tr><td align=right>�ֻ���</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"> </td></tr> 
				 <tr><td align=right>QQ��</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"> </td></tr>
				 <tr><td align=right>ͨ�ŵ�ַ��</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"> </td></tr> 
				 <tr><td align=right> �������룺</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 <!--<tr><td align=right> ��Ӣ�ģ���</td><td><input type="text" name="dizhi" class="ninput"  value="<%=rs("dizhi")%>" style="height:25px;width:200px"></td></tr>  
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
    </tr>
    -->
    
    
    
				<tr><td align=right> <input type="Submit" name="Submit" value=" �޸���Ϣ " class="button"> </td><td> </td></tr> 
         &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp;
        <input name="action" type="hidden" id="action" value="edit"> 
        <input name="shenhe" type="hidden" id="action" value="<%=rs("shenhe")%>"> 
        <input name="id" type="hidden" value="<%=rs("id")%>">     </td></tr></table>
				<%
				rs.close
				%> 
    </form>
				     ע�⣺����Ϊ��ʱ ���޸�����
              <table ><tr><td>&nbsp;</td></tr></table> 
         </div>
       	<table><tr><td height=10px></td></tr></table>
     </td></tr></table>         
 </td> 
  
</td>
  </tr>
</table>
<!--#include file="foot.asp"-->
 