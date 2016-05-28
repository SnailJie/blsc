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


Select Case Lcase(Request("action"))
	 
	Case "chklogin"
	     Call Chklogin() 
	Case "save"  
	     Call save()
	     
	Case "edit"  
	
	     Call edit()     
	Case "out"
	     Call loginout() 
End Select
 
Sub Chklogin()  
    strMsg=""
    Username=CheckStr(Request.Form("Username"))
    Password=CheckStr(Request.Form("Password"))
    
    Sql="Select * From userinfo Where Username='"&Username&"' And Password='"&Md5(Password)&"'"
    Set rs=conn.execute(sql)
    If Rs.Eof Or Rs.Bof Then
        strMsg=strMsg&"错误的用户名或密码 " 
    Else
        UserName=Rs("UserName") 
        quanxian=rs("quanxian") 
        'If  isnull(trim(rs("shenhe"))) or InStr(rs("shenhe"),"1")=0 then strMsg=strMsg&"请等待管理员审核 "
   
    End If
    rs.close 
   
    If strMsg<>"" Then  
     Response.Redirect "mMember.asp?strMsg="&strMsg
    Else
    	  
        Session("Master")=UserName
        Session("quanxian")=quanxian 
         
        Response.Redirect "mMember.asp" 'Request.ServerVariables("HTTP_REFERER")
       
    End If
End Sub
 
Sub loginout() 
     session("Master")=""
	session("quanxian")=""
	Response.Redirect "mreg.asp?strMsg=成功退出" 
end sub
Sub save()

if  len(username)<6 or len(username)>20 then
  Response.Redirect "mreg.asp?strMsg=用户名长度应该6-20位" 
  response.end
end if

if  Password="" or username=""  then
  Response.Redirect "mreg.asp?strMsg=用户名和密码 都不能为空"  
  response.end
end if
 
if CheckStr(Request("Password2"))<>Password then
  Response.Redirect "mreg.asp?strMsg=两次输入的密码不一致"    
  response.end
end if

if youxiang="" then
   Response.Redirect "mreg.asp?strMsg=邮箱不能为空"    
  response.end
end if
 
Password=md5(Password)
		sql="select * from userinfo where username='"&username&"'"
		rs.open sql,conn,1,1 
				if not rs.bof then
					Response.Redirect "mreg.asp?strMsg=此用户名已经被注册"    
				  response.end
				end if
		rs.close
		
		sql="select * from userinfo where youxiang='"&youxiang&"'"
		rs.open sql,conn,1,1 
				if not rs.bof then
					Response.Redirect "mreg.asp?strMsg=此邮箱已经被注册"  
				  response.end
				end if
		rs.close
		
		sql="select * from userinfo where (id is null)"
		rs.open sql,conn,1,3
		rs.addnew 
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
		rs("shenhe") ="未审核"
		rs("quanxian") ="未审核"
		
		rs.update 
		Session("Master")=UserName 
    Session("quanxian")="未审核"
         Response.Redirect "mmember.asp?strMsg=注册单已提交，请您认真填写会员信息并耐心等待审核"  
		 
		rs.close
		set rs=nothing
end sub

Sub edit()
  
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
		rs("province") =province 
    rs("city") =city  
    rs("gaikuang") =gaikuang
    rs("xingqu") =xingqu
    rs("touzi") =touzi
    rs("previewimg") =previewimg 
		if Password<>"" then rs("Password")=md5(Password)
		rs.update 
		
		Response.Redirect "mmember.asp?strMsg=修改成功！" 
		 
		rs.close
		set rs=nothing
end sub
%>

  
 
