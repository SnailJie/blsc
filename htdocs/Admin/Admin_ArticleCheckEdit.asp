<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
<style type=text/css>
.outcolor{
border:1 double;border-color:#dddddd #dddddd #dddddd #dddddd;cursor:hand;background:efefef
}
.overcolor{
border:1 double;border-color:#ffffff #999999 #999999 #ffffff;cursor:hand;background:dddddd
}
.clickcolor{
border:1 double;border-color:#999999 #ffffff #ffffff #999999;cursor:hand;background:dddddd
}

</style>
<script src="../js/ubbcode.js"></script>
<script src="editor/checkform.js"></script>
<script language="JavaScript">
function CheckArt(form){
	var blnCheck=form.isCheck.checked;
	if (blnCheck==true){
		form.indexpic.disabled=false;
		form.Recommend.disabled=false;
		form.previewimg.disabled=false;
	}
	else{
		form.indexpic.disabled=true;
		form.Recommend.disabled=true;
		form.previewimg.disabled=true;
	}
}
</script>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID,NID
Dim Title,Content,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor,Key,WriteFrom,SpecialID,contentjianxie
Dim ClassID,NClassID,Editor,Author,AddUser
Dim Action,TableName
TableName="Article_NoCheck"
Action=Request.Form("Action")
Admin_flag="03"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If
ID=CheckStr(Request.QueryString("ID"))

DataConn()

Select Case Action
	Case "Save"
		Call Save()
	Case Else
		Call Main()
End Select 

DataClose()

Sub Main()
	Sql="Select * From Article_NoCheck Where ID="&ID
	Set Rs=Conn.Execute(Sql)
	ID=Rs("ID")
	ClassID=Rs("ClassID")
	NClassID=Rs("NClassID")
	Title=Rs("Title")
	Content=Rs("Content")
	Key=Rs("sKey")
	Author=Rs("Author")
	WriteFrom=Rs("WriteFrom")
	AddUser=Rs("AddUser")
	isHtml=Site_Info(13)
	SpecialID=Rs("SpecialID")
  contentjianxie=Rs("contentjianxie")
	If Trim(Editor)="" Or IsNull(Editor) Then Editor=Session("Master")
	Set Rs=Nothing
%>
<script src="../js/selectlist.js"></script>
<script src="editor/edit.js" type="text/javascript"></script>
<form name="myform" method="post" action="?ID=<%=ID%>" onSubmit="return CheckForm(this);">
  <table width="95%" border="0" align="center" cellpadding="5" cellspacing="1" class="border-all">
    <tr> 
      <th colspan="2" id="succmsg">修改内容</th>
    </tr>
    <tr> 
      <td width="12%" height="20"><font color="#FF0000">内容标题: 
        <input name="titlecolor" type="hidden" id="titlecolor" value="<%=TitleColor%>">
        </font></td>
      <td height="20"> <table width="100%" border="0" cellspacing="0" cellpadding="0">
          <tr> 
            <td width="40%"><input name="title" type="text" class="editbox" id="title" style="color:#000000" value="<%=title%>" size="50">
             <!--支持HTML </td>
          </tr>
          <tr> 
            <td><script language=JavaScript src="editor/title_color.js"></script> 
              <TABLE id=ColorPanel cellSpacing=0 cellPadding=0 border=0>
                <TBODY>
                  <TR> 
                    <TD id=ColorUsed 
                     onclick="if(this.bgColor.length > 0) insertTag(this.bgColor)" 
                     vAlign=center align=middle> </TD>
                    <SCRIPT language=JavaScript>rgb(pas,width1,height1)</SCRIPT>
                  </TR>
                </TBODY>
              </TABLE>
              --></td>
          </tr>
        </table></td>
    </tr>
    <tr> 
      <td width="12%" height="20">编辑模式:</td>
      <td height="20"> <input type="radio" name="EditMode" value="HTML"  onClick="e1.style.display='inline';e2.style.display='none';" <%If isHtml=1 Then Response.Write(" checked")%>>
        HTML编辑模式 
        <input type="radio" name="EditMode" value="UBB" onClick="e1.style.display='none';e2.style.display='inline';" <%If isHtml=0 Then Response.Write(" checked")%>>
        UBB编辑模式 </td>
    </tr>
    <tr> 
      <td> <font color="#0000FF">审核情况:</font></td>
      <td><input name="isCheck" type="checkbox" id="isCheck" value="1" onClick="CheckArt(this.form)">
        通过审核</td>
    </tr>
    <tr> 
      <td width="12%" height="20">内容属性:</td>
      <td height="20"> <input id="indexpic" type="checkbox" name="indexpic" value="1" disabled="true" /> <label for=indexpic>视点内容</label> 
        <input id="Recommend" type="checkbox" name="Recommend" value="1"  disabled="true" /> 
        <label for=Recommend>推荐内容</label> </td>
    </tr>
    <tr> 
      <td width="12%" height="20">内容分类:</td>
      <td height="20"> <%=CataLog(ClassID,NClassID)%></td>
    </tr>
    <tr> 
      <td width="12%">所属专题:</td>
      <td><%=Special(SpecialID)%></td>
    </tr>
    <tr> 
      <td width="12%"><font color="#FF0000">内容内容:</font></td>
      <td>『<a href="javascript:Upload()">上传文件</a>』『<a href="javascript:Insert('[SplitPage]')">插入分页符</a>』『<a href="javascript:Insert('[EA_AdRotator]')">插入内容内广告</a>』</td>
    </tr>
    <tr id=e1 <%if isHtml=0 then response.write "style='display:none;'" end if %>> 
      <td height="20" colspan="2"><table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td bgcolor="#FFFFFF"> <table width="100%" border="0" cellpadding="2" cellspacing="0" bgcolor="#eaeaea">
                <tr> 
                  <td width="711" align="left"> <select id="formatSelect" onChange="FormatText('FormatBlock',this[this.selectedIndex].value);this.selectedIndex=0">
                      <option selected>段落格式</option>
                      <option value="&lt;P&gt;">普通</option>
                      <option value="&lt;PRE&gt;">已编排格式</option>
                      <option value="&lt;H1&gt;">标题一</option>
                      <option value="&lt;H2&gt;">标题二</option>
                      <option value="&lt;H3&gt;">标题三</option>
                      <option value="&lt;H4&gt;">标题四</option>
                      <option value="&lt;H5&gt;">标题五</option>
                      <option value="&lt;H6&gt;">标题六</option>
                    </select> <select onChange="specialtype(this[this.selectedIndex].value);this.selectedIndex=0">
                      <option selected>特殊字体格式 
                      <option value="sup">上标 
                      <option value="sub">下标 
                      <option value="address">地址 
                      <option value="blink">闪烁 
                      <option value="marquee">移动 
                      <option value="marquee2">飞行 
                      <option value="del">删除线 
                      <option value="big">增大字体 
                      <option value="small">减小字体 </select> <img src="images/editor/bold.gif" alt="粗体" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('bold', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/italic.gif" alt="斜体" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('italic', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/underline.gif" alt="下划线" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('underline', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/justifyleft.gif" alt="左对齐" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('Justifyleft', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/justifycenter.gif" alt="居中" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('JustifyCenter', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/justifyright.gif" alt="右对齐" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('JustifyRight', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/insertorderedlist.gif" alt="项目符号" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('InsertUnorderedList', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/insertunorderedlist.gif" alt="编号" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('insertorderedlist', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/outdent.gif" alt="回退" width="16" height="16" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('Outdent', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/indent.gif" alt="缩进" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('indent', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/fontcolor.gif" alt="字体颜色" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="foreColor()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/bgcolor.gif" alt="字体突出颜色" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="BackColor()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/cut.gif" alt="剪切" width="16" height="16"  align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('cut')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/copy.gif" alt="复制" width="16" height="16"  align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('copy')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/paste.gif" alt="粘贴" width="16" height="16"  align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('paste')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/help.gif" alt="使用帮助" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="help()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"></td>
                </tr>
                <tr> 
                  <td align="left"> <select name="selectFont" onChange="FormatText('fontname', selectFont.options[selectFont.selectedIndex].value);document.myform.selectFont.options[0].selected = true;"  style="font-family: 宋体; font-size: 9pt" onmouseover="window.status='选择选定文字的字体。';return true;" onmouseout="window.status='';return true;">
                      <option selected>选择字体 
                      <option value="custom">自定义字体 
                      <option value="removeFormat">默认字体 
                      <option value="宋体">宋体 
                      <option value="黑体">黑体 
                      <option value="隶书">隶书 
                      <option value="幼圆">幼圆 
                      <option value="楷体_GB2312">楷体 
                      <option value="仿宋_GB2312">仿宋 
                      <option value="新宋体">新宋体 
                      <option value="华文彩云">华文彩云 
                      <option value="华文仿宋">华文仿宋 
                      <option value="华文新魏">华文新魏 
                      <option value="Arial">Arial 
                      <option value="Arial Black">Arial Black 
                      <option value="Arial Narrow">Arial Narrow 
                      <option value="Century">Century 
                      <option value="Courier New">Courier New 
                      <option value="Georgia">Georgia 
                      <option value="Impact">Impact 
                      <option value="Lucida Console">Lucida Console 
                      <option value="MS Sans Serif">MS Sans Serif 
                      <option value="System">System 
                      <option value="Symbol">Symbol 
                      <option value="Tahoma">Tahoma 
                      <option value="Times New Roman">Times New Roman&nbsp; &nbsp; 
                      <option value="Verdana">Verdana 
                      <option value="Webdings">Webdings 
                      <option value="Wingdings">Wingdings</option>
                    </select> <select language="javascript"  id="FontSize" title="字号大小" onChange="FormatText('fontsize',this[this.selectedIndex].value);" name="select" onmouseover="window.status='选择选定文字的字号大小。';return true;" onmouseout="window.status='';return true;">
                      <option class="heading" selected>字号 
                      <option value="7">一号 
                      <option value="6">二号 
                      <option value="5">三号 
                      <option value="4">四号 
                      <option value="3">五号 
                      <option value="2">六号 
                      <option value="1">七号</option>
                    </select> <img src="images/editor/DELETE.gif" alt="删除" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('DELETE')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/undo.gif" alt="撤消" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('undo')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/redo.gif" alt="恢复" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('redo')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/inserthorizontalrule.gif" alt="普通水平线" width="16" height="16" border="0" align="absmiddle" class=outcolor  style="cursor: hand;" onClick="FormatText('InsertHorizontalRule', '')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/createlink.gif" alt="超级链接" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('createLink')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/clear.gif" alt="删除文字格式" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor: hand;" onClick="FormatText('RemoveFormat')" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)"> 
                    <img src="images/editor/table.gif" alt="插入表格" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="fortable()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/insertimage.gif" alt="插入网上图片，支持格式为：gif、jpg、png、bmp" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="pic()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/media.gif" alt="自动插入播放的媒体文件" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="checkType()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/FIELDSET.gif" alt="插入栏目框" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="FIELDSET()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <img src="images/editor/iframe.gif" alt="插入网页" width="16" height="16" border="0" align="absmiddle" class=outcolor style="cursor:hand;" onClick="iframe()" onMouseDown="Check(this,2)" onMouseUp="Check(this,1)" onMouseOver="Check(this,1)" onMouseOut="Check(this,0)" language="javascript"> 
                    <input onClick="setMode(this.checked);" name="viewhtml" type="checkbox" value="ON">
                    查看HTML代码 </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr> 
                  <td bgcolor="#FFFFFF"> <script language="javascript">
                       document.write ('<iframe src="admin_view_content.asp?Action=<%=TableName%>&ID=<%=ID%>" id="HtmlEditor" width="100%" height="260"  frameborder="0" align="left"></iframe>')
                       frames.HtmlEditor.document.designMode = "On";
                    </script> </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td valign="top" bgcolor="#FFFFFF"><img src="images/editor/bian.gif" width="100%" height="13"></td>
          </tr>
        </table></td>
    </tr>
    <tr id=e2 <%if isHtml=1 then response.write "style='display:none;'" end if%>> 
      <td height="20" colspan="2"> <table width="100%" border="0" cellpadding="0" cellspacing="0">
          <tr> 
            <td bgcolor="#FFFFFF"> <!--#include file="inc/ubb.asp" --> </td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF"><table width="100%" border="0" cellpadding="0" cellspacing="1" bgcolor="#CCCCCC">
                <tr> 
                  <td bgcolor="#FFFFFF"><textarea name="content" rows="15" cols="75" class="Content"><%=content%></textarea> 
                  </td>
                </tr>
              </table></td>
          </tr>
          <tr> 
            <td bgcolor="#FFFFFF"><div align="right"><img src="images/editor/bian.gif" width="100%" height="13"></div></td>
          </tr>
        </table></td>
    </tr>
    <!--<tr> 
      <td width="12%" height="20">缩略图:</td>
      <td height="40"> <input type="text" name="previewimg" class="editbox" size="36" value="<%=previewimg%>" disabled=false> 
      </td>
    </tr>
    <tr> 
      <td width="12%" height="20">关键字:</td>
      <td height="20"> <input type="text" name="key" size="20" class="editbox" value="<%=key%>"> 
      </td>
    </tr>
    <tr> 
      <td width="12%" height="20">内容作者:</td>
      <td height="20"> <input type="text" name="author" size="20" class="editbox" value="<%=author%>">
        ←<a href="javascript:" onClick="document.myform.author.value='不详'">不详</a></td>
    </tr>
    <tr> 
      <td width="12%" height="20">内容来源:</td>
      <td height="20"> <input type="text" name="writefrom" size="20" class="editbox" value="<%=writefrom%>"> 
      </td>
    </tr>
    <%If AddUser<>"" Then%>
    <tr> 
      <td width="12%" height="20">投稿人:</td>
      <td height="20"> <input type="text" name="AddUser" size="20" class="editbox" value="<%=AddUser%>"> 
      </td>
    </tr>
    <%End If%>
    <tr> 
      <td width="12%" height="20">责任编辑:</td>
      <td height="20" width="88%"><%=Editor%></td>
    </tr>
    -->
     <input name="Editor" type="hidden" id="Editor" value="<%=Editor%>"> 
        <input name="Action" type="hidden" id="Action" value="Save">
        <input name="GoUrl" type="hidden" id="GoUrl" value="<%=Url%>">
    <tr> 
      <th colspan="2"> <input type="submit" name="Submit" value="提交" class=button> 
        &nbsp; <input type="reset" name="Submit2" value="重置" class=button> </th>
    </tr>
  </table>
</form>
<%
End Sub

Sub Save()
    CheckForm()
	If strMsg<>"" Then 
	    Call Msg()
	Else
		Dim isCheck
		isCheck=Request.Form("isCheck")
		If isCheck=1 Then TableName="Article"
        Set Rs=Server.Createobject("Adodb.Recordset")
		If isCheck=1 Then
			Sql="Select * From "&TableName
			Rs.Open Sql,Conn,1,3
			Rs.AddNew
			Rs("Previewimg")=Previewimg
			Rs("isRecommend")=isRecommend
			Rs("TitleColor")=TitleColor
			Rs("Editor")=Editor
		Else
			Sql="Select * From "&TableName&" Where ID="&ID
			Rs.Open Sql,Conn,1,3
		End If
        Rs("ClassID")=ClassID
		Rs("NClassID")=NClassID
        Rs("Title")=Title
        Rs("Content")=Content
        Rs("sKey")=Checkstr(Request.Form("Key"))
        If Checkstr(Request.Form("Author"))="" Then
	        Rs("Author")="不详"
        Else
	        Rs("Author")=Checkstr(Request.Form("Author"))
        End If
        If Checkstr(Request.Form("Writefrom"))="" Then
	        Rs("Writefrom")="不详"
        Else
            Rs("Writefrom")=Checkstr(Request.Form("Writefrom"))
        End If
		Rs("AddUser")=AddUser
		Rs("SpecialID")=SpecialID
		Rs("contentjianxie")=contentjianxie
        Rs.Update
        Rs.Close
        Set Rs=Nothing
		If isCheck=1 Then
			Conn.Execute("Delete From Article_NoCheck Where ID="&ID)
			Response.Redirect "Admin_Check.Asp"
		Else 
			Response.Redirect Url
		End If
	End If 
End Sub
%>
</body></html>