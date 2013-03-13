<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<base href="<%=basePath%>">
<title>上传图片</title>

<meta charset="utf-8">

<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="">

<!-- Le styles -->
<link href="bootstrap/css/bootstrap.css" rel="stylesheet">
<style type="text/css">
body {
	padding-top: 60px;
	padding-bottom: 40px;
}

.sidebar-nav {
	padding: 9px 0;
}
</style>
<link href="bootstrap/css/bootstrap-responsive.css" rel="stylesheet">
<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="jquery/ajaxfileupload.js"></script>
<script type="text/javascript" src="jquery/uploadPreview.js"></script>

<script type="text/javascript">
	function ajaxFileUpload() {

		$("#loading").ajaxStart(function() {
			$(this).show();
		})//开始上传文件时显示一个图片
		.ajaxComplete(function() {
			$(this).hide();
		});//文件上传完成将图片隐藏起来

		$.ajaxFileUpload({
			url : 'uploadImg',//用于文件上传的服务器端请求地址
			secureuri : false,//一般设置为false
			fileElementId : 'file',//文件上传空间的id属性  <input type="file" id="file" name="file" />
			dataType : 'json',//返回值类型 一般设置为json
			data : {
				fileId : $("#num").val()
			},
			success : function(data, status) //服务器成功响应处理函数
			{
				//alert(data);//从服务器返回的json中取出message中的数据,其中message为在struts2中action中定义的成员变量

				console.log("什么情况");
				/*if (typeof (data.error) != 'undefined') {
					if (data.error != '') {
						alert(data.error);
					} else {
						alert(data.message);
					}
				}
				 */

			},
			error : function(data, status, e)//服务器响应失败处理函数
			{
				alert(e);
			}

		});

		return false;

	}

	$(function() {
		$("#bu1").click(function() {
			$("input[type='file']").trigger("click");

		});

		//建议在#imgDiv的父元素上加个overflow:hidden;的css样式 
		function getFullPath(obj) { //得到图片的完整路径  
			if (obj) {
				//ie  
				if (window.navigator.userAgent.indexOf("MSIE") >= 1) {
					obj.select();
					return document.selection.createRange().text;
				}
				//firefox  
				else if (window.navigator.userAgent.indexOf("Firefox") >= 1) {
					if (obj.files) {
						return obj.files.item(0).getAsDataURL();
					}
					return obj.value;
				}
				return obj.value;
			}
		}

		$("#file").change(function() {
			var strSrc = $("#file").val();
			img = new Image();
			img.src = getFullPath(strSrc);
			//验证上传文件格式是否正确  
			var pos = strSrc.lastIndexOf(".");
			var lastname = strSrc.substring(pos, strSrc.length)
			/**
			
			if (lastname.toLowerCase() != ".jpg") {
				alert("您上传的文件类型为" + lastname + "，图片必须为 JPG 类型");
				return false;
			}
			//验证上传文件宽高比例  

			if (img.height / img.width > 1.5 || img.height / img.width < 1.25) {
				alert("您上传的图片比例超出范围，宽高比应介于1.25-1.5");
				return;
			}
			//验证上传文件是否超出了大小  
			if (img.fileSize / 1024 > 150) {
				alert("您上传的文件大小超出了150K限制！");
				return false;
			}
			 */
			$("#stuPic").attr("src", getFullPath(this));
		});

	});
</script>
</head>
<body>




	<img src="" id="stuPic" style="display: none;">
	<form method="post" enctype="multipart/form-data" action="upload.php">
		<input type="file" id="file" name="file" />
	</form>
	<br />
	<input type="text" id="num" />
	<br />

	<button id="bu1">触发上传</button>

	<input type="button" value="上传" onclick="ajaxFileUpload();">

</body>
</html>