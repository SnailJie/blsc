<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
<br>
<%
 Function WriteChildFolderNames(folderPath)   
      dim fso,fd,item 
      set fso = Server.CreateObject("Scripting.FileSystemObject")   
      set fd = fso.GetFolder(Server.MapPath(folderPath))   
      Response.Write   "目录   "   &   folderPath   &   "   下的子目录：<hr>"   
      for each item in fd.SubFolders   
          Response.Write "<a href=?path="&folderPath&"/"&item.Name&">"&item.Name & "</a> <font color=#006699>●</font> "   
      next   
      set   fd   =   nothing   
      set   fso   =   nothing   
  end Function
  
Dim Admin_flag,Action,Sfor(30,2)
PageSize=Cint(Site_Info(9))
Admin_flag="32"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
Else
    Call Main()
End If

Sub Main()
    Dim objFSO,Uploadpath,FileName
    Dim Folder
    Dim Num,FileCount
    If Request("Path")<>"" Then
        UploadPath=Request("Path")
    Else 
        UploadPath="../UploadFile"
    End If

    sFor(0,0)="txt":sFor(0,1)="txt"
    sFor(1,0)="chm":sFor(1,1)="chm"
    sFor(2,0)="hlp":sFor(2,1)="chm"
    sFor(3,0)="doc":sFor(3,1)="doc"
    sFor(4,0)="pdf":sFor(4,1)="pdf"
    sFor(5,0)="gif":sFor(5,1)="gif"
    sFor(6,0)="jpg":sFor(6,1)="jpg"
    sFor(7,0)="png":sFor(7,1)="png"
    sFor(8,0)="bmp":sFor(8,1)="bmp"
    sFor(9,0)="asp":sFor(9,1)="asp"
    sFor(10,0)="jsp":sFor(10,1)="asp"
    sFor(11,0)="js" :sFor(11,1)="asp"
    sFor(12,0)="htm":sFor(12,1)="html"
    sFor(13,0)="html":sFor(13,1)="html"
    sFor(14,0)="shtml":sFor(14,1)="html"
    sFor(15,0)="zip":sFor(15,1)="zip"
    sFor(16,0)="rar":sFor(16,1)="rar"
    sFor(17,0)="exe":sFor(17,1)="exe"
    sFor(18,0)="avi":sFor(18,1)="avi"
    sFor(19,0)="mpg":sFor(19,1)="mpg"
    sFor(20,0)="ra" :sFor(20,1)="ra"
    sFor(21,0)="ram":sFor(21,1)="ra"
    sFor(22,0)="mid":sFor(22,1)="mid"
    sFor(23,0)="wav":sFor(23,1)="wav"
    sFor(24,0)="mp3":sFor(24,1)="mp3"
    sFor(25,0)="asf":sFor(25,1)="asf"
    sFor(26,0)="php":sFor(26,1)="aspx"
    sFor(27,0)="php3":sFor(27,1)="aspx"
    sFor(28,0)="aspx":sFor(28,1)="aspx"
    sFor(29,0)="xls":sFor(29,1)="xls"
    sFor(30,0)="mdb":sFor(30,1)="mdb"
%>
<table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class=border-all>
  <tr> 
    <th sytle="line-height:150%">目录浏览 </th>
  </tr>
  <form name="form1" method="get" action="?path=">
    <tr> 
      <td height="20" sytle="line-height:150%">要查看的文件夹： 
        <input name="path" type="text" class="editbox" id="path" value="/UploadFile"> <input name="Submit" type="submit" class="button" value="提交">
        <font color="#006699"><b>请填写正确的文件夹名或路径</b></font></td>
    </tr>
    <tr> 
      <td height="20" sytle="line-height:150%">
    <% 
    '当前目录的子目录列表   
    WriteChildFolderNames("../UploadFile")    
    '通过绝对路径来引用   
   'WriteChildFolderNames("d:\www\health-biotech\UploadFile")   
  %>
</td>
  </tr>
    <tr> 
      <td height="20" sytle="line-height:150%">当前浏览　<font style="color:#006699;font-weight:bold"><%=uploadpath%></font>　目录的所有文件列表如下</td>
    </tr>
  </form>
</table>
<br>
<table width="95%" border="0" align=center cellpadding="2" cellspacing="1" class="border-all" style="table-layout:fixed;word-break:break-all">
  <tr> 
    <th width="6%" height=23 align="center">类型</th>
    <th width="51%" align="center">文件地址</th>
    <th width="13%" align="center">大小</th>
    <th width="23%" align="center">上传日期</th>
    <th width="7%" align="center">管理</th>
  </tr>
<%
	On Error Resume Next
    Set objFSO=Server.CreateObject("Scripting.FileSystemObject")
	If Err.Number=-2147221005 Then 
	    Response.Write "<Tr><Td Colspan=5 Class=Tablebody1 align='center'>非常遗憾,您的主机不支持FSO(Scripting.FileSystemObject),不能使用该功能</Td></Tr>"
	    Err.Clear
	    Response.End
	End If
    If Request("FileName")<>"" Then
        If objFSO.Fileexists(Server.Mappath(""&Uploadpath&"\"&Request("FileName"))) Then
            objFSO.Deletefile(Server.Mappath(""&Uploadpath&"\"&Request("FileName")))
        Else
            Response.Write "未找到：<U><Font Color=Red>"&Uploadpath&"/"&Request("FileName")&"</Font></U>"
        End If
    End If
    Set Folder=objFSO.Getfolder(Server.Mappath(Uploadpath))
    If Err.Number<>0 Then
    Response.Write "<Tr><Td Colspan=5 Class=Tablebody1>"&Err.Description&"</Td></Tr>"
    Response.End
    End If
    Set Num=Folder.Files

    FileCount=num.count
    pagecount=int(FileCount/PageSize)

    Page=Request.QueryString("Page")
    If Page="" Or Page<1 Then 
       Page=1
    Else
       Page=Cint(Page)
    End If 

	If FileCount Mod PageSize=0 Then
	    PageCount= FileCount \ Cint(PageSize)
	Else
	    PageCount= FileCount \ Cint(PageSize)+1
  	End If

  	i=0
  	Dim CSS
  	For Each FileName In folder.files
  	  	i=i+1
  	  	If i>(Page-1)*PageSize And i<=Page*PageSize Then 
		    If i Mod 2=0 then 
  	  	  	  	Css="table_row_1"
  	  	  	Else
  	  	  	  	Css="table_row_2"
  	  	  	End If
%>
  <tr class="<%=css%>"> 
    <td align=center><img src="images/files/<%=procGetFormat(FileName.name)%>.gif"></td>
    <td ><%="<a href="&uploadpath&"/"&FileName.name&" target=_blank><br><img src="&uploadpath&"/"&FileName.name&" width=120 border=0></a><br><input size=20 value="&uploadpath&"/"&FileName.name&">"%></td>
    <td align=center><%=FileName.size%> 字节</td>
    <td  align=center><%=FileName.datecreated%></td>
    <td align=center><a href=?FileName=<%=FileName.name%>&path=<%=request("path")%>>删除</a></td>
  </tr>
<%
  	  	ElseIf i>Page*PageSize Then Exit For
  	  	End If
  	Next
%>
  <tr bgcolor="#FFFFFF"> 
    <td height=25 colspan="5" class="table_row_1"> 
<%Response.Write "共计：<b><font color=#FF0000>"&folder.size&"</font> k</b>"%>
    </td>
  </tr>
  <tr bgcolor="#FFFFFF"> 
    <td height=25 colspan="5"> 
<%Response.Write ShowPage(PageCount,FileCount,Page,PageSize,"?Path="&uploadpath&"&")%>
    </td>
  </tr>
</table>
<%
    Set objFSO=Nothing
    Set Folder=Nothing
End Sub

Function Procgetformat(Sname)
    Dim I,Str
    Procgetformat=0
    If Instrrev(Sname,".")=0 Then Exit Function
    Str=Lcase(Mid(Sname,Instrrev(Sname,".")+1))
    For I=0 To Ubound(Sfor,1)
        If Str=Sfor(I,0) Then 
            Procgetformat=Sfor(I,1)
            Exit For
        End If
    Next
End Function
%>
</body></html>