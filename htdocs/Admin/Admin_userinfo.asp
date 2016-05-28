<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
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
        <th colspan="5"> 信息 </th>
      </tr>
      <tr class="TopTitle">  
        <td> 信息</td>
        <td>审核状态</td>   
        <td>操作</td>
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
	      <td align=right valign=top> 用户名：</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font>   </td></tr>  
				<td align=right valign=top> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px">
					<br>请输入6-20位，请使用英文(a-z、A-Z))、数字(0-9)注意区分大小写； 
						<br>密码不能与登录名相同；易记；难猜</td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> 企业名称（中文）：</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> （英文）：</td><td><input type="text" name="dizhi" class="ninput"  value="<%=rs("dizhi")%>" style="height:25px;width:200px"></td></tr>  
				 <tr><td align=right>成立时间：</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right>企业网站：</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				 <tr><td align=right>通信地址：</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right> 邮政编码：</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 <tr>  
           	<td align=right>开户银行<br>(地址及账号)：</td>
             <td bgcolor="#FFFFFF"><textarea name="xingqu" rows="6" cols="70" class="gaikuaung"><%=rs("xingqu")%></textarea>  
            </td> 
    </tr>
				  <tr><td align=right>注册资金：</td><td><input type="text" name="province" class="ninput"  value="<%=rs("province")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right>营业执照注册号：</td><td><input type="text" name="xuexiao" class="ninput"  value="<%=rs("xuexiao")%>" style="height:25px;width:200px"></td></tr>  
				 <tr><td align=right>企业组织结构代码号：</td><td><input type="text" name="city" class="ninput"  value="<%=rs("shouji")%>" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				
				 <tr><td align=right> 企业登记注册类型：</td><td>
				 	<input type="radio" value="国有及国有控股企业" name="xingbie" <%if rs("xingbie")="国有及国有控股企业" then response.write "checked"%>>国有及国有控股企业
				 	<br><input type="radio" value="股份有限公司" name="xingbie" <%if rs("xingbie")="股份有限公司" then response.write "checked"%>>股份有限公司
				 	<br><input type="radio" value="港澳台商投资" name="xingbie" <%if rs("xingbie")="港澳台商投资" then response.write "checked"%>>港澳台商投资
				 	<br><input type="radio" value="有限责任公司" name="xingbie" <%if rs("xingbie")="有限责任公司" then response.write "checked"%>>有限责任公司
				 	<br><input type="radio" value="股份合作企业" name="xingbie" <%if rs("xingbie")="股份合作企业" then response.write "checked"%>>股份合作企业
				 	<br><input type="radio" value="私营企业" name="xingbie" <%if rs("xingbie")="私营企业" then response.write "checked"%>>私营企业
					<br><input type="radio" value="外商投资" name="xingbie" <%if rs("xingbie")="外商投资" then response.write "checked"%>>外商投资
				</td></tr>   
				<tr>  
           	<td align=right>主营业务：</td>
             <td bgcolor="#FFFFFF"><textarea name="gaikuang" rows="6" cols="70" class="gaikuang"><%=rs("gaikuang")%></textarea>  
            </td> 
    </tr>
			 
				<tr><td align=right> 资产总额：</td><td><input type="text" name="shouji" class="ninput"  value="<%=rs("shouji")%>" style="height:25px;width:200px"> 万元</td></tr>  
				
			  
			  <tr><td align=right> 职工人数：</td><td><input type="text" name="zhiwu" class="ninput"  value="<%=rs("zhiwu")%>" style="height:25px;width:200px">人</td></tr>  
       
    
    <tr> 
        
           	<td align=right>年销售额：</td>
             <td bgcolor="#FFFFFF"><input type="text" name="touzi" class="ninput"  value="<%=rs("touzi")%>" style="height:25px;width:200px"> 万元
             	
            </td>
        
    </tr>
    <!--
    <tr> 
      <td align=right>上传照片：</td>
      <td><input type="text" name="previewimg" value="<%=rs("previewimg")%>" class="editbox" size="36" id="xFilePath"><input type="button" value=" 浏览 " onclick="BrowseServer();" /><%if rs("previewimg")<>"" then%><img src="<%=rs("previewimg")%>" height=100><%end if%></td>
    </tr>-->
     </table>
 </td> 
   <td valign=top>
   	<table>
		  <tr  valign=top > 			  
    
				<td>
					<input type="radio" name=shenhe value="未审核" <%If InStr(rs("shenhe"),"未审核")<>0 Then Response.Write " checked"%> > 未审核 <br>
					<input type="radio" name=shenhe value="审核未通过" <%If InStr(rs("shenhe"),"审核未通过")<>0 Then Response.Write " checked"%> > 审核未通过 <br>
    <input type="radio" name=shenhe value="普通会员" <%If InStr(rs("shenhe"),"普通会员")<>0 Then Response.Write " checked"%> >  审核为普通会员 <br>
		  <input type="radio" name=shenhe value="VIP会员" <%If InStr(rs("shenhe"),"VIP会员")<>0 Then Response.Write " checked"%> >  审核为VIP会员 <br>
			</td> </tr>
			  
		</table>
 </td> 
        
		    <td align=center> 
		    	<input name="ID" type="hidden" id="ID" value="<%=id%>">
         <input name="Action" type="submit" class="button" id="Submit" value="审核" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}">       
        <input name="Action" type="submit" class="button" id="Submit" value="删除" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}"> </td>
		  </tr> 
		  </form>
      <% 
	         Rs.Movenext
  	      Loop
	Else%>
      <tr> 
        <td height="25" colspan="5" align="center"><font color="#006699"><b>尚未添加内容</b></font></td>
      </tr>
      <%	End If%>
    
    </tbody>
  </table>
 
<%End Sub
 
%>
</body>
</html>