<!--#include file="head.asp"-->  
  <!-- Wenjuan Layer Begin -->
<div id="idy_floatdiv" style="position:fixed;right:0;top:250px;">
<a href="http://www.wenjuan.com/s/V77j6j/" target="blank"><img src="http://www.wenjuan.com/static/images/sharepic/share_pA.png" /></a>
</div>
<!-- Wenjuan Layer End -->
 <% strtemp =Request.ServerVariables("Http_User_Agent")
if InStr(strtemp,"Android")>0 or InStr(strtemp,"SymbianOS")>0 or InStr(strtemp,"iPhone")>0 or InStr(strtemp,"iPod")>0 or InStr(strtemp,"iPad")>0 or InStr(strtemp,"Windows Phone")>0  then
response.redirect  "mindex.asp" '如果是手机访问则跳转到wap.asp
response.end 
end if%>
<DIV class=homeContainer>
<DIV id=bx-default-Pager class=defaultPagination>
<UL>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="0">1</A></LI>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="1">2</A></LI>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="2">3</A></LI>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="3">4</A></LI>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="4">5</A></LI>
  <LI><A class=bx-pager-link href="#a"  data-slide-index="5">6</A></LI></UL></DIV>
<DIV id=bx-pager class="bx-pager navigationThumbnail">
<UL><A href="#a" data-slide-index="0">
  <LI style="BACKGROUND-IMAGE: url(home_images/1_nav_icon_pharma_060314.png)"  class=thumbnailSpan><SPAN>助力精准医疗</LI></SPAN></A>
  	<IMG  class=thumnailSeperator alt=separator  src="top_files/thumbnailSeprator.png"  width=2 height=110>
  	
 <A href="#a"  data-slide-index="1">
  <LI style="BACKGROUND-IMAGE: url(home_images/2_nav_icon_energy.png)" class=thumbnailSpan><SPAN>患癌风险评估</LI></SPAN></A>
  	<IMG class=thumnailSeperator alt=separator src="top_files/thumbnailSeprator.png" width=2 height=110> 
  	
  	<A href="#a" data-slide-index="2">
  <LI style="BACKGROUND-IMAGE: url(home_images/3_nav_icon_env.png)"  class=thumbnailSpan><SPAN>癌症突变探测</LI></SPAN></A>
  	<IMG  class=thumnailSeperator alt=separator  src="top_files/thumbnailSeprator.png"  width=2 height=110> 
  	
  	<A href="#a"  data-slide-index="3">
  <LI style="BACKGROUND-IMAGE: url(home_images/4_nav_icon_reserach.png)" class=thumbnailSpan><SPAN>万物互联</LI></SPAN></A>
  	<IMG class=thumnailSeperator alt=separator src="top_files/thumbnailSeprator.png" width=2 height=110> 
  	
  	<A href="#a" data-slide-index="4">
  <LI style="BACKGROUND-IMAGE: url(home_images/5_nav_icon_diagnostics.png)" class=thumbnailSpan><SPAN>智能防伪</LI></SPAN></A>
  	<IMG  class=thumnailSeperator alt=separator  src="top_files/thumbnailSeprator.png"  width=2 height=110> 
  	
  	<A href="#a"  data-slide-index="5">
  <LI style="BACKGROUND-IMAGE: url(home_images/6_nav_icon_food.png)"  class=thumbnailSpan><SPAN>可视化技术</SPAN></LI></A>
  	
  	</UL></DIV>
 
<UL class=bxslider>
  <LI><A  href="view.asp?classid=2&nclassid=52"  target=_self>
  <DIV class=heroBox>
  <DIV>让基因组学研究成为个人治疗的根据 </DIV><SPAN   class=readMore>详细信息 &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage src="top_files/heropharma.jpg" width="100%" height=770> </LI>
  	
  	
  <LI><A href="view.asp?classid=2&nclassid=53"  target=_self>
  <DIV class=heroBox>
  <DIV>确保未来更健康 </DIV><SPAN class=readMore>详细信息  &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage  src="top_files/hero_energy_2015_1.jpg"  width="100%" height=770> </LI>
  	
  <LI><A href="view.asp?classid=2&nclassid=54"  target=_self>
  <DIV class=heroBox>
  <DIV>掌握突变先机 </DIV><SPAN class=readMore>详细信息 &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage src="top_files/heroenv.jpg" width="100%" height=770> </LI>
  	
  <LI><A href="view.asp?classid=17&nclassid=74"  target=_self>
  <DIV class=heroBox>
  <DIV>让世界智慧起来</DIV><SPAN  class=readMore>详细信息 &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage  src="top_files/heroresearch.jpg"  width="100%" height=770> </LI>
  	
  <LI><A href="view.asp?classid=17&nclassid=75"  target=_self>
  <DIV class=heroBox>
  <DIV>让世界真实起来</DIV><SPAN  class=readMore>详细信息 &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage  src="top_files/hero_diagnostics_2015_1.jpg"  width="100%" height=770> </LI>
  	
  <LI><A href="view.asp?classid=4"  target=_self>
  <DIV class=heroBox>
  <DIV>让大数据更直观</DIV><SPAN class=readMore>详细信息  &gt;</SPAN></DIV></A>
  	<IMG alt=HeroBannerImage  src="top_files/hero_food_2015_1.jpg"  width="100%" height=770> 
  	</LI></UL></DIV>
 
<SCRIPT type=text/javascript>
	$("#homeyear").text("2015");
</SCRIPT>
<!-- eng **** euCookieLangValue -->
<SCRIPT>
//Commenting because keysight messgae is not required any more - IM16979370
//showKeySightMessage();
$(document).ready(function(){

//script for herobanner slide
$('.bxslider').bxSlider({
  auto: true,
  pagerCustom: '#bx-pager,#bx-default-Pager',
  pause:12000,
  autoStart:true,
  touchEnabled:false,
  mode:'horizontal',
  startSlide: 5,
});
if ( $( ".bx-loading" ).length ) {
$(".bx-loading").remove();
}
$(".twitter-typeahead").css("position","relative");
$(".twitter-typeahead").css("display","block");

setTimeout(function(){
	document.querySelectorAll(".homeSearchImg")[0].querySelectorAll("a")[0].href="javascript:doSearch();";
}, 100);  

});

</SCRIPT>

</div> 
</td></tr></table>  
 <table width="1210" align="center"  cellpadding="0" cellspacing="0">
     		<tr>
     			<td style="padding-right:10px;  "> 
 <div align=center style="background:url(images/line.jpg) no-repeat top;width:100%;height:3px;"></div>
  <div align=center style="background:url(images/line1.jpg) no-repeat top;width:100%;height:20px;"></div>
 <table><tr><td height=5></td></tr></table>
 <table width=1200 align=center cellpadding="0" cellspacing="0" >
	<tr valign=top>  
     <td width="450">
     		<%classid=12%>		 
     	<div class=tt12><a href="view.asp?classid=<%=classid%>">新闻中心</a></div> 
			<div class=news>	
				     		<ul> 
				     		<% 
						SQL="SELECT top 5 * FROM article where classid="&classid&" order by  adddate desc" '
						rs.Open sql,conn,1,1 
						if not(rs.eof and rs.bof) then
						Do While Not Rs.EOF  
						%>
            <li><a href="view.asp?id=<%=rs("id")%>" title="<%=left(rs("title"),35)%>">
            	<span> <%=left(rs("adddate"),instr(6,Replace(rs("adddate"),"/","-"),"-")+2)%> </span>· <%=left(rs("title"),30)%></a></li>
          <% 
						Rs.MoveNext
						Loop
						End If 
						rs.close
						%>
     		 </ul> 
		</div>	 
    </td>
     <td width=20 valign=middle>
     	<table height=100><tr><td width=1 bgcolor=#cccccc> </td></tr></table>
     	 </td>
    <td valign=top> 
    	<%
		
		t=0
		sql="SELECT top 1 * from article where classid=1 order by adddate desc" 
		rs.Open sql,conn,1,1 
		if not(rs.eof and rs.bof) then
		 
				%>
				<div ><a href="view.asp?id=<%=rs("id")%>" style="color:#666666;font-size:18px; "><%=rs("title")%></a></div>
    	<div style="">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<%=HtmlEncode(rs("skey"))%> </div> 
    <%if trim(rs("Previewimg")) <>"" then%><img src="<%=trim(rs("Previewimg"))%>" border=0><%end if%>
			<%  
		end if 
		rs.close
		%> 
    	
    	
    </td> 
  </tr>
</table>
</td></tr></table>
<table><tr><td height=10></td></tr></table>
 <table width=100% align=center cellpadding="0" cellspacing="0" bgcolor=#eeeeee>
	<tr valign=top>  
     <td >
     	<table width=1200 align=center cellpadding="0" cellspacing="10" bgcolor=#dedede>
	    <tr valign=top>  
        <td >
 <table align=center width=1200><tr>
<%  
			    SQL="SELECT ID,Class FROM Class where id=2 or id=4  or id=17  or id=14  ORDER BY Orders "
			    Set Rs=Conn.Execute(SQL)
			    If Rs.Eof Or Rs.Bof Then
					Response.Write (" ")	   
			    Else 
			    	t=0
				    Do While  Not Rs.EOF  and t<8
				    	t=t+1 
						strClass=Rs("Class") 
						%>  
						<td valign=top>
						 <div class=tt12><!--<span><a href="view.asp?classid=<%=classid%>&nclassid=<%=nclassid%>">MORE + </a></span>--><a href="view.asp?classid=<%=rs("id")%>"><%=strclass%></a></div> 
					    <div class=Cont >
					    	<ul>
					    	<% 
											SQL="SELECT top 5 * FROM article where classid="&rs("id")&" order by adddate desc"' and nclassid="&nclassid&" and isRecommend=1  order by id desc" '
											rs1.Open sql,conn,1,1 
											if not(rs1.eof and rs1.bof) then
											Do While Not Rs1.EOF 
											%> 
											 <li><a href="view.asp?id=<%=rs1("id")%>" style="color:#333333;"><%=left(rs1("title"),18)%></a></li> 
											<% 
											Rs1.MoveNext
											Loop
											End If 
										rs1.close
									%></ul> 
									
					    </div> 
					     <div style="clear:both"></div>
					    <table><tr><td height=1></td></tr></table> 
            </td>
            <%
            if t mod 4 =0 then response.write "</tr><tr>"
            Rs.MoveNext
				    Loop
				End If 
				rs.close
				%> 
		 </tr></table>  
		 </td>  
		 </tr></table>
		 </td>
		 </tr></table>
		 
 <table><tr><td height=10></td></tr></table>
 <table width=1200 align=center cellpadding="0" cellspacing="0" >
	<tr valign=top>  
     <td>
     		<%classid=4%>		 
     	<div class=tt12><a href="view.asp?classid=<%=classid%>">产品展示</a></div>  
     	</td>
  </tr> 
</table>  
                   <% title="" 
										sql="select top 15 * from article where classid="&classid&"  and Previewimg<> '"&title&"' order by adddate DESC"
										rs.Open sql,conn,1,1
										i=1
										if not Rs.eof then
											do while not rs.eof 
										title=title&trim(rs("Previewimg"))&"#view.asp?id="&rs("id")&"#|"
										'title=title&trim(rs("Previewimg"))&"#view.asp?id="&rs("id")&"#"&left(rs("title"),20)&"|"
										%> 
										<%
										rs.movenext
										i=i+1
										loop 
										end if 
										rs.close 
										title=title&"##"
										%>
<table width="1230" border="0" align="center" cellpadding="0" cellspacing="0"> 
  <tr>
    <td align=left><object style="float:left;" classid="clsid:D27CDB6E-AE6D-11cf-96B8-444553540000" codebase="http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=0,0,0,0" height="180" width="1200">
      <param name="movie" value="images/loop.swf" />
      <param name="quality" value="best" />
      <param name="wmode" value="transparent" />
      <param name="FlashVars" value="mypic_add=<%=title%>" />
      <param name="SCALE" value="exactfit" />
      <embed src="images/loop.swf" width="1200" height="180" scale="exactfit" quality="best" pluginspage="http://www.macromedia.com/go/getflashplayer" type="application/x-shockwave-flash" wmode="transparent" 
      	flashvars="mypic_add=<%=title%>"> </embed>
    </object></td>
  </tr> 
</table>  
	 
</td> 
  </tr>
</table>
<!--#include file="foot.asp"-->
