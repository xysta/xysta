<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.xysta.web.model.*"%>
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

<title>@me微博</title>

<meta http-equiv="Content-Type" content="text/html; charset=utf-8" />

<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css"
	type="text/css"></link>

<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-dropdown.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-scrollspy.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap-tab.js"></script>

<style type="text/css">
textarea {
	overflow: auto;
	width: 95%;
	resize: none;
	border: none;
}

#bianji {
	width: 100%;
	border: 1px solid #999;
	border-radius: 6px;
}

#Div1 {
	position: absolute;
	left: 121px;
	top: 53px;
	width: 80%;
	height: auto;
	border-radius: 6px;
	background-color: #FFFFFF;
}

body {
	background-color: #6BC9EB;
	color: #333;
}

.td {
	border-right-color: #C9F1FF;
	border-right-style: solid;
	background-color: #B6DFEF;
}

.hoveron {
	border-right-color: #C9F1FF;
	border-right-style: solid;
	background-color: #A8D2E4;;
}

.td2 {
	background-color: #B6DFEF;
}

.hoveron2 {
	background-color: #A8D2E4;;
}

.tl_imgGroup {
	overflow: hidden;
	padding-top: 2px;
}

.tl_imgGroup_item {
	float: left;
	width: 90px;
	height: 90px;
	overflow: hidden;
}
</style>
</head>

<body>
	<div style="width: 100%">
		<jsp:include page="header.jsp" />
	</div>
<div id="Div1">
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
			<tr style="line-height:5px">
				<td colspan="4">&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td width="34%" bgcolor="#C9F1FF">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%" rowspan="4">&nbsp;</td>
				<td colspan="3" rowspan="4" valign="top">
				<jsp:include page="relation_list.jsp"/>
				</td>
				<td height="243">&nbsp;</td>
				<td rowspan="2" align="center" valign="top"
					style="background-color: #C9F1FF; border-color: #C9F1FF"><jsp:include
						page="user_bolg_data.jsp" />
				 </td>
			</tr>
			<tr>
				<td rowspan="2"></td>
			</tr>
			<tr>
				<td height="22" align="right" bgcolor="#C9F1FF"></td>
			</tr>
			<tr>
				<td></td>
				<td bgcolor="#C9F1FF" valign="top"><jsp:include
						page="user_set.jsp" /></td>
			</tr>
		</table>
	</div>
</body>
</html>
