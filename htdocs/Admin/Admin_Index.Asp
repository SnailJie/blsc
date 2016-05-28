<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<!--#include file="inc/Md5.asp" -->
<%
DataConn()
Version="<br><div align=center>"&Version&"</div>"
Select Case Lcase(Request("action"))
	Case "admin_login"
	     Call Admin_login()
	Case "chklogin"
	     Call Admin_login()
	     Call chklogin()
	Case "loginout"
	
	     Call loginout()
    Case "admin_left"
	     Call Admin_left()
    Case "admin_main"
	     Call Admin_main()
    Case "admin_head"
	     Call Admin_head()
    Case Else
	     Call Main()
End Select

DataClose()

Sub Main()
%>
<html>
<head>
<title><%=site_info(0)%>--控制面板</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
</head>
<%
If session("master")="" Then
   Call Admin_login()
Else%>
<frameset rows="20,*"  framespacing="0" border="0" frameborder="0" frameborder="no" border="0">
<frame src="Admin_index.asp?action=Admin_head" name="head" scrolling="NO" NORESIZE frameborder="0" marginwidth="10" marginheight="0" border="no">


<frameset cols="180,*" frameborder="no" border="0" framespacing="0" rows="*"> 
  <frame name="leftFrame" scrolling="yes" noresize src="Admin_index.asp?action=Admin_left" marginwidth="0" marginheight="0">

<frame name="main" src="Admin_index.asp?action=Admin_main" scrolling="AUTO" NORESIZE frameborder="0" marginwidth="10" marginheight="10" border="no">
</frameset>
<%End If%>
</frameset>
<noframes>
</body></noframes>
</html>
<%
End Sub

Sub Admin_left()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
</head>
<body  topmargin=0 leftmargin=0 bgcolor=#E5E5E5>
<SCRIPT language="JavaScript" type="text/javascript">
<!--
function ToggleNode(nodeObject, imgObject){
         if (nodeObject.style.display == '' || nodeObject.style.display == 'inline') {
             nodeObject.style.display = 'none';
             imgObject.src = 'images/collapse.gif';
         } else {
             nodeObject.style.display = 'inline';
             imgObject.src = 'images/expand.gif';
         }
}
function Upload()
{
	window.open("Admin_upload.asp","Upload","left=0,top=0,width=400,height=280,status=1");
}
-->
</SCRIPT>
<table cellpadding=0 cellspacing=1 width=95% align=center border="0" align="center">
  <tr>
    <td bgcolor="#f6f6f6" align="center" height="30">
	  <br>后台管理控制面板
	</td>
  </tr>
</table>
<%
Dim Admin_menu(7,6)
Admin_menu(0,0)="内容管理"
Admin_menu(0,1)="<a href=Admin_ArticleAdd.asp target=main>添加内容</a>"
Admin_menu(0,2)="<a href=Admin_Article.Asp target=main>内容管理</a>"
'Admin_menu(0,3)="<a href=Admin_Check.Asp target=main>审核内容</a>"
Admin_menu(0,3)="<a href=Admin_Search.Asp target=main>内容搜索</a>"
'Admin_menu(0,5)="<a href=Admin_Article.Asp?action=CreateIndexJs target=main title=如果基本设置里的首页分类显示方式选择的是JS调用,每次添加,修改,删除内容后请点此处>生成首页分类列表JS</a>"

Admin_menu(1,0)="分类管理" '、专题
Admin_menu(1,1)="<a href=Admin_class.asp target=main>分类管理</a>"
'Admin_menu(1,2)="<a href=Admin_Special.asp target=main>专题管理</a>"
'Admin_menu(1,2)="<a href=Admin_class.asp?action=createjs target=main title=生成的JS有顶部分类菜单,搜索分类>生成搜索分类</a>"

'Admin_menu(2,0)="模板管理"
'Admin_menu(2,1)="<a href=Admin_template.asp target=main>模板管理</a>"
'Admin_menu(2,2)="<a href=Admin_template.asp?Action=reload target=main>刷新模板</a>"

Admin_menu(2,0)="文件管理"
Admin_menu(2,1)="<a href=Admin_file.asp target=main>查看上传文件</a>"
'Admin_menu(2,1)="<a href=javascript:Upload()>上传文件</a>" 

Admin_menu(3,0)="系统管理"
'Admin_menu(3,1)="<a href=Admin_setting.asp target=main>文件目录设置</a>"
'Admin_menu(3,2)="<a href=Admin_user.asp target=main>人员管理</a>"
Admin_menu(3,1)="<a href=Admin_password.asp target=main>密码修改</a>"
 
Admin_menu(4,0)="会员管理 " 
Admin_menu(4,1)="<a href=Admin_book.asp target=main>会员管理 </a>" 
Admin_menu(4,2)="<a href=add_book.asp target=main>会员信息添加 </a>"
'Admin_menu(4,3)="<a href=Admin_book.asp?shenhe=2 target=main>会员权限管理 </a>"
'Admin_menu(4,0)="友情链接管理" 
'Admin_menu(4,1)="<a href=Admin_addlook.asp target=main>添加友情链接</a>"
'Admin_menu(4,2)="<a href=Admin_look.asp target=main>友情链接管理</a>"

'Admin_menu(5,0)="证件查询管理" 
'Admin_menu(5,1)="<a href=Admin_addbook.asp target=main>证件信息添加</a>"
'Admin_menu(5,2)="<a href=Admin_book.asp target=main>证件查询管理</a>"

'Admin_menu(5,0)="程序信息"
'Admin_menu(5,1)="<a href=Admin_e-Soft.asp title='获取关于本程序的最新动态' target=main>程序最新动态</a>"

Dim J
Dim Admin_menuname
For I=0 To Ubound(Admin_menu,1)
     If IsEmpty(Admin_menu(I,0)) Then Exit For
%>
<table cellspacing=1 cellpadding=0 width="95%" border=0 align="center">
  <tbody>
    <tr id=root> 
      <td>
        <table cellspacing=0 cellpadding=0 width="100%" border=0>
          <tbody>
            <tr> 
              <td bgcolor=#006699>
	            <img
                    id=nav_img_<%=i%> style="cursor: hand"
                    onclick=ToggleNode(nav_tr_<%=i%>,nav_img_<%=i%>) hspace=2 
                    src="images/expand.gif" 
                    align=absmiddle vspace=2>
		        <Font style="color:#ffffff;font-weight:bold"><%=Admin_menu(i,0)%></font>
              </td>
            </tr>
          </tbody>
        </table>
      </td>
    </tr>
    <tr id=nav_tr_<%=i%>> 
      <td>
	    <table cellspacing=1 cellpadding=2 width="100%" border=0>
          <tbody>
<%     For J=1 To Ubound(Admin_menu,1)
          If Isempty(Admin_menu(I,J)) Then Exit For%>
            <tr id=cat onmouseover="this.bgColor='#EEEEEE';" 
                       onmouseout="this.bgColor='#FFFFFF';" 
                       bgColor=#ffffff> 
              <td>
			    <img hspace=2 src="images/blank.gif" width="16" height="16" align=absmiddle><%=Admin_menu(i,j)%>
			  </td>
            </tr>
<%     Next%>
          </tbody>
        </table>
      </td>
    </tr>
  </tbody>
</table>
<%Next%>
</body>
</html>
<%
End sub

Sub Admin_head()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
</head>
<body  topmargin=0 leftmargin=0 bgcolor=#006699>
<table width="100%" align=center cellpadding=0 cellspacing=0 border=0>
<tr>
<td height="23" valign=middle><Font color=white>→ 欢迎 <%=session("master")%> 进入控制面板</font> </td>
<td valign=middle></td>
<td valign=middle align=right><a href=Admin_index.asp?action=loginout target=_top style="color:white">退出后台</a>&nbsp;&nbsp; <a href=../ target=_top style="color:white">返回首页</a>&nbsp;&nbsp;</td>
</tr>
</table>
</body>
</html>
<%
End Sub

Sub Admin_main()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
</head>
<body  topmargin=0 leftmargin=0 bgcolor=#E5E5E5>
<br>
<H4 align=center>欢迎使用后台管理</H4>

<!--<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
  <tr> 
    <th colspan="2">系统信息</th>
  </tr>
  <tr class="table_row_1"> 
    <td width="50%">服务器类型：<%=Request.ServerVariables("OS")%>(IP:<%=Request.ServerVariables("LOCAL_ADDR")%>)</td>
    <td width="50%">脚本解释引擎：<%=ScriptEngine & "/"& ScriptEngineMajorVersion &"."&ScriptEngineMinorVersion&"."& ScriptEngineBuildVersion %></td>
  </tr>
  <tr class="table_row_2"> 
    <td>站点物理路径：<%=request.ServerVariables("APPL_PHYSICAL_PATH")%></td>
    <td>数据库使用： 
      <%
	  If Not testObject("Adodb.Connection") Then
	     Response.Write "<b>×</b>"
      Else 
         Response.Write "<font style='color:red;font-weight:bold'>√</font>"
      End If
	  %>
    </td>
  </tr>
  <tr class="table_row_1"> 
    <td>FSO文本读写： 
      <%
	  If Not testObject("scripting.filesystemobject") Then
	     Response.Write "<b>×</b>"
      Else 
         Response.Write "<font style='color:red;font-weight:bold'>√</font>"
      End If
	  %>
    </td>
    <td>MDAC版本：<%=Conn.Version%></td>
  </tr>
</table>
<br>
<%
Dim Article_NoCheck,ClassCount
Set Rs=Conn.execute("Select Count(ID) From Article")
ArticleCount=Rs(0)

Set Rs=Conn.execute("Select Count(ID) From Article_NoCheck")
Article_NoCheck=Rs(0)

Set Rs=Conn.execute("Select Count(ID) From Class")
ClassCount=Rs(0)

Set Rs=Nothing
%>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
  <tr> 
    <th colspan="2">数据统计</th>
  </tr>
  <tr class="table_row_1"> 
    <td width="50%">共有内容：<b><font color="#FF0000"><%=ArticleCount%> 篇</font></b> 
    </td>
    <td width="50%">待审内容：<font color="#FF0000"><b><%=Article_NoCheck%> 篇</b></font></td>
  </tr>
  <tr class="table_row_2"> 
    <td>共有分类：<b><font color="#FF0000"><%=ClassCount%> 个</font></b></td>
    <td>数据库大小：<b><font color="#FF0000"><%=GetFileSize(DataPath)%></font></b></td>
  </tr>
</table>
<br>
<table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
  <tr> 
    <th colspan="2">程序相关信息</th>
  </tr>
  <tr class="table_row_1"> 
    <td width="50%">程序开发：0000 </td>
    <td width="50%">官方网站：<a href="http://www.0yan.com" target="_blank">http://www.0000.com</a></td>
  </tr>
   
</table>-->
<br>
</body>
</html>
<%
    Response.Write Version
End sub

Session("Rand")=GetRand(4)
Sub Admin_login()
%>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<title><%=site_info(0)%></title>
<link href="xfok.css" type="text/css" rel="stylesheet">
</head>
<body  topmargin=0 leftmargin=0 bgcolor=#E5E5E5>
<p>&nbsp;</p>
<p>&nbsp;</p>
<table width="50%" border=0 align="center" cellpadding=5 cellspacing=1 class="border-all">
  <tbody>
    <tr> 
      <th height=21 sytle="line-height:150%" align="center"> <b>&nbsp;管理登陆</b> <a href="http://urban-d.hk1.ipinhao.com/admin">英文管理登陆</a></th>
    </tr>
    <tr> 
      <td align=center bgcolor=#ffffff height="40"> <table width="95%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td height="5"></td>
          </tr>
          <tr> 
            <td> 
              <form name="myform" method="post" action="?action=chklogin">
                <table width="100%" border="0" align="center" cellpadding="0" cellspacing="0">
                  <tr> 
                    <td width="25%"><font face="Arial, Helvetica, sans-serif">用户名：</font></td>
                    <td width="75%" height="35"> <input type="text" name="username" class="editbox" size="20"> 
                    </td>
                  </tr>
                  <tr> 
                    <td width="25%"><font face="Arial, Helvetica, sans-serif">密码：</font> 
                    </td>
                    <td width="75%" height="35"> <input type="password" name="password" class="editbox" size="20" value=""> 
                    </td>
                  </tr>
                  <!--<tr> 
                    <td>验证码：</td>
                    <td height="35"><input name="verifycode" type="text" class="editbox" id="verifycode" value="" size="20"><img src="show_verifycode.asp"></td>
                  </tr>
                  
                  <tr> 
                    <td height="40" colspan="2" id="strMsg">&nbsp;</td>
                  </tr>
                  -->
                  
                  <tr>
                    <td height="22" colspan="2"><input type="submit" name="Submit" value="提交" class="button"> 
                      &nbsp; <input type="reset" name="Submit2" value="重置" class="button">
                      <input name="action" type="hidden" id="action" value="chklogin"> </td>
                  </tr>
                </table>
                </form></td>
          </tr>
        </table></td>
    </tr>
  </tbody>
</table>
</body>
</html>
<%
    Response.Write Version
End Sub

Sub Loginout()
    Session.Abandon
    Response.Redirect "/"
End Sub

Sub Chklogin()
    Dim Username,Password,Flag
    Username=CheckStr(Request.Form("Username"))
    Password=CheckStr(Request.Form("Password"))
    Sql="Select * From Admin Where Username='"&Username&"' And Password='"&Md5(Password)&"'"
    Set rs=conn.execute(sql)
    If Rs.Eof Or Rs.Bof Then
        strMsg=strMsg&"<li><font color=red>错误的用户名或密码</font>"
    Else
        UserName=Rs("UserName")
        Flag=Rs("Flag")
    End If
    Set Rs=Nothing

    'If Request.Form("Verifycode")<>Session("Rand") Then
        'strMsg=strMsg&"<li><font color=red>请刷新本页，重新输入正确的验证码！ <a href=Admin_index.asp target=_top>[刷新]</a></font>"
    'End If

    If strMsg<>"" Then 
	    Session("rand")=""
        Response.Write "<script language=javascript>strMsg.innerHTML='"&strMsg&"'</script>"
    Else
        Session("Master")=UserName
        Session("Flag")=Flag
        Response.Redirect "Admin_index.asp"
    End If
End Sub

Function testObject(str)
    On Error Resume Next
    testObject = False
    Dim TestObj
    Set TestObj = Server.CreateObject(str)
    If Err.Number=0 Then testObject=True
    Set TestObj = Nothing
    Err.Clear
End Function

Function GetFileSize(file)
    Dim fso,fs,GetFile
    On Error Resume Next
    Set Fso = Server.CreateObject("Scripting.FileSystemobject")
    Set GetFile=fso.getfile(server.mappath(file))
    If Err.Number<>0 Then 
	    GetFileSize="未知"
		Err.Clear
		Exit Function
    End If 
    GetFileSize=GetFile.Size/1024 &" KB"
    Set getfile=nothing
    Set fso=nothing
End Function

Function GetRand(Num)
    Dim R
    Randomize
    For R=1 To Num
        Getrand=Getrand & Int(10*Rnd)
    Next
End Function
%>