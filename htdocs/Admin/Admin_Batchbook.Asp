<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/Md5.asp" -->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Action
Admin_flag="02"
 
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
   
    Select Case Request.Form("Action")
	    Case "删除"
	            Call bookDel() 
			Case "修改"
			    Call bookedit()
			Case "添加"
			    Call bookadd() 
			Case ""
			    Response.Redirect Url
    End Select
End If

Sub bookDel()
    Dim ID
	 ID=Request.Form("Id") 
    If ID="" Then Response.Redirect Url 
	  Sql="Delete From userinfo Where id="&ID
	Conn.Execute Sql 
	DataClose()
	Response.Redirect Url
End Sub

Sub bookedit()
    Dim ID 
    ID=Request.Form("Id") 
    If ID="" Then Response.Redirect Url 
	  Set Rs=Server.Createobject("Adodb.Recordset")
        Sql="Select * From userinfo Where id="&ID
        Rs.Open Sql,Conn,1,3  
         Rs("youxiang")=Request.Form("youxiang")
				Rs("xingming")=Request.Form("xingming")
				Rs("xingbie")=Request.Form("xingbie")
				Rs("shouji")=Request.Form("shouji")
				Rs("qqmsn")=Request.Form("qqmsn")
				Rs("xuexiao")=Request.Form("xuexiao")
				Rs("zhiwu")=Request.Form("zhiwu")
				Rs("nianji")=Request.Form("nianji")
				Rs("xueke")=Request.Form("xueke")
				Rs("quanxian")=Request.Form("quanxian") 
				Rs("dizhi")=Request.Form("dizhi") 
				Rs("shenhe")=Request.Form("shenhe") 
				Rs("dingyue")=Request.Form("dingyue") 
				if trim(Request.Form("Password"))<>"" then Rs("Password")=md5(Request.Form("Password") )
        Rs.Update
        Rs.Close
        Set Rs=Nothing
	Response.Redirect Url
End Sub

Sub bookadd() 
 
	  Set Rs=Server.Createobject("Adodb.Recordset") 
        Sql="Select * From book"
        Rs.Open Sql,Conn,1,3
        Rs.Addnew
          Rs("youxiang")=Request.Form("youxiang")
				Rs("xingming")=Request.Form("xingming")
				Rs("xingbie")=Request.Form("xingbie")
				Rs("shouji")=Request.Form("shouji")
				Rs("qqmsn")=Request.Form("qqmsn")
				Rs("xuexiao")=Request.Form("xuexiao")
				Rs("zhiwu")=Request.Form("zhiwu")
				Rs("nianji")=Request.Form("nianji")
				Rs("xueke")=Request.Form("xueke")
				Rs("quanxian")=Request.Form("quanxian") 
				Rs("dizhi")=Request.Form("dizhi") 
				Rs("shenhe")=Request.Form("shenhe") 
				Rs("dingyue")=Request.Form("dingyue")  
        Rs.Update
        Rs.Close
        Set Rs=Nothing
         
 Response.Redirect Url
End Sub
%>
</body>
</html>
 