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

<title>My JSP 'head.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->

</head>

<body>
	<div id="navbar" class="navbar navbar-fixed-top">
		<div class="navbar-inner"
			style="background-image: -webkit-linear-gradient(top, rgb(50, 162, 208), rgb(28, 216, 216) );">
			<div class="container" style="width: auto;">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"
					style="color: rgb(51, 51, 51); background-image: -webkit-linear-gradient(top, rgb(255, 255, 255), rgb(230, 230, 230) ); background-color: rgb(230, 230, 230);">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> </a> <a class="brand" href="#"
					style="color: rgb(247, 242, 242); padding: 8px 20px 12px; font-size: 20px;"><span
					style="visibility: hidden">aaaa</span>@me 微薄</a>
				<div class="nav-collapse">
					<ul class="nav">
						
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px;"></li>
						<li class="active"><a href="#"
							style="color: rgb(247, 239, 239); padding: 10px 10px 11px; font-size: 14px;">首页</a>
						</li>
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px;"></li>
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px;">应用</a>
						</li>
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px;">微吧</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px;">更多
								<b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="index.jsp" style="color: rgb(85, 85, 85);">去登录</a>
								</li>
								<li><a href="register.jsp" style="color: rgb(85, 85, 85);">去注册</a></li>
								<li><a href="#" style="color: rgb(85, 85, 85);">Something else here</a></li>
								<li class="divider"></li>
								<li><a href="#" style="color: rgb(85, 85, 85);">Separated link</a></li>
							</ul></li>
					</ul>
					
					<ul class="nav pull-right">
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px;">其它</a>
						</li>
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px;"></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px;">More
								<b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#" style="color: rgb(85, 85, 85);">Action</a>
								</li>
								<li><a href="#" style="color: rgb(85, 85, 85);">Another
										action</a></li>
								<li><a href="#" style="color: rgb(85, 85, 85);">Something
										else here</a></li>
								<li class="divider"></li>
								<li><a href="#" style="color: rgb(85, 85, 85);">Separated
										link</a></li>
							</ul></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>
</body>
</html>
