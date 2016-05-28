
		  <!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv="Content-Type" content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
<script src="../ckeditor/ckeditor.js"  type="text/javascript" ></script>
<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
 <script type="text/javascript">

function BrowseServer()
{
	// You can use the "CKFinder" class to render CKFinder in a page:
	var finder = new CKFinder();
	finder.basePath = '../';	// The path for the installation of CKFinder (default = "/ckfinder/").
	finder.selectActionFunction = SetFileField;
	finder.popup();

	// It can also be done in a single line, calling the "static"
	// popup( basePath, width, height, selectFunction ) function:
	// CKFinder.popup( '../', null, null, SetFileField ) ;
	//
	// The "popup" function can also accept an object as the only argument.
	// CKFinder.popup( { basePath : '../', selectActionFunction : SetFileField } ) ;
}

// This is a sample function which is called when a file is selected in CKFinder.
function SetFileField( fileUrl )
{
	document.getElementById( 'xFilePath' ).value = fileUrl;
}

	</script>
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
<script src="../js/selectlist.js"></script>
<script src="editor/checkform.js"></script>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5" onload="Kermy_JS('setDynaList(arrNSet)')">
<br>
<%
Dim Admin_flag,ID
Dim Title,Content,isHtml,Previewimg,Isindexpic,isRecommend,TitleColor,SpecialID,contentjianxie
Dim ClassID,NClassID,Editor,Author,AddUser
Dim Action
Action=Request.Form("Action")
Admin_flag="01"
If Not CheckAdmin(Admin_Flag) Then
    strMsg="<Li>您没有管理本页面的权限。"
    Call Msg()
End If

%>
<table width="95%" border=0 align="center" cellpadding=2 cellspacing=1 class="border-all">
    <tbody>
      <tr> 
        <th colspan="2">友情添加</th>
      </tr>
      <tr > 
        <td> 
        	<table> <form name="guestMessage" action="Admin_Batchlook.Asp" method="post"> 
              <tr > 
                <td  align="right"> 
                网站LOGO：</td> <td > <input type="text" name="guestName" class="ninput" size="40" id="xFilePath"><input type="button" value=" 浏览 " onclick="BrowseServer();"> </td> 
                </tr> 
                <!--
                <tr > <td  align="right"> 
                性别：</td> <td > <input type="radio" name="gongsi" value="男" checked>男<input type="radio" name="gongsi" value="女">女 </td> 
                </tr> 
                <tr > <td  align="right"> 
                职务：</td> <td > <input type="text" name="dizhi" class="ninput" size="40"> </td> 
                </tr> 
                <tr > <td  align="right"> 
                身份证号：</td> <td > <input type="text" name="dianhua" class="ninput" size="40"> </td> 
                </tr> 
                <tr > <td  align="right"> 
                发证日期：</td> <td > <input type="text" name="shouji" class="ninput" size="40"> </td> 
                </tr> 
                
                 <tr > <td  align="right"> 
                编号：</td> <td > <input type="text" name="youxiang" class="ninput" size="40"> </td> 
                </tr>
                -->
                <tr > <td  align="right"> 
                网址：</td> <td > <input type="text" name="zhiye" class="ninput" size="40"> </td> 
                </tr>
                 
                <input type="hidden" name="gongsi" value="男" checked>
                <input type="hidden" name="dizhi" class="ninput" size="40" value="0"> 
                <input type="hidden" name="dianhua" class="ninput" size="40"  value="0">
                <input type="hidden" name="shouji" class="ninput" size="40"  value="0">
                <input type="hidden" name="youxiang" class="ninput" size="40"  value="0"> </td> 
                </tr>
                 
              <tr > 
                <td colspan="2" align="center"> 
                 <input type="hidden" name="Action" value="添加"  >
                <input type="button" name="Action1" value="添加" onClick="vbscript:formSubmit()" class="button"> 
                <input type="reset" name="resetBtn" value="清除" class="button">                </td> 
              </tr> 
              </form> 
            </table> 
            <br><br>
          </td> 
        </tr> 
      </table> 
      <br><br>
<script language="vbs"> 
sub formSubmit() 
checkOk = true 
 
select case true 
	case trim(document.guestMessage.guestName.value)="" 
	alert ("您必须填写姓名") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub 
	 
	case instr(trim(document.guestMessage.guestName.value),"'") > 0 or instr(trim(document.guestMessage.guestName.value)," ") > 0 
	alert ("您的名字中有非法字符") 
	checkOk = false 
	document.guestMessage.guestName.focus() 
	exit sub  
	 case trim(document.guestMessage.dizhi.value)="" 
	alert ("您必须填写职务") 
	checkOk = false 
	document.guestMessage.dizhi.focus() 
	exit sub
	 
	case trim(document.guestMessage.dianhua.value)="" 
	alert ("您必须填写身份证号") 
	checkOk = false 
	document.guestMessage.dianhua.focus() 
	exit sub 
	case trim(document.guestMessage.shouji.value)="" 
	alert ("您必须填写发证日期") 
	checkOk = false 
	document.guestMessage.shouji.focus() 
	exit sub
	case trim(document.guestMessage.youxiang.value)="" 
	alert ("您必须填写编号") 
	checkOk = false 
	document.guestMessage.youxiang.focus() 
	exit sub 
	case trim(document.guestMessage.zhiye.value)="" 
	alert ("您必须填写图片地址") 
	checkOk = false 
	document.guestMessage.zhiye.focus() 
	exit sub 
	 
end select 
 
if checkOk = true then 
document.guestMessage.submit() 
end if 
end sub 
</script> 