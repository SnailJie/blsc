<!--#include file="head.asp"-->
<%

id=request("id") 
classid=request("classid") 
nclassid=request("nclassid") 
page=cint(request("page"))
'if classid=1 and nclassid="163" and session("username")="" then response.write("<script>alert('请先登陆!如果不是会员请先注册为会员');history.go(-1);</script>")
'if classid=15 and nclassid="" then nclassid=55
'if classid=14 and nclassid="" then nclassid=36
'if classid=19  then response.redirect "book.asp?classid=19"
'if classid=12 then response.redirect "/bbs"
if id<>"" then
sql="SELECT * from article where id="&id
	rs.Open sql,conn,3,3 
	if not(rs.eof and rs.bof) then
		classid=rs("classid")
		nclassid=rs("nclassid") 
		title=rs("title")
		Content=rs("content")
		isHtml=rs("isHtml")
		content=UBBCode(Content,2)
		
	else
		response.Redirect "/"
	end if 
	rs("hits")=rs("hits")+1
	Rs.Update
	rs.close
end if	
 
if classid="" then
	response.Redirect "/"
response.end
end if
	sql="SELECT * from class where id="&classid
	rs.Open sql,conn,1,1 
	if not(rs.eof and rs.bof) then
		bigclassname=rs("class")
	else
		response.Redirect "/"
	end if 
	rs.close
  if nclassid="" then nclassid=0
	if nclassid<>0 then
		sql="SELECT * from nclass where id="&nclassid
		rs.Open sql,conn,1,1 
		if not(rs.eof and rs.bof) then
			smallclassname=rs("nclass")
		else
			response.Redirect "/"
		end if 
		rs.close
	end if

%>
<table><tr><td ></td></tr></table> 
<table width="980" align=center border="0" cellpadding="0" cellspacing="1" bgcolor=#cccccc>
  <tr>
    <td bgcolor=#FFFFFf>  

          	<table width="100%" border="0" cellspacing="0" cellpadding="0">
            <tr>
              <td> </td>
              <td class="ymenu">&nbsp;&nbsp;您现在的位置是：首 页  >   <%=bigclassname%> >  <%=smallclassname%> </td>
            </tr>
            <tr>
              <td class="bg2-l">
              <!--#include file="left.asp" -->
				      </td>
              <td class="bg2-r" align=center height=550>
               
              <table width="0" border="0" cellspacing="0" cellpadding="0">
                  <tr>
                    <td>&nbsp;</td>
                  </tr>
                </table>
     <% 
	    sql="SELECT a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg,n.NClass from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    if nclassid<>0 then
	    	sql=sql & "and a.nclassid="&nclassid&" " 
	    elseif  classid=1411 then
	    	sql=sql & " and  isRecommend=1 "
	    end if 
	    
	    if id<>"" then 
	    	sql=sql & "and a.id="&id
	    end if
	    if classid=16 then
	    	sql=sql&" order by a.SpecialID asc"
	    elseif classid=21 then
	    		sql=sql&"  order by  a.SpecialID desc"
	    else 
	    sql=sql&"  order by n.orders asc"
	    end if 
	    
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then
	 
				rs.PageSize=10
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0
				if rs.recordcount<2   then
					if classid=15 then

							title=rs("title")
					end if
					Content=rs("content")
					isHtml=rs("isHtml")
		      content=UBBCode(Content,2)
					%> 
				  <div class="prolist">
				  	<div class="title11"><%=title%></div> 
                <div class="text1">
                <%=content%></div>
                </div>
           <div>&nbsp;</div>
					<%
			  else 
			   %>
			    <div class="zuopin"><ul>
			   <%
				do while not rs.eof  and t < rs.PageSize
				 
        	%> 
          <li> 
           
		       <%if trim(rs("Previewimg"))<>""  then%> <a  href="view.asp?id=<%=rs("id")%>" ><img src="<%=trim(rs("Previewimg"))%>" border=0></a> <%end if%> 
		      <a  href="view.asp?id=<%=rs("id")%>"><%=rs("NClass")%><%=rs("title")%></a> 
		      
		      </li> 
         <%  
		    rs.movenext  
				loop  
		   end if 
		   %>
	    </ul>
	    <div style="clear:both;height:5px"></div>
		  </div>
		 <div>&nbsp;</div>
		<%
		if rs.recordcount> rs.pagesize then
		%>  
		<div class="banben"> 
   	<% 
   	if page=1 then%>
   	<a href=#>上一页</a>
   	<%else%> 
   	<a href="?classid=<%=classid%>&nclassid=<%=nclassid%>&page=<%=page-1%>">上一页</a>
   <%
   end if
   for   i=1 to rs.pagecount 
  %>
  <a <%if page=i then%>class="red"<%end if%> href="?classid=<%=classid%>&nclassid=<%=nclassid%>&page=<%=i%>"><%=i%></a>   
  <%
   next
   if page=rs.pagecount  then%>
   	<a href=#>下一页</a>
   	<%else%>
    <a href="?classid=<%=classid%>&nclassid=<%=nclassid%>&page=<%=page+1%>">下一页</a>
    <%end if%>
  </div> 
		 <%
		end if
			end if
		rs.close
		%>
   </td>
  </tr> 
 </table> 
 </td></tr>
   </td> 
  </tr>
</table>
<table><tr><td></td></tr></table>
<!--#include file="foot.asp"-->