<%@ page language="java" import="java.util.*" pageEncoding="ISO-8859-1"%>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>

<!DOCTYPE HTML PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN">
<html>
<head>
<base href="<%=basePath%>">

<title>My JSP 'MyJsp.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<style>
body {
	padding: 30px
}

form {
	display: block;
	margin: 20px auto;
	background: #eee;
	border-radius: 10px;
	padding: 15px
}

.progress {
	position: relative;
	width: 400px;
	border: 1px solid #ddd;
	padding: 1px;
	border-radius: 3px;
}

.bar {
	background-color: #B4F5B4;
	width: 0%;
	height: 20px;
	border-radius: 3px;
}

.percent {
	position: absolute;
	display: inline-block;
	top: 3px;
	left: 48%;
}
</style>
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="jquery/jquery.form.js"></script>


<script type="text/javascript">
	$(function() {
		var bar = $('.bar');
		var percent = $('.percent');
		var status = $('#status');
		$('form').ajaxForm({
			beforeSend : function() {
				status.empty();
				var percentVal = '0%';
				bar.width(percentVal)
				percent.html(percentVal);
			},
			uploadProgress : function(event, position, total, percentComplete) {
				var percentVal = percentComplete + '%';
				bar.width(percentVal)
				percent.html(percentVal);
				//console.log(percentVal, position, total);
			},
			complete : function(xhr) {
				status.html(xhr.responseText);
			}
		});
		
		$("#sub2").click(function() {
			$("#sub1").trigger("click");
		});
	});
</script>
<script src="http://www.google-analytics.com/urchin.js"
	type="text/javascript"></script>
<script type="text/javascript">
	_uacct = "UA-850242-2";
	urchinTracker();
</script>

</head>

<body>
	<form action="uploadImg" method="post" enctype="multipart/form-data">
		<input type="file" name="myfile1"><br> <input type="file"
			name="myfile2"><br> <input type="file" name="myfile3 "><br>
		<input type="submit" id="sub1" value="Upload File to Server">
	</form>
	<input type="button" id="sub2" value="Upload File to Server">
	<div class="progress">
		<div class="bar"></div>
		<div class="percent">0%</div>
	</div>

	<div id="status"></div>

</body>
</html>
