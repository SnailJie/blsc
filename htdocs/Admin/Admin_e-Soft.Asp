<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim admin_flag,action
admin_flag="51"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    Call Main()
End If
  
Sub Main()
	GetPage()
%>
<p>
<div id=ShowContent style="display:none">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr>
      <th>新闻内容</th>
    </tr>
    <tr>
      <td><span id="Content">&nbsp;</span></td>
    </tr>
  </table>
</div>
</p>
<%
End Sub

Function GetPage()
    On Error Resume Next 
    Dim Http 
    Set Http=Server.Createobject("Microsoft.XMLHTTP")
    Http.open "get","http://www.xfok.com/article/support/News.asp?From="&Url&"&Site="&Site_Info(0)&"&SiteUrl="&Site_Info(1)&"&Version="&Version,False
    Http.send() 
    If Http.readystate<>4 Then
        Exit Function 
    End If
    Response.Write (bytes2bstr(http.ResponseBody))
    Set Http=nothing
    If Err.number<>0 Then Err.clear  
End Function

Function Bytes2bStr(vin)
    Dim BytesStream,StringReturn
    Set BytesStream = Server.CreateObject("ADODB.Stream")
    With BytesStream
    .Type = 2
    .Open
    .WriteText vin
    .Position = 0
    .Charset = "GB2312"
    .Position = 2
    StringReturn = .ReadText
    .close
    End With
    Set BytesStream = Nothing
    Bytes2bStr = StringReturn
End Function
%>
</body>
</html>