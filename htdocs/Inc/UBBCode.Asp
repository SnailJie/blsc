<%
'CType=1(UBB),CType=2(HTML)
Function UBBCode(strContent,CType)
	Dim re
	If CType=1 Then
		strContent = HTMLEncode(strContent)
	Else
		strContent = strContent
	End If
	Set re=new RegExp
	re.IgnoreCase =true
	re.Global=True

	If CType=1 Then
		'图片标签
		re.Pattern="\[IMG\](http|https|ftp):\/\/(.[^\[]*)\[\/IMG\]"
		strContent=re.Replace(strContent,"<a onfocus=this.blur() 1href=""$1://$2"" target=_blank><IMG SRC=""$1://$2"" border=0 alt="" onload=""javascript:if(this.width>screen.width-333)this.width=screen.width-333""></a>")

		'多媒体标签
		re.Pattern="\[MP=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/MP]"
		strContent=re.Replace(strContent,"<object align=middle classid=CLSID:22d6f312-b0f6-11d0-94ab-0080c74c7e95 class=OBJECT id=MediaPlayer width=$1 height=$2 ><param name=ShowStatusBar value=-1><param name=Filename value=$3><embed type=application/x-oleobject codebase=http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=5,1,52,701 flename=mp src=$3 width=$1 height=$2></embed></object>")
		re.Pattern="\[RM=*([0-9]*),*([0-9]*)\](.[^\[]*)\[\/RM]"
		strContent=re.Replace(strContent,"<OBJECT classid=clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width=$1 height=$2><PARAM NAME=SRC VALUE=$3><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width=$1><PARAM NAME=SRC VALUE=$3><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>")

		re.Pattern="(\[FLASH\])(.[^\[]*)(\[\/FLASH\])"
		strContent= re.Replace(strContent,"<a href=""$2"" TARGET=_blank><IMG SRC=images/files/swf.gIf border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=500 height=400><PARAM NAME=movie VALUE=""$2""><PARAM NAME=quality VALUE=high><embed src=""$2"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=500 height=400>$2</embed></OBJECT>")

		re.Pattern="(\[FLASH=*([0-9]*),*([0-9]*)\])(.[^\[]*)(\[\/FLASH\])"
		strContent= re.Replace(strContent,"<a 1href=""$4"" TARGET=_blank><IMG SRC=images/files/swf.gIf border=0 alt=点击开新窗口欣赏该FLASH动画! height=16 width=16>[全屏欣赏]</a><br><OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width=$2 height=$3><PARAM NAME=movie VALUE=""$4""><PARAM NAME=quality VALUE=high><embed src=""$4"" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width=$2 height=$3>$4</embed></OBJECT>")

		're.Pattern="(\[sound\])(.[^\[]*)(\[\/sound\])" 
		'strContent=re.Replace(strContent,"<a href=""$2"" target=_blank><IMG SRC=images/files/mid.gIf border=0 alt='背景音乐'></a><bgsound src=""$2"" loop=""-1"">")

		re.Pattern="(\[URL\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$2</A>")
		re.Pattern="(\[URL=(.[^\[]*)\])(.[^\[]*)(\[\/URL\])"
		strContent= re.Replace(strContent,"<A HREF=""$2"" TARGET=_blank>$3</A>")

		re.Pattern="(\[EMAIL\])(\S+\@.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<A HREF=""mailto:$2"">$2</A>")
		re.Pattern="(\[EMAIL=(\S+\@.[^\[]*)\])(.[^\[]*)(\[\/EMAIL\])"
		strContent= re.Replace(strContent,"<A HREF=""mailto:$2"" TARGET=_blank>$3</A>")

		re.Pattern = "^((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)"
		strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
		re.Pattern = "((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)$"
		strContent = re.Replace(strContent,"<a target=_blank href=$1>$1</a>")
		re.Pattern = "([^>=""])((http|https|ftp|rtsp|mms):(\/\/|\\\\)[A-Za-z0-9\./=\?%\-&_~`@[\]\':+!]+)"
		strContent = re.Replace(strContent,"$1<a target=_blank href=$2>$2</a>")

		re.Pattern="\[color=(.[^\[]*)\](.[^\[]*)\[\/color\]"
		strContent=re.Replace(strContent,"<font color=$1>$2</font>")
		re.Pattern="\[face=(.[^\[]*)\](.[^\[]*)\[\/face\]"
		strContent=re.Replace(strContent,"<font face=$1>$2</font>")
		re.Pattern="\[align=(center|left|right)\](.*)\[\/align\]"
		strContent=re.Replace(strContent,"<div align=$1>$2</div>")

		re.Pattern="\[QUOTE\](.*)\[\/QUOTE\]"
		strContent=re.Replace(strContent,"<table style=""width:100%"" cellpadding=5 cellspacing=1><TR><TD style='border-right: #cccccc 1px solid; border-top: #cccccc 1px solid; border-left: #cccccc 1px solid; border-bottom: #cccccc 1px solid;background-color:#f6f6f6' width=""100%"">$1</td></tr></table><br>")
		re.Pattern="\[fly\](.*)\[\/fly\]"
		strContent=re.Replace(strContent,"<marquee width=90% behavior=alternate scrollamount=3>$1</marquee>")
		re.Pattern="\[move\](.*)\[\/move\]"
		strContent=re.Replace(strContent,"<MARQUEE scrollamount=3>$1</marquee>")		
		re.Pattern="\[SHADOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/SHADOW]"
		strContent=re.Replace(strContent,"<table width=$1 ><tr><td style=""filter:shadow(color=$2, strength=$3)"">$4</td></tr></table>")
		re.Pattern="\[GLOW=*([0-9]*),*(#*[a-z0-9]*),*([0-9]*)\](.[^\[]*)\[\/GLOW]"
		strContent=re.Replace(strContent,"<table width=$1 ><tr><td style=""filter:glow(color=$2, strength=$3)"">$4</td></tr></table>")

		re.Pattern="\[i\](.[^\[]*)\[\/i\]"
		strContent=re.Replace(strContent,"<i>$1</i>")
		re.Pattern="\[u\](.[^\[]*)(\[\/u\])"
		strContent=re.Replace(strContent,"<u>$1</u>")
		re.Pattern="\[b\](.[^\[]*)(\[\/b\])"
		strContent=re.Replace(strContent,"<b>$1</b>")
		re.Pattern="\[size=([1-4])\](.[^\[]*)\[\/size\]"
		strContent=re.Replace(strContent,"<font size=$1>$2</font>")
		strContent=replace(strContent,"<I></I>","")
	End If

	If CType=1 Or CType=2 Then
		re.Pattern="\[UPLOAD=(gif|jpg|jpeg|bmp|png)\](.[^\[]*)(gif|jpg|jpeg|bmp|png)\[\/UPLOAD\]"
		strContent= re.Replace(strContent,"<A 1HREF=""$2$1"" TARGET=_blank><IMG SRC=""$2$1"" border=0  onload=""javascript:if(this.width>screen.width-333)this.width=screen.width-333""></A>")

		re.Pattern="\[UPLOAD=(.[^\[]*)\](.[^\[]*)\[\/UPLOAD\]"
		strContent= re.Replace(strContent,"<br><IMG SRC=""images/files/$1.gif"" border=0> <a href=""$2"">点击浏览该文件</a>")
	End If
	If InStr(strContent,"[EA_AdRotator]")<>0 Then
		strContent=Replace(strContent,"[EA_AdRotator]","<table align=left><tr><td>"&AdRotator(Site_Info(17),Chr(10))&"</td></tr></table>")
	End If
	Set re=Nothing
	UBBCode=strContent
End Function
%>