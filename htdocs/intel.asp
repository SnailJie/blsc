<!--#include file="head.asp"-->
<%

id=request("id") 
classid=4
nclassid=79
page=cint(request("page"))
pages1=cint(request("pages1"))
'if classid=1 and nclassid="163" and session("username")="" then response.write("<script>alert('请先登陆!如果不是会员请先注册为会员');history.go(-1);</script>")
'if classid=4  then response.redirect "pro.asp?classid="&classid&"&nclassid="&nclassid
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
'if classid=4 then response.redirect "other.asp?id="&id
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

if classid=00014 and session("quanxian")="" then
			 
			response.Redirect "reg.asp"
 end if 
%> 
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td height=170>    
    	</td>
    	</tr>
    	</table>
<table width="1200" align=center border="0" cellpadding="0" cellspacing="1">
  <tr valign=top>
    <td width=200>    
       <!--#include file="left.asp" -->
		 </td>
		 <td width=17>     
		 </td>
      <td class="bg2-r">
      <div class="ymenu"> 您现在的位置是：首 页  >   <%=bigclassname%> >  <%=smallclassname%> </div><!-- 
       <img src="images/banner_<%=classid%>.jpg" width="500" border=0>-->
              
   <% 
	    sql="SELECT a.nclassid,a.isRecommend,a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	    if nclassid<>0 then
	      sql=sql & "and a.nclassid="&nclassid&" " 
	     end if
	   
	   if classid=20 and id=0 then 
	    	if  nclassid=0 then 
	    	sql=sql & " and  a.isRecommend=1 " 
	      else 
	      'sql=sql & " and  a.isRecommend<>1 " 
	      end if
	    end if 
	    
	    if id<>"" then 
	    	sql=sql & "and a.id="&id 
	    end if
	    
				sql=sql&"  order by a.adddate desc"
	 
			 'response.write sql
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then 
				rs.PageSize=10
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0
				if rs.recordcount<2   then
					
					Content=rs("content")
					isHtml=rs("isHtml")
		      content=UBBCode(Content,2)
		      id=rs("id")
					%>  
				  <div style="1background:#ffffff url(../images/rightbg.jpg) no-repeat top right;">
				  	<!--<div class="title11"><%=title%></div> -->
                <div class="text1"><%
                 
                 
function charCount(strS,chrC) '获取总页数的函数
dim Tempstr
TempStr = Replace(strS, chrC, "")  
charCount =( Len(strS) - Len(TempStr))/len(chrC) +1
end function

function charweizhi(strS,chrC,stra) '获取分页符 在字符位置的函数
	dim Tempdir
	Tempdir=1  
	for i=1 to chrC 
	  Tempdir=instr(Tempdir,content,stra)+77 
	next 
  charweizhi =Tempdir 
end function

dim output
if pages1=0 then pages1=1
PageCount=charCount(content,"page-break-after")

  if pages1=PageCount then 
  output=mid(content,charweizhi(content,pages1-1,"page-break-after"),len(content)) 
  else
  output=mid(content,charweizhi(content,pages1-1,"page-break-after"),charweizhi(content,pages1,"page-break-after")-charweizhi(content,pages1-1,"page-break-after")) 
  end if
 Response.Write   output
 if PageCount>1 then
  %>
   <div align=center>
   	<%if pages1=1 then%>
   	上一页
   	<%else%>
   	
   	<a href="view.asp?id=<%=id%>&pages1=<%=pages1-1%>">上一页</a>
   	
   <%
  end if
   for   i=1 to PageCount 
  
  Response.Write   "&nbsp;<a href=view.asp?id="&id&"&pages1="&i&">"&i&"</a>&nbsp;"   
  
   next
   if pages1=PageCount  then%>
   	下一页
   	<%else%>
    <a href="view.asp?id=<%=id%>&pages1=<%=pages1+1%>">下一页</a>
    <%end if%>
  </div>
  <%end if%></div>
  <%if classid=111 and nclassid=15 then%>
 ditu
  <%end if%>
               <div style="clear:both"></div>
               <div align=right>
            <%
         
							SQL="SELECT top 1 * FROM article where classid="&classid&" "
							if nclassid<>0 then
							sql=sql& "  and nclassid="&nclassid&" "
							end if 
							sql=sql&" and id >"&id&" order by id asc"
							
							    rs1.Open sql,conn,1,1 
									if not(rs1.eof and rs1.bof) then 
									%> 
									  <%if classid<>118 then%> <a href="view.asp?id=<%=rs1("id")%>"> 【上一篇】</a> <%end if%>
									  <%  
								 
							    End If  
						  rs1.close
					  
							SQL="SELECT top 1 * FROM article where classid="&classid&"  "
							if nclassid<>0 then
							sql=sql& "  and nclassid="&nclassid&" "
							end if
							sql=sql&" and id <"&id&" order by id desc"
							rs1.Open sql,conn,1,1 
							if not(rs1.eof and rs1.bof) then 
							%> 
							 <%if classid<>128 then%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<a href="view.asp?id=<%=rs1("id")%>">【下一篇】</a><%end if%>
							
							<% 
							 
							End If 
						 rs1.close
				 
			 		%> &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
			 		</div>
			 		</div>
			 		<div>&nbsp;</div>
					 
					<%
			  elseif classid= 20  then
			  	
			  	 %>
			  <div class="wsdlest">
			  	<ul>
			  <% t=0
        	do while not rs.eof  and t < rs.PageSize
					
					if nclassid=0 and rs("isRecommend")=1 then
						t=t+1 
        	%> 
        <li <%if t mod 2 =1 then response.write "style=margin-left:0px;"%>> 
        	 <div class="r"><span>》》</span><a  href="view.asp?classid=<%=classid%>&nclassid=<%=rs("nclassid")%>"><%=rs("title")%></a></div>
			     <div><%=HtmlEncode(left(rs("skey"),180))%> </div> 
						 <div class="l"><a href="view.asp?classid=<%=classid%>&nclassid=<%=rs("nclassid")%>" ><img src="<%=trim(rs("Previewimg"))%>" ></a>  </div> 
		      </li> 
         <% 
       elseif nclassid<>0 and rs("isRecommend")<>1 then
       	t=t+1 
         	%> 
        <li <%if t mod 2 =1 then response.write "style=margin-left:0px;"%>> 
        	 <div class="r"><span>》》</span><a  href="view.asp?id=<%=rs("id")%>"><%=rs("title")%></a></div>
			     <div><%=HtmlEncode(left(rs("skey"),180))%> </div> 
						 <div class="l"><a href="view.asp?id=<%=rs("id")%>" ><img src="<%=trim(rs("Previewimg"))%>" ></a>  </div> 
		      </li> 
         <% 
          end if 
		    rs.movenext  
				loop
				
			 %>
	   </ul>
		  </div>
		  <%
			  else 
			   
				do while not rs.eof  and t < rs.PageSize
				 
        	%>
        	 <div class="prolist"><ul>
          <li><%if trim(rs("Previewimg"))<>""  then%><div class="r"><%else%><div><%end if%><div>
          <%if classid=18 then%><span>[<%=left(rs("adddate"),instr(6,rs("adddate"),"-")+2)%>]</span><%end if%><a  href="view.asp?id=<%=rs("id")%>"><%=rs("title")%></a>
		  <p><%=HtmlEncode(left(rs("skey"),190))%></p>
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
 </td> 
  </tr>
</table> 
<!--#include file="foot.asp"-->