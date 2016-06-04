<!--#include file="head.asp"-->  
  <!-- Wenjuan Layer Begin -->

<style type="text/css">
.javascript.source-javascript .de1, .javascript.source-javascript .de2 {font: normal normal 1em/1.2em monospace; margin:0; padding:0; background:none; vertical-align:top;font-family: monospace, monospace;}
.javascript.source-javascript  {font-family:monospace;}
.javascript.source-javascript .imp {font-weight: bold; color: red;}
.javascript.source-javascript li, .javascript.source-javascript .li1 {font-weight: normal; vertical-align:top;}
.javascript.source-javascript .ln {width:1px;text-align:right;margin:0;padding:0 2px;vertical-align:top;}
.javascript.source-javascript .li2 {font-weight: bold; vertical-align:top;}
.javascript.source-javascript .kw1 {color: #000066; font-weight: bold;}
.javascript.source-javascript .kw2 {color: #003366; font-weight: bold;}
.javascript.source-javascript .kw3 {color: #000066;}
.javascript.source-javascript .kw5 {color: #FF0000;}
.javascript.source-javascript .co1 {color: #006600; }
.javascript.source-javascript .co2 {color: #009966;  }
.javascript.source-javascript .coMULTI {color: #006600;}
.javascript.source-javascript .es0 {color: #000099; font-weight: bold;}
.javascript.source-javascript .br0 {color: #009900;}
.javascript.source-javascript .sy0 {color: #339933;}
.javascript.source-javascript .st0 {color: #3366CC;}
.javascript.source-javascript .nu0 {color: #CC0000;}
.javascript.source-javascript .me1 {color: #660066;}
.javascript.source-javascript .ln-xtra, .javascript.source-javascript li.ln-xtra, .javascript.source-javascript div.ln-xtra {background-color: #ffc;}
.javascript.source-javascript span.xtra { display:block; }

    </style>

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
    <DIV style="height:200px"></DIV>
    <DIV class="mycontext" >
    <DIV class="url"><b>天气请求API，可直接调用：http://blsc.com/getWeatera.asp，返回JSON格式数据</b>

    </DIV>
    <DIV class="description">
       
       <strong> 使用说明：</strong><br />
        <em> API数据包含各个地点分钟级、小时级、天级的降雨预测、相对湿度预测、温度预测，每<mark>半小时</mark>进行一次更新</em><br />
          
        1.请求API返回的数据包含如下所示地点的数据。 <br />
              <div dir="ltr" class="mw-geshi mw-code mw-content-ltr" style="padding: 1em;
    border: 1px dashed #2f6fab;
    color: black;
    line-height:1.3em;
    background-color: #f9f9f9;"
            >
                   <pre>
        
           
             01.慈太             富屯溪      闽江                    117.9           26.8667
             02.岚下             富屯溪      闽江                    117.9833        27 
             03.黄墩             富屯溪      闽江                    117.85          26.8833 
             04.建西             富屯溪      闽江                    117.9667        26.8167 
             05.田坪             富屯溪      闽江                    117.8833        26.8167 
             06.慈悲             富屯溪      闽江                    117.55          26.9833 
             07.谢坑             富屯溪      闽江                    117.6667        26.9333 
             08.埔上             富屯溪      闽江                    117.7167        26.9333 
             09.余塘             富屯溪      闽江                    117.9           27.15         
             10.仁寿             富屯溪      闽江                    117.9           27.0833 
             11.关墩             富屯溪      闽江                    117.8           27.0333 
             12.河墩             富屯溪      闽江                    117.8           26.95 
             13.南舟             富屯溪      闽江                    117.7667        26.9167 
             14.安浆             建溪        闽江                    118.1667        26.9333 
             15.榜山             富屯溪      闽江                    117.7833        26.6833 
             16.桃园             富屯溪      闽江                    117.9333        26.9667 
             17.洋口电站         富屯溪      闽江                    117.892         26.792 
             18.洋口             富屯溪      闽江                    117.917         26.796 
             19.谟武             金溪        闽江                    117.683         26.816 
             20.元坑             富屯溪      闽江                    117.7167        26.7667 
             21.大历             富屯溪      闽江                    118             26.8833 
             22.洋墩             富屯溪      闽江                    117.8667        27.0333 
        
                  </pre>
             </DIV>
        <br />


    <strong> 2.请求API返回数据格式说明</strong><br />           
    <div dir="ltr" class="mw-geshi mw-code mw-content-ltr" style="padding: 1em;border: 1px dashed #2f6fab;color: black;line-height:1.3em; background-color: #f9f9f9;">
            <div class="javascript source-javascript">
                <pre class="de1" style="font-weight: bolder;">
    <span class="br0">{</span>
    <span class="st0">"status"</span><span class="sy0">:</span><span class="st0">"ok"</span><span class="sy0">,</span>
    <span class="st0">"time"</span><span class="sy0">:</span><span class="st0">"2016/6/4 15:50:56"</span><span class="sy0">,</span>  <span class="co1">//数据更新时间</span>
    <span class="st0">"result"</span><span class="sy0">:</span><span class="br0">[</span>
         <span class="br0">{</span>
            <span class="st0">"location"</span><span class="sy0">:</span><span class="br0">[</span>
                    <span class="nu0">117.9</span><span class="sy0">,</span> <span class="co1">//纬度</span>
                    <span class="nu0">26.8667</span> <span class="co1">//经度</span>
                <span class="br0">]</span><span class="sy0">,</span>
            <span class="st0">"precipitation"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//降雨强度</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//小时级，从当前时间开始未来48小时</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.0529</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 13:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">0</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 12:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"minutely"</span><span class="sy0">:</span><span class="br0">[</span><span class="co1">//分钟级预报，未来一小时每分钟的降雨量，0.05-0.15是小雨，0.15-0.35是中雨, 0.35以上是大雨，根据不同地区情况可以有所调整</span>
                           <span class="nu0">0</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                           <span class="nu0">0.2812</span><span class="sy0"></span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span><span class="co1">//天级预报，从当前时间起未来五天内预报</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.1866 </span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.0059 </span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">0 </span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.1866 </span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.0059 </span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">0 </span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span><span class="sy0">,</span>
             <span class="st0">"temperature"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//温度</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//未来48小时内温度预测</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">26</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 15:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">29.59</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 14:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span>  <span class="co1">//未来一周温度</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">26.39</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">22.66</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">18.06</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">26.39</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">22.66</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">18.06</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span><span class="sy0">,</span>
             <span class="st0">"humidity"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//相对湿度</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//未来48小时相对湿度</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.79</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 13:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.65</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 12:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//未来五天相对湿度</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.99</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.85</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">.74</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">……</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.99</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.85</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">.74</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span>
            <span class="br0">}</span><span class="sy0">,</span>
                     <span class="co1">//其余各个地方的预测数据，格式与上一致</span>
         <span class="br0">{</span>
            <span class="st0">"location"</span><span class="sy0">:</span><span class="br0">[</span>
                    <span class="nu0">117.9</span><span class="sy0">,</span> <span class="co1">//纬度</span>
                    <span class="nu0">26.8667</span> <span class="co1">//经度</span>
                <span class="br0">……</span>
      <span class="br0">}</span> 
                </pre></div>
         
    </DIV>
  </DIV>
 
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
 
 <table width="1210" align="center"  cellpadding="0" cellspacing="0">
     		<tr>
     			<td style="padding-right:10px;  "> 
 <div align=center style="background:url(images/line.jpg) no-repeat top;width:100%;height:3px;"></div>
  <div align=center style="background:url(images/line1.jpg) no-repeat top;width:100%;height:20px;"></div>
 <table><tr><td height=5></td></tr></table>
 
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
											  <a href="view.asp?id=<%=rs1("id")%>" style="color:#333333;"><%=left(rs1("title"),18)%></a>  
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
  
 
	 
</td> 
  </tr>
</table>
<!--#include file="foot.asp"-->
