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
			    <td height=35>&nbsp;&nbsp;&nbsp;&nbsp;<b><font size=2>���϶���</font></b></td>
			  </tr>
			  <tr>
           <td height=3  bgcolor=#0A6ADF></td>
         </tr> 
			   <tr>
			    <td height=250 valign=top>
			    	<table><tr><td>  
			    ��ӭʹ�����϶���ϵͳ������ύ����Ϣ���ǽ��ᾡ�촦��	
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
						response.Write("û�м�¼")
						else
						rs.PageSize=20
						if page=0 then page=1 
						pages=rs.pagecount
						if page > pages then page=pages
						rs.AbsolutePage=page  
						    
						for t=1 to rs.PageSize 
						%>
						
		       <table> <tr><td><strong>�ǳƣ�</strong><%=rs("guestname")%></td></tr></table>
				   <table> <tr><td><strong><strong>���⣺</strong><%=rs("messageTitle")%></td></tr></table>					    
	    	   <table> <tr><td>�������ݣ�</td><td><%=rs("messageDetail")%></td></tr></table>
				    	  <%if rs("messageback")<> "" then%>
                          <table style="BORDER-right: #999999 1px dotted;BORDER-bottom: #999999 1px dotted;BORDER-left: #999999 1px dotted;BORDER-top: #999999 1px dotted;"> <tr><td >�ظ�����:</td><td><%=rs("messageback")%></td></tr></table>	
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
					    response.write "��ҳ ��һҳ&nbsp;"
					  else
					    response.write "<a href=?page=1>��ҳ</a>&nbsp;"
					    response.write "<a href=?page=" & Page-1 & ">��һҳ</a>&nbsp;"
					  end if
					  if rs.pagecount-page<1 then
					    response.write "��һҳ βҳ"
					  else
					    response.write "<a href=?page=" & (page+1) & ">"
					    response.write "��һҳ</a> <a href=?page="&rs.pagecount&">βҳ</a>"
					  end if
					   response.write "&nbsp;ҳ�Σ�"&Page&"/"&rs.pagecount&"ҳ "
					    response.write "&nbsp;��"&rs.recordcount&"����¼"
					   response.write " ת����<input type='text' name='page' size=4 maxlength=10 class=input value="&page&">"
					   response.write " <input class=input type='submit'  value='ȷ��'  name='cndok'></span></p>"     
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
                ������</td> <td > <input type="text" name="guestName" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                �Ա�</td> <td > <input type="radio" name="gongsi" value="����" checked>����<input type="radio" name="gongsi" value="Ůʿ">Ůʿ </td> 
                </tr> 
                <td  align="right"> 
                ��ַ��</td> <td > <input type="text" name="dizhi" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                ��ϵ�绰��</td> <td > <input type="text" name="dianhua" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                �ֻ���</td> <td > <input type="text" name="shouji" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                ���䣺</td> <td > <input type="text" name="youxiang" class="ninput" size="40"> </td> 
                </tr> 
                <td  align="right"> 
                ְҵ��</td> <td > <input type="text" name="zhiye" class="ninput" size="40"> </td> 
                </tr>
                <td  align="right"> 
                װ�޷�ʵ�������</td> <td ><input name="mianji" type="text"  value="" size="12">
                  ƽ�� </td> 
                </tr> 
                <td  align="right"> 
                �ṹ���ͣ�</td> <td ><select name="leixing">
                  <option value="" selected>��ѡ��...</option>
                  <option value="����">����</option>
                  <option value="��ʽ">��ʽ</option>
                  <option value="������">������</option>
                  <option value="������">������</option>
                  <option value="һ����">һ����</option>
                  <option value="����">����</option>
                  <option value="�� װ">�� װ</option>
                  <option value="�� ��">�� ��</option>
                </select> </td> 
                </tr> 
                <td  align="right"> 
                ׼������ʱ�䣺</td> <td > <select name="nian">
                  <option value="" selected>��ѡ��...</option> 
				  <option value="2008��">2008</option>
				  <option value="2009��">2009</option>
				  <option value="2010��">2010</option>
                </select>��&nbsp;
				<select name="yue">
                  <option value="" selected>��ѡ��...</option>
                  <option value="01��">01</option>
                  <option value="02��">02</option>
                  <option value="03��">03</option>
                  <option value="04��">04</option>
                  <option value="05��">05</option>
                  <option value="06��">06</option>
                  <option value="07��">07</option>
                  <option value="08��">08</option>
                  <option value="09��">09</option>
                  <option value="10��">10</option>
                  <option value="11��">11</option>
                  <option value="12��">12</option>
                </select>��&nbsp;
				<select name="tian">
                  <option value="" selected>��ѡ��...</option>
                  <option value="01��">01</option>
                  <option value="02��">02</option>
                  <option value="03��">03</option>
                  <option value="04��">04</option>
                  <option value="05��">05</option>
                  <option value="06��">06</option>
                  <option value="07��">07</option>
                  <option value="08��">08</option>
                  <option value="09��">09</option>
                  <option value="10��">10</option>
                  <option value="11��">11</option>
                  <option value="12��">12</option>
                  <option value="13��">13</option>
                  <option value="14��">14</option>
                  <option value="15��">15</option>
                  <option value="16��">16</option>
                  <option value="17��">17</option>
                  <option value="18��">18</option>
                  <option value="19��">19</option>
                  <option value="20��">20</option>
                  <option value="21��">21</option>
                  <option value="22��">22</option>
                  <option value="23��">23</option>
                  <option value="24��">24</option>
                  <option value="25��">25</option>
                  <option value="26��">26</option>
                  <option value="27��">27</option>
                  <option value="28��">28</option>
                  <option value="29��">29</option>
                  <option value="30��">30</option>
                  <option value="31��">31</option>
                </select>��</td> 
                </tr>
                <td  align="right"> 
                Ԥ��װ�޷��ã�</td> <td > <input name="feiyong" type="text"  value="" size="12">
                  ��Ԫ�����&nbsp; (�������ģ�Ϳ�ϡ���ġ���������)</td> 
                </tr> 
                 <td  align="right"> 
                Ԥ�����ģ�</td> <td > <input name="zhucai" type="text"  value="" size="12">
                  ��Ԫ�����&nbsp;(�ذ塢��ש�����񡢵ƾߡ���ߡ�����) </td> 
                </tr>
                <td  align="right"> 
                װ�޷��</td> <td > <select name="fengge">
                  <option value="" selected>��ѡ��...</option>
                  <option value="�ִ�">�ִ�</option>
                  <option value="ŷʽ">ŷʽ</option>
                  <option value="��ʽ">��ʽ</option>
                  <option value="�ŵ�">�ŵ�</option>
                  <option value="����">����</option>
                    </select> </td> 
                </tr>   
                <td  align="right"> 
                ���Ҫ��</td> <td ><textarea name="xingqu" class="ninput" cols="50" rows="5"></textarea></td> 
                </tr> 
                <td  align="right">ϣ���ṩ�ķ��� 
                 </td><td > <input type="radio" name="xingqu1" value="��Ƽ�װ��" checked> ��Ƽ�װ��
                 	 <input type="radio" name="xingqu1" value="�������">�������
                 	 <input type="radio" name="xingqu1" value="���С��ȫ�̸��ٷ���">���С��ȫ�̸��ٷ���</td> 
                 	  
                </tr> 
              
              <tr bgcolor="white"> 
                <td colspan="2" align="center"> 
                	<!--��֤�룺<input name="verifycode" type="text" class="editbox" id="verifycode" value="" size="5"><img src="admin/show_verifycode.asp">
                	-->
                <input type="button" name="submitBtn" value="�����ύ" onClick="vbscript:formSubmit()" class="button"  accesskey="s"> 
                <input type="reset" name="resetBtn" value="��д��д" class="button" accesskey="c">                </td> 
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
	alert ("��������д��������") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub 
	 
	case instr(trim(document.guestMessage.guestName.value),"'") > 0 or instr(trim(document.guestMessage.guestName.value)," ") > 0 
	alert ("�����������зǷ��ַ�") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub  
	case trim(document.guestMessage.shouji.value)="" 
	alert ("��������д�����ֻ�") 
	checkOk = false 
	document.guestMessage.shouji.focus() 
	exit sub 
	 
	case trim(document.guestMessage.dianhua.value)="" 
	alert ("��������д���ĵ绰") 
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