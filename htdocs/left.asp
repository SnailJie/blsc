 	<table><tr><td height=19></td></tr></table> 
 	<table width=100% border="0" align="center" cellpadding="0" cellspacing="0">
	<tr>
		 <td align=right height=10><!--<img src=images/lv.jpg>--></td>
		</tr>
	 <tr> 
	 <td style="1background:#ffffff url(../images/leftbg.jpg) repeat-y right;">
			<div class="lmenuc"> <a href="view.asp?classid=<%=classid%>"><%=bigclassname%></a>  </div>
				<div  class="lmenu">
						<ul> 	
						<%
						t=0
						sql="SELECT * from nclass where parentid="&classid&" order by orders asc" 
						rs1.Open sql,conn,1,1 
						if not(rs1.eof and rs1.bof) then
						do while not rs1.eof
							t=t+1
							%>
							<li <%if nclassid =rs1("id") then%>style="cursor: hand;background:#e2e2e2" <%end if%>><a href="view.asp?classid=<%=classid%>&nclassid=<%=rs1("id")%>"><span>></span><%=left(rs1("nClass"),15)%></a></li>
							<% 
						rs1.movenext  
						loop 
						end if 
						rs1.close
						%> 
				 </ul> 
				</div>
			</td> 
		</tr>
		<tr>
		 <td align=right height=10><!--<img src=images/lv.jpg>--></td>
		</tr>
	</table>
				 