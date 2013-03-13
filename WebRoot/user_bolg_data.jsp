<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.xysta.web.model.*"  %>
<%
	String path = request.getContextPath();
	String basePath = request.getScheme() + "://"
			+ request.getServerName() + ":" + request.getServerPort()
			+ path + "/";
%>


<html>
<head>
<base href="<%=basePath%>">

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">

</head>

<body>
	<div>
		<table width="100%" border="0" cellspacing="2" cellpadding="2"
			style="border-color: #C9F1FF; background-color: #C9F1FF">
			<tr>
				<td width="31%" height="105" align="center"><img
					src="img/touxiang.png" alt="aa" /></td>
				<td width="69%">&nbsp;</td>
			</tr>
			<tr>
				<td colspan="2">
					<table width="100%" id="user_bolg_data">
						<tr bgcolor="#B6DFEF" style="padding: 5px">
							<td id="td1" class="td" width="25%" align="center"
								valign="middle">
								<% User u = (User)session.getAttribute("user");
								   String nickname = u.getStr("nickname");
								   int id = u.getInt("id");
								%>
								<p><label id="mybroadcast"></label></p>
								<p>我的广播</p></td>
							<td id="td2" class="td" width="25%" align="center"
								valign="middle">
								<p><label id="mycollection">0</label></p>
								<p>我的收藏</p></td>
							<td id="td3" class="td" width="25%" align="center"
								valign="middle">
								<p><label id="ihavelistened"></label></p>
								<p>收听</p></td>
							<td id="td4" class="td2" width="25%" align="center"
								valign="middle">
								<p><label id="mylistener"></label></p>
								<p>听众</p></td>
						</tr>
					</table></td>
			</tr>
		</table>
	</div>
</body>
</html>