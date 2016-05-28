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
 
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>会员中心</title>
<link rel="stylesheet" href="jmobile/jquery.mobile-1.2.0.css" />
<script src="jmobile/jquery.js"></script>
<script src="jmobile/jquery.mobile-1.2.0.js"></script>
 <% 
 bigclassname="会员中心"
 smallclassname="会员注册"	 
  
%>
</head>
<body class="home">

<div data-role="page" id="news">
		<div data-role="header">
		<a href="#" data-role="button" data-transition="slidefade" data-icon="back" class="ui-btn-left" data-theme="a" data-rel="back">返回</a>
		<h1><%=bigclassname%></h1>
		<a href="mmember.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false">会员中心</a>
		<a href="mindex.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false" style="MARGIN-right:90px;">主页</a>
		
	</div><!-- /header -->

 <ul data-role="listview" data-inset="true" >   
          <br />   <font color=#ff0000><%Response.Write  Request("strMsg") %></font>
 
 
        <%if Session("Master")="" then%>
  			 <br>如果已经是会员直接登录，如果还没有注册选择注册.<br /> 
  			 <form name="myform" method="post" action="mSaveUser.asp" >
  			 	<br>
  			  用户名： <input type=text name=username  style="width:100%;height:40px;" maxlength=20 class=input value=""> 
  						密&nbsp;&nbsp;码： <input type="password" name=password  style="width:100%;height:40px;" maxlength=20 class=input value="">
  						<input name="action" type="hidden" id="action" value="chklogin"> 
   	      <input type="submit" name="denglu1" value=" 登 陆 " >
   	       <input type="button" name="denglu1" value=" 注册 " onclick="window.open('mreg.asp')"  >
   	       
  	 
  	<%Response.Write  Request("strMsg") %>
  	
  	<br /> 
  	<br /> 
  	</form> 
  	 <%else%>
  	 当前用户:<a href=mmember.asp><font color=#8700a2><%=session("Master")%></font></a>
  	 会员状态：【<%=session("quanxian")%>】
  	 <a href=mmember.asp style="background:#a35f1d;color:#ffffff;">【会员信息】</a>
  	 <a href=mSaveUser.asp?action=out style="background:#a35f1d;color:#ffffff;">【退出】</a>
  	 <form action="medit.asp" method="post" id="form1" name="creator" data-ajax="false">
  <%
      	sql="select top 1 *  from userinfo where username='"&session("Master")&"' "
	      rs.open sql,conn,1,1  
	      %> 
	      用户名： 
 <input type="text" name="username" class="ninput" readOnly class="ninput" value="<%=rs("username")%>"> 
 密码： 
<input name="password" type="password" value=""  class="ninput" style="height:35px;width:100%;">
邮箱：
<input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>"> 
联系人：
<input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>">			

手机：<input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>"> 
QQ：<input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" >
通信地址：<input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" > 
 邮政编码：<input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>">
				 	
				 	 
 <input type="Submit"  value="提交修改信息" class="button"> 
        <input name="action" type="hidden" id="action" value="save"> 
        <input name="id" type="hidden" value="<%=rs("id")%>">  
        <%
				rs.close
				%> 
    </form> 
				     注意：密码为空时 不修改密码
		<%end if%>
  </ul>       
<!--#include file="mfoot.asp"-->
 