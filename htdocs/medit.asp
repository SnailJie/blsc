<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<!--#include file="admin/inc/Md5.asp" -->

<%
'response.write "0000000000000000000000000"
'	response.end
DataConn() 
 Set rs=Server.CreateObject("ADODB.RecordSet")
dim  username,Password,youxiang
dim xingming,xingbie,shouji,qqmsn,xuexiao,zhiwu,nianji,xueke,dizhi,dingyue,province,city
dim  zhuceshijian,zhuceIp,id,quanxian,gaikuang,xingqu,touzi,previewimg

id=CheckStr(request("id") ) 
Password=CheckStr(request("Password"))
xingming=CheckStr(request("xingming"))
youxiang=CheckStr(request("youxiang"))
xingbie=CheckStr(request("xingbie"))
shouji=CheckStr(request("shouji"))
qqmsn=CheckStr(request("qqmsn"))
xuexiao=CheckStr(request("xuexiao"))
zhiwu=CheckStr(request("zhiwu"))
nianji=CheckStr(request("nianji"))
xueke=CheckStr(request("xueke")) 
dizhi=CheckStr(request("dizhi")) 
dingyue=CheckStr(request("dingyue")) 
username=CheckStr(request("username")) 
province=CheckStr(request("province")) 
city=CheckStr(request("city")) 
gaikuang=CheckStr(request("gaikuang")) 
xingqu=CheckStr(request("xingqu")) 
touzi=CheckStr(request("touzi")) 
previewimg=CheckStr(request("previewimg")) 
zhuceshijian= date()
zhuceIp=Request.ServerVariables("remote_addr")
  
		sql="select * from userinfo where id="&id
		rs.open sql,conn,1,3 
		rs("youxiang") =youxiang 
		rs("username") =username 
		rs("xingming") =xingming 
		rs("xingbie") =xingbie 
		rs("shouji") =shouji 
		rs("qqmsn") =qqmsn  
		rs("xuexiao") =xuexiao
		rs("zhiwu") =zhiwu 
		rs("nianji") =nianji
		rs("xueke") =xueke
		rs("dizhi") =dizhi
		rs("dingyue") =dingyue  
		rs("Password") =Password
		rs("zhuceshijian") =zhuceshijian
		rs("zhuceip") =zhuceip
		rs("province") =province 
    rs("city") =city
    rs("gaikuang") =gaikuang
    rs("xingqu") =xingqu
    rs("touzi") =touzi
    rs("previewimg") =previewimg 
    if Password<>"" then rs("Password")=md5(Password)
    	 
		rs.update 
		Session("Master")=UserName  
         Response.Redirect "mmember.asp?strMsg=信息修改成功"  
		 
		rs.close
		set rs=nothing
 
%>

  
 
