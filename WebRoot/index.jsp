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

<title>@me微博 登录</title>
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
<script>
	$(function() {
		var index = Math.floor(Math.random() * 10);
		$("body").addClass("style" + (index + 2));
		$("#real_password").hide();
		var bubian;
		var index1;
		$("#email").focus(function() {
			if ($("#email").val() == "请填写您的注册Email") {
				$("#email").attr("class", "fontcolor1");
				$("#email").val("");
			}
		});
		$("#email").blur(function() {
			if ($("#email").val() == "") {
				$("#email").attr("class", "fontcolor");
				$("#email").val("请填写您的注册Email");
			}
		});
		$("#password").focus(function() {
			$("#real_password").show();
			$("#real_password").attr("class", "fontcolor1");
			$("#password").hide();
		});
		$("#real_password").blur(function() {
			if ($("#real_password").val() == "") {
				$("#password").show();
				$("#password").attr("class", "fontcolor");
				$("#real_password").hide();
			}
		});
		$("#login").mouseover(function() {
			$("#login").attr("src", "img/bgimg1.png");
		});
		$("#login").mouseout(function() {
			$("#login").attr("src", "img/bgimg.png");
		});
		$("#img2").mouseover(function() {
			$("#img2").attr("src", "img/liulan1.png");
		});
		$("#img2").mouseout(function() {
			$("#img2").attr("src", "img/liulan.png");
		});
		$("#img2").click(function(){
			window.location="mblog.jsp";
		});
		$("#img3").mouseover(function() {
			$("#img3").attr("src", "img/shi1.png");
		});
		$("#img3").mouseout(function() {
			$("#img3").attr("src", "img/shi.png");
		});
		$("#toregi").mouseover(function() {
			$("#toregi").attr("src", "img/zhuce1.png");
		});
		$("#toregi").mouseout(function() {
			$("#toregi").attr("src", "img/zhuce.png");
		});
		$("#toregi").click(function() {
			window.location = "register.jsp";
		});
		$("#home").click(function() {
			index1 = Math.floor(Math.random() * 10);
			$("body").removeClass("style" + (index + 2));
			$("body").removeClass("style" + (bubian + 2));
			$("body").addClass("style" + (index1 + 2));
			bubian = index1;
		});
		
		$("#login").click(function() {
			$.ajax({
				type : "post",
				//url : "http://192.168.0.103:8080/xysta/login",
				url : "login",
				data : {
					email : $("#email").val(),
					password : $("#real_password").val()
				},
				cache : false,
				dataType : "json",
				success : function(data) {
					var res= data.result;
					if (res) {
						//console.log(data.message.email);
						window.location="mblog.jsp";
						//alert("登录成功, 用户信息："+data.message.email);
					} else {
						//console.log(data.message);
						alert("登录失败, 附加信息："+data.message);
					}
				}
			});
		});
	});
</script>
</head>
<body>
	<img src="img/logo.png" id="home"
		style="width:350;margin-left: 300;margin-top: -20;"></img>
	<table style="margin-left: 450;" cellspacing="-1">
		<tr>
			<td>
				<table style="margin-top:  0">
					<tr>
						<td><table style="width:308">
								<tr>
									<td><table>
											<tr>
												<td><img src="img/shi.png" id="img3"></img>
												</td>
											</tr>
										</table></td>
									<td></td>
								</tr>
								<tr>
									<td><table>
											<tr>
												<td><img src="img/zhuce.png" id="toregi"></img><img
													src="img/liulan.png" id="img2"></img></td>
											</tr>
										</table></td>
								</tr>

							</table></td>
						<td>
							<div class="login_regsiter">
								<table>
									<tr>
										<td><input type="text" value="请填写您的注册Email" id="email"
											class="fontcolor" name="email"></td>
									</tr>
									<tr>
										<td><input type="text" value="请输入密码" id="password"
											class="fontcolor" name="password""> <input
											type="password" id="real_password" name="password"
											class="fontcolor"></td>
									</tr>
									<tr>
										<td><img src="img/bgimg.png" style="width:120;" id="login"></img>
											&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input type="checkbox">记住我的帐号</td>
									</tr>
									<tr>
										<td><br>
										</td>
									</tr>
									<tr>
										<td><br>
										</td>
									</tr>
									<tr>
										<td><br>
										</td>
									</tr>
									<tr>
										<td><span><a href="#" style="margin-left:230;color: black;">忘记密码？</a>
										</span>
										</td>
									</tr>
								</table>
							</div></td>
					</tr>
				</table>
		<tr>
			<td><img src="img/guanggao.png"
				style="width:680;margin-left: 8;"></img></td>
		</tr>
	</table>
</body>
</html>