<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
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

<title>@me微博  注册</title>
<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<link rel="stylesheet" href="css/index.css" type="text/css"></link>
<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<style type="text/css">
#div5 {
	opacity: 0.7;
	z-index: 0;
	position: absolute;
	left: 25%;
}

#div6 {
	opacity: 0.8;
	z-index: 5;
	position: absolute;
	left: 30%;
	top: 30%
}
</style>
<script type="text/javascript">
	$(function() {
		$("#password1").hide();
		$("#gohome").click(function() {
			window.location = "index.jsp";
		});
		$("#zhuce").mouseover(function() {
			$("#zhuce").attr("src", "img/li2.png");
		});
		$("#zhuce").mouseout(function() {
			$("#zhuce").attr("src", "img/li1.png");
		});
		$("#email").focus(function() {
			if ($("#email").val() == "请务必填写有效的Email地址") {
				$("#email").attr("class", "fontcolor1");
				$("#email").val("");
			}
		});
		$("#email").blur(function() {
			if ($("#email").val() == "") {
				$("#email").attr("class", "fontcolor");
				$("#email").val("请务必填写有效的Email地址");
			}
		});
		$("#password").focus(function() {
			$("#password1").show();
			$("#password1").attr("class", "fontcolor1");
			$("#password").hide();
		});
		$("#password1").blur(function() {
			if ($("#password1").val() == "") {
				$("#password").show();
				$("#password").attr("class", "fontcolor");
				$("#password1").hide();
			}
		});
		$("#img1").mouseover(function() {
			$("#img1").attr("src", "img/bgimg1.png");
		});
		$("#img1").mouseout(function() {
			$("#img1").attr("src", "img/bgimg.png");
		});
		$("#img1").click(function() {
			window.location="index.jsp"
		});
	});
</script>
</head>
<body style="background-image: url('img/bgimg99.jpg');">
	<img src="img/logo.png"
		style="width:350;margin-left: 300;margin-top: -20;" id="gohome"></img>
	<div style="width: 900;height:800;background-color: white;" id="div5"><img
			src="img/fa.png" style="margin-left:-10"></img>
	</div>
	<div id="div6">
		<table style="margin: 0 auto;" cellspacing="0">
			<tr>
				<td>
					<div id="div1"
						style="background-color:white; width:500px;height:600px;">
						<div id="div2">
							<img src="img/tuxianga.png" style="width: 150"></img>
							<hr>
							<table cellspacing="10">
								<tr style="width:500px;">
									<td width="25%"><font style="color: red">*</font><b>Email：</b>
									</td>
									<td width="75%"><input type="text" class="product_thumb"
										id="email" value="请务必填写有效的Email地址"></td>
								</tr>
								<tr>
									<td><font style="color: red">*</font><b>密码：</b></td>
									<td><input type="text" class="product_thumb"
										value="请输入不少于6位的密码" id="password"><input
										type="password" class="product_thumb" id="password1">
									</td>
								</tr>
								<tr>
									<td><font style="color: red">*</font><b>昵称：</b>
									</td>
									<td><input type="text" class="product_thumb"></td>
								</tr>
								<tr>
									<td><font style="color: red">*</font><b>真实姓名：</b>
									</td>
									<td><input type="text" class="product_thumb"></td>
								</tr>
								<tr>
									<td><font style="color: red">*</font><b>性别：</b>
									</td>
									<form>
										<td><input type="radio" value="man" name="sex">男<input
											type="radio" name="sex" value="woman">女</td>
									</form>
								</tr>
								<tr>
									<td><font style="color: red;">*</font><b>地区：</b>
									</td>
									<td><select><option value="请选择">请选择</option>
											<option value="北京市">北京市</option>
											<option value="天津市">天津市</option>
											<option value="河北省">河北省</option>
											<option value="山西省">山西省</option>
											<option value="辽宁省">辽宁省</option>
											<option value="吉林省">吉林省</option>
											<option value="上海市">上海市</option>
											<option value="江苏省">江苏省</option>
											<option value="浙江省">浙江省</option>
											<option value="安徽省">安徽省</option>
											<option value="福建省">福建省</option>
											<option value="江西省">江西省</option>
											<option value="山东省">山东省</option>
											<option value="河南省">河南省</option>
											<option value="内蒙古自治区">内蒙古自治区</option>
											<option value="黑龙江省">黑龙江省</option>
											<option value="湖北省">湖北省</option>
											<option value="湖南省">湖南省</option>
											<option value="广东省">广东省</option>
											<option value="广西壮族自治区">广西壮族自治区</option>
											<option value="海南省">海南省</option>
											<option value="四川省">四川省</option>
											<option value="重庆市">重庆市</option>
											<option value="台湾省">台湾省</option>
											<option value="贵州省">贵州省</option>
											<option value="云南省">云南省</option>
											<option value="西藏自治区">西藏自治区</option>
											<option value="陕西省">陕西省</option>
											<option value="甘肃省">甘肃省</option>
											<option value="青海省">青海省</option>
											<option value="宁夏回族自治区">宁夏回族自治区</option>
											<option value="新疆维吾尔族自治区">新疆维吾尔族自治区</option>
											<option value="香港特别行政区">香港特别行政区</option>
											<option value="澳门特别行政区">澳门特别行政区</option>
											<option value="东南亚">东南亚</option>
											<option value="欧洲">欧洲</option>
											<option value="南美洲">南美洲</option>
											<option value="大洋洲">大洋洲</option>
											<option value="非洲">非洲</option>
											<option value="亚洲">亚洲</option>
											<option value="美国">美国</option>
											<option value="加拿大">加拿大</option>
											<option value="新加坡">新加坡</option>
											<option value="韩国">韩国</option>
											<option value="日本">日本</option>
									</select>
										</form></td>
								</tr>
							</table>
							<br> <br> <img src="img/li1.png"
								style="margin-left: 30%" id="zhuce"></img>
						</div>
					</div></td>
				<td>
					<div id="div2"
						style="background-color:white; width:200px;height:600px;">
						<br>
						<br>
						<br>
						<br>
						<br>
						<br> <span><font color="gray" size="5">&nbsp;&nbsp;已有邮箱用户,<br>&nbsp;&nbsp;可以直接登录:</font><img
							src="img/bgimg.png" style="width:80;margin:20 50;" id="img1"></img>
						</span>
					</div></td>
			</tr>
		</table>
	</div>
</body>
</html>