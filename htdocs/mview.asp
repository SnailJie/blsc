<!--#include file="mhead.asp"-->

<% 
	    sql="SELECT a.nclassid,a.isRecommend,a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    if nclassid<>0 then 
	      	sql=sql & "and a.nclassid="&nclassid&" "  
	   
	    end if 
	    
	    if id<>0 then 
	    	sql=sql & "and a.id="&id 
	    end if
	    if classid=4 then
	    	sql=sql&"  order by n.orders asc"
		  else
				sql=sql&"  order by a.id desc"
			end if  
			
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then
	 
				rs.PageSize=20
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0
				if rs.recordcount<2   then
					
					Content=rs("content")
					isHtml=rs("isHtml")
		      content=UBBCode(Content,2) 
					%> 
					<div data-role="content">
						<style>
							img{max-width: 100%;height: auto;width: auto\9;}
							</style>
<p><p class=img>   <%=Replace(content,"style","style0")%> </p></p>
	</div>
				  
					<%
			  else 
			   %>
			   <div data-role="content">
		<ul data-role="listview">
	 
	

			
			   <%
				do while not rs.eof  and t < rs.PageSize
					t=t+1 
         
        	%>
        	
        	<li>
				<a href="mview.asp?id=<%=rs("id")%>">
	<%if trim(rs("Previewimg"))<>"" then%><img src="<%=trim(rs("Previewimg"))%>"  style="width:80px; height:54px;border-radius:5px; margin-top:15px;" /><%end if%>
										<h3><%=rs("title")%></h3>
					<p><%=HtmlEncode(left(rs("skey"),150))%></p>
				</a>
	</li>
     
         <%  
		    rs.movenext  
				loop 
			 %>
	   </ul>
				
	</div>
		<% 
			end if 
				
		
			end if
		rs.close
		%>
	
		<!-- /content -->
		
	 
   
<!--#include file="mfoot.asp"-->