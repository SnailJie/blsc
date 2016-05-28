<!--#include file="head.asp"-->
<%
keyword=request("keyword") 
page=cint(request("page")) 
%>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=170>    
    	</td>
    	</tr>
    	</table>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
  
              <td class="bg2-r"><div class="ymenu">&nbsp;&nbsp;您现在的位置是：首 页  >   搜索的关键词为：  <%=keyword%> </div>  
     
                <%
           
	    sql="SELECT a.writefrom,a.adddate,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.title like '%"&keyword&"%' or a.content like '%"&keyword&"%'"
	     
	    'if classid=15 then
	    	sql=sql&"  order by  a.id desc"
	    'else 
	    'sql=sql&"  order by n.orders,a.id desc"
	    'end if
	    
	    
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then
		 
				rs.PageSize=20
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0
				 
			   
				do while not rs.eof  and t < rs.PageSize
					t=t+1 
       
        	%>
        
        	 <div class="prolist" style="width:700px;"><ul>
          <li><%if trim(rs("Previewimg"))<>""  then%><div class="r"><%else%><div><%end if%><div>
          <%if classid=18 then%><span>[<%=left(rs("adddate"),instr(6,rs("adddate"),"-")+2)%>]</span><%end if%><a  href="view.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
		  <p><%=HtmlEncode(left(rs("skey"),150))%></p>
		  <%if classid=2218 then%><span><a  href="view.asp?id=<%=rs("id")%>">详情请点击</a></span><%end if%>
		  </div>
		  </div>
		  <%if trim(rs("Previewimg"))<>""  then%><div class="l"><a  href="view.asp?id=<%=rs("id")%>"  target="_blank"><img src="<%=trim(rs("Previewimg"))%>"  border=0></a> </div><%end if%> 
		  <div style="clear:both"></div>
		  </li>
		  </ul>
		  </div> 
		 <%
       
		    rs.movenext  
				loop  
			end if 
	 
		if rs.recordcount> rs.pagesize then
		%>  
			<div class="banben" style="width:700px;"> 
   	<% 
   	if page=1 then%>
   	<a href=#>上一页</a>
   	<%else%> 
   	<a href="?keyword=<%=keyword%>&page=<%=page-1%>">上一页</a>
   <%
   end if
   for   i=1 to rs.pagecount 
  %>
  <a <%if page=i then%>class="red"<%end if%> href="?keyword=<%=keyword%>&page=<%=i%>"><%=i%></a>   
  <%
   next
   if page=rs.pagecount  then%>
   	<a href=#>下一页</a>
   	<%else%>
    <a href="?keyword=<%=keyword%>&page=<%=page+1%>">下一页</a>
    <%end if%>
  </div> 
		 <%
		end if 
		rs.close
		%>
 </td>   
  </tr> 
 </table> 
<table><tr><td></td></tr></table>
<!--#include file="foot.asp"-->