<!--#include file="head.asp"-->
<%

title=trim(request("title"))
if title="" then response.redirect "index.asp"
classid=2
 
if classid="" then
	response.Redirect "/"
response.end
end if
	sql="SELECT * from class where id="&classid
	rs.Open sql,conn,1,1 
	if not(rs.eof and rs.bof) then
		bigclassname=rs("class")
	else
		response.Redirect "index.asp"
	end if 
	rs.close
  if nclassid="" then nclassid=0
	if nclassid<>0 then
		sql="SELECT * from nclass where id="&nclassid
		rs.Open sql,conn,1,1 
		if not(rs.eof and rs.bof) then
			smallclassname=rs("nclass")
		else
			response.Redirect "index.asp"
		end if 
		rs.close
	end if
 
%>
<table cellspacing=0 cellpadding=0 width=100% align=center bgcolor=#ffffff>
<tr><td height=1px></td></tr>
<tr><td>
<table cellspacing=0 cellpadding=0 width=920 align=center>
	<tr>
    <td colspan=2 height=170px valign=top>
     <script>
	      var NowFrame = 1;
	      var MaxFrame = 5;
	      var bStart = 0;
	      function fnToggle(){var next = NowFrame + 1;if(next == MaxFrame+1) {NowFrame = MaxFrame;next = 1;}if(bStart == 0){bStart = 1;setTimeout('fnToggle()', 2000);return;}else{oTransContainer.filters[0].Apply();document.images['oDIV'+next].style.display = "";document.images['oDIV'+NowFrame].style.display = "none";oTransContainer.filters[0].Play(duration=2);if(NowFrame == MaxFrame){NowFrame = 1;}else{NowFrame++;}}	setTimeout('fnToggle()', 6000);}fnToggle();
	   </script>
    	<div id=oTransContainer style="FILTER: progid:DXImageTransform.Microsoft.Wipe(GradientSize=1.0,wipeStyle=0, motion='forward'); WIDTH: 979px; HEIGHT: 170px">
	    	<a href="#" target="_blank"><img class=pic id=oDIV1 src="images/01.jpg" width=979 height=170px height=979></a>
				<a href="#" target="_blank"><img class=pic id=oDIV2 src="images/02.jpg" width=979 height=170px style="DISPLAY: none;"></a>
				<a href="#" target="_blank"><img class=pic id=oDIV3 src="images/03.jpg" width=979 height=170px style="DISPLAY: none;"></a>
				<a href="#" target="_blank"><img class=pic id=oDIV4 src="images/04.jpg" width=979 height=170px style="DISPLAY: none;"></a>
				<a href="#" target="_blank"><img class=pic id=oDIV5 src="images/05.jpg" width=979 height=170px style="DISPLAY: none;"></a>
  		</div>
  	</td>
  </tr>
  <tr><td colspan=2 height=10px></td></tr>
	<tr>
		<td valign=top style="background:url(images/lmenubg.png) left top repeat-y;" width=250px><!--#include file="left.asp"--></td>
		<td align=left valign=top width=729px rowspan=2>
			<br>
			您现在的位置是：首 页  >产品查询：<%=title%><br>
			<% 
	    sql="SELECT a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid=2 "
	    
	    if title<>"" then
	    	sql=sql&"  and title like '%"&title&"%'"
	    end if
	    
	    sql=sql&" order by orders asc"
	     
			rs.Open sql,conn,1,1 

			if not(rs.eof and rs.bof) then 
			 
					 %>
				<TABLE border=0 cellSpacing=0 cellPadding=0 width="100%">
				<TBODY>
					<TR>
						<TD class=texte11 height=18 width="80%">&nbsp;&nbsp;
							<STRONG><%=rs("title")%></STRONG>
						</TD>
						<TD height=18 width="20%" align=right><A href="view.asp?id=<%=rs("id")%>">更多</A>&nbsp;&nbsp;</TD>
					</TR>
				</TBODY>
				</TABLE>
			<%
				if rs("skey")<>"" then
			%>
				</DIV>
				<div style="border-bottom:solid 1-x #000; width:665px;padding:10px;line-height:20px;">
				  <%if trim(rs("Previewimg"))<>""  then%><span style="float:left;margin-right:10px;"><img src="<%=trim(rs("Previewimg"))%>"  class="img-bor1" width="100" border=0></span><%end if%>
				  <p><%=UBBCode(rs("skey"),2)%></p>
				</div>
			<% 
			end if
		  else
		  	%>
		  	没有此产品的信息，请认真核实输入的名称。
		  	<%
				end if 
				rs.close
				%>
		</td>
	</tr>
	<tr>
		<td valign=bottom align=left width=250px style="background:url(images/lmenubg.png) left top repeat-y;padding-left:10px;padding-right:10px;">
			<img src=images/lmenu_b.jpg>
		</td>
	</tr>
</table>
</td></tr></table>
<!--#include file="foot.asp"-->