<!--#include file="head.asp"-->
<%
 
id=request("id")  
nclassid=request("nclassid") 
page=cint(request("page")) 
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
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<title> <%=site_info(0)%></title> 
</head>

<body>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=170>    
    	</td>
    	</tr>
    	</table>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td width=200>    <div class="ymenu"> 您现在的位置是：首 页  >   <%=bigclassname%> >  <%=smallclassname%> </div></td>
     
  </tr> 
</table>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=30>    
    	</td>
    	</tr>
    	</table>
<table width="1200" border="0" align="center" cellpadding="0" cellspacing="0">
  <tr>
    <td class="bgcolor1">
    	 <% 
	    sql="SELECT a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    sql=sql & "and a.id="&id&" order by a.id desc"  
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then 
				t=0
				if not rs.eof  then 
					title=rs("title") 
					Content=rs("content")
					isHtml=rs("isHtml") 
		      content=UBBCode(Content,2)  
		      Previewimg=rs("Previewimg")
					%>  
		   
						<div align=center>
						<iframe  name="twt" src="otherimg.asp?id=<%=rs("id")%>&Previewimg=<%=Previewimg%>" width="1200" height="600" marginwidth="5" marginheight="5" align="middle" scrolling="no" frameborder="0" ></iframe>
						</div>
            <table><tr><td></td></tr></table> 
					 <%  
			end if 
				
		 
			end if
		rs.close
		 %>
    	
    	
      <table width="100%" border="0" cellspacing="0" cellpadding="0">
        <tr>
          <td height="45">&nbsp;</td>
        </tr>
        <tr>
          <td class="bgcolor2">
          	<% 
	    sql="SELECT a.SpecialID,a.id,a.classid,a.nclassid,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg,n.NClass from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    if nclassid<>0 then
	    	sql=sql & "and a.nclassid="&nclassid&" "  
	    end if 
	    
	    if id<>0 then 
	    	sql=sql & "and a.id="&id
	    end if
	    sql=sql&" and a.Previewimg <>'' " 
	    sql=sql&"  order by a.id desc"
	     
	    
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then
	 
				rs.PageSize=15
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0 
			   %> 
          <ul>
			   <%
				do while not rs.eof  and t < rs.PageSize 
         
		classid=rs("classid")
		nclassid=rs("nclassid") 
		title=rs("title")
		Content=rs("content")
		content=LCase(UBBCode(Content,2)  )
		id=rs("id")
		t=1 
		
		Previewimg=""
		
		n="" 
		dim m
		m=""
		Do While t <>0 
			 t=instr(t,content,"<img")
			 if t<>0 then
			 n=mid(content,instr(t,content,"src")+5,instr(t,content,"jpg")-instr(t,content,"src")-2)  
			 if left(n,1)="/" then n=right(n,len(n)-1) 
		   n="<li><a href=otherimg.asp?id="&id&"&Previewimg="&n&" target=twt><img src="&n&"></a></li>"
		   Previewimg=Previewimg&n
			 if instr(instr(t,content,">"),content,"<img") then
			    t=instr(instr(t,content,">"),content,"<img")  
			 else
				 t=0
			 end if
			end if
		Loop  
	 
response.write Previewimg
  %> 
  <!--       <li>  
		       <%if trim(rs("Previewimg"))<>""  then%> <a  target=twt href="otherimg.asp?id=<%=rs("id")%>&Previewimg=<%=rs("Previewimg")%>" ><img src="<%=trim(rs("Previewimg"))%>" border=0></a> <%end if%> 
		      <a  href="view.asp?id=<%=rs("id")%>"><%=rs("NClass")%><%=rs("title")%></a>  
		      </li> 
		      -->
         <% 
         t=t+1 
		    rs.movenext  
				loop  
		  
		   %>
	    </ul> 
	    <%
		if rs.recordcount> rs.pagesize then
		 i=1
		 %>  
		 <p class="page">
   	 <% 
   	 if page=1 then%>
   	  <a href="#">上一页</a>
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
    </p>
	 <%
		end if 
	 
		  
		
		end if
		rs.close
		%>  	
        </td>
        </tr>
      </table></td>
  </tr>
</table>
<!--#include file="foot.asp"-->