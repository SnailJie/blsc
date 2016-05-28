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
 bigclassname="会员中心"
 smallclassname="会员注册"	 
  if  session("Master")="" then response.write("<script>alert('请先登陆!如果不是会员请先注册为会员');history.go(-1);</script>") 
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
      <div class="ymenu">&nbsp;&nbsp;您现在的位置是：
               首 页  > <%=bigclassname%> >  <%=smallclassname%> </div>
              </div>
              <table width="0" border="0" cellspacing="0" cellpadding="0" width=750 align=center>
                  <tr>
                    <td> 
                
        申请表仅用于对入会的真实性备案，承诺绝不泄露。<br />
 
 
        
       <div class=tt13 style="background:url(/images/sep_1.png) repeat-x top center;width:600px;"> 会员信息</div>
        <div style="height:1000px">
<form action="SaveUser.asp" method="post"id="form1" name="creator">
 
    <%
      	sql="select top 1 *  from userinfo where username='"&session("Master")&"' "
	      rs.open sql,conn,1,1  
	      %> 
	      <table width=700>
	      	<tr>
	      <td align=right valign=top> 用户名：</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px">  </td></tr>  
				<td align=right valign=top> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px">
					<br>请输入6-20位，请使用英文(a-z、A-Z))、数字(0-9)注意区分大小写； 
						<br>密码不能与登录名相同；易记；难猜</td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right>联系人：</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
				
				 <tr><td align=right>手机：</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"> </td></tr> 
				 <tr><td align=right>QQ：</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"> </td></tr>
				 <tr><td align=right>通信地址：</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"> </td></tr> 
				 <tr><td align=right> 邮政编码：</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 <!--<tr><td align=right> （英文）：</td><td><input type="text" name="dizhi" class="ninput"  value="<%=rs("dizhi")%>" style="height:25px;width:200px"></td></tr>  
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
    </tr>
    -->
    
    
    
				<tr><td align=right> <input type="Submit" name="Submit" value=" 修改信息 " class="button"> </td><td> </td></tr> 
         &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp;
        <input name="action" type="hidden" id="action" value="edit"> 
        <input name="shenhe" type="hidden" id="action" value="<%=rs("shenhe")%>"> 
        <input name="id" type="hidden" value="<%=rs("id")%>">     </td></tr></table>
				<%
				rs.close
				%> 
    </form>
				     注意：密码为空时 不修改密码
              <table ><tr><td>&nbsp;</td></tr></table> 
         </div>
       	<table><tr><td height=10px></td></tr></table>
     </td></tr></table>         
 </td> 
  
</td>
  </tr>
</table>
<!--#include file="foot.asp"-->
 