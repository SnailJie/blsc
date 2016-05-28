 
<ul class="lmenuc"> 
	<li>
		<a href="view.asp?classid=<%=classid%>"><%=bigclassname%></a></li>
</ul>
 

		<ul class="lmenu"> 	
		<%
		t=0
		sql="SELECT * from nclass where parentid="&classid&" order by orders asc" 
		rs1.Open sql,conn,1,1 
		if not(rs1.eof and rs1.bof) then
		do while not rs1.eof
			t=t+1
			%>
			<li style="cursor: hand;"><a <%if classid=2 then response.write "style=font-weight:bold;"%> href="view.asp?classid=<%=classid%>&nclassid=<%=rs1("id")%>"><%=rs1("nclass")%></a></li>
			 <% 
		rs1.movenext  
		loop 
		end if 
		rs1.close
		%>

		
      </ul> 
    </div>
    

         
          <!--<div align=center> <img src="images/youxiang.jpg" width=210px border=0></div> --><table><tr><td></td></tr></table> 
        
<br>
<div align=center>
<a  href="view.asp?classid=7"><img src=images/zixian.gif border=0 height=70></a></div>
 