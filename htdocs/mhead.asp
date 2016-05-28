<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,fso1,f1,ext,bFlag,p1,arr,w,h,pp
dim bigclassname,smallclassname,Previewimg,skey,keyword,t,pages1,rs1,pages,t1,isHtml,writefrom,adddate 
Set Rs=Server.CreateObject("ADODB.RecordSet") 
Set Rs1=Server.CreateObject("ADODB.RecordSet") 
 
id=cint(request("id"))
classid=cint(request("classid"))
nclassid=cint(request("nclassid")) 
page=cint(request("page"))
pages1=cint(request("pages1"))
 if nclassid<>0 then
		sql="SELECT * from nclass where id="&nclassid
		rs.Open sql,conn,1,1 
		if not(rs.eof and rs.bof) then
			smallclassname=rs("nclass")
			classid=rs("ParentID")
		else
			response.Redirect "/"
		end if 
		rs.close
	end if
 
if id<>0 then
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

if classid=0 then
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
 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=title&"--"&bigclassname%></title>
<link rel="stylesheet" href="jmobile/jquery.mobile-1.2.0.css" />
<script src="jmobile/jquery.js"></script>
<script src="jmobile/jquery.mobile-1.2.0.js"></script>
 
</head>
<body class="home">

<div data-role="page" id="news">
		<div data-role="header">
		<a href="#" data-role="button" data-transition="slidefade" data-icon="back" class="ui-btn-left" data-theme="a" data-rel="back">返回</a>
		<h1><%=bigclassname%></h1>
		<a href="mmember.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false">会员中心</a>
		<a href="mindex.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false" style="MARGIN-right:90px;">主页</a>
		
	</div><!-- /header -->
