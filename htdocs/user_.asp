
    <table align=right > 
 <tr>
  		<td  valign=bottom>
  			<%if Session("UserName")="" then%>
  			 <form name="myform" method="post" action="SaveUser.asp" >
  			<table><tr><td align=right>�û�����</td><td align=left><input type=text name=username  style="width:100px;height:20px;" maxlength=20 class=input value="">  </td>
  	<td align=right>��&nbsp;&nbsp;�룺</td><td align=left><input type="password" name=password  style="width:100px;height:20px;" maxlength=20 class=input value=""> </td>
  	<td align=left style="padding-left:0px;"><input name="action" type="hidden" id="action" value="chklogin"> 
   	      <input type="submit" name="denglu1" value=" �� ½ " style="border: 0 solid #dddddd; background:url(images/anniu.png) no-repeat; height:26px;font-size:14px;color:#ffffff;padding-top:0px;width:75px;valign:center;">
   	      </td><td align=right><input type="button" name="denglu1" value=" ע�� " onclick="window.open('reg.asp')" style="border: 0 solid #dddddd; background:url(images/anniu.png) no-repeat; height:26px;font-size:14px;color:#ffffff;padding-top:0px;width:75px;valign:center;"></td></tr>
  	</table>
  	<%Response.Write  Request("strMsg") %>
  	</form> 
  	 <%else%>
		<table><tr><td align=right>��ǰ�û�:</td><td><a href=member.asp><font color=#8700a2><%=session("username")%></font></a></td>  
	 <td align=right>��Ա״̬��</td><td>��<%=session("quanxian")%>��</td> 
		 <td align=right><a href=member.asp style="background:#a35f1d;color:#ffffff;">����Ա��Ϣ��</a></td>
			<td><a href=saveuser.asp?action=out style="background:#a35f1d;color:#ffffff;">���˳���</a></td></tr> 
	</table> 
		<%end if%>
   	      
		</td>
		</tr></table> 
		
		<table><tr><td></td></tr></table> 