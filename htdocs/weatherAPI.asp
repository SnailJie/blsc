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
response.redirect  "mindex.asp" '������ֻ���������ת��wap.asp
response.end 
end if%>
<DIV class=homeContainer>
    <DIV style="height:200px"></DIV>
    <DIV class="mycontext" >
    <DIV class="url"><b>��������API����ֱ�ӵ��ã�http://blsc.com/getWeatera.asp</b>

    </DIV>
    <DIV class="description">
       
       <strong> ʹ��˵����</strong><br />
        <em> API���ݰ��������ص���Ӽ���Сʱ�����켶�Ľ���Ԥ�⡢���ʪ��Ԥ�⡢�¶�Ԥ�⣬ÿ<mark>��Сʱ</mark>����һ�θ���</em><br />
          
        1.����API���ص����ݰ���������ʾ�ص�����ݡ� <br />
              <div dir="ltr" class="mw-geshi mw-code mw-content-ltr" style="padding: 1em;
    border: 1px dashed #2f6fab;
    color: black;
    line-height:1.3em;
    background-color: #f9f9f9;"
            >
                   <pre>
        
           
             01.��̫             ����Ϫ      ����                    117.9           26.8667
             02.���             ����Ϫ      ����                    117.9833        27 
             03.�ƶ�             ����Ϫ      ����                    117.85          26.8833 
             04.����             ����Ϫ      ����                    117.9667        26.8167 
             05.��ƺ             ����Ϫ      ����                    117.8833        26.8167 
             06.�ȱ�             ����Ϫ      ����                    117.55          26.9833 
             07.л��             ����Ϫ      ����                    117.6667        26.9333 
             08.����             ����Ϫ      ����                    117.7167        26.9333 
             09.����             ����Ϫ      ����                    117.9           27.15         
             10.����             ����Ϫ      ����                    117.9           27.0833 
             11.�ض�             ����Ϫ      ����                    117.8           27.0333 
             12.�Ӷ�             ����Ϫ      ����                    117.8           26.95 
             13.����             ����Ϫ      ����                    117.7667        26.9167 
             14.����             ��Ϫ        ����                    118.1667        26.9333 
             15.��ɽ             ����Ϫ      ����                    117.7833        26.6833 
             16.��԰             ����Ϫ      ����                    117.9333        26.9667 
             17.��ڵ�վ         ����Ϫ      ����                    117.892         26.792 
             18.���             ����Ϫ      ����                    117.917         26.796 
             19.����             ��Ϫ        ����                    117.683         26.816 
             20.Ԫ��             ����Ϫ      ����                    117.7167        26.7667 
             21.����             ����Ϫ      ����                    118             26.8833 
             22.���             ����Ϫ      ����                    117.8667        27.0333 
        
                  </pre>
             </DIV>
        <br />


    <strong> 2.����API�������ݸ�ʽ˵��</strong><br />           
    <div dir="ltr" class="mw-geshi mw-code mw-content-ltr" style="padding: 1em;border: 1px dashed #2f6fab;color: black;line-height:1.3em; background-color: #f9f9f9;">
            <div class="javascript source-javascript">
                <pre class="de1" style="font-weight: bolder;">
    <span class="br0">{</span>
    <span class="st0">"status"</span><span class="sy0">:</span><span class="st0">"ok"</span><span class="sy0">,</span>
    <span class="st0">"time"</span><span class="sy0">:</span><span class="st0">"2016/6/4 15:50:56"</span><span class="sy0">,</span>  <span class="co1">//���ݸ���ʱ��</span>
    <span class="st0">"result"</span><span class="sy0">:</span><span class="br0">[</span>
         <span class="br0">{</span>
            <span class="st0">"location"</span><span class="sy0">:</span><span class="br0">[</span>
                    <span class="nu0">117.9</span><span class="sy0">,</span> <span class="co1">//γ��</span>
                    <span class="nu0">26.8667</span> <span class="co1">//����</span>
                <span class="br0">]</span><span class="sy0">,</span>
            <span class="st0">"precipitation"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//����ǿ��</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//Сʱ�����ӵ�ǰʱ�俪ʼδ��48Сʱ</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.0529</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 13:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">0</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 12:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"minutely"</span><span class="sy0">:</span><span class="br0">[</span><span class="co1">//���Ӽ�Ԥ����δ��һСʱÿ���ӵĽ�������0.05-0.15��С�꣬0.15-0.35������, 0.35�����Ǵ��꣬���ݲ�ͬ�������������������</span>
                           <span class="nu0">0</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                           <span class="nu0">0.2812</span><span class="sy0"></span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span><span class="co1">//�켶Ԥ�����ӵ�ǰʱ����δ��������Ԥ��</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.1866 </span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.0059 </span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">0 </span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.1866 </span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.0059 </span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">0 </span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span><span class="sy0">,</span>
             <span class="st0">"temperature"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//�¶�</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//δ��48Сʱ���¶�Ԥ��</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">26</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 15:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">29.59</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 14:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span>  <span class="co1">//δ��һ���¶�</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">26.39</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">22.66</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">18.06</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">26.39</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">22.66</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">18.06</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span><span class="sy0">,</span>
             <span class="st0">"humidity"</span><span class="sy0">:</span><span class="br0">{</span> <span class="co1">//���ʪ��</span>
                    <span class="st0">"hourly"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//δ��48Сʱ���ʪ��</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.79</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-04 13:00"</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"value"</span><span class="sy0">:</span><span class="nu0">.65</span><span class="sy0">,</span>
                            <span class="st0">"datetime"</span><span class="sy0">:</span><span class="st0">"2016-06-06 12:00"</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span><span class="sy0">,</span>
                     <span class="st0">"daily"</span><span class="sy0">:</span><span class="br0">[</span> <span class="co1">//δ���������ʪ��</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-04 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.99</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.85</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">.74</span>
                        <span class="br0">}</span><span class="sy0">,</span>
                     <span class="br0">����</span>
                        <span class="br0">{</span>
                            <span class="st0">"date"</span><span class="sy0">:</span><span class="st0">"2016-06-08 "</span><span class="sy0">,</span>
                            <span class="st0">"max"</span><span class="sy0">:</span><span class="nu0">.99</span><span class="sy0">,</span>
                            <span class="st0">"avg"</span><span class="sy0">:</span><span class="nu0">.85</span><span class="sy0">,</span>
                            <span class="st0">"min"</span><span class="sy0">:</span><span class="nu0">.74</span>
                        <span class="br0">}</span>
                     <span class="br0">]</span>
                  <span class="br0">}</span>
            <span class="br0">}</span><span class="sy0">,</span>
                     <span class="co1">//��������ط���Ԥ�����ݣ���ʽ����һ��</span>
         <span class="br0">{</span>
            <span class="st0">"location"</span><span class="sy0">:</span><span class="br0">[</span>
                    <span class="nu0">117.9</span><span class="sy0">,</span> <span class="co1">//γ��</span>
                    <span class="nu0">26.8667</span> <span class="co1">//����</span>
                <span class="br0">����</span>
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
