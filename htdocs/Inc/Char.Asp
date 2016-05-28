<%
Function isInt(str)
    Dim L,I
	isInt=False
    If Trim(Str)="" Or IsNull(str) Then Exit Function
	str=CStr(Trim(str))
    L=Len(Str)
    For I=1 To L
        If Mid(Str,I,1)>"9" Or Mid(Str,I,1)<"0" Then Exit Function
    Next
    isInt=True
End Function

Function CheckStr(Str)
	If Trim(Str)="" Or IsNull(str) Then Exit Function
	Checkstr=Replace(Trim(Str),"'","''")
End Function

Function HtmlEncode(str)
    If Trim(Str)="" Or IsNull(str) Then Exit Function
    str=Replace(str,">","&gt;")
    str=Replace(str,"<","&lt;")
    str=Replace(str,Chr(32),"&nbsp;")
    str=Replace(str,Chr(9),"&nbsp;")
    str=Replace(str,Chr(34),"&quot;")
    str=Replace(str,Chr(39),"&#39;")
    str=Replace(str,Chr(13),"")
    str=Replace(str,Chr(10) & Chr(10), "</p>&nbsp;<p>")
    str=Replace(str,Chr(10),"<br> ")
    HtmlEncode=str
End Function

Function CheckWord(Str)
    Dim SplitWord,i
    If trim(Str)="" Then Exit Function
    Splitword=Split(SplitWords,",")
    For I=0 To Ubound(Splitword)
        Str=Replace(Str, Splitword(I),String(Len(Splitword(I)),"*")) 
    Next
    Checkword=Str
End Function

Function strLen(Str)
    If Trim(Str)="" Or IsNull(str) Then Exit Function
    Dim P_len,x
    P_len=0
    StrLen=0
    P_len=Len(Trim(Str))
    For x=1 To P_len
        If Asc(Mid(Str,x,1))<0 Then
            StrLen=Int(StrLen) + 2
        Else
            StrLen=Int(StrLen) + 1
        End If
    Next
End Function

Function CutStr(Str,LenNum)
    Dim P_num
    Dim I,X
    If StrLen(Str)<=LenNum Then
        Cutstr=Str
    Else
        P_num=0
        X=0
        Do While Not P_num > LenNum-2
            X=X+1
            If Asc(Mid(Str,X,1))<0 Then
                P_num=Int(P_num) + 2
            Else
                P_num=Int(P_num) + 1
            End If
            Cutstr=Left(Trim(Str),X)&"..."
        Loop
    End If
End Function

Function CataLog(intClassID,intNClassID)
	Dim Result,i
	Result="<script language=""JavaScript"">"&vbcrlf
	SQL="SELECT ID,NClass,ParentID FROM NClass ORDER BY Orders"
	Result=Result&"var nclassid="&intNClassID&";"
	Set Rs=Server.CreateObject("ADODB.RecordSet")
	Rs.Open SQL,Conn,1
	If Not (Rs.EOF Or Rs.BOF) Then
		i=-1
		Do Until Rs.EOF			
			If intNClassID=Rs(0) Then
				
			End If
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(2)&""""&vbcrlf
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(1)&""""&vbcrlf
			i=i+1
			Result=Result&"arrNList["&i&"] = """&Rs(0)&""""&vbcrlf
			Rs.MoveNext
		Loop
	End If
	Set Rs=Nothing
	Result=Result&"</script>"

	Result=Result&"<select onChange=""Kermy_JS('setDynaList(arrNSet)')"" name=""ClassID"" id=""ClassID"">"&vbcrlf
	SQL="SELECT ID,Class FROM Class ORDER BY Orders"
	Set Rs=Conn.Execute(SQL)
	If Not (Rs.EOF Or Rs.BOF) Then
		Do Until Rs.EOF
			If intClassID=Rs(0) Then
				Result=Result&"<option value="&Rs(0)&" selected>"&Rs(1)&"</option>"&vbcrlf
			Else
				Result=Result&"<option value="&Rs(0)&">"&Rs(1)&"</option>"&vbcrlf
			End If
			Rs.MoveNext
		Loop
	Else
		Result=Result&"<option value=0>尚未添加一级分类</option>"
	End If
	Set Rs=Nothing
	Result=Result&"</select>"&vbcrlf

	Result=Result&"<select name=""NClassID"" id=""NClassID""></select>"
	CataLog=Result
End Function

Function Special(sid)
	Dim Result 
	Result=Result&"<select name=""SpecialID"" id=""SpecialID"">"&vbcrlf
	SQL="SELECT ID,Name FROM Special ORDER BY ID"
	Set Rs=Conn.Execute(SQL)
	If Not (Rs.EOF Or Rs.BOF) Then
		Result=Result&"<option value=0 selected>不选择专题</option>"&vbcrlf
		Do Until Rs.EOF
			If CInt(sid)=Rs(0) Then
				Result=Result&"<option value="&Rs(0)&" selected>"&Rs(1)&"</option>"&vbcrlf
			Else
				Result=Result&"<option value="&Rs(0)&">"&Rs(1)&"</option>"&vbcrlf
			End If
			Rs.MoveNext
		Loop
	Else
		Result=Result&"<option value=0 selected>0</option>"&vbcrlf
	End If
	Set Rs=Nothing
	Result=Result&"</select>"&vbcrlf
	Special=Result
End Function

Function ShowPage(ByRef PageCount,RecordCount,CurrentPage,PageSize,LinkFile)
	Dim Retval,J,StartPage,EndPage
	If (RecordCount Mod PageSize)=0 Then
	    PageCount=RecordCount \ PageSize
	Else 
	    PageCount=RecordCount \ PageSize+1
	End If
	If PageCount=0 Then PageCount=1
	If CurrentPage="" Then CurrentPage=1 else CurrentPage=CInt(CurrentPage)
	Retval=Retval & "<table width='100%' border='0' cellspacing='0' cellpadding='0'>"
    Retval=Retval & "<tr>"
    Retval=Retval & "<td height='20'>"
	If CurrentPage=1 Then              
		Retval=Retval & "<font style='color:#999999'>首页</font> | <font style='color:#999999'>前页</font> | " 
	Else
		Retval=Retval & "<a href='" & LinkFile & "Page=1'>首页</a> | <a href='" & LinkFile & "Page=" & CurrentPage - 1 & "'>前页</a> | "
	End If
	If  CurrentPage=PageCount Then             
		Retval=Retval & "<font style='color:#999999'>后页</font> | <font style='color:#999999'>末页</font>"
	Else
		Retval=Retval & "<a href='" & LinkFile & "Page=" & CurrentPage + 1 & "'>后页</a> | <a href='" & LinkFile & "Page=" & PageCount & "'>末页</a>"
	End if
	If RecordCount>0 Then
	    Retval=Retval & " | <b>"&CurrentPage&"</b>页/<b>"&CInt(PageCount)&"</b>页 | 共<b>"&RecordCount&"</b>条记录"
	End If
	Retval=Retval & "<td align='right'>"
	StartPage = Page-3
	EndPage = Page+3
	If StartPage<=0 Then
	    StartPage=1
	ElseIf StartPage>1 Then 
	    Retval=Retval & " <a href='" & LinkFile & "Page=1' style='font-family:webdings' title='首页'>9</a>"
	    Retval=Retval & " ... "
	End If	    
	If EndPage>PageCount Then EndPage=PageCount
	For J = StartPage to EndPage
		If J = Page Then
		    Retval = Retval & " <font color=#999999>" & J & "</font>"
		Else
		    Retval = Retval & " <a href='" & LinkFile & "Page=" & J & "'>" & J & "</a>"
		End If
	Next
	If EndPage < PageCount Then Retval= Retval & " ... <a href='" & LinkFile & "Page=" & PageCount & "' style='font-family:webdings' title='末页'>:</a>"
	Retval=Retval & "</td>"
	Retval=Retval & "</tr>"
    Retval=Retval & "</table>"
	ShowPage=Retval
End Function

Function LoadTemplate(str)
    If Application("Art_T_"&DefaultTemplate&str)="" Then 
        If str="" Or IsNull(str) Then Exit Function 
	    Dim objStream,Template_Dir,Template_File
		If IsNull(DefaultTemplate) Or DefaultTemplate="" Then DefaultTemplate=Site_Info(7)
	    Template_Dir="Template/"&DefaultTemplate
		Template_File=Article_Url&Template_Dir&str&".htm"
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
			.LoadFromFile Server.MapPath(Template_File)
			If Err.Number<>0 Then
				Response.Write "<div align='center'>模板<font color='#ff0000'>"&Template_File&"</font>无法被打开，请检查该模板是否存在!</font></div>"
				Err.Clear
				Response.End
			End If
			.Charset = "GB2312"
			.Position = 2
			LoadTemplate = .ReadText
			.Close
		End With
		Set objStream = Nothing
	    Application("Art_T_"&DefaultTemplate&str)=LoadTemplate
	Else 
	    LoadTemplate=Application("Art_T_"&DefaultTemplate&str)
	End If
End Function

Function Index_List()
	Dim index_list_bottom,newartloop,cRs,Title,TitleColor,ClassID
	SQL="Select Top "&Site_Info(16)&" ID,Class From Class Order By Orders"
	Set cRs=Conn.Execute(SQL)
	If Not cRs.EOF Then
		Do Until cRs.EOF '分类循环
			index_list_bottom=LoadTemplate("index_main_bottom")
			ClassID=cRs(0)
			'---分类图片文章
			SQL="Select Top 1 ID,Title,PreviewImg,TitleColor From Article Where isPic=1 And ClassID="&ClassID&" Order By ID Desc"
			Set Rs=Conn.Execute(SQL)
			If Not (Rs.EOF Or Rs.BOF) Then 
				Title=CutStr(Rs(1),18)
				TitleColor=Rs(3)
				If TitleColor<>"" Then Title="<font style='color:"&TitleColor&";'>"&Title&"</font>"
				index_list_bottom=Replace(index_list_bottom,"{title}",Title)
				index_list_bottom=Replace(index_list_bottom,"{previewimg}","<a href='dispArticle.Asp?ID="&Rs(0)&"'  title="""&Title&"""><img src='"&Rs(2)&"' width='120' height='90' border='0'></a>")
			Else
				index_list_bottom=Replace(index_list_bottom,"{previewimg}","")
				index_list_bottom=Replace(index_list_bottom,"{title}","")
			End If
			'---分类图片文章结束
			index_list=index_list&LoadTemplate("index_main_top")&index_list_bottom
			index_list=Replace(index_list,"{class}",cRs(1))
			index_list=Replace(index_list,"{classid}",ClassID)

			'-
			SQL="Select Top 7 ID,Title,AddDate,TitleColor From Article Where ClassID="&ClassID&" Order By ID Desc"
			Set Rs=Conn.Execute(SQL)
			If Not (Rs.EOF Or Rs.BOF) Then
	   			Do Until Rs.EOF '--文章循环
	   	   			newartloop=newartloop&LoadTemplate("index_main_loop")
	   	   			Title=CutStr(Rs(1),40)
					TitleColor=Rs(3)
					If TitleColor<>"" Then Title="<font style='color:"&TitleColor&";'>"&Title&"</font>"
	   	   			newartloop=Replace(newartloop,"{id}",Rs(0))
	   	   			newartloop=Replace(newartloop,"{title}",Title)
	   	   			newartloop=Replace(newartloop,"{adddate}",FormatDateTime(Rs(2),2))
	   	   			Rs.MoveNext
	   			Loop
			End If
			cRs.MoveNext
			index_list=Replace(index_list,"{index_newarticle}",newartloop)
			newartloop=Empty
		Loop
	End If
	Set cRs=Nothing
	Set Rs=Nothing
End Function

'广告随机显示
Function AdRotator(strAd,adSplit)
	Dim i
	strAd=Split(strAd,adSplit)  
	Randomize 
	I=cint(ubound(strAd)*rnd)
	On Error Resume Next
	If Err>0 Then Exit Function
	AdRotator=strAd(i)
End Function

Sub GetSetting()
    Dim objXML,objRoot,Total,I
    Set objXML=Server.CreateObject("Microsoft.XMLDOM")
    objXML.async=False
    objXML.load (Server.Mappath(SettingFile))
    Set objRoot=objXML.selectsinglenode("系统设置/系统设置")
    Total=objRoot.childnodes.length
    ReDim Site_Info(Total-1)
    For I=0 To Total-1
	    Site_info(i)=objRoot.childnodes(i).text
	    'Response.Write "site_info("&i&")"&site_info(i)&"<br>"
    Next
    Set objRoot=Nothing
    Set objXML=Nothing
End Sub

Sub DataClose()
    If IsObject(Conn) Then 
	    Conn.Close
	    Set Conn=Nothing
	End If
End Sub

Sub Foot()
	DataClose()
    Response.Write "<Div Align=Center>页面执行时间:"&Fix(Formatnumber((Timer-StartTime)*1000,3))&" ms</Div>"
	Response.Write "<div align='center'>"&Version&"</div>"
End Sub

rem 错误信息
Sub Msg()
	If InStr(ScriptName,"admin")<>0 Then
        Html=LoadTemplate("admin/msg")
	Else
        Html=LoadTemplate("msg")
	End If
	ReplaceFoot()
    Response.Write Replace(Html,"{strerr}",strMsg)
    Response.End
End Sub

Sub ReplaceFoot()
    Html=Replace(Html,"{copyright}",CopyRight)
    Html=Replace(Html,"{poweredby}",Version)
End Sub
%>