/*
Copyright (c) 2003-2011, CKSource - Frederico Knabben. All rights reserved.
For licensing, see LICENSE.html or http://ckeditor.com/license
*/

CKEDITOR.editorConfig = function( config )
{
	// Define changes to default configuration here. For example:
	// config.language = 'fr';
	// config.uiColor = '#AADC6E';
	 config.filebrowserBrowseUrl= '/ckfinder/ckfinder.html'; //上传文件时浏览服务文件夹
     config.filebrowserImageBrowseUrl= '/ckfinder/ckfinder.html?Type=Images'; //上传图片时浏览服务文件夹
     config.filebrowserFlashBrowseUrl= '/ckfinder/ckfinder.html?Type=Flash';  //上传Flash时浏览服务文件夹
     config.filebrowserUploadUrl = '/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Files'; //上传文件按钮(标签)
     config.filebrowserImageUploadUrl= '/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Images'; //上传图片按钮(标签)
     config.filebrowserFlashUploadUrl= '/ckfinder/core/connector/asp/connector.asp?command=QuickUpload&type=Flash'; //上传Flash按钮(标签)
 
};
 