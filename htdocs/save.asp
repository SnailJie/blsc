<!--#include file="inc/const.asp"-->
<%
DataConn() 
Dim ClassID,NClassID,ParentID,strClass,strNClass,strTemp,n,id,Title,content,pages
dim bigclassname,smallclassname,Previewimg,skey,keyword
 
dim guestName,messageTitle,messageDetail,yanzhengma,messageDate,messageIp,dianhua
dim gongsi,youxiang,dizhi,xingqu,xingqu1,yingyong
dim shouji,zhiye,mianji,leixing,nian,yue,tian,feiyong,zhucai,fengge
guestName =request("guestName")
messageTitle = request("messageTitle")
messageDetail =request("messageDetail")
messageDate = date()
messageIp=Request.ServerVariables("remote_addr")
yanzhengma =request("yanzhengma")
'if Request("Verifycode")<>Session("Rand") then
'	response.write("<script>alert('验证码错误!');history.go(-1);</script>")
'  response.end
'end if
dianhua=request("dianhua")
gongsi=request("gongsi")
if guestName="" or dianhua="" or gongsi="" then
	response.write("<script>alert('都不能为空!');history.go(-1);</script>")
  response.end
end if 
Set rs=Server.CreateObject("ADODB.RecordSet")  
sql="select * from book where (messageid is null)"
rs.open sql,conn,1,3
rs.addnew
rs("gongsi") =request("gongsi")
rs("dianhua") =request("dianhua")
rs("youxiang") =request("youxiang")
rs("dizhi") =request("dizhi")
rs("xingqu") =request("xingqu")
rs("xingqu1") =request("xingqu1")
rs("yingyong") =request("yingyong")
rs("guestName") =guestName 
rs("messageTitle") =messageTitle 
rs("messageDetail") =messageDetail 
rs("messageDate") =date()
rs("messageIp") =messageIp

rs("shouji") =request("shouji")
rs("zhiye") =request("zhiye")
rs("mianji") =request("mianji")
rs("leixing") =request("leixing")
rs("nian") =request("nian")
rs("yue") =request("yue")
rs("tian") =request("tian")
rs("feiyong") =request("feiyong")
rs("zhucai") =request("zhucai")
rs("fengge") =request("fengge")
 
rs.update
%>
<script language="javascript">
      alert("订单提交成功！");
      window.location=("<%=Request.ServerVariables("HTTP_REFERER")%>");  
  </script>
  <%
rs.close
set rs=nothing
%>

  
 
