function CheckForm(form){
    var strContent=form.content.value;
	if (form.EditMode[0].value=="HTML" && form.EditMode[0].checked==true){
	    form.content.value=frames.HtmlEditor.document.body.innerHTML;
	}
	else{
	   if (form.EditMode[1].value=="UBB" && form.EditMode[1].checked==true){
		  document.myform.content.value=strContent;
	   }
	}
	if (form.title.value=="") {
       alert("���±��ⲻ��Ϊ��");
	   form.title.focus();
	   return false;
    }
	if (form.indexpic.checked==true) {
		if (form.previewimg.value=="") {
			alert("�ӵ����±�����д����ͼ");
			form.previewimg.focus();
			return false;
		}
	}
	if (form.ClassID.value=="" || form.ClassID.value==0) {
       alert("��ѡ�����·���");
	   form.ClassID.focus();
	   return false;
    }
	if (form.content.value=="") {
       alert("�������ݲ���Ϊ��");
	   return false;
    }
	if (form.Editor.value=="") {
       alert("���α༭����Ϊ��");
	   form.Editor.focus();
	   return false;
    }	
}

function Upload(){
	window.open("admin_upload.asp?Mode=Article","Upload","left=0,top=0,width=400,height=280,status=1");
}

function Insert(str){
	var objTextarea;
	var form=document.myform;
	if (document.myform.EditMode[1].value=="UBB" && form.EditMode[1].checked==true) {
	objTextarea=document.myform.content;
	objTextarea.focus();
    }
	else{
	    if (document.myform.EditMode[0].value=="HTML" && form.EditMode[0].checked==true){
	       objTextarea=frames.HtmlEditor.document.body
           objTextarea.focus();
		}
	}
		if ((document.selection)&&(document.selection.type== "Text"))
	{
		var range= document.selection.createRange();
		var ch_text=range.text;
		range.text= str + ch_text;
	}
	else if ( (document.selection)&&(document.selection.type=="None") )
	{
		var range= document.selection.createRange();
		range.text= str;
	}
	else
	{
		objTextarea.value=objTextarea.value+str;
		objTextarea.focus();
	}
}