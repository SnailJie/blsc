<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,fso1,f1,ext,bFlag,p1,arr,w,h,pp
dim bigclassname,smallclassname,Previewimg,skey,keyword,t,pages1,rs1,pages,t1,isHtml,writefrom,adddate 
Set Rs=Server.CreateObject("ADODB.RecordSet") 
Set Rs1=Server.CreateObject("ADODB.RecordSet")

id=cstr(request("id"))
classid=request("classid") 
nclassid=request("nclassid")  
 
if nclassid="" then nclassid=0
if id<>"" then
 
	    sql="SELECT a.SpecialID,a.id,a.classid,a.nclassid,a.writefrom,a.adddate,n.orders,a.id,a.title,a.Content,a.skey,a.isHtml,a.Previewimg,n.NClass from article A LEFT JOIN NClass N ON (A.NClassID=N.ID)  where a.id="&id 
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then
	 
				rs.PageSize=15
				if page=0 then page=1 
				pages=rs.pagecount
				if page > pages then page=pages
				rs.AbsolutePage=page
				t=0 
			  
			 
		title=rs("title")
		Content=rs("content")
		content=LCase(UBBCode(Content,2)  )
		id=rs("id")
		t=1 
		
		Previewimg=""
		
		n="" 
		dim m,tempPreviewimg
		tempPreviewimg=""
		m=""
		Do While t <>0 
			 t=instr(t,content,"<img")
			 n=mid(content,instr(t,content,"src")+5,instr(t,content,"jpg")-instr(t,content,"src")-2)  
			 if left(n,1)="/" then n=right(n,len(n)-1) 
		   n="<td><a href=viewimg.asp?id="&id&"&Previewimg="&n&" target=twt><img  src="&n&" border=0 height=120></a></td>"
		   Previewimg=Previewimg&n
			 if instr(instr(t,content,">"),content,"<img") then
			    t=instr(instr(t,content,">"),content,"<img")  
			 else
				 t=0
			 end if
		Loop  
	 rs.close
    tempPreviewimg=tempPreviewimg&Previewimg
   end if	
end if	

if classid<>0 then
  sql="SELECT * from class where id="&classid
	rs.Open sql,conn,1,1 
	if not(rs.eof and rs.bof) then
		bigclassname=rs("class")
	end if 
	rs.close
end if

	if nclassid<>0 then
		sql="SELECT * from nclass where id="&nclassid
		rs.Open sql,conn,1,1 
		if not(rs.eof and rs.bof) then
			smallclassname=rs("nclass")
		end if 
		rs.close
	end if
%>
<a name=#top> </a>
<html>
<head> 
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<title><%if smallclassname<>"" then%><%=smallclassname%>_<%end if%><%if bigclassname<>"" then%><%=bigclassname%>_<%end if%><%=site_info(0)%></title>
<link href="css/style3.css" rel="stylesheet" type="text/css">
<meta name="description" content=" ">
<meta name="Keywords" content=" ">
<SCRIPT language=JavaScript type=text/JavaScript>
<!--
//more javascript from http://www.webjx.com 鼠标经过箭头时,图片会向左或向右横向移动
var sh;
marqueesWidth=600;
preLeft=0; currentLeft=0; stopscroll=false; getlimit=0;preTop=0; currentTop=0;

function scrollLeft()
{
	if(stopscroll==true) return;
	preLeft=marquees.scrollLeft;
	marquees.scrollLeft+=2;
	if(preLeft==marquees.scrollLeft)
	{
		//marquees.scrollLeft=templayer.offsetWidth-marqueesWidth+1;
	}
}

function scrollRight()
{
	if(stopscroll==true) return;

	preLeft=marquees.scrollLeft;
	marquees.scrollLeft-=2;
	if(preLeft==marquees.scrollLeft)
	{
		if(!getlimit)
		{
			marquees.scrollLeft=templayer.offsetWidth*2;
			getlimit=marquees.scrollLeft;
		}
		marquees.scrollLeft-=1;
	}
}

function Left()
{
	stopscroll = false;
	sh = setInterval("scrollLeft()",20);
}

function Right()
{
	stopscroll = false;
	sh = setInterval("scrollRight()",20);
}

function StopScroll()
{
	stopscroll = true;
	clearInterval( sh );
}



function SelectType(value)
{
	document.all.sendForm.page.value = 1;
	document.all.sendForm.type.value = value;

	document.all.sendForm.submit();
}

function init()
{
	with(marquees)
	{
		style.height=0;
		style.width=marqueesWidth;
		style.overflowX="hidden";
		style.overflowY="visible";
		style.align = "center";
		noWrap=true;
	}
}


//-->
</SCRIPT>

</head>
<body onload=init();>
<div class="pic">
	  <ul> 
	  <li>
<TABLE cellpadding="1" cellspacing="1" width=660 align=center border=0>
<TR valign=top>
<TD ><IMG src="images/left.gif" border=0 onmouseout=StopScroll() onmouseover=Left() style="CURSOR: pointer"></TD>
    <TD>
      <DIV id=marquees>
      <TABLE border=0 cellpadding="1" cellspacing="1">
      	<TR>
      	<%=tempPreviewimg%>
</TR></TABLE></DIV>
<DIV id=templayer style="LEFT: 0px; VISIBILITY: hidden; POSITION: absolute; TOP: 0px"></DIV>

</TD>
<TD align=middle><IMG  src="images/right.gif" border=0 height=120 onmouseout=StopScroll() onmouseover=Right() style="CURSOR: pointer"></TD>
</TR></TABLE>
	  	 </li>
	  </ul>
	  </div>
   
   </BODY></HTML> 
		 <% 
set rs=nothing
DataClose()
%>