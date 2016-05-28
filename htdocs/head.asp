<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,fso1,f1,ext,bFlag,p1,arr,w,h,pp
dim bigclassname,smallclassname,Previewimg,skey,keyword,t,pages1,rs1,pages,t1,isHtml,writefrom,adddate 
Set Rs=Server.CreateObject("ADODB.RecordSet") 
Set Rs1=Server.CreateObject("ADODB.RecordSet") 

%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.0 Transitional//EN">
<!-- saved from url=(0027) -->
<HTML xmlns="http://www.w3.org/1999/xhtml"><HEAD>
	<TITLE> <%=site_info(0)%></TITLE>
<META content="text/html; charset=gb2312" http-equiv=Content-Type><!-- Use Internet Explorer Standards mode -->
<META content=IE=10 http-equiv=x-ua-compatible>
<META content=IE=9 http-equiv=x-ua-compatible>
<META content=IE=8 http-equiv=x-ua-compatible>
<META content=IE=7 http-equiv=x-ua-compatible>
<META name=viewport content=width=1200>
<META name=format-detection content=telephone=no> 
<LINK rel=stylesheet type=text/css href="top_files/typeahead.css" media=screen>
<LINK rel=stylesheet type=text/css href="top_files/homeStyle.css" media=screen>
<LINK rel=stylesheet type=text/css href="top_files/jquery.bxslider.css" media=screen>
<link href="css/style.css" rel="stylesheet" type="text/css">
<LINK rel="shortcut icon" href="home_images/favicon.ico"> 

<SCRIPT language=javascript type=text/javascript src="top_files/jquery-1.11.0.min.js"></SCRIPT>
 
<SCRIPT language=javascript type=text/javascript src="top_files/jquery-scrolltofixed-min.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript src="top_files/jquery.cookie.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript src="top_files/jquery.bxslider.min.js"></SCRIPT>
 

<SCRIPT language=javascript type=text/javascript src="top_files/typeahead.min.js"></SCRIPT>

<SCRIPT language=javascript type=text/javascript src="top_files/hogan-2.0.0.js"></SCRIPT>

<META name=GENERATOR content="MSHTML 8.00.7600.16385"></HEAD>
<BODY class=homeBody> 
<DIV id=homeHeaderDiv class=homeHeader>
<DIV class=homeHeaderWraper>
<DIV id=homePgAgilentLogo  style="FLOAT: left; ">
	<A class=homeLogo href="index.asp">
	<IMG alt="Agilent Technologies" src="top_files/header_agilent_logo.png" width=266  > </A>
	</DIV>
<DIV class=topRtNav>
<UL style="FLOAT: right; ">   
	<table>
		<tr>
			<td style=" color:#ffffff;">
   <%if Session("Master")="" then%>
  			 
  			 <form name="myform" method="post" action="SaveUser.asp" >
  			 	<br>
  			  会员登录  用户名： <input type=text name=username  style="width:100px;height:20px;" maxlength=20 class=input value=""> 
  						密&nbsp;&nbsp;码： <input type="password" name=password  style="width:100px;height:20px;" maxlength=20 class=input value="">
  						<input name="action" type="hidden" id="action" value="chklogin"> 
   	      <input type="submit" name="denglu1" value=" 登 陆 " style="border: 0 solid #dddddd; background:url(images/anniu.png) no-repeat; height:26px;font-size:14px;color:#ffffff;padding-top:0px;width:75px;valign:center;">
   	       <input type="button" name="denglu1" value=" 注册 " onclick="window.open('reg.asp')" style="border: 0 solid #dddddd; background:url(images/anniu.png) no-repeat; height:26px;font-size:14px;color:#ffffff;padding-top:0px;width:75px;valign:center;">
   	       
  	 
  	<%Response.Write  "<br>"&Request("strMsg") %>
  	</form> 
  	 <%else%>
  	 当前用户:<a href=member.asp><font color=#8700a2><%=session("Master")%></font></a>
  	 会员状态：【<%=session("quanxian")%>】
  	 <a href=member.asp style="background:#a35f1d;color:#ffffff;">【会员信息】</a>
  	 <a href=saveuser.asp?action=out style="background:#a35f1d;color:#ffffff;">【退出】</a>
		<%end if%>
	</td>
	<td valign=middle>
		<div class="erweima" >
     			 	<ul>
     			 		<li><A href="#"><img src="images/wxx.png" border=0 height=30></A>
     			 			<ul style="z-index:999;position:absolute;"><li><img src="images/erweima.jpg" width=260 border=0></li></ul>
     			 			</li></ul>
     			 			</div>
</td></tr></table>
  <LI style="DISPLAY: none" id=topRtNav4><A href="#" 
  data-link-name="MyAccount">MY ACCOUNT<SPAN id=triangle4 
  class=dropDownTriangle></SPAN></A> 
 </LI></UL>
 <!--
<DIV id=the-basics class="homeSearch divClear">
<FORM id=searchform onsubmit="if(this.Ntt.value == '')return false;" 
action=javascript:submitSearch(); autocomplete="off"><INPUT id=searchinput 
class="typeahead homeSearchBox" type=text name=Ntt placeholder=""> <SPAN 
class=homeSearchImg><A href="javascript:submitSearch();"><IMG alt=Search 
src="top_files/header_icon_search-EN.png" 
width=101 height=22> </A></SPAN><SPAN 
class=homeSearchTxt></SPAN></FORM></DIV>--></DIV>

     			 			
     			 			<!-- .topRtNav -->
<DIV id=homeMainNav class=homeMainNav>
	<div class="menu" >
     				<!--<form  method=post action=search.asp> 
     				<input  type="text" name="keyword" style="height:15px;" size="40" value='请输入要搜索的关键词' onBlur="if (value ==''){value='请输入要搜索的关键词'}" onFocus="if (value =='请输入要搜索的关键词'){value =''}" >
 
        	
        	<input name="imageField" type="image" src="images/search-icon.gif" border="0"  > 
        	 </form>-->
       <ul style="padding-top:10px;" > 
      <li ><a href="index.ASP">首    页</a></li>
     <%  
			    SQL="SELECT top 9 ID,Class FROM Class where id<>411   ORDER BY Orders "
			    Set Rs=Conn.Execute(SQL)
			    If not (Rs.Eof Or Rs.Bof) Then
					 
				    Do While Not Rs.EOF 
						strClass=Rs("Class") 
						%>  
						<li>
							<a href="view.asp?classid=<%=rs("id")%>"><%=strclass%></a>
							<ul> 
								<%
								SQL="SELECT * FROM nclass where parentid="&rs("id")&" order by orders asc" 
							  Set Rs1=Conn.Execute(SQL)
								If not (Rs1.Eof and Rs1.Bof )Then  
								Do While Not Rs1.EOF	
							  %>
						    <li><a href="<%if rs("id")=554 then%>PRO.asp<%else%>view.asp<%end if%>?classid=<%=rs("id")%>&nclassid=<%=rs1("id")%>"><%=left(rs1("nClass"),21)%></a></li> 
							  <% 
								rs1.movenext
						   loop
							 end if 
							 rs1.close	
							%>
							</ul>
				    </li>
            <%
						Rs.MoveNext
				    Loop
				End If 
				rs.close
				%>   
			</ul> 
</ul> 
<div class="clear"> </div>
 </DIV><!-- #homeMainNav --></DIV><!-- .homeHeaderWraper --></DIV><!-- #homeHeaderDiv -->
 </DIV>
 
 

