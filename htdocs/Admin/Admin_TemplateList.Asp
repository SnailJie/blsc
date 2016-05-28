<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
<meta http-equiv="Content-Type" content="text/html; charset=gb2312"></head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
Dim Admin_flag,Action,TMemo(24,1)
Admin_flag="21"
TMemo(0,0)="index.htm":TMemo(0,1)="首页模板"
TMemo(1,0)="disp.htm":TMemo(1,1)="文章显示模板"
TMemo(2,0)="contribute.htm":TMemo(2,1)="用户投稿模板"
TMemo(3,0)="bottom.htm":TMemo(3,1)="页面底部模板"
TMemo(4,0)="head.htm":TMemo(4,1)="页面头部信息(基本信息),如TITLE,CSS"
TMemo(5,0)="head_body.htm":TMemo(5,1)="页面头部信息(主体)"
TMemo(6,0)="index_main_bottom.htm":TMemo(6,1)="首页主体底部(最新文章列表底部)"
TMemo(7,0)="index_main_loop.htm":TMemo(7,1)="首页主体循环部分(最新文章列表循环)"
TMemo(8,0)="index_main_top.htm":TMemo(8,1)="首页主体顶部(最新文章列表顶部)"
TMemo(9,0)="index_topimages_loop.htm":TMemo(9,1)="首页视点文章循环部分"
TMemo(10,0)="index_topimages_nodata.htm":TMemo(10,1)="首页视点文章循环部分(无数据)"
TMemo(11,0)="list.htm" :TMemo(11,1)="文章列表模板"
TMemo(12,0)="list_loop_nodata.htm":TMemo(12,1)="文章列表循环部分(无数据)"
TMemo(13,0)="list_loop.htm":TMemo(13,1)="文章列表循环部分"
TMemo(14,0)="search_loop.htm":TMemo(14,1)="文章搜索列表循环部分"
TMemo(15,0)="mail.htm":TMemo(15,1)="推荐文章给好友的模板"
TMemo(16,0)="mailbody.htm":TMemo(16,1)="邮件内容模板"
TMemo(17,0)="msg.htm":TMemo(17,1)="提示信息,错误信息模板"
TMemo(18,0)="print.htm" :TMemo(18,1)="可打印页面模板"
TMemo(19,0)="Remark.htm":TMemo(19,1)="评论模板"
TMemo(20,0)="Remark_loop.htm":TMemo(20,1)="评论循环部分"
TMemo(21,0)="search.htm":TMemo(21,1)="搜索模板"
TMemo(22,0)="special.htm":TMemo(22,1)="专题模板"
TMemo(23,0)="Special_main_loop.htm":TMemo(23,1)="专题列表循环模板"
TMemo(24,0)="style.css":TMemo(24,1)="模板样式表文件"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    DataConn()
    Select Case Request("Action")
        Case "Edit"
            Call Edit()
		Case "Save"
		    Call Save()
        Case Else
            Call Main()
    End Select
End If

Sub Main()
%>
<table width="95%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th height=22 colspan="2" align="center" sytle="line-height:150%">模板列表(点击模板名称编辑模板)</th>
    </tr>
    <tr class="TopTitle"> 
      <td width="37%" align="left">模板名称</td>
      <td width="63%"><div align="left">备注</div></td>
    </tr>
    <%
	Dim TPath,objFolder,strFileName,Css,n
	TPath=Request.QueryString("TPath")
    For i=0 To UBound(TMemo,1)
		If i Mod 2=0 then 
  	  	   	Css="table_row_1"
  	  	Else
  	  	  	Css="table_row_2"
  	  	End If
	%>
    <tr class="<%=Css%>"> 
      <td align="left"> <a href="?FileName=<%=TPath&TMemo(i,0)%>&Action=Edit"><%=TMemo(i,0)%></a> 
      </td>
      <td><%=TMemo(i,1)%></td>
    </tr>
    <%
	Next
	%>
  </tbody>
</table>
<%
End Sub

Sub Edit()
    Dim TBody,strFileName
	strFileName=Request.QueryString("FileName")
	TBody=Server.HtmlEncode(GetTemplateFile(strFileName))
%>
<form name="form1" method="post" action="?Action=Save">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr> 
      <th colspan="2">编辑模板 --- <%=strFileName%></th>
    </tr>
    <tr class="table_row_1"> 
      <td width="12%">模板内容: </td>
      <td width="88%" align="center"> 
        <textarea name="TBody" rows="30" id="TBody" style="width:100%"><%=TBody%></textarea></td>
    </tr>
    <tr> 
      <th colspan="2" align="center"> <input name="Submit" type="submit" class="button" value="保存模板"> 
        <input name="GoUrl" type="hidden" id="GoUrl" value="<%=Url%>"> <input name="FileName" type="hidden" id="FileName" value="<%=strFileName%>"></th>
    </tr>
  </table>
</form>
<%
End Sub 

Sub Save()
    Dim TBody,TPathFile
	TPathFile=Request.Form("FileName")
	TBody=Request.Form("TBody")
	If TBody="" Then
	    strMsg="<li>模板内容不能为空"
		Call Msg()
	End If
    SaveToFile TBody,"../Template/"&TPathFile
	Response.Redirect Request.Form("GoUrl")
End Sub

Function GetTemplateFile(ByVal TPathFile)
    Dim objStream
    TPathFile=Server.MapPath("../Template/"&TPathFile)
	On Error Resume Next
	Set objStream = Server.CreateObject("ADODB.Stream")
    If Err.Number=-2147221005 Then 
		Response.Write "<div align='center'>非常遗憾,您的主机不支持ADODB.Stream,不能使用本程序</div>"
		Err.Clear
		Response.End
    End If
    With objStream
        .Type = 2
		.Mode = 3
        .Open
		.LoadFromFile TPathFile
        .Charset = "GB2312"
        .Position = 2
        GetTemplateFile = .ReadText
        .close
    End With
    Set objStream = Nothing
End Function

Function GetTemplateMemo(FileName)
    Dim I,Str
    GetTemplateMemo="未知"
    For I=0 To UBound(TMemo,1)
        If FileName=TMemo(I,0) Then 
            GetTemplateMemo=TMemo(I,1)
            Exit For
        End If
    Next
End Function
%>
</body>
</html>