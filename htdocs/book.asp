<!--#include file="head.asp"-->
<%

id=request("id") 
classid=request("classid") 
nclassid=request("nclassid") 
page=cint(request("page"))

%>

<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td width="250" valign=top> 
    	<p align=center>
			  <img src="images/3.gif" border=0 width=240>
			</p>
    	<table width="100%" border="0" align="center" cellpadding="0" cellspacing="0" bgcolor=#E6E7E8>
			  <tr>
			    <td height=35>&nbsp;&nbsp;&nbsp;&nbsp;<b><font size=2>网上订单</font></b></td>
			  </tr>
			  <tr>
           <td height=3  bgcolor=#0A6ADF></td>
         </tr> 
			   <tr>
			    <td height=250 valign=top>
			    	<table><tr><td>  
			    欢迎使用网上订单系统，你的提交的信息我们将会尽快处理。	
			    </td>
			  </tr>
			</table>
			</td>
			  </tr>
			   <tr>
			    <td><img src="images/yhb1.gif" border=0></td>
			  </tr>
			</table>
		</td>
    <td width="20"><img src="images/1px.gif" width="1" height="1"></td>
    <td valign="top" bgcolor=#ffffff>
    	<br>
    	<!--<table width=100%> <tr><td height=1 bgcolor=#333333> </td></tr></table><br>
    	<%
				Set rs=Server.CreateObject("ADODB.RecordSet") 
					 
						sql="select * from book order by messageid desc"
						rs.Open sql,conn,1,1
						if rs.eof and rs.bof then
						response.Write("没有记录")
						else
						rs.PageSize=20
						if page=0 then page=1 
						pages=rs.pagecount
						if page > pages then page=pages
						rs.AbsolutePage=page  
						    
						for t=1 to rs.PageSize 
						%>
						
		       <table> <tr><td><strong>昵称：</strong><%=rs("guestname")%></td></tr></table>
				   <table> <tr><td><strong><strong>标题：</strong><%=rs("messageTitle")%></td></tr></table>					    
	    	   <table> <tr><td>留言内容：</td><td><%=rs("messageDetail")%></td></tr></table>
				    	  <%if rs("messageback")<> "" then%>
                          <table style="BORDER-right: #999999 1px dotted;BORDER-bottom: #999999 1px dotted;BORDER-left: #999999 1px dotted;BORDER-top: #999999 1px dotted;"> <tr><td >回复内容:</td><td><%=rs("messageback")%></td></tr></table>	
                          <%end if%>
            <br> <table width=100%> <tr><td height=1 bgcolor=#333333> </td></tr></table>
					  <br>
					  <%
					rs.movenext
					if rs.eof then exit for
					next                                                       
					%>
					
					  
					<table width="100%" border="0" cellpadding="0" cellspacing="0">
					  <tr bgcolor="#FFFFFF"> 
					<form method=Post action="">  
					      <td height="30"> 
					    <%if Page<2 then      
					    response.write "首页 上一页&nbsp;"
					  else
					    response.write "<a href=?page=1>首页</a>&nbsp;"
					    response.write "<a href=?page=" & Page-1 & ">上一页</a>&nbsp;"
					  end if
					  if rs.pagecount-page<1 then
					    response.write "下一页 尾页"
					  else
					    response.write "<a href=?page=" & (page+1) & ">"
					    response.write "下一页</a> <a href=?page="&rs.pagecount&">尾页</a>"
					  end if
					   response.write "&nbsp;页次："&Page&"/"&rs.pagecount&"页 "
					    response.write "&nbsp;共"&rs.recordcount&"条记录"
					   response.write " 转到：<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
					   response.write " <input class=input type='submit'  value='确定'  name='cndok'></span></p>"     
					%>  
					      </td></form>
					  </tr>
					</table>
					
					<% 
					end if
					rs.close
					set rs=nothing
					%>
          	
          -->	
       <br>
  	
      
      <table border="0" width="90%" cellspacing="0" cellpadding="0">
    		<tr>
    			<td  bgcolor=#fffffF align=center>
            <table width="100%" cellpadding="2" cellspacing="0"> 
              <form name="guestMessage" action="save.asp" method="post"> 
              <tr bgcolor="white"> 
                <td  align="right"> 
                姓名：</td> <td > <input type="text" name="guestName" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                性别：</td> <td > <input type="radio" name="gongsi" value="先生" checked>先生<input type="radio" name="gongsi" value="女士">女士 </td> 
                </tr> 
                <td  align="right"> 
                地址：</td> <td > <input type="text" name="dizhi" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                联系电话：</td> <td > <input type="text" name="dianhua" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                手机：</td> <td > <input type="text" name="shouji" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                邮箱：</td> <td > <input type="text" name="youxiang" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                职业：</td> <td > <input type="text" name="zhiye" class="ninput" size="40"> </td> 
                </tr>
                <td  align="right"> 
                装修房实用面积：</td> <td ><input name="mianji" type="text"  value="" size="12">
                  平米 </td> 
                </tr> 
                <td  align="right"> 
                结构类型：</td> <td ><select name="leixing">
                  <option value="" selected>请选择...</option>
                  <option value="别墅">别墅</option>
                  <option value="复式">复式</option>
                  <option value="三居室">三居室</option>
                  <option value="二居室">二居室</option>
                  <option value="一居室">一居室</option>
                  <option value="大户型">大户型</option>
                  <option value="工 装">工 装</option>
                  <option value="其 它">其 它</option>
                </select> </td> 
                </tr> 
                <td  align="right"> 
                准备开工时间：</td> <td > <select name="nian">
                  <option value="" selected>请选择...</option> 
				  <option value="2008年">2008</option>
				  <option value="2009年">2009</option>
				  <option value="2010年">2010</option>
                </select>年&nbsp;
				<select name="yue">
                  <option value="" selected>请选择...</option>
                  <option value="01月">01</option>
                  <option value="02月">02</option>
                  <option value="03月">03</option>
                  <option value="04月">04</option>
                  <option value="05月">05</option>
                  <option value="06月">06</option>
                  <option value="07月">07</option>
                  <option value="08月">08</option>
                  <option value="09月">09</option>
                  <option value="10月">10</option>
                  <option value="11月">11</option>
                  <option value="12月">12</option>
                </select>月&nbsp;
				<select name="tian">
                  <option value="" selected>请选择...</option>
                  <option value="01日">01</option>
                  <option value="02日">02</option>
                  <option value="03日">03</option>
                  <option value="04日">04</option>
                  <option value="05日">05</option>
                  <option value="06日">06</option>
                  <option value="07日">07</option>
                  <option value="08日">08</option>
                  <option value="09日">09</option>
                  <option value="10日">10</option>
                  <option value="11日">11</option>
                  <option value="12日">12</option>
                  <option value="13日">13</option>
                  <option value="14日">14</option>
                  <option value="15日">15</option>
                  <option value="16日">16</option>
                  <option value="17日">17</option>
                  <option value="18日">18</option>
                  <option value="19日">19</option>
                  <option value="20日">20</option>
                  <option value="21日">21</option>
                  <option value="22日">22</option>
                  <option value="23日">23</option>
                  <option value="24日">24</option>
                  <option value="25日">25</option>
                  <option value="26日">26</option>
                  <option value="27日">27</option>
                  <option value="28日">28</option>
                  <option value="29日">29</option>
                  <option value="30日">30</option>
                  <option value="31日">31</option>
                </select>日</td> 
                </tr>
                <td  align="right"> 
                预算装修费用：</td> <td > <input name="feiyong" type="text"  value="" size="12">
                  万元人民币&nbsp; (不含主材，涂料、板材、其它辅料)</td> 
                </tr> 
                 <td  align="right"> 
                预算主材：</td> <td > <input name="zhucai" type="text"  value="" size="12">
                  万元人民币&nbsp;(地板、地砖、橱柜、灯具、洁具、五金件) </td> 
                </tr>
                <td  align="right"> 
                装修风格：</td> <td > <select name="fengge">
                  <option value="" selected>请选择...</option>
                  <option value="现代">现代</option>
                  <option value="欧式">欧式</option>
                  <option value="美式">美式</option>
                  <option value="古典">古典</option>
                  <option value="其它">其它</option>
                    </select> </td> 
                </tr>   
                <td  align="right"> 
                设计要求：</td> <td ><textarea name="xingqu" class="ninput" cols="50" rows="5"></textarea></td> 
                </tr> 
                <td  align="right">希望提供的服务 
                 </td><td > <input type="radio" name="xingqu1" value="设计及装修" checked> 设计及装修
                 	 <input type="radio" name="xingqu1" value="单纯设计">单纯设计
                 	 <input type="radio" name="xingqu1" value="设计小组全程跟踪服务">设计小组全程跟踪服务</td> 
                 	  
                </tr> 
              
              <tr bgcolor="white"> 
                <td colspan="2" align="center"> 
                	<!--验证码：<input name="verifycode" type="text" class="editbox" id="verifycode" value="" size="5"><img src="admin/show_verifycode.asp">
                	-->
                <input type="button" name="submitBtn" value="订单提交" onClick="vbscript:formSubmit()" class="button"  accesskey="s"> 
                <input type="reset" name="resetBtn" value="重写填写" class="button" accesskey="c">                </td> 
              </tr> 
              </form> 
            </table> 
            <br><br>
          </td> 
        </tr> 
      </table> 
<script language="vbs"> 
sub formSubmit() 
checkOk = true 
 
select case true 
	case trim(document.guestMessage.guestName.value)="" 
	alert ("您必须填写您的名字") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub 
	 
	case instr(trim(document.guestMessage.guestName.value),"'") > 0 or instr(trim(document.guestMessage.guestName.value)," ") > 0 
	alert ("您的名字中有非法字符") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub  
	case trim(document.guestMessage.shouji.value)="" 
	alert ("您必须填写您的手机") 
	checkOk = false 
	document.guestMessage.shouji.focus() 
	exit sub 
	 
	case trim(document.guestMessage.dianhua.value)="" 
	alert ("您必须填写您的电话") 
	checkOk = false 
	document.guestMessage.dianhua.focus() 
	exit sub 
	 
end select 
 
if checkOk = true then 
document.guestMessage.submit() 
end if 
end sub 
</script> 
<script language="javascript"> 
function setsmiley(what)  
{  
document.guestMessage.messageDetail.value = document.guestMessage.messageDetail.value+" "+what;  
document.guestMessage.messageDetail.focus();  
}  
</script>
				</TD>
			
     </TR>
  </TBODY>
</TABLE>
<!--#include file="foot.asp"-->