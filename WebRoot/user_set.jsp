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

<title>My JSP 'd.jsp' starting page</title>

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
	<span class="label" id="set">个人信息</span>
	<div id="user_set" style="visibility: hidden">
		<table cellspacing="10" bgcolor="#C9F1FF">
			<tr style="width: 500px;">
				<td width="25%"><font style="color: red">*</font><b>Email：</b>
				</td>
				<td width="75%"><input type="text" class="product_thumb"
					name="email" id="email" value="请务必填写有效的Email地址"></td>
			</tr>
			<tr>
				<td><font style="color: red">*</font><b>密码：</b></td>
				<td><input type="text" class="product_thumb" name="password"
					value="请输入不少于6位的密码" id="password"> <input name="password"
					type="password" class="product_thumb" id="real_password"></td>
			</tr>
			<tr>
				<td><font style="color: red">*</font><b>昵称：</b></td>
				<td><input type="text" class="product_thumb" id="nickname">
				</td>
			</tr>
			<tr>
				<td><font style="color: red">*</font><b>真实姓名：</b></td>
				<td><input type="text" class="product_thumb" id="realname">
				</td>
			</tr>
			<tr>
				<td><font style="color: red">*</font><b>性别：</b></td>

				<td>
					<div id="sex_radio">
						<input type="radio" value="man" name="sex" id="radio1"> 男
						<input type="radio" name="sex" value="woman" id="radio2">
						女
					</div></td>
			</tr>
			<tr>
				<td><font style="color: red;">*</font><b>地区：</b></td>
				<td><select id="area">
						<option value="请选择">请选择</option>
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
				</select></td>
			</tr>
		</table>

	</div>
</body>
</html>
