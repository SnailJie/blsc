<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,fso1,f1,ext,bFlag,p1,arr,w,h,pp,imgpath
dim bigclassname,smallclassname,Previewimg,skey,keyword,t,pages1,rs1,pages,t1,isHtml,writefrom,adddate 
Set Rs=Server.CreateObject("ADODB.RecordSet") 
Set Rs1=Server.CreateObject("ADODB.RecordSet") 
 

Class  imgInfo  
 dim  aso  
 Private  Sub  Class_Initialize  
   set  aso=CreateObject("Adodb.Stream")  
   aso.Mode=3    
   aso.Type=1    
   aso.Open    
 End  Sub  
 Private  Sub  Class_Terminate
   err.clear
   set  aso=nothing  
 End  Sub  
 
Private  Function  Bin2Str(Bin)  
   Dim  I,  Str  
   For  I=1  to  LenB(Bin)  
     clow=MidB(Bin,I,1)  
     if  ASCB(clow)<128  then  
       Str  =  Str  &  Chr(ASCB(clow))  
     else  
       I=I+1  
       if  I  <=  LenB(Bin)  then  Str  =  Str  &  Chr(ASCW(MidB(Bin,I,1)&clow))  
     end  if  
   Next    
   Bin2Str  =  Str  
 End  Function  
   
Private  Function  Num2Str(num,base,lens)  
   dim  ret  
   ret  =  ""  
   while(num>=base)  
     ret  =  (num  mod  base)  &  ret  
     num  =  (num  -  num  mod  base)/base  
   wend  
   Num2Str  =  right(string(lens,"0")  &  num  &  ret,lens)  
 End  Function  
   
Private  Function  Str2Num(str,base)  
   dim  ret  
   ret  =  0  
   for  i=1  to  len(str)  
     ret  =  ret  *base  +  cint(mid(str,i,1))  
   next  
   Str2Num=ret  
 End  Function  
   
Private  Function  BinVal(bin)  
   dim  ret  
   ret  =  0  
   for  i  =  lenb(bin)  to  1  step  -1  
     ret  =  ret  *256  +  ascb(midb(bin,i,1))  
   next  
   BinVal=ret  
 End  Function  
   
Private  Function  BinVal2(bin)  
   dim  ret  
   ret  =  0  
   for  i  =  1  to  lenb(bin)  
     ret  =  ret  *256  +  ascb(midb(bin,i,1))  
   next  
   BinVal2=ret  
 End  Function  
   
Private  Function  getImageSize(filespec)    
   dim  ret(3)  
   aso.LoadFromFile(filespec)  
   bFlag=aso.read(3)  
   select  case  hex(binVal(bFlag))  
   case  "4E5089":  
     aso.read(15)  
     ret(0)="PNG"  
     ret(1)=BinVal2(aso.read(2))  
     aso.read(2)  
     ret(2)=BinVal2(aso.read(2))  
   case  "464947":  
     aso.read(3)  
     ret(0)="GIF"  
     ret(1)=BinVal(aso.read(2))  
     ret(2)=BinVal(aso.read(2))  
   case  "535746":  
     aso.read(5)  
     binData=aso.Read(1)  
     sConv=Num2Str(ascb(binData),2  ,8)  
     nBits=Str2Num(left(sConv,5),2)  
     sConv=mid(sConv,6)  
     while(len(sConv)<nBits*4)  
       binData=aso.Read(1)  
       sConv=sConv&Num2Str(ascb(binData),2  ,8)  
     wend  
     ret(0)="SWF"  
     ret(1)=int(abs(Str2Num(mid(sConv,1*nBits+1,nBits),2)-Str2Num(mid(sConv,0*nBits+1,nBits),2))/20)  
     ret(2)=int(abs(Str2Num(mid(sConv,3*nBits+1,nBits),2)-Str2Num(mid(sConv,2*nBits+1,nBits),2))/20)  
   case  "FFD8FF":  
     do    
       do:  p1=binVal(aso.Read(1)):  loop  while  p1=255  and  not  aso.EOS  
       if  p1>191  and  p1<196  then  exit  do  else  aso.read(binval2(aso.Read(2))-2)  
       do:p1=binVal(aso.Read(1)):loop  while  p1<255  and  not  aso.EOS  
     loop  while  true  
     aso.Read(3)  
     ret(0)="JPG"  
     ret(2)=binval2(aso.Read(2))  
     ret(1)=binval2(aso.Read(2))  
   case  else:  
     if  left(Bin2Str(bFlag),2)="BM"  then  
       aso.Read(15)  
       ret(0)="BMP"  
       ret(1)=binval(aso.Read(4))  
       ret(2)=binval(aso.Read(4))  
     else  
       ret(0)=""  
     end  if  
   end  select  
   ret(3)="width="""  &  ret(1)  &"""  height="""  &  ret(2)  &""""  
   getimagesize=ret  
 End  Function  
   
Public Function  imgW(pic_path)  
     Set  fso1  =  server.CreateObject("Scripting.FileSystemObject")  
     If (fso1.FileExists(pic_path)) Then 
   Set  f1  =  fso1.GetFile(pic_path)  
   ext=fso1.GetExtensionName(pic_path)  
   select  case  ext  
    case  "gif","bmp","jpg","png":  
     arr=getImageSize(f1.path)  
     imgW = arr(1)  
   end  select  
   Set  f1=nothing 
  else
      imgW = 0
  End if   
     Set  fso1=nothing  
 End  Function  
 
Public Function  imgH(pic_path)  
     Set  fso1  =  server.CreateObject("Scripting.FileSystemObject") 
  If (fso1.FileExists(pic_path)) Then 
   Set  f1  =  fso1.GetFile(pic_path)  
   ext=fso1.GetExtensionName(pic_path)  
   select  case  ext  
    case  "gif","bmp","jpg","png":  
     arr=getImageSize(f1.path)  
     imgH = arr(2)  
   end  select  
   Set  f1=nothing  
  else
   imgH = 0 
  End if  
     Set  fso1=nothing  
 End  Function  
End  Class
 
  
id=cint(request("id"))
Previewimg=request("Previewimg")
 
imgpath=Previewimg
 
 set  pp=new  imgInfo  
 w = pp.imgW(server.mappath(imgpath))  
 h = pp.imgH(server.mappath(imgpath)) 
set pp=nothing 

dim uimg,dimg
sql="SELECT * from article where  id="&id&" " 
			rs.Open sql,conn,1,1 
			if not(rs.eof and rs.bof) then 
				 skey=rs("skey")
				  Content=rs("content")
					content=Lcase(UBBCode(Content,2))
					title=rs("title") 
					if instr(1,content,".jpg")<>0 then
					'//��ȡ ��һ��ͼƬ
					'response.write content
					t=1 
				  n=0
					Do While t <>0  
					 uimg=mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)  
					 
					 if instr(instr(t,content,".jpg"),content,"uploadfile") then
					    t=instr(instr(t,content,".jpg"),content,"uploadfile") '//��һ��ͼƬ��ʼλ��
					    if  mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)= Previewimg then t=0
					 else
						 t=0
					 end if  
				  Loop 
					
					'//��ȡ ��һ��ͼƬ
					t=1 
				  n=0
					t1=len(Previewimg) 
					if instr(1,content,Previewimg)+t1 < len(content) then
					n=instr(instr(1,content,Previewimg)+t1,content,"uploadfile") '//��¼��ʼλ��
					'response.write n
				  'response.end
				  end if
				if n=0 then
					dimg=mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)  
				else
					t=instr(n,content,".jpg")'//����λ�� instr(-2-instr(1,content,"uploadfile") 
					'response.end 
		      dimg=mid(content,n,t-n+4)
		      'response.write n & "_"
		      'response.write t & "_"
		      'response.write dimg
				  '  response.end
				  end if
		    end if
		  end if
		  rs.close
		  set rs=nothing
		  if dimg="" then dimg=Previewimg
		  if uimg="" then uimg=Previewimg
%>
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312" />
<link href="css/style.css" rel="stylesheet" type="text/css">
<title> <%=site_info(0)%></title> 
</head>
<body>  
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="border:solid 1px #dddddd;" bgcolor=#eeeeee height=600>
      <tr>
        <td align="center"></td>
         <td align="center"></td>
        <td align="center" height=20> </td> 
         <td align="center"></td>
      </tr>
       <tr>
        <td align="center"></td>
         <td align="center"></td>
        <td align="center"><h1><%=title%></h1></td> 
         <td align="center"></td>
      </tr>
      <tr>
         <td class="neirong" width=150 valign=top> <%=HtmlEncode(left(skey,240))%> </td>
         <td valign=middle><a href="?id=<%=id%>&Previewimg=<%=uimg%>"><img src="images/up.png" border=0></a></td>
          <td width="700" valign=top>
        	<%
if 5*w < 7* h then
%> 
<div align=center class=otherimg>
  <a href="?id=<%=id%>&Previewimg=<%=dimg%>"><img src="<%=Previewimg%>" style="height:420" border=0></a></td>
	 
</div>
<%else%>
<div align=center class=otherimg>
  <a href="?id=<%=id%>&Previewimg=<%=dimg%>"><img src="<%=Previewimg%>"  style="width:660" border=0></a></td>
	 
</div>
<%end if%>
</td>
    <td valign=middle><a href="?id=<%=id%>&Previewimg=<%=uimg%>"><img src="images/down.png" border=0></a></td>
      </tr>
    </table>
 <table width="100%" border="0" cellspacing="0" cellpadding="0" bgcolor="#000000">
   <tr>
    <td><a href="?id=<%=id%>&Previewimg=<%=uimg%>"><img src="images/i_nex.jpg" width="27" height="27" border="0" /></a></td>
    <td width="700" align="center">
<%
if 5*w < 7* h then
%> 
<div align=center class=otherimg>
  <img src="<%=Previewimg%>" height=600 border=0 style="margin:5px;padding:5px;border:1px solid #e5e5e5;backgcolor:#ffffff"></td>
	 
</div>
<%else%>
<div align=center class=otherimg>
  <img src="<%=Previewimg%>"  width="700" border=0 style="margin:5px;padding:5px;border:1px solid #e5e5e5;backgcolor:#ffffff"></td>
	 
</div>
<%end if%> </td>
<td align="right"><a href="?id=<%=id%>&Previewimg=<%=dimg%>"><img src="images/i_pre.jpg" width="25" height="26" border="0" /></a></td>
</tr> 
</table>
 