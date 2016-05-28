<%
Option Explicit
Server.ScriptTimeOut=90    '脚本超时时间(单位:秒)
Session.Timeout=20         'Session过期时间(单位:分钟)
Response.Expires=-1

'--------设置区（相对路径）--------
Dim DataPath,SettingFile
DataPath="Data/Article.Mdb"    '数据库路径
SettingFile="Data/Config.Xml"  '网站设置路径
'--------以下部分勿动--------------

Dim StartTime,Conn,strConn,Article_Url
Dim SQL,Rs,strMsg
Dim Site_Info,Url
Dim ArticleCount,PageSize,Page,PageCount
Dim SqlStr,i
Dim CopyRight,Version,SplitWords,DefaultTemplate,ScriptName
Dim Html
StartTime=Timer
ScriptName=LCase(Request.ServerVariables("SCRIPT_NAME"))
If InStr(ScriptName,"admin")>0 Then 
    Article_Url="../"
End If
DataPath=Article_Url&DataPath
SettingFile=Article_Url&SettingFile
Url=Request.ServerVariables("HTTP_REFERER")

GetSetting()

CopyRight=Site_Info(5)
DefaultTemplate=Site_Info(7)
PageSize=CInt(Site_Info(8))
SplitWords=Site_Info(14)
Version="Powered by：timemedia"

Sub DataConn()
    Set Conn = Server.Createobject("Adodb.Connection")
	'strConn = "Provider=SQLOLEDB.1;Persist Security Info=False;Server=10.81.0.75;User ID=sa ;Password=123456;Database=eArticle;"
    strConn="Provider=Microsoft.Jet.Oledb.4.0;Data Source=" & Server.Mappath(DataPath)
    Conn.Open strConn
End Sub 
%>
<!--#include file="char.asp"-->