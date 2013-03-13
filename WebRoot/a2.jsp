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

<title>My JSP 'a2.jsp' starting page</title>

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
	<div>
		<div style="float:right; width:65%">
			<table width="98%" height="156" border="0" cellpadding="2"
				cellspacing="2" style=" margin:8px">
				<tr>
					<td height="23">用户名</td>
				</tr>
				<tr>
					<td height="36">资料</td>
				</tr>
				<tr>
					<td align="left" valign="bottom">
						<div class="btn-group" style="margin: 9px 0;">
							<button class="btn btn-large btn-primary">Left</button>
							<button class="btn btn-large  btn-primary">Middle</button>
							<button class="btn   btn-large btn-primary">Right</button>
						</div>
					</td>
				</tr>
			</table>
		</div>
		<div style="float:right; width:35%; margin:auto">
			<table width="98%" border="0" cellspacing="2" cellpadding="2"
				style=" margin:8px">
				<tr>
					<td align="center" valign="middle"><img src="tab5.png"
						width="63" height="79" />
					</td>
				</tr>
			</table>
		</div>
	</div>
</body>
</html>
