function Check(t,n)
{
if(n==1) t.className ="overcolor"
else
if(n==2) t.className ="clickcolor"
else t.className ="outcolor"
}

function fortable()
{
  var arr = showModalDialog("editor/table.htm", "", "dialogWidth:32em; dialogHeight:10em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  row=ss[0];
  col=ss[1];
  width=ss[2];
  height=ss[3];
  cellpadding=ss[4];
  cellspacing=ss[5];
  align=ss[6];
  border=ss[7];
  var string;
  string="<table border="+border+" width="+width+" height="+height+" cellpadding="+cellpadding+" cellspacing="+cellspacing+" align="+align+">";
  for(i=1;i<=row;i++){
  string=string+"<tr>";
  for(j=1;j<=col;j++){
  string=string+"<td></td>";
  }
  string=string+"</tr>";
  }
  string=string+"</table>";
  content=HtmlEditor.document.body.innerHTML;
  content=content+string;
  HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
}


function swf()
{
  var arr = showModalDialog("editor/flash.htm", "", "dialogWidth:32em; dialogHeight:10em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  path=ss[0];
  row=ss[1];
  col=ss[2];
  var string;
  if (path!="http://" && path!="")
  {
   string="<object classid='clsid:D27CDB6E-AE6D-11cf-96B8-444553540000'  codebase='http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=5,0,0,0' width="+row+" height="+col+"><param name=movie value="+path+"><param name=quality value=high><embed src="+path+" pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width="+row+" height="+col+"></embed></object>"
   content=HtmlEditor.document.body.innerHTML;
   content=content+string;
   HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }

}

function wmv()
{
  var arr = showModalDialog("editor/media.htm", "", "dialogWidth:31em; dialogHeight:12em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  path=ss[0];
  row=ss[1];
  col=ss[2];
  var string;
  if (path!="http://" && path!="")
  {
string="<object classid='clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95' width="+row+" height="+col+"><param name=Filename value="+path+"><param name='BufferingTime' value='5'><param name='AutoSize' value='-1'><param name='AnimationAtStart' value='-1'><param name='AllowChangeDisplaySize' value='-1'><param name='ShowPositionControls' value='0'><param name='TransparentAtStart' value='1'><param name='ShowStatusBar' value='1'></object>"
  content=HtmlEditor.document.body.innerHTML;
  content=content+string;
   HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }

}


function rm()
{
  var arr = showModalDialog("editor/rm.htm", "", "dialogWidth:31em; dialogHeight:12em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  path=ss[0];
  row=ss[1];
  col=ss[2];
  var string;
  if (path!="http://" && path!="")
  {
	  string="<object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA' width="+row+" height="+col+"><param name='CONTROLS' value='ImageWindow'><param name='CONSOLE' value='Clip1'><param name='AUTOSTART' value='-1'><param name=src value="+path+"></object><br><object classid='clsid:CFCDAA03-8BE4-11cf-B84B-0020AFBBCCFA'  width="+row+" height=60><param name='CONTROLS' value='ControlPanel,StatusBar'><param name='CONSOLE' value='Clip1'></object>"
      content=HtmlEditor.document.body.innerHTML;
      content=content+string;
      HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }

}


function pic()
{
  var arr = showModalDialog("editor/pic.htm", "", "dialogWidth:32em; dialogHeight:12em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  a=ss[0];
  b=ss[1];
  c=ss[2];
  d=ss[3];
  e=ss[4];
  var str1;
  if (a!="http://" && a!="")
  {
	  str1="<img src='"+a+"' alt='"+b+"'"
      str1=str1+" style='"+c+"'"
      str1=str1+" width='"+d+"' height='"+e+"'"
      str1=str1+">"
      content=HtmlEditor.document.body.innerHTML;
      content=content+str1;
      HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }
}

function FIELDSET()
{
  var arr = showModalDialog("editor/fieldset.htm", "", "dialogWidth:16.5em; dialogHeight:13.5em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  a=ss[0];
  b=ss[1];
  c=ss[2];
  d=ss[3];
  var str1;
str1="<FIELDSET "
str1=str1+"align="+a+""
str1=str1+" style='"
if(c.value!='')str1=str1+"color:"+c+";"
if(d.value!='')str1=str1+"background-color:"+d+";"
str1=str1+"'><Legend"
str1=str1+" align="+b+""
str1=str1+">标题</Legend>内容</FIELDSET>"
  content=HtmlEditor.document.body.innerHTML;
  content=content+str1;
   HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
}

function iframe()
{
  var arr = showModalDialog("editor/iframe.htm", "", "dialogWidth:26em; dialogHeight:12.5em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  a=ss[0];
  b=ss[1];
  c=ss[2];
  d=ss[3];
  e=ss[4];
  var str1;
  if (a!="http://" && a!="")
  {
	  str1="<iframe src='"+a+"'"
	  str1+=" scrolling="+b+""
	  str1+=" frameborder="+c+""
	  if(d!='')str1+=" marginheight="+d
	  if(e!='')str1+=" marginwidth="+e
	  str1=str1+"></iframe>"
	  content=HtmlEditor.document.body.innerHTML;
	  content=content+str1;
	  HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }

}

function hr()
{
  var arr = showModalDialog("editor/hr.htm", "", "dialogWidth:19em; dialogHeight:17em; status:0;help:0");
  
  if (arr != null){
  var ss;
  ss=arr.split("*")
  a=ss[0];
  b=ss[1];
  c=ss[2];
  d=ss[3];
  e=ss[4];
  var str1;
  if (b!="" && e!="")
  {
	  str1="<hr"
	  str1=str1+" color='"+a+"'"
	  str1=str1+" size="+b+"'"
	  str1=str1+" "+c+""
	  str1=str1+" align="+d+""
	  str1=str1+" width="+e
	  str1=str1+">"
	  content=HtmlEditor.document.body.innerHTML;
	  content=content+str1;
	  HtmlEditor.document.body.innerHTML=content;
  }
  else HtmlEditor.focus();
  }

}

function help()
{
    var helpmess;
    helpmess="---------------编辑器帮助---------------\r\n\r\n"+
         "1.请不要发表有危险性的脚本。\r\n\r\n"+
         "2.如果要书写源代码，请选中查看\r\n\r\n"+
         "　HTML源代码书写.\r\n\r\n"+
         "3.需要你自己运行,才能看效果.\r\n\r\n"+
         "4.如果要书写JS，尽量不要在这儿\r\n\r\n"+
	     "　书写.\r\n\r\n";
    alert(helpmess);
}

//Function to format text in the text box
function FormatText(command, option){
	
  	frames.HtmlEditor.document.execCommand(command, true, option);
  	frames.HtmlEditor.focus();
}

function specialtype(Mark){
//if (!Error(idEdit)) return;
var sel,RangeType;
sel = frames.HtmlEditor.document.selection.createRange();
RangeType = frames.HtmlEditor.document.selection.type;
if (RangeType == "Text"&&Mark!="marquee2"&&Mark!="marquee"){
sel.pasteHTML("<" + Mark + ">" + sel.text + "</" + Mark + ">");
sel.select();
}
else
if (RangeType=="Text"&&Mark=="marquee2"||RangeType=="Text"&&Mark=="marquee")
{
var speed=prompt("请输入文字移动或飞行的速度(0-255): ","3");
if (!speed) return;
if (speed!=null) {
sel.pasteHTML("<marquee behavior=alternate scrollamount=" + speed + ">" + sel.text + "</marquee>");
}
sel.select();
}
frames.HtmlEditor.focus();
}
//Function to add image
function AddImage(){	
	imagePath = prompt('请输入图片地址', 'http://');				
	
	if ((imagePath != null) && (imagePath != "")){					
		frames.HtmlEditor.document.execCommand('InsertImage', false, imagePath);
  		frames.HtmlEditor.focus();
	}
	frames.HtmlEditor.focus();			
}

function foreColor()
{
  var arr = showModalDialog("editor/selcolor.htm", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0");
  if (arr != null) FormatText('forecolor', arr);
  else frames.HtmlEditor.focus();
}

function BackColor()
{
  var arr = showModalDialog("editor/selcolor.htm", "", "dialogWidth:18.5em; dialogHeight:17.5em; status:0");
  if (arr != null) FormatText('BackColor', arr);
  else frames.HtmlEditor.focus();
}

//Function to clear form
function ResetForm(){

	if (window.confirm('确认要清空对话框内容?')){
	 	frames.HtmlEditor.document.body.innerHTML = ''; 
	 	return true;
	 } 
	 return false;		
}

//Function to open pop up window
function openWin(theURL,winName,features) {
  	window.open(theURL,winName,features);
}

function setMode(newMode)
{
  bTextMode = newMode;
  var cont;
  if (bTextMode) {
    cleanHtml();
    cleanHtml();

    cont=HtmlEditor.document.body.innerHTML;
    HtmlEditor.document.body.innerText=cont;
  } else {
    cont=HtmlEditor.document.body.innerText;
    HtmlEditor.document.body.innerHTML=cont;
  }
  HtmlEditor.focus();
}

function cleanHtml()
{
  var fonts = HtmlEditor.document.body.all.tags("FONT");
  var curr;
  for (var i = fonts.length - 1; i >= 0; i--) {
    curr = fonts[i];
    if (curr.style.backgroundColor == "#ffffff") curr.outerHTML	= curr.innerHTML;
  }

}

function checkType(idEdit,url){
//if (!Error(idEdit)) return;
var afilename,bfilename,filetype;
if (url==null){
url=prompt("请输入需要自动播放的媒体文件地址(自动识别文件类型): ","http://");
if(!url) return;
}
afilename=url.split("/");
bfilename=afilename[afilename.length-1];
filetype=bfilename.split(".");
switch(filetype[filetype.length-1].toLowerCase()){
case "swf":
inserObject('swf',url);
break;
case "mov":
inserObject('qt',url);
break;
case "asf":
inserObject('mp',url);
break;
case "asx":
inserObject('mp',url);
break;
case "wmv":
inserObject('mp',url);
break;
case "wma":
inserObject('mp',url);
case "wmf":
inserObject('mp',url);
case "avi":
inserObject('video',url);
break;
case "mpeg":
inserObject('video',url);
break;
case "mpg":
inserObject('video',url);
break;
case "rm":
inserObject('rm',url);
break;
case "rmvb":
inserObject('rm',url);
break;
case "mp3":
inserObject('music',url);
break;
case "ra":
inserObject('music',url);
break;
case "wav":
inserObject('music',url);
break;
case "mid":
inserObject('music',url);
break;
case "midi":
inserObject('music',url);
break;
case "rar":
inserObject('rar',url);
break;
case "zip":
inserObject('zip',url);
break;
case "jpg":
if(confirm("插入的图片是否需带说明的新闻图片？")){
inserObject('inphototable',url);
}
else
inserObject('img',url);
break;
case "jpeg":
if(confirm("插入的图片是否需带说明的新闻图片？")){
inserObject('inphototable',url);
}
else
inserObject('img',url);
break;
case "gif":
if(confirm("插入的图片是否需带说明的新闻图片？")){
inserObject('inphototable',url);
}
else
inserObject('img',url);
break;
case "png":
if(confirm("插入的图片是否需带说明的新闻图片？")){
inserObject('inphototable',url);
}
else
inserObject('img',url);
break;
default:
alert("输入的地址格式或文件类型暂不支持自动播放！");
break;
}
}


function inserObject(obj,objvalue) {
//if (!Error(idEdit)) return;
frames.HtmlEditor.focus();
switch(obj){
case "table":
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML(objvalue);
break;
case "excel":
var oSel=GetSelection(idEdit);
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<object classid='clsid:0002E510-0000-0000-C000-000000000046' id='Spreadsheet1' codebase='file:\\Bob\software\office2000\msowc.cab' width='100%' height='250'><param name='HTMLURL' value><param name='HTMLData' value='&lt;html xmlns:x=&quot;urn:schemas-microsoft-com:office:excel&quot;xmlns=&quot;http://www.w3.org/TR/REC-html40&quot;&gt;&lt;head&gt;&lt;style type=&quot;text/css&quot;&gt;&lt;!--tr{mso-height-source:auto;}td{black-space:nowrap;}.wc4590F88{black-space:nowrap;font-family:宋体;mso-number-format:General;font-size:auto;font-weight:auto;font-style:auto;text-decoration:auto;mso-background-source:auto;mso-pattern:auto;mso-color-source:auto;text-align:general;vertical-align:bottom;border-top:none;border-left:none;border-right:none;border-bottom:none;mso-protection:locked;}--&gt;&lt;/style&gt;&lt;/head&gt;&lt;body&gt;&lt;!--[if gte mso 9]&gt;&lt;xml&gt;&lt;x:ExcelWorkbook&gt;&lt;x:ExcelWorksheets&gt;&lt;x:ExcelWorksheet&gt;&lt;x:OWCVersion&gt;9.0.0.2710&lt;/x:OWCVersion&gt;&lt;x:Label Style='border-top:solid .5pt silver;border-left:solid .5pt silver;border-right:solid .5pt silver;border-bottom:solid .5pt silver'&gt;&lt;x:Caption&gt;Microsoft Office Spreadsheet&lt;/x:Caption&gt; &lt;/x:Label&gt;&lt;x:Name&gt;Sheet1&lt;/x:Name&gt;&lt;x:WorksheetOptions&gt;&lt;x:Selected/&gt;&lt;x:Height&gt;7620&lt;/x:Height&gt;"+
"&lt;x:Width&gt;15240&lt;/x:Width&gt;&lt;x:TopRowVisible&gt;0&lt;/x:TopRowVisible&gt;&lt;x:LeftColumnVisible&gt;0&lt;/x:LeftColumnVisible&gt; &lt;x:ProtectContents&gt;False&lt;/x:ProtectContents&gt; &lt;x:DefaultRowHeight&gt;210&lt;/x:DefaultRowHeight&gt; &lt;x:StandardWidth&gt;2389&lt;/x:StandardWidth&gt; &lt;/x:WorksheetOptions&gt; &lt;/x:ExcelWorksheet&gt;&lt;/x:ExcelWorksheets&gt; &lt;x:MaxHeight&gt;80%&lt;/x:MaxHeight&gt;&lt;x:MaxWidth&gt;80%&lt;/x:MaxWidth&gt;&lt;/x:ExcelWorkbook&gt;&lt;/xml&gt;&lt;![endif]--&gt;&lt;table class=wc4590F88 x:str&gt;&lt;col width=&quot;56&quot;&gt;&lt;tr height=&quot;14&quot;&gt;&lt;td&gt;&lt;/td&gt;&lt;/tr&gt;&lt;/table&gt;&lt;/body&gt;&lt;/html&gt;'> <param name='DataType' value='HTMLDATA'> <param name='AutoFit' value='0'><param name='DisplayColHeaders' value='-1'><param name='DisplayGridlines' value='-1'><param name='DisplayHorizontalScrollBar' value='-1'><param name='DisplayRowHeaders' value='-1'><param name='DisplayTitleBar' value='-1'><param name='DisplayToolbar' value='-1'><param name='DisplayVerticalScrollBar' value='-1'> <param name='EnableAutoCalculate' value='-1'> <param name='EnableEvents' value='-1'><param name='MoveAfterReturn' value='-1'><param name='MoveAfterReturnDirection' value='0'><param name='RightToLeft' value='0'><param name='ViewableRange' value='1:65536'></object>");
break;
case "nowdate":
var d = new Date();
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML(d.toLocaleDateString());
break;
case "nowtime":
var d = new Date();
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML(d.toLocaleTimeString());
break;
case "swf":
if (objvalue==null){
url=prompt("请输入SWF文件地址(*.SWF): ","http://");
if(!url) return;
}
else url=objvalue;
swfw=prompt("请输入Flash播放器宽度(单位:像素): ","300");
if(!swfw) return;
swfh=prompt("请输入Flash播放器高度(单位:像素): ","200");
if(!swfh) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<OBJECT codeBase=http://download.macromedia.com/pub/shockwave/cabs/flash/swflash.cab#version=4,0,2,0 classid=clsid:D27CDB6E-AE6D-11cf-96B8-444553540000 width="+swfw+" height="+swfh+"><PARAM NAME=movie VALUE="+url+"><PARAM NAME=quality VALUE=high><embed src="+url+" quality=high pluginspage='http://www.macromedia.com/shockwave/download/index.cgi?P1_Prod_Version=ShockwaveFlash' type='application/x-shockwave-flash' width="+swfw+" height="+swfh+">"+url+"</embed></OBJECT>");
break;
case "rm":
if (objvalue==null) {
url=prompt("请输入RM文件地址(*.RM): ","http://");
if(!url) return;
}
else url=objvalue;
rmw=prompt("请输入RealPlay播放器宽度(单位:像素): ","500");
if(!rmw) return;
rmh=prompt("请输入RealPlay播放器高度(单位:像素): ","300");
if(!rmh) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA class=OBJECT id=RAOCX width="+rmw+" height="+rmh+"><PARAM NAME=SRC VALUE="+url+"><PARAM NAME=CONSOLE VALUE=Clip1><PARAM NAME=CONTROLS VALUE=imagewindow><PARAM NAME=AUTOSTART VALUE=true></OBJECT><br><OBJECT classid=CLSID:CFCDAA03-8BE4-11CF-B84B-0020AFBBCCFA height=32 id=video2 width="+rmw+"><PARAM name=src value="+url+"><PARAM NAME=AUTOSTART VALUE=-1><PARAM NAME=CONTROLS VALUE=controlpanel><PARAM NAME=CONSOLE VALUE=Clip1></OBJECT>");
break;
case "music":
if (objvalue==null) {
url=prompt("请输入音频文件地址(*.MP3,*.WAV,*.MID,*.MIDI,*.RA): ","http://");
if(!url) return;
}
else url=objvalue;
muw=prompt("请输入音频播放器宽度(单位:像素): ","320");
if(!muw) return;
muh=prompt("请输入音频播放器高度(单位:像素): ","70");
if(!muh) return;
muv=prompt("请输入音频播放器默认音量(0-100): ","90");
if(!muv) return;
if(confirm("插入音频是否需要无限循环播放？")){
mloop=true;
}
else{
mloop=false;
}
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<EMBED src="+url+" width="+muw+" height="+muh+" autostart=true loop="+mloop+" volume="+muv+">");
break;
case "video":
if (objvalue==null) {
url=prompt("请输入视频文件地址:(*.AVI,*.MPG,*.MPEG","http://");
if(!url) return;
}
else url=objvalue;
vdw=prompt("请输入视频播放器宽度(单位:像素): ","300");
if(!vdw) return;
vdh=prompt("请输入视频播放器高度(单位:像素): ","300");
if(!vdh) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<EMBED src="+url+" width="+vdw+" height="+vdh+" autostart=true loop=false>");
break;
case "mp":
if (objvalue==null) {
url=prompt("请输入微软媒体文件地址(*.ASF,*.ASX,*.WMA,*.AVI): ","http://");
if(!url) return;
}
else url=objvalue;
mpw=prompt("请输入微软媒体播放器宽度(单位:像素): ","365");
if(!mpw) return;
mph=prompt("请输入微软媒体播放器高度(单位:像素): ","320");
if(!mph) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML('<object classid="clsid:22D6F312-B0F6-11D0-94AB-0080C74C7E95" id=MediaPlayer1 codebase="http://activex.microsoft.com/activex/controls/mplayer/en/nsmp2inf.cab#Version=6,1,5,217"standby="正在加载微软媒体播放器组件......" type="application/x-oleobject" width='+mpw+' height='+mph+' VIEWASTEXT><PARAM NAME="AutoSize" VALUE="0"><PARAM NAME="Filename" VALUE="'+url+'"><PARAM NAME="ShowStatusBar" VALUE="-1"></object>');
break;
case "qt":
if (objvalue==null) {
url=prompt("请输入QuickTime文件地址(*.MOV): ","http://");
if(!url) return;
}
else url=objvalue;
qtw=prompt("请输入QuickTime播放器宽度(单位:像素): ","500");
if(!qtw) return;
qth=prompt("请输入QuickTime播放器高度(单位:像素): ","300");
if(!qth) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<embed src="+url+" width="+qtw+" height="+qth+" autoplay=true loop=false controller=true playeveryframe=false cache=false scale=TOFIT bgcolor=#000000 kioskmode=false targetcache=false pluginspage=http://www.apple.com/quicktime/>");
break;
case "img":
imgalt=prompt("请输入插入图片的注释文字(可以不填): ","");
if(imgalt==null) return;
sel = frames.HtmlEditor.document.selection.createRange();
if (imgalt==""){
sel.pasteHTML("<img src="+ objvalue +">");
} else sel.pasteHTML("<img src="+ objvalue +" alt="+imgalt+">");
break;
case "emot":
if (objvalue==" "){
objvalue=prompt("请输入自定义的表情图片地址(*.GIF,*.JPG,*.JPEG): ","http://");
if(!objvalue) return;
url=objvalue;
}
else
url="sys/"+objvalue;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<IMG SRC="+url+">");
break;
case "inphototable":
note=prompt("请输入新闻图片说明文字: ","新闻图片说明");
if(!note) return;
notecolor=prompt("请输入新闻图片说明文字背景色: ","#eaeaea");
if(!notecolor) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<table border=0 cellpadding=0 cellspacing=0><tr><td><img src="+ objvalue +"></td></tr><tr><td align=center bgcolor="+notecolor+">"+note+"</td></tr></table>");
break;
case "bgcolor":
var oSel=GetSelection(idEdit);
var el = null;
if (oSel.parentElement != null) {
el =  GetElement(oSel.parentElement(),"TD");
if (!el) el =  GetElement(oSel.parentElement(),"TH");
if (!el) el =  GetElement(oSel.parentElement(),"TR");
if (!el) el =  GetElement(oSel.parentElement(),"TABLE");
}
else
el = GetElement(oSel.item(0),"TABLE");
if (el)
el.bgColor = objvalue;
else
frames.HtmlEditor.document.execCommand('backcolor','',objvalue);
break;
case "getpage":
htmlurl=prompt("请输入需要获取页面的URL: ","http://");
if(!htmlurl) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML(getDatal(htmlurl));
break;
case "code":
sel = frames.HtmlEditor.document.selection.createRange();
RangeType = frames.HtmlEditor.document.selection.type;
if (RangeType == "Text"){
sel.pasteHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #6595d6; TABLE-LAYOUT: fixed"><tr><td bgcolor=#e8f4ff style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">以下是代码片段：</font><br>'+sel.text+'</td></tr></table>');
}
break;
case "quote":
sel = frames.HtmlEditor.document.selection.createRange();
RangeType = frames.HtmlEditor.document.selection.type;
if (RangeType == "Text"){
sel.pasteHTML('<table width=95% border="0" align="Center" cellpadding="6" cellspacing="0" style="border: 1px Dotted #6595d6; TABLE-LAYOUT: fixed"><tr><td bgcolor=#e8f4ff style="WORD-WRAP: break-word"><font style="color: #990000;font-weight:bold">以下是引用片段：</font><br>'+sel.text+'</td></tr></table>');
}
break;
case "rar":
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<a href="+objvalue+" target=_blank><IMG SRC=sys/img/rar.gif border=0>请点击此处下载</a>");
break;
case "zip":
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<a href="+objvalue+" target=_blank><IMG SRC=sys/img/zip.gif border=0>请点击此处下载</a>");
break;
case "msn":
msnnumber=prompt("请输入你的MSN号码: ","xxx@xxx.com");
if(!msnnumber) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<img alt='MSN号码:"+msnnumber+"在线状态检测图标' src='http://itwarlocks.com:81/msn/"+msnnumber+"' border=0>");
break;
case "icq":
icqnumber=prompt("请输入你的ICQ号码: ","");
if(!icqnumber) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<img alt='ICQ号码:"+icqnumber+"在线状态检测图标' src='http://itwarlocks.com:81/icq/"+icqnumber+"' border=0>");
break;
case "qq":
qqnumber=prompt("请输入你的QQ号码: ","");
if(!qqnumber) return;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<img alt='QQ号码:"+qqnumber+"在线状态检测图标' src=http://www.newyouth.org/serve/qq/qq.asp?oicq="+qqnumber+"&style=11&mode=bbs>");
break;
case "paper":
if (objvalue=="custom"){
url=prompt("请输入其它信纸的WEB地址: ","http://");
if(!url) return;
}else if(objvalue=="empty"){
clearEdit();return;}
else
url="sys/paper/"+objvalue;
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML("<table width=100% height=100% border=0 cellpadding=0 cellspacing=0 background="+url+"><tr><td valign=top>&nbsp;</td></tr></table>");
break;
case "symbol":
sel = frames.HtmlEditor.document.selection.createRange();
if (objvalue=="")
{
objvalue=prompt("请输入特殊字符的扩展代码: ","&#8217;");
if(!objvalue) return;
}
sel.pasteHTML(objvalue);
break;
case "calculator":
sel = frames.HtmlEditor.document.selection.createRange();
sel.pasteHTML(objvalue);
break;
default:
alert("错误参数调用！");
break;
}
sel=null;
}