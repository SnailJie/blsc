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
        <th colspan="5"> 信息列表</th>
      </tr>
      <tr class="TopTitle"> 
        <td>编号</td>   
        <td> 信息</td>
        <td>权限</td>   
        <td>操作</td>
      </tr>
    <%
	ArticleCount=Rs.RecordCount
    Dim Css
    Page=Request.QueryString("Page")
    If Page="" Or Page<1 Then 
        Page=1
    Else
        Page=Cint(Page)
    End If 
	I=1
	If ArticleCount Mod Cint(PageSize)=0 Then
	    PageCount= ArticleCount \ Cint(PageSize)
	Else
	    PageCount= ArticleCount \ Cint(PageSize)+1
  	End If

  	If Not (Rs.Bof And Rs.Eof) Then
	   Rs.Movefirst
	   If Page > PageCount Then Page = PageCount
	   If Page<1 Then Page=1
	      Rs.Move (Page-1) * Cint(PageSize)
  	      Do While Not Rs.Eof And I<=PageSize
	         I=I+1      
             ID=Rs("id")
			 
             If I Mod 2=0 Then 
                Css="Table_row_1"
             Else
                Css="Table_row_2"
             End If
             if Request.Querystring("shenhe")=2 then  
             	if InStr(rs("shenhe"),"2")<>0 then
             	%><form name="myform" method="post" action="Admin_Batchbook.Asp">
      <tr class="Table_row_1"> 
        <td align=center><%=ID%></td>   
		    <td valign=top align=right> 
		    	<table>
		    		<tr  valign=top > 
		    				 <td align=right valign=top> 用户名：</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px"></td></tr>  
				<td align=right valign=top> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"> </td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> 联系人：</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
			 
				 <tr><td align=right>手机：</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"></td></tr> 
				 <tr><td align=right>QQ：</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"></td></tr>
				 <tr><td align=right>通信地址：</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"></td></tr> 
				 <tr><td align=right> 邮政编码：</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 </table>
 
 </td> 
   <td valign=top>
   	<table>
		  <tr  valign=top > 			  
   	 <% 
   	 	 dim tt
   	 tt=0
					SQL="SELECT * FROM class   order by id desc" '
					rs1.Open sql,conn,1,1 
					if not(rs1.eof and rs1.bof) then
					Do While Not Rs1.EOF   
						tt=tt+1
				%>
       <td><input type=checkbox name=quanxian value="q<%=rs1("id")%>q" <%If InStr(rs("quanxian"),"q"&rs1("id")&"q")<>0 Then Response.Write " checked"%> > <%=left(rs1("Class"),30)%> </td> 
       <% 
       if tt mod 3 = 0 then response.write "</tr><tr>"
						Rs1.MoveNext
						Loop
						End If 
						rs1.close
						%><input type=hidden name=shenhe value="<%=rs("shenhe")%>">
						 
			</tr>
		</table>
 </td> 
        
		    <td align=center> 
		    	<input name="ID" type="hidden" id="ID" value="<%=id%>">
         <input name="Action" type="submit" class="button" id="Submit" value="修改" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}">       
        <input name="Action" type="submit" class="button" id="Submit" value="删除" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}"> </td>
		  </tr> 
		  </form>
      <%end if
            else
%><form name="myform" method="post" action="Admin_Batchbook.Asp">
      <tr class="Table_row_1"> 
        <td align=center><%=ID%></td>   
		    <td valign=top align=right>  
	      <table>
		    		<tr  valign=top > 
		    				 <td align=right valign=top> 用户名：</td><td><input type="text" name="username" readOnly class="ninput" value="<%=rs("username")%>" style="height:25px;width:200px"></td></tr>  
				<td align=right valign=top> 密码：</td><td><input name="password" type="password" value="" size=21 class="ninput" style="height:25px;width:200px"> </td></tr>  
				<tr><td align=right valign=top> 邮箱：</td><td><input type="text" name="youxiang" class="ninput"  value="<%=rs("youxiang")%>" style="height:25px;width:200px"></td></tr>  
				<tr><td align=right> 联系人：</td><td><input type="text" name="xingming" class="ninput"  value="<%=rs("xingming")%>" style="height:25px;width:200px"></td></tr>  
			 
				 <tr><td align=right>手机：</td><td><input type="text" name="nianji" class="ninput"  value="<%=rs("nianji")%>" style="height:25px;width:200px"></td></tr> 
				 <tr><td align=right>QQ：</td><td><input type="text" name="dingyue" class="ninput"  value="<%=rs("dingyue")%>" style="height:25px;width:200px"></td></tr>
				 <tr><td align=right>通信地址：</td><td><input type="text" name="xueke" class="ninput"  value="<%=rs("xueke")%>" style="height:25px;width:200px"></td></tr> 
				 <tr><td align=right> 邮政编码：</td><td><input type="text" name="qqmsn" class="ninput"  value="<%=rs("qqmsn")%>" style="height:25px;width:200px"></td></tr>  
				 </table>
 
 </td> 
   <td valign=top>
   	<table>
		  <tr  valign=top > 			  
    
				<td><input type=checkbox name=quanxian value="普通会员" <%If InStr(rs("quanxian"),"普通会员")<>0 Then Response.Write " checked"%> >普通会员<br>
					<input type=checkbox name=quanxian value="VIP会员" <%If InStr(rs("quanxian"),"VIP会员")<>0 Then Response.Write " checked"%> >VIP会员<br>
					<% 
   	 	 
   	 tt=0
					SQL="SELECT * FROM class where  id=15 or id=16   order by id desc" '
					rs1.Open sql,conn,1,1 
					if not(rs1.eof and rs1.bof) then
					Do While Not Rs1.EOF   
						tt=tt+1
				%>
        <input type=checkbox name=quanxian value="q<%=rs1("id")%>q" <%If InStr(rs("quanxian"),"q"&rs1("id")&"q")<>0 Then Response.Write " checked"%> > <%=left(rs1("Class"),30)%> <br> 
       <% 
       if tt mod 3 = 0 then response.write "</tr><tr>"
						Rs1.MoveNext
						Loop
						End If 
						rs1.close
						%><input type=hidden name=shenhe value="<%=rs("shenhe")%>">
						 
			</tr></td> 
			 
			</tr>
		</table>
 </td> 
        
		    <td align=center> 
		    	<input name="ID" type="hidden" id="ID" value="<%=id%>">
         <input name="Action" type="submit" class="button" id="Submit" value="修改" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}">       
        <input name="Action" type="submit" class="button" id="Submit" value="删除" onClick="{if(confirm('您确定执行的操作吗?')){return true;}return false;}"> </td>
		  </tr> 
		  </form>
      <%end if
	         Rs.Movenext
  	      Loop
	Else%>
      <tr> 
        <td height="25" colspan="5" align="center"><font color="#006699"><b>尚未添加内容</b></font></td>
      </tr>
      <%	End If%>
      <tr> 
        <td height="30" colspan="5" class="table_row_1"> 
          <%
    Response.Write (ShowPage(PageCount,ArticleCount,Page,PageSize,"?citiesid="&Request.QueryString("citiesid")&"&"))
%>
        </td>
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