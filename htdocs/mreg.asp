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
<title>��Ա����</title>
<link rel="stylesheet" href="jmobile/jquery.mobile-1.2.0.css" />
<script src="jmobile/jquery.js"></script>
<script src="jmobile/jquery.mobile-1.2.0.js"></script>
 <% 
 bigclassname="��Ա����"
 smallclassname="��Աע��"	 
  
%>
</head>
<body class="home">

<div data-role="page" id="news">
		<div data-role="header">
		<a href="#" data-role="button" data-transition="slidefade" data-icon="back" class="ui-btn-left" data-theme="a" data-rel="back">����</a>
		<h1><%=bigclassname%></h1>
		<a href="mmember.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false">��Ա����</a>
		<a href="mindex.asp" data-icon="home" data-iconpos="left" data-direction="reverse" class="ui-btn-right" data-ajax="false" style="MARGIN-right:90px;">��ҳ</a>
		
	</div><!-- /header -->

 <ul data-role="listview" data-inset="true" >   
          <br /> ��ʾ��  <font color=#ff0000><%Response.Write  Request("strMsg") %></font>
                <br /> 
               ���Ǿ�������ע��ǼǵĻ�Ա��Ҫ��������Ա��ˣ���������д��ϸ��<br />
                
               <font color=#ff0000>��Ϊ������</font><br /> 
       <div class=tt13> ��Ա��Ϣ</div>
        <div   style="height:650px">
<form action="mSaveUser.asp" method="post" id="form1" name="creator" data-ajax="false">
 �û�����������6-20λӦΪ��ĸ��������
 <input type="text" name="username" class="ninput" value="" style="height:35px;width:100%"> 
 ���룺������6-20λӦΪ��ĸ��������
<input name="password" type="password" value="" size=21 class="ninput" style="height:35px;width:100%;">
�ظ����룺
<input name="password2" type="password" value="" size=21 class="ninput" style="height:35px;width:100%;"> 
���䣺
<input type="text" name="youxiang" class="ninput"  value="" style="height:35px;width:100%;"> 
				<!--�����һ�����
				<tr><td align=right> ������</td><td><input type="text" name="xingming" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> �Ա�</td><td><input type="radio" value="����" name="xingbie">����
				<input type="radio" value="Ůʿ" name="xingbie" >Ůʿ<font color=#ff0000>&nbsp;*</font>
				</td></tr> 
				
				<tr><td align=right>���壺</td><td><input type="text" name="xueke" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
			  <tr><td align=right>���᣺</td><td><input type="text" name="province" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				 <tr><td align=right>�������£�</td><td><input type="text" name="nianji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				 <tr><td align=right>�̻���</td><td><input type="text" name="city" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>
				<tr><td align=right> �ֻ���</td><td><input type="text" name="shouji" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right> QQ/msn��</td><td><input type="text" name="qqmsn" class="ninput"  value="" style="height:25px;width:200px"></td></tr>   
			  
			  <tr><td align=right>΢�źţ�</td><td><input type="text" name="dingyue" class="ninput"  value="" style="height:25px;width:200px"> </td></tr>
			  <tr><td align=right>��λ��</td><td><input type="text" name="xuexiao" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
				<tr><td align=right>ְ��</td><td><input type="text" name="zhiwu" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr> 
				--> 
 <input type="Submit" name="Submit" value=" �ύע����Ϣ  " class="button"> 
        <input name="action" type="hidden" id="action" value="save"> 
        <input name="id" type="hidden" value="">   
    </form> 
    
<!--#include file="mfoot.asp"-->
  