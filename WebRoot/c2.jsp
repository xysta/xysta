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

<title>My JSP 'b2.jsp' starting page</title>


</head>

<body>
	<div>
		<table width="100%" id="user_bolg_data">
			<tr bgcolor="#B6DFEF">
				<td id="td1" class="td" width="25%" align="center" valign="middle">
					<p>听众</p>
					<p>数量</p></td>
				<td id="td2" class="td" width="25%" align="center" valign="middle">
					<p>收听</p>
					<p>数量</p></td>
				<td id="td3" class="td" width="25%" align="center" valign="middle">
					<p>广播</p>
					<p>数量</p></td>
			</tr>
			<tr bgcolor="#B6DFEF">
				<td colspan="3">博主资料</td>
			</tr>
		</table>
	</div>
</body>
</html>
