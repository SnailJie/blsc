<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID,shenhe
Dim Title,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor
Dim citiesID,NcitiesID,Ncities,Editor,Author,AddUser,strcities
Dim Action,Rs1,Rs0
Set Rs1=Server.CreateObject("ADODB.RecordSet") 
Set Rs0=Server.CreateObject("ADODB.RecordSet") 
Action=Request.Querystring("Action")
Admin_flag="02"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If

DataConn()
PageSize=CInt(site_info(9))

Select Case Action
	Case "CreateIndexJs"
		Call CreateIndexJs()
	Case Else 
		Call Main()
End Select

DataClose()

Sub Main()
    Set Rs=Server.Createobject("Adodb.Recordset")
	SQL="SELECT * from userinfo  ORDER BY id DESC"
	Rs.CursorLocation=3
    Rs.Open Sql,Conn,1
    ShowContent
End Sub

Sub ShowContent()%>
<script language=javascript>
function CheckAll(form1)  {
  for (var i=0;i<form1.elements.length;i++)    {
    var e = form1.elements[i];
    if (e.name != 'chkall')       e.checked = form1.chkall.checked; 
   }
  }
function load_tree(v_id){
  var targetImg =eval("document.all.followImg" + v_id);
  var targetDiv =eval("document.all.follow" + v_id);
  if (targetImg.src.indexOf("nofollow")!=-1){return false;}
    if ("object"==typeof(targetImg)){
      if (targetDiv.style.display!='block'){
        targetDiv.style.display="block";
        targetImg.src="../images/expand.gif";
        if (targetImg.loaded=="no"){
          document.frames["hiddenframe"].location.replace("Admin_RemarkTree.asp?ID="+v_id);
        }
      }else{
      targetDiv.style.display="none";
      targetImg.src="../images/collapse.gif";
    }
  }
}
</script>
<script src="../js/selectlist.js"></script>

  <table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th colspan="5"> 添加会员</th>
      </tr> 
      <tr> 
        <td height="25" colspan="5" align="center">
        	<table border="0" cellpadding="0" cellspacing="0"  height=250 >
     	<tr>
     		<td align=right valign=top>
      	 <div class=tt13> 会员信息</div>
        <div   style="height:650px">
<form action="../SaveUser.asp" method="post" id="form1" name="creator">
 
    
	      <table width=600>
	      	<tr>
	      <td align=right valign=top> 用户名：</td><td><input type="text" name="username" class="ninput" value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font> <br>请输入6-20位,请使用英文(a-z、A-Z)、数字(0-9) </td></tr>  
				<td align=right> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font></td></tr>  
					<td align=right valign=top>重复密码：</td><td><input name="password2" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font>
						<br>请输入6-20位，请使用英文(a-z、A-Z))、数字(0-9)注意区分大小写； 
						<br>密码不能与登录名相同；易记；难猜
						</td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="" style="height:25px;width:200px"><font color=#ff0000>&nbsp;*</font> </td></tr>  
				 
 
				<td align=right> <input type="Submit" name="Submit" value=" 提交注册信息  " class="button"> </td><td> </td></tr> 
         &nbsp; &nbsp; &nbsp; &nbsp;   &nbsp; &nbsp;
        <input name="action" type="hidden" id="action" value="save"> 
        <input name="id" type="hidden" value="">     </td></tr></table> 
    </form>
				</div>
				<font color=#ffffff><%Response.Write  strMsg %></font>
				</td></tr></table></td>
      </tr>
     
    </tbody>
  </table>

<iframe width=0 height=0 src="" id="hiddenframe"></iframe>
<%End Sub

Sub CreateIndexJs()
	Dim Result
	Result=index_list
	Result=Replace(Result,vbcrlf,"")
	Result=Replace(Result,"""","\""")
	SaveToFile "document.write("""&Result&""");"&vbcrlf,"../js/index.js"
	strMsg="<li>首页分类列表JS生成完毕!"
	Call Msg()
End Sub
%>
</body>
</html>