<!--#include file="head.asp"-->
<%

id=request("id") 
classid=request("classid") 
nclassid=request("nclassid") 
page=cint(request("page"))
'if classid=1 and nclassid="163" and session("username")="" then response.write("<script>alert('请先登陆!如果不是会员请先注册为会员');history.go(-1);</script>")
'if classid=15 and nclassid="" then nclassid=55
'if classid=14 and nclassid="" then nclassid=36
if classid=2  then response.redirect "pro.asp?classid=2&nclassid="&nclassid
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
<table cellspacing=0 cellpadding=0 border=0 width=980 align=center><tr><td width=100% bgcolor=#eeeeee height=1px></td></tr></table> 
<table><tr><td height=20></td></tr></table> 
<table width="980" align=center border="0" cellpadding="0" cellspacing="0" bgcolor=#cccccc>
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
	    sql="SELECT a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    if nclassid<>0 then
	    	sql=sql & "and a.nclassid="&nclassid&" " 
	    elseif  classid=1411 then
	    	sql=sql & " and  isRecommend=1 "
	    end if 
	    
	    if id<>"" then 
	    	sql=sql & "and a.id="&id
	    end if
	    if classid=21  then
	    	sql=sql&" order by a.SpecialID asc"
	    elseif classid=16 then
	    		sql=sql&"  order by a.SpecialID desc"
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
				  title=rs("title") 
				content=LCase(UBBCode(Content,2))
		      Previewimg=rs("Previewimg")
					%>  
		   <div style="clear:both"></div> 
					<div class="prolist"">
						
						<div>&nbsp;</div> 
						<div align=center>
						<table width="0" border="0" cellspacing="1" bgcolor=#cccccc cellpadding="0"><tr><td bgcolor=#ffffff>
							<iframe  name="twt" src="viewimg.asp?id=<%=rs("id")%>&Previewimg=<%=Previewimg%>" width="660" height="440" bgcolor="#ffffff" marginwidth="5" marginheight="5" align="middle" scrolling="no" frameborder="0" ></iframe>
            </td></tr></table><table><tr><td></td></tr></table> 
					<%
					 
						t=1  
						Previewimg="" 
						n="" 
						dim m,tempPreviewimg
						tempPreviewimg=""
						m=""
						Do While t <>0 
							 t=instr(t,content,"<img")
							 n=mid(content,instr(t,content,"src")+5,instr(t,content,"jpg")-instr(t,content,"src")-2)  
							 if left(n,1)="/" then n=right(n,len(n)-1) 
						   n="<li><a href=viewimg.asp?id="&id&"&Previewimg="&n&" target=twt><img  src="&n&" border=0 ></a></li>"
						   Previewimg=Previewimg&n
							 if instr(instr(t,content,">"),content,"<img") then
							    t=instr(instr(t,content,">"),content,"<img")  
							 else
								 t=0
							 end if
						Loop  
	       
        
    %>
				  </div>
		   <div style="clear:both"></div> 
		   <div class="bgcolor2"><% 
		    response.write Previewimg
		    %>
		    </div> 
		   <table><tr><td height=10></td></tr></table>
		   <table width=660 align=center><tr><td><div><p><%=UBBCode(rs("skey"),2)%></p> </div> </td></tr></table> 
		 
		</div>  
		<div>&nbsp;</div> 
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
 