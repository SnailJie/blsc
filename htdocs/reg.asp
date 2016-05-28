<!--#include file="head.asp"-->
<%
 classid=14
 bigclassname="会员中心"
 smallclassname="会员注册"	 
%>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=170>    
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
              	<a href="index.asp">首 页</a>  > <%=bigclassname%> >  <%=smallclassname%> </div>
              </div>
          
              
			 <table width="0" border="0" cellspacing="0" cellpadding="0" width=750 align=center>
                  <tr>
                    <td> 
                <br /><br />
               凡是经过申请注册登记的会员，要经过管理员审核，请资料填写详细。<br />
                
               <font color=#ff0000>*</font>为必填项<br />
 
        
       <div class=tt13> 会员信息</div>
        <div   style="height:650px">
<form action="mSaveUser.asp" method="post" id="form1" name="creator">
 
    
	      <table width=600>
	      	<tr>
	      <td align=right valign=top> 用户名：</td><td><input type="text" name="username" class="ninput" value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font> <br>请输入6-20位,请使用英文(a-z、A-Z)、数字(0-9) </td></tr>  
				<td align=right> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
					<td align=right valign=top>重复密码：</td><td><input name="password2" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font>
						<br>请输入6-20位，请使用英文(a-z、A-Z))、数字(0-9)注意区分大小写； 
						<br>密码不能与登录名相同；易记；难猜
						</td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font> </td></tr>  
				<!--用于找回密码
				<tr><td align=right> 姓名：</td><td><input type="text" name="xingming" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> 性别：</td><td><input type="radio" value="先生" name="xingbie">先生
				<input type="radio" value="女士" name="xingbie" >女士<font color=#ff0000>&nbsp;*</font>
				</td></tr> 
				
				<tr><td align=right>民族：</td><td><input type="text" name="xueke" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
			  <tr><td align=right>籍贯：</td><td><input type="text" name="province" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				 <tr><td align=right>出生年月：</td><td><input type="text" name="nianji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right>固话：</td><td><input type="text" name="city" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				<tr><td align=right> 手机：</td><td><input type="text" name="shouji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> QQ/msn：</td><td><input type="text" name="qqmsn" class="ninput"  value="" style="height:25px;width:200px"></td></tr>   
			  
			  <tr><td align=right>微信号：</td><td><input type="text" name="dingyue" class="ninput"  value="" style="height:25px;width:200px"> </td></tr>
			  <tr><td align=right>单位：</td><td><input type="text" name="xuexiao" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right>职务：</td><td><input type="text" name="zhiwu" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				--> 
				 
 
				<td align=right> <input type="Submit" name="Submit" value=" 提交注册信息  " class="button"> </td><td> </td></tr> 
         &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp;
        <input name="action" type="hidden" id="action" value="save"> 
        <input name="id" type="hidden" value="">     </td></tr></table> 
    </form>
				     
          
         </div>
       	<table><tr><td height=10px></td></tr></table>
    
 </td>
  </tr>
</table>
 </td> 
   
  </tr>
</table>
 
		
 
<!--#include file="foot.asp"-->
  