 
<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
	<%
	'response.write Site_Info(6)
	'创建文件夹 
			on error resume next
			 Dim fso, f,fldr
			 fldr="/"&Site_Info(6)
			 Set fso = CreateObject("Scripting.FileSystemObject")
			 Set f = fso.CreateFolder(Server.MapPath(fldr))
			 CreateFolder = f.Path
			 Set f=nothing
			 Set fso=nothing
	%>
<html>
<head>
<title><%=Site_Info(0)%>-后台管理</title>
<meta http-equiv=content-type content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<% 
Dim Admin_Flag,Action
Admin_flag="41"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
	DataConn()
    If Request("Action")="save" Then 
        Call Save()
    Else
        Call Main()
    End If
End If

DataClose()

Sub Main()

%>
<form name="form1" method="post" action="?">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" bgcolor="#FFFFFF" class="border-all">
    <tr> 
      <th colspan="2">文件目录设置 </th>
    </tr>
    
    <tr> 
      <td width="21%">网站标题:</td>
      <td width="79%"><input name="site_info(0)" type="text" class="editbox" id="site_info(0)" value="<%=site_info(0)%>" size="35"></td>
    </tr>
    
     <tr> 
      <td class="table_row_1">地址：</td>
      <td class="table_row_1"> 
        <input name="site_info(1)" type="text" class="editbox" id="site_info(1)" value="<%=site_info(1)%>" size="35"></td>
    </tr>
    <tr> 
      <td>电话:</td>
      <td>
      <input name="site_info(2)" type="text" class="editbox" id="site_info(2)" value="<%=site_info(2)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_1">传真:</td>
      <td class="table_row_1"> 
        <input name="site_info(3)" type="text" class="editbox" id="site_info(3)" value="<%=site_info(3)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_1">版权:</td>
      <td class="table_row_1"> 
        <input name="site_info(4)" type="text" class="editbox" id="site_info(4)" value="<%=site_info(4)%>" size="35"></td>
    </tr>
    
    <tr> 
      <td class="table_row_1">首页:</td>
      <td class="table_row_1"> 
        <input name="site_info(5)" type="text" class="editbox" id="site_info(5)" value="<%=site_info(5)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_1">更多:</td>
      <td class="table_row_1"> 
        <input name="site_info(7)" type="text" class="editbox" id="site_info(7)" value="<%=site_info(7)%>" size="35"></td>
    </tr>
    <!--
     <tr> 
      <td><p>文章内广告(300*300):<br>
          <font color="#FF0000">每个广告之间不能包含回车,<br>
          多个广告用回车来分隔.</font></p>
        </td>
      <td>
        <textarea name="site_info(17)" cols="70" rows="6" class="editbox4" id="site_info(17)"><%=site_info(17)%></textarea></td>
    </tr> 
    <tr> 
      <td class="table_row_1">版权信息:</td>
      <td class="table_row_1"> 
        <input name="site_info(5)" type="text" class="editbox" id="site_info(5)" value="<%=site_info(5)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_1">默认模板:</td>
      <td class="table_row_1"> 
        <%Call TemplateList(Site_Info(7),"Site_Info(7)")%>
	  </td>
    </tr>
     <tr> 
      <td>上传文件目录:</td>
      <td>
    <input name="site_info(6)" type="text" class="editbox" id="site_info(6)" value="<%=site_info(6)%>" size="35"></td>
    </tr>
    <tr> 
      <td>页面记录数:</td>
      <td> 
        前台：<Input style="text-align:center" name="site_info(8)" type="text" class="editbox" id="site_info(8)" value="<%=site_info(8)%>" size="2"> &nbsp;
		后台：<Input style="text-align:center" name="site_info(9)" type="text" class="editbox" id="site_info(9)" value="<%=site_info(9)%>" size="2"> 
      </td>
    </tr>
     <tr> 
      <td class="table_row_1">热门文章显示数量:</td>
      <td class="table_row_1">
	  <Input name="site_info(10)" type="text" class="editbox" id="site_info(10)" value="<%=site_info(10)%>" size="2"> 条
      </td>
    </tr>
    <tr> 
      <td>上传组件：</td>
      <td>
	    <Select name="site_info(15)">
		<Option value="1" <%If site_info(15)=1 Then Response.Write "selected"%>>无组件上传</Option>
        <Option value="2" <%If site_info(15)=2 Then Response.Write "selected"%>>LyfUpLoad组件上传</Option>
		</Select>
      </td>
    </tr>
     <tr> 
      <td class="table_row_1">过滤字符:</td>
      <td class="table_row_1"> 
        <input name="site_info(14)" type="text" class="editbox" id="site_info(14)" value="<%=site_info(14)%>" size="50"> 
        <font color="#FF0000">使用逗号&quot;,&quot;分隔 ,用于用户评论</font></td>
    </tr>
   
	<tr> 
      <td>首页分类显示数量：</td>
      <td> <Input name="site_info(16)" type="text" class="editbox" id="site_info(16)" value="<%=site_info(16)%>" size="2"> 
      </td>
    </tr>
    <tr> 
      <td>首页分类显示方式：</td>
      <td> <select name="site_info(18)" id="site_info(18)">
          <option value="1" <%If site_info(18)=1 Then Response.Write "selected"%>>数据库读取</option>
          <option value="0" <%If site_info(18)=0 Then Response.Write "selected"%>>JS调用</option>
        </select>
        (推荐JS调用,这样可以加快首页调用速度)</td>
    </tr>
    
    --> 
    <input name="site_info(17)" type="hidden" class="editbox" id="site_info(17)" value="<%=site_info(17)%>" size="35">
     
    <input name="site_info(8)" type="hidden" class="editbox" id="site_info(8)" value="<%=site_info(8)%>" size="35">
    <input name="site_info(9)" type="hidden" class="editbox" id="site_info(9)" value="<%=site_info(9)%>" size="35">
    <input name="site_info(10)" type="hidden" class="editbox" id="site_info(10)" value="<%=site_info(10)%>" size="35">
    <input name="site_info(15)" type="hidden" class="editbox" id="site_info(15)" value="<%=site_info(15)%>" size="35">
    <input name="site_info(16)" type="hidden" class="editbox" id="site_info(16)" value="<%=site_info(16)%>" size="35">
    <input name="site_info(18)" type="hidden" class="editbox" id="site_info(18)" value="<%=site_info(18)%>" size="35">
    <input name="site_info(14)" type="hidden" class="editbox" id="site_info(14)" value="<%=site_info(14)%>" size="35">
    <tr> 
      <td>上传文件目录:</td>
      <td>
<input name="site_info(6)" type="text" class="editbox" id="site_info(6)" value="<%=site_info(6)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_2">上传文件大小限制:</td>
      <td class="table_row_2"> 
        <input name="site_info(11)" type="text" class="editbox" id="site_info(11)" value="<%=site_info(11)%>" size="3">
        kb </td>
    </tr>
    <tr> 
      <td class="table_row_1">上传文件类型:</td>
      <td class="table_row_1"> 
        <input name="site_info(12)" type="text" class="editbox" id="site_info(12)" value="<%=site_info(12)%>" size="35"></td>
    </tr>
    <tr> 
      <td class="table_row_2">默认编辑模式:</td>
      <td class="table_row_2"> 
        <input type="radio" name="site_info(13)" value="1" <%if cint(site_info(13))=1 then response.write "checked" end if%>>
        HTML模式 
        <input type="radio" name="site_info(13)" value="0" <%if cint(site_info(13))=0 then response.write "checked" end if%>>
        UBB模式</td>
    </tr>
    
    <tr> 
      <th colspan="2">
<input type="submit" name="Submit" value="提交" class=button> 
        <input type="reset" name="Submit2" value="重置" class=button> <input name="action" type="hidden" id="action" value="save">
      </th>
    </tr>
  </table>
</form>
<%
End Sub

Sub Save()
	Dim objXml,objRoot,Total
    Set objXml = Server.CreateObject("Microsoft.XMLDOM")
    objXml.async = false
    objXml.load(Server.MapPath(SettingFile))
    set objRoot = objXml.selectSingleNode("系统设置/系统设置")
    Total = objRoot.childnodes.length
    For i=0 To Total-1
        objRoot.childnodes(i).text=Request.Form("Site_Info("&i&")")
    Next
    objXml.save(Server.MapPath(SettingFile))
    Set objXml = Nothing 
	Response.Redirect Url
End Sub
 
%>
</body></html>