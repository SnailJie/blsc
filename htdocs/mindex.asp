<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,fso1,f1,ext,bFlag,p1,arr,w,h,pp
dim bigclassname,smallclassname,Previewimg,skey,keyword,t,pages1,rs1,pages,t1,isHtml,writefrom,adddate 
Set Rs=Server.CreateObject("ADODB.RecordSet") 
Set Rs1=Server.CreateObject("ADODB.RecordSet") 
  
%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<meta name="viewport" content="width=device-width, initial-scale=1">
<title><%=site_info(0)%></title>
<link rel="stylesheet" href="jmobile/jquery.mobile-1.2.0.css" />
<script src="jmobile/jquery.js"></script>
<script src="jmobile/jquery.mobile-1.2.0.js"></script>
<script src="jmobile/jquery.nicescroll.js"></script>
<style>
.home {
background: transparent url(image/01.png); 
}
</style>
<script>
  $(document).ready(function() {
    $("html").niceScroll({cursorwidth:4});  // The document page (html)
  });
</script>
<script type="text/javascript" src="js/scroll.js"></script>
<style type="text/css">
*{margin:0;padding:0;list-style-type:none;}
a,img{border:0;}
body{font:12px/180% Arial, Helvetica, sans-serif, "新宋体";}

.scroll{max-width: 100%;height: auto;width: auto\9;height:200px;margin:20px auto 0 auto; position:relative;overflow:hidden;}
.mod_01{float:left;width:480px;}
.mod_01 img{display:block;width:480px;height:200px;}
.dotModule_new{padding:0 5px;height:11px;line-height:6px;-webkit-border-radius:11px;background:rgba(45,45,45,0.5);position:absolute;bottom:5px;right:10px;z-index:11;}
#slide_01_dot{text-align:center;margin:3px 0 0 0;}
#slide_01_dot span{display:inline-block;margin:0 3px;width:5px;height:5px;vertical-align:middle;background:#f7f7f7;-webkit-border-radius:5px;}
#slide_01_dot .selected{background:#66ff33;}
#slide_01_width{max-width: 100%;height: auto;width: auto\9;}
</style>
</head>
<body >
	
<!-- Home -->
<div data-role="page" class="home">
	 
<div data-role="content">
	<div style=" color:#183e69; font-size:15px; font-weight:bold; "><img src="/images/logo.png" width=320px><br>电话：010-82616977 4006-365-360<a href="mmember.asp" style="COLOR: #0085d5; TEXT-DECORATION: none;">【会员中心】</a></div>
	
	<div class="scroll">
	<div class="slide_01" id="slide_01">
		<% classid=323
	    sql="SELECT a.nclassid,a.isRecommend,a.SpecialID,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg from article A LEFT JOIN NClass N ON (A.NClassID=N.ID) where a.classid="&classid&" "
	     sql=sql&"  order by n.orders asc"
		  rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then 
			 t=0
				do while (not rs.eof) and t<6
					t=t+1 
         
        	%> 
        	<div class="mod_01"><a href="mview.asp?id=<%=rs("id")%>" > <img src="<%=trim(rs("Previewimg"))%>" alt="<%=trim(rs("title"))%>"></a></div>
         
         <%  
		    rs.movenext  
				loop  
		
			end if
		rs.close
		%>  
  	
		<div class="mod_01"><a href="mview.asp?classid=2&nclassid=52"><img src="wap/banner1.jpg"></a></div>
		<div class="mod_01"><a href="mview.asp?classid=2&nclassid=53"><img src="wap/banner2.jpg"></a></div>
		<div class="mod_01"><a href="mview.asp?classid=2&nclassid=54"><img src="wap/banner3.jpg"></a></div>
		<div class="mod_01"><a href="mview.asp?classid=17&nclassid=74"><img src="wap/banner4.jpg"></a></div>
		<div class="mod_01"><a href="view.asp?classid=17&nclassid=75"><img src="wap/banner5.jpg"></a></div>
		<div class="mod_01"><a href="mview.asp?classid=4"><img src="wap/banner6.jpg"></a></div> 
	</div>
	<div class="dotModule_new">
		<div id="slide_01_dot"></div>
	</div>
</div>

<script type="text/javascript">
if(document.getElementById("slide_01")){
	var slide_01 = new ScrollPic();
	slide_01.scrollContId   = "slide_01"; //内容容器ID
	slide_01.dotListId      = "slide_01_dot";//点列表ID
	slide_01.dotOnClassName = "selected";
	slide_01.arrLeftId      = "sl_left"; //左箭头ID
	slide_01.arrRightId     = "sl_right";//右箭头ID
	slide_01.frameWidth     = 480;
	slide_01.pageWidth      = 480;
	slide_01.upright        = false;
	slide_01.speed          = 10;
	slide_01.space          = 30; 
	slide_01.initialize(); //初始化
}
</script>
	 
		<ul data-role="listview" data-inset="true" >  
			
			<li><a href="mview.asp?classid=12" data-transition="slidedown"><img src="wap/news.png" alt="News" class="ui-li-icon">新闻中心 </a></li> 
			<li><a href="mview.asp?classid=2" data-transition="turn"><img src="wap/events.png" alt="Events" class="ui-li-icon">助力精准医疗 </a></li>
			<li><a href="mview.asp?classid=17" data-transition="pop"><img src="wap/athletics.png" alt="Athletics" class="ui-li-icon">物联网技术</a></li>
			<li><a href="mview.asp?classid=4" data-transition="slidedown"><img src="wap/contact.png" alt="Contact" class="ui-li-icon">计算解决方案</a></li>
			<li><a href="mview.asp?classid=14" data-transition="slidedown"><img src="wap/maps.png" alt="Links" class="ui-li-icon">支持与下载</a></li> 
			<li><a href="mview.asp?classid=1" data-transition="turn"><img src="wap/events.png" alt="Events" class="ui-li-icon">关于我们</a></li>
			<li><a href="mview.asp?classid=9" data-transition="turn"><img src="wap/events.png" alt="Events" class="ui-li-icon">北京超级云计算中心</a></li>  
  
		</ul>
		<div style=" color:#183e69; font-size:10px; font-weight:bold; ">  电话：010-82616977 4006-365-360   版权所有 2013-2015 北龙超云
<br>邮箱：hr-blsc@sccas.cn blsc-solution@sccas.cn 京ICP备12004296号 </div>
</div><!-- end content -->

</div><!-- end page -->
 
</div>
<script language="javascript" type="text/javascript" src="http://js.users.51.la/17819488.js"></script>
<noscript><a href="http://www.51.la/?17819488" target="_blank"><img alt="&#x6211;&#x8981;&#x5566;&#x514D;&#x8D39;&#x7EDF;&#x8BA1;" src="http://img.users.51.la/17819488.asp" style="border:none" /></a></script>
</body>
</html>

