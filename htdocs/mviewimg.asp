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
 
  
id=request("id")
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
				  Content=rs("content")
					content=Lcase(UBBCode(Content,2))
					title=rs("title") 
					'//获取 上一个图片
					t=1 
				  n=0
					Do While t <>0  
					 uimg=mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)  
					 
					 if instr(instr(t,content,".jpg"),content,"uploadfile") then
					    t=instr(instr(t,content,".jpg"),content,"uploadfile") '//下一个图片开始位置
					    if  mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)= Previewimg then t=0
					 else
						 t=0
					 end if  
				  Loop 
					
					'//获取 下一个图片
					t=1 
				  n=0
					t1=len(Previewimg) 
					if instr(1,content,Previewimg)+t1 < len(content) then
					n=instr(instr(1,content,Previewimg)+t1,content,"uploadfile") '//记录开始位置
					'response.write n
				  'response.end
				end if
				if n=0 then
					dimg=mid(content,instr(t,content,"uploadfile"),instr(t,content,".jpg")-instr(t,content,"uploadfile")+4)  
				else
					t=instr(n,content,".jpg")'//结束位置 instr(-2-instr(1,content,"uploadfile") 
					'response.end 
		      dimg=mid(content,n,t-n+4)
		      'response.write n & "_"
		      'response.write t & "_"
		      'response.write dimg
				  '  response.end
				  end if
		    end if
		    rs.close
		    set rs=nothing
%>
 
<table width="100%" border="0" cellspacing="0" cellpadding="0" >
   <tr>
    <td><a href="?id=<%=id%>&Previewimg=<%=uimg%>"><img src="images/r.jpg" width="20" border="0" /></a></td>
    <td width="600" align="center">
<%
if 2*w < 3* h then
%> 
<div align=center>
  <img src="<%=Previewimg%>" height=400 border=0></td>
	 
</div>
<%else%>
<div align=center>
  <img src="<%=Previewimg%>"  width="600" border=0></td>
	 
</div>
<%end if%> </td>
<td align="right"><a href="?id=<%=id%>&Previewimg=<%=dimg%>"><img src="images/l.jpg" width="20"  border="0" /></a></td>
</tr> 
</table>
 