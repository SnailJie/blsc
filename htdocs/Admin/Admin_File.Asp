<!--#include file="../inc/const.asp"-->
<!--#include file="inc/char.asp"-->
<html>
<head>
<title><%=site_info(0)%>-后台管理</title>
<meta http-equiv=Content-Type content="text/html; charset=gb2312">
<link href="xfok.css" type=text/css rel=stylesheet>
 
	<link href="sample.css" rel="stylesheet" type="text/css" />
	<script type="text/javascript" src="../ckfinder/ckfinder.js"></script>
</head>
<body text=#000000 leftmargin=0 topmargin=0 marginheight="0" marginwidth="0" bgcolor="#E5E5E5">
	<p style="padding-left: 5px; padding-right: 5px;">
		<script type="text/javascript">
			function showFileInfo( fileUrl, data )
			{
				var msg = 'The selected URL is: <a href="' + fileUrl + '">' + fileUrl + '</a><br /><br />';
				
				if ( fileUrl != data['fileUrl'] )
					msg += '<b>File url:</b> ' + data['fileUrl'] + '<br />';
				msg += '<b>File size:</b> ' + data['fileSize'] + 'KB<br />';
				msg += '<b>Last modifed:</b> ' + data['fileDate'];

			
				this.openMsgDialog( "Selected file", msg );
			}
		
			var finder = new CKFinder();
			finder.basePath = '../ckfinder/';
			finder.selectActionFunction = showFileInfo;
			finder.create();
		</script>
	</p>
</body>
</html> 