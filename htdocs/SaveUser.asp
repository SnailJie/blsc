<!--#include file="inc/const.asp"-->
<!--#include file="inc/UBBCode.Asp"-->
<!--#include file="admin/inc/Md5.asp" -->

<%

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
	Case ""
	     Call info()
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
        strMsg=strMsg&"������û��������� " 
    Else
        UserName=Rs("UserName") 
        quanxian=rs("quanxian") 
        'If  isnull(trim(rs("shenhe"))) or InStr(rs("shenhe"),"1")=0 then strMsg=strMsg&"��ȴ�����Ա��� "
   
    End If
    rs.close 
   
    If strMsg<>"" Then  
     Response.Redirect "index.asp?strMsg="&strMsg
    Else
    	  
        Session("Master")=UserName
        Session("quanxian")=quanxian 
        Response.Redirect "member.asp" 'Request.ServerVariables("HTTP_REFERER")
       
    End If
End Sub
 
Sub loginout() 
 session("Master")=""
	session("quanxian")=""
	response.redirect "/"
end sub
Sub save()

if  len(username)<6 or len(username)>20 then
  response.write("<script>alert('�û�������Ӧ��6-20λ!');history.go(-1);</script>")
  response.end
end if

if  Password="" or username=""  then
  response.write("<script>alert('�û��������� ������Ϊ��!');history.go(-1);</script>")
  response.end
end if
 
if CheckStr(Request("Password2"))<>Password then
  response.write("<script>alert('������������벻һ��!');history.go(-1);</script>")
  response.end
end if

if youxiang="" then
  response.write("<script>alert('���䲻��Ϊ��!');history.go(-1);</script>")
  response.end
end if


'if xingming="" then
'  response.write("<script>alert('��������Ϊ��!');history.go(-1);</script>")
'  response.end
'end if

'if xingbie="" then
'  response.write("<script>alert('�Ա�û��ѡ��!');history.go(-1);</script>")
'  response.end
'end if

'if xuexiao="" then
'  response.write("<script>alert('����ѧУ��λ����Ϊ��!');history.go(-1);</script>")
'  response.end
'end if

'if zhiwu="" then
'  response.write("<script>alert('ְ����Ϊ��!');history.go(-1);</script>")
'  response.end
'end if

Password=md5(Password)
		sql="select * from userinfo where username='"&username&"'"
		rs.open sql,conn,1,1 
				if not rs.bof then
					response.write("<script>alert('���û����Ѿ���ע��!');history.go(-1);</script>")
				  response.end
				end if
		rs.close
		
		sql="select * from userinfo where youxiang='"&youxiang&"'"
		rs.open sql,conn,1,1 
				if not rs.bof then
					response.write("<script>alert('�������Ѿ���ע��!');history.go(-1);</script>")
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
		rs("shenhe") ="δ���"
		
		rs.update 
		Session("Master")=UserName 
    Session("quanxian")=quanxian 
         
		%>
		
		<script language="javascript">
		      alert("ע�ᵥ���ύ������������д��Ա��Ϣ�����ĵȴ����");
		      window.location=("member.asp");  
		  </script>
		  <%
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
		%>
 
		<script language="javascript">
		      alert("�޸ĳɹ���");
		      window.location=("<%=Request.ServerVariables("HTTP_REFERER")%>");  
		  </script>
		  <%
		rs.close
		set rs=nothing
end sub
%>

  
 
