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

		<title>My JSP 'relation_list.jsp' starting page</title>

		<meta http-equiv="pragma" content="no-cache">
		<meta http-equiv="cache-control" content="no-cache">
		<meta http-equiv="expires" content="0">
		<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
		<meta http-equiv="description" content="This is my page">
		<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
		<link rel="stylesheet" type="text/css"
			href="bootstrap3/css/bootstrap.css" />
		<script type="text/javascript" src="bootstrap2/js/jquery.js"></script>
		<link rel="stylesheet" type="text/css"
			href="bootstrap3/css/bootstrap-responsive.css" />
		<script type="text/javascript" src="bootstrap3/js/bootstrap.js"></script>
		<script type="text/javascript"
			src="bootstrap2/js/bootstrap-dropdown.js"></script>
		<script type="text/javascript"
			src="bootstrap2/js/bootstrap-scrollspy.js"></script>
		<script type="text/javascript" src="bootstrap2/js/bootstrap-tab.js"></script>
		<script>
	$(function() {

		$('#myTab a').click(function(e) {
			e.preventDefault();
			$(this).tab('show');
		});

	})
</script>
		<style>
#a {
	line-height: 100%;
	vertical-align: middle;
}

#a i {
	vertical-align: middle;
}
</style>
	</head>
	<body>
		<div style="border-bottom-style: solid 1px blue">
			<ul class="nav nav-tabs" id="myTab">
				<li class="active">
					<a href="#home">我收听的人</a>
				</li>
				<li>
					<a href="#profile">收听我的人</a>
				</li>
				<li>
					<a href="#messages">强烈推荐</a>
				</li>
			</ul>

			<div class="tab-content">
				<div class="tab-pane active" id="home">
					<div id="xiangxi" style="height:auto; width:auto">
						<table width="100%" style="border-bottom-style: solid 1px blue">
							<tr>
								<td width="923" valign="top" style="float: right">
									<div style="float: right">
										<ul class="nav">
											<li class="dropdown">
												<a href="#" class="dropdown-toggle" data-toggle="dropdown">
													详细 <b class="caret"></b> </a>
												<ul class="dropdown-menu">
													<li>
														详细
													</li>
													<li>
														头像
													</li>
												</ul>
											</li>
										</ul>
									</div>
								</td>
								<td width="145" align="center" valign="top">
									<span class="right">共收听<strong>130</strong>人</span>
								</td>
							</tr>
						</table>
						<div>
							<div style="float: right; width: 80%">
								<table width="98%" border="0" cellspacing="2" cellpadding="2">
									<tr>
										<td width="75%" align="left" valign="top">
											<a>用户名</a>
										</td>
										<td width="25%" align="right" valign="top">
											<div class="btn-group">
												<button class="btn">
													取消
												</button>
												<button class="btn">
													求收听
												</button>
											</div>
										</td>
									</tr>
									<tr>
										<td colspan="2">
											个人信息
										</td>
									</tr>
									<tr>
										<td colspan="2">
											收听多少 被收听多少
										</td>
									</tr>
								</table>
							</div>
							<div id="a" style="float: right; width: 20%; height: 100%">
								<i><img style="margin: auto 25%" src="tab5.png" />
								</i>
							</div>
						</div>

					</div>

				</div>
				<div class="tab-pane" id="profile">
					2222
				</div>
				<div class="tab-pane" id="messages">
					333
				</div>
			</div>
		</div>

	</body>
</html>
