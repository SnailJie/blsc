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
          <br /> 提示：  <font color=#ff0000><%Response.Write  Request("strMsg") %></font>
                <br /> 
               凡是经过申请注册登记的会员，要经过管理员审核，请资料填写详细。<br />
                
               <font color=#ff0000>都为必填项</font><br /> 
       <div class=tt13> 会员信息</div>
        <div   style="height:650px">
<form action="mSaveUser.asp" method="post" id="form1" name="creator" data-ajax="false">
 用户名：请输入6-20位应为字母或者数字
 <input type="text" name="username" class="ninput" value="" style="height:35px;width:100%"> 
 密码：请输入6-20位应为字母或者数字
<input name="password" type="password" value="" size=21 class="ninput" style="height:35px;width:100%;">
重复密码：
<input name="password2" type="password" value="" size=21 class="ninput" style="height:35px;width:100%;"> 
邮箱：
<input type="text" name="youxiang" class="ninput"  value="" style="height:35px;width:100%;"> 
				<!--用于找回密码
				<tr><td align=right> 姓名：</td><td><input type="text" name="xingming" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> 性别：</td><td><input type="radio" value="先生" name="xingbie">先生
				<input type="radio" value="女士" name="xingbie" >女士<font color=#ff0000>&nbsp;*</font>
				</td></tr> 
				
				<tr><td align=right>民族：</td><td><input type="text" name="xueke" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
			  <tr><td align=right>籍贯：</td><td><input type="text" name="province" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				 <tr><td align=right>出生年月：</td><td><input type="text" name="nianji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right>固话：</td><td><input type="text" name="city" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				<tr><td align=right> 手机：</td><td><input type="text" name="shouji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> QQ/msn：</td><td><input type="text" name="qqmsn" class="ninput"  value="" style="height:25px;width:200px"></td></tr>   
			  
			  <tr><td align=right>微信号：</td><td><input type="text" name="dingyue" class="ninput"  value="" style="height:25px;width:200px"> </td></tr>
			  <tr><td align=right>单位：</td><td><input type="text" name="xuexiao" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right>职务：</td><td><input type="text" name="zhiwu" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				--> 
 <input type="Submit" name="Submit" value=" 提交注册信息  " class="button"> 
        <input name="action" type="hidden" id="action" value="save"> 
        <input name="id" type="hidden" value="">   
    </form> 
    
<!--#include file="mfoot.asp"-->
  