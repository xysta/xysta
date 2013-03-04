<%@page import="com.jfinal.plugin.activerecord.Page"%>
<%@ page language="java" import="java.util.*" pageEncoding="utf-8"%>
<%@ page import="com.xysta.web.model.MiniBlog"%>
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

<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap-responsive.min.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap.css"
	type="text/css"></link>
<link rel="stylesheet" href="bootstrap/css/bootstrap.min.css"
	type="text/css"></link>

<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.js"></script>
<script type="text/javascript" src="bootstrap/js/bootstrap.min.js"></script>

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
}
</style>

<script type="text/javascript">
	$(function() {

		function toolbar(el) {
			el = typeof el == 'string' ? document.getElementById(el) : el;
			var elTop = el.offsetTop;
			var sTop = 0;
			window.onscroll = function() {
				sTop = document.body.scrollTop
						|| document.documentElement.scrollTop;
				if (sTop > elTop) {
					el.style.top = "0";
					el.style.position = "fixed"
				} else {
					el.style.top = elTop + 'px';
					el.style.position = "absolute"
				}
			}
		}

		$("#navbar").ready(function(e) {
			// toolbar("navbar");
		});

		function nTabs(thisObj, Num) {
			if (thisObj.className == "active")
				return;
			var tabObj = thisObj.parentNode.id;
			var tabList = document.getElementById(tabObj).getElementsByTagName(
					"li");
			for ( var i = 0; i < tabList.length; i++) {
				if (i == Num) {
					thisObj.className = "active";
					document.getElementById(tabObj + "_Content" + i).style.display = "block";
				} else {
					tabList[i].className = "normal";
					document.getElementById(tabObj + "_Content" + i).style.display = "none";
				}
			}
		}

		$("#user_bolg_data").hover(function() {
			//#A8D2E4
		}, function() {
		});

		var current_page = 1;
		var totalPage = $("#totalPage").val();
		var totalRow = $("#totalRow").val();
		var pageSize = $("#pageSize").val();
		var show_size = 7;

		var current_blog = 0;
		for ( var i = 0; i < pageSize; i++) {

			$("#blog_review_div" + i).hide();
			$("#go_to_review" + i).click(function() {

				current_blog = parseInt($(this).val());

				if ($("#blog_review_div" + current_blog).is(":hidden")) {
					$("#blog_review_div" + current_blog).show();
				} else {
					$("#blog_review_div" + current_blog).hide();
				}
			});

		}

		function creat_paginate_bar(total_page) {
			var ul_html = "<ul><li id='previous_li' class='disabled'>"
					+ "<a id='previous_page' style='color: #08c;'>上一页</a></li>";
			for ( var i = 1; i <= total_page; i++) {
				ul_html += "<li id='li"+i+"' class='disabled'>"
						+ "<a id='page"+i+"' style='color: #08c;'>" + i
						+ "</a></li>";
			}

			ul_html += "<li id='next_li' class='disabled'>"
					+ "<a id='next_page' style='color: #08c;'>下一页</a></li></ul>";

			return ul_html;
		}

		$(".pagination").html(creat_paginate_bar(totalPage));
		paginate_bar_function();
		showOrHide_li(show_size);

		function ajaxGetJson(pageNumber, pageSize0) {
			$.ajax({
				type : "post",
				//url : "http://192.168.0.103:8080/xysta/paginate",
				url : "paginate",
				data : {
					pageNumber : pageNumber,
					pageSize : pageSize0
				},
				cache : false,
				dataType : "json",
				success : function(data) {
					var blog_list = data.message.list;
					totalPage = data.message.totalPage;
					totalRow = data.message.totalRow;
					pageSize = data.message.pageSize;
					for ( var i = 0; i < blog_list.length; i++) {
						var blog_temp = blog_list[i];
						$("#show_time" + i).text(blog_temp.createtime);
						$("#show_content" + i).text(blog_temp.content);
						$("#show_author" + i).text(blog_temp.author);
					}
					if (current_page == totalPage
							&& blog_list.length < pageSize) {
						for ( var i = blog_list.length; i < pageSize; i++) {
							$("#blog_content" + i).hide();
						}
					}

					if (blog_list.length == pageSize) {
						for ( var i = 0; i < pageSize; i++) {
							if ($("#blog_content" + i).is(":hidden")) {
								$("#blog_content" + i).show();
							}
						}
					}

					$(".pagination").html("");
					$(".pagination").html(creat_paginate_bar(totalPage));
					paginate_bar_function();
					showOrHide_li(show_size);

				}
			});
		}

		function paginate_bar_function() {
			$(".pagination").ready(function(e) {
				$("#li" + current_page).removeClass("disabled");
				$("#li" + current_page).addClass("active");
			});

			$("#previous_page").click(
					function() {
						if (current_page > 1) {
							$("#page" + current_page).css("background-color",
									"#fff");
							$("#page" + (current_page - 1)).css(
									"background-color", "#73B2DA");
							current_page = current_page - 1;
						} else if (current_page == 1) {

						}
						ajaxGetJson(current_page, pageSize);

					});

			$("#previous_page").hover(function(e) {
				$(this).css("background-color", "#73B2DA");
			}, function() {
				$(this).css("background-color", "#fff");
			});

			$("#next_page").hover(function(e) {
				$(this).css("background-color", "#73B2DA");
			}, function() {
				$(this).css("background-color", "#fff");
			});

			$("#next_page").click(
					function() {
						if (current_page < totalPage) {
							$("#page" + current_page).css("background-color",
									"#fff");
							$("#page" + (parseInt(current_page) + 1)).css(
									"background-color", "#73B2DA");
							current_page = parseInt(current_page) + 1;
						} else if (current_page == totalPage) {

						}
						ajaxGetJson(current_page, pageSize);
					});

			for ( var i = 1; i <= totalPage; i++) {

				$("#page" + i).hover(function(e) {
					if ($(this).text() != current_page) {
						$(this).css("background-color", "#73B2DA");
					}
				}, function() {
					if ($(this).text() != current_page) {
						$(this).css("background-color", "#fff");
					}
				});

				$("#page" + i).click(
						function() {
							var temp_page = parseInt($(this).text());
							if (temp_page != current_page) {

								$("#page" + current_page).css(
										"background-color", "#fff");
								$(this).css("background-color", "#73B2DA");
								current_page = temp_page;
							} else {

							}
							ajaxGetJson(current_page, pageSize);

						});
			}

			var temp_li1 = "<li id='separate1' class='disabled'><a style='color: #08c;'>...</a></li>";
			var temp_li2 = "<li id='separate2' class='disabled'><a style='color: #08c;'>...</a></li>";
			$("#li1").after(temp_li1);
			$("#li" + totalPage).before(temp_li2);

			

		}

		function showOrHide_li(show_size) {//show_size为为省略号中间显示的页码的个数(奇数)
			var critical_value1 = 1 + ((show_size - 1) / 2 + 2);//句号右边最小为3
			var critical_value2 = totalPage - ((show_size - 1) / 2 + 2);//句号右边最小为3
			var max_value = show_size + 4;//分页工具条最多显示的个数(包括两个省略号)
			if (totalPage < max_value) {
				$("#separate1").hide();
				$("#separate2").hide();
			} else {
				if (current_page < critical_value1) {
					$("#separate1").hide();
					$("#separate2").show();
					for ( var i = 2; i < totalPage; i++) {
						if (i > show_size + 2) {
							$("#li" + i).hide();
						}
					}
				} else if (current_page >= critical_value1
						&& current_page <= critical_value2) {
					$("#separate1").show();
					$("#separate2").show();
					for ( var i = 2; i < totalPage; i++) {
						if (i < current_page - (show_size - 1) / 2
								|| i > current_page + (show_size - 1) / 2) {
							$("#li" + i).hide();
						}
					}
				} else {

					$("#separate1").show();
					$("#separate2").hide();
					for ( var i = 2; i < totalPage; i++) {
						if (i <= totalPage - (show_size + 2)) {
							$("#li" + i).hide();
						}
					}
				}

			}

		}

		function broadcast_new_blog(content) {
			$.ajax({
				type : "post",
				//	url : "http://192.168.0.103:8080/xysta/save",
				url : "save",
				data : {
					content : content
				},
				cache : false,
				dataType : "json",
				success : function(data) {
					var res = data.result;
					if (res) {
						//console.log(data.message.email);
						//window.location="mblog.jsp";
						console.log("终于刷了一条");
					} else {
						//console.log(data.message);
						console.log("刷不出来啊啊，亲");
					}
				}
			});
		}

		$("#broadcast").click(function() {
			var new_blog_content = $("#new_blog").val();

			broadcast_new_blog(new_blog_content);

			ajaxGetJson(current_page, pageSize);

			setTimeout(function() {
				$("#new_blog").val("");
			}, 1500);
		});

	});
</script>


</head>
<body>
	<div id="navbar" class="navbar" style="z-index: 2">
		<div class="navbar-inner"
			style="background-image: -webkit-linear-gradient(top, rgb(50, 162, 208), rgb(28, 216, 216)); ">
			<div class="container" style="width: auto;">
				<a class="btn btn-navbar" data-toggle="collapse"
					data-target=".nav-collapse"
					style="color: rgb(51, 51, 51); background-image: -webkit-linear-gradient(top, rgb(255, 255, 255), rgb(230, 230, 230)); background-color: rgb(230, 230, 230); ">
					<span class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span> </a> <a class="brand" href="#"
					style="color: rgb(247, 242, 242); padding: 8px 20px 12px; font-size: 20px; ">@me
					微薄</a>
				<div class="nav-collapse">
					<ul class="nav">
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Home</a>
						</li>
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px; "></li>
						<li class="active"><a href="#"
							style="color: rgb(247, 239, 239); padding: 10px 10px 11px; font-size: 14px; ">Miracle</a>
						</li>
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px; "></li>
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Link</a>
						</li>
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Link</a>
						</li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Dropdown
								<b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#" style="color: rgb(85, 85, 85); ">Action</a>
								</li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Another
										action</a>
								</li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Something
										else here</a>
								</li>
								<li class="divider"></li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Separated
										link</a>
								</li>
							</ul></li>
					</ul>
					<ul class="nav pull-right">
						<li><a href="#"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Link</a>
						</li>
						<li class="divider-vertical"
							style="border-right-width: 1px; border-right-style: solid; border-right-color: rgb(79, 149, 234); background-color: rgb(95, 107, 216); height: 41px; "></li>
						<li class="dropdown"><a href="#" class="dropdown-toggle"
							data-toggle="dropdown"
							style="color: rgb(247, 247, 247); padding: 10px 10px 11px; font-size: 14px; ">Dropdown
								<b class="caret"></b> </a>
							<ul class="dropdown-menu">
								<li><a href="#" style="color: rgb(85, 85, 85); ">Action</a>
								</li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Another
										action</a>
								</li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Something
										else here</a>
								</li>
								<li class="divider"></li>
								<li><a href="#" style="color: rgb(85, 85, 85); ">Separated
										link</a>
								</li>
							</ul></li>
					</ul>
				</div>
				<!-- /.nav-collapse -->
			</div>
		</div>
		<!-- /navbar-inner -->
	</div>

	<div id="Div1">
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
			<tr>
				<td colspan="4">&nbsp;</td>
				<td width="2%">&nbsp;</td>
				<td width="29%" bgcolor="#C9F1FF">&nbsp;</td>
			</tr>
			<tr>
				<td width="2%" rowspan="4">&nbsp;</td>
				<td colspan="3"><span>来，晒晒你的心情......</span>
					<div id="bianji">
						<span> <textarea id="new_blog" rows="7"></textarea> </span><span>
						</span> <span>
							<table>
								<tr>
									<td><span><img name="t1" src="" width="25"
											height="25" alt="tupian1" /><a href="#">表情</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t1" /><a href="#">图片</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t2" /><a href="#">朋友</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t3" /><a href="#">ddd</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t4" /><a href="#">eee</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t5" /><a href="#">fff</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t6" /><a href="#">ggg</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t7" /><a href="#">hhh</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t8" /><a href="#">iii</a> </span>
									</td>
									<td><span><img src="" alt="tupian1" name="t1"
											width="25" height="25" id="t9" /><a href="#">jjj</a> </span>
									</td>
								</tr>
							</table> </span>
					</div>
				</td>
				<td>&nbsp;</td>
				<td align="center" valign="top"
					style="background-color:#C9F1FF; border-color:#C9F1FF"><table
						width="100%" border="0" cellspacing="2" cellpadding="2"
						style=" border-color:#C9F1FF; background-color:#C9F1FF">
						<tr>
							<td width="31%" height="105" align="center"><img
								src="img/touxiang.png" alt="aa" />
							</td>
							<td width="69%">&nbsp;</td>
						</tr>
						<tr>
							<td colspan="2"><table width="100%" id="user_bolg_data">
									<tr bgcolor="#B6DFEF">
										<td width="25%" align="center" valign="middle"
											bgcolor="#B6DFEF"
											style="border-right-color:#C9F1FF; border-right-style: solid;"><p>xxx</p>
											<p>我的广播</p>
										</td>
										<td width="25%" align="center" valign="middle"
											bgcolor="#B6DFEF"
											style="border-right-color:#C9F1FF; border-right-style: solid;"><p>xxx</p>
											<p>我的收藏</p>
										</td>
										<td width="25%" align="center" valign="middle"
											bgcolor="#B6DFEF"
											style="border-right-color:#C9F1FF; border-right-style: solid;"><p>xxx</p>
											<p>收听</p>
										</td>
										<td width="25%" align="center" valign="middle"
											bgcolor="#B6DFEF"><p>xxx</p>
											<p>听众</p>
										</td>
									</tr>
								</table>
							</td>
						</tr>
					</table>
				</td>
			</tr>
			<tr>
				<td width="40%" rowspan="2"></td>
				<td width="12%" rowspan="2" align="right"><span class="label">我是提示哟</span>
				</td>
				<td width="15%" rowspan="2" align="right"><button
						id="broadcast" class="btn btn-primary">广播</button>
				</td>
				<td rowspan="2"></td>
				<td height="9" bgcolor="#C9F1FF"></td>
			</tr>
			<tr>
				<td height="22" align="right" bgcolor="#C9F1FF"><span
					class="label">个人信息</span>
				</td>
			</tr>
			<tr>
				<td colspan="3" align="center"><div class="nTab"
						style="width:98%; height:100%">
						<div>
							<div class="nTab" style=" width:100%">
								<!-- 标题开始 -->
								<div class="TabTitle">
									<!-- 标题开始 -->
									<ul class="nav nav-tabs">
										<li class="active"><a href="#">Home</a>
										</li>
										<li><a href="#">Profile</a>
										</li>
										<li><a href="#">Messages</a>
										</li>
									</ul>
								</div>
							</div>
							<div class="TabContent">
								<div id="myTab1_Content0">

									<%
										int pageSize = 5;
										Page firstPage = MiniBlog.dao.initial(pageSize);
										List<MiniBlog> list = firstPage.getList();
										int totalRow = firstPage.getTotalRow();
										int totalPage = firstPage.getTotalPage();
									%>
									<div>
										<input id="totalPage" type="hidden" value="<%=totalPage%>" />
										<input id="totalRow" type="hidden" value="<%=totalRow%>" /> <input
											id="pageSize" type="hidden" value="<%=pageSize%>" />
									</div>
									<%
										for (int i = 0; i < list.size(); i++) {
											MiniBlog blog = list.get(i);
									%>
									<div id="blog_content<%=i%>">
										<table width="100%" height="180"
											style="border-bottom:solid 1px #C9F1FF">
											<tr>
												<td width="93" rowspan="2" align="center" valign="top"><p>
														<img src="img/touxiang.png" alt="" name="touxiang"
															width="74" height="77" id="touxiang<%=i%>"
															style="margin:10px;" />
													</p>
												</td>
												<td height="128" colspan="4" valign="top"><label
													id="show_author<%=i%>"><%=blog.getStr("author")%></label>
													<div style="margin: 10px" id="show_content<%=i%>"><%=blog.getStr("content")%></div>
												</td>
											</tr>
											<tr>
												<td width="326" style="font-size:12px"><span
													id="show_time<%=i%>"><%=blog.getTimestamp("createtime").toString()%></span>,
													来自@me微薄。<a id="showallcomment<%=i%>"
													style="font-size:12px;">查看全部评论</a></td>
												<td width="48" align="center">
													<div class="btn-group" style="margin: 9px 0;">
														<button id="forward<%=i%>" class="btn btn-info btn-small"
															value="<%=i%>">转播</button>
														<button id="go_to_review<%=i%>"
															class="btn btn-info btn-small" value="<%=i%>">评论</button>
														<button id="sendtouch<%=i%>"
															class="btn btn-info btn-small" value="<%=i%>">对话</button>
													</div>
												</td>

											</tr>
											<tr>
												<td width="93" align="center" valign="top">&nbsp;</td>
												<td colspan="4"><div id="blog_review_div<%=i%>">
														<table width="98%" border="0" align="center"
															cellpadding="2" cellspacing="2">
															<tr>
																<td colspan="3"><textarea id="comment<%=i%>"
																		name="textarea" rows="3"></textarea>
																	<table width="100%" height="53">
																		<tr>
																			<td width="55" height="47" valign="middle"><span><img
																					src="" alt="tupian1" name="t1" width="25"
																					height="25" id="t10" /><a href="#">aaaa</a> </span>
																			</td>
																			<td width="55" valign="middle"><span><img
																					src="" alt="tupian1" name="t1" width="25"
																					height="25" id="t10" /><a href="#">bbb</a> </span>
																			</td>
																			<td width="55" valign="middle"><span><img
																					src="" alt="tupian1" name="t1" width="25"
																					height="25" id="t11" /><a href="#">ccc</a> </span>
																			</td>
																			<td width="55" valign="middle"><span><img
																					src="" alt="tupian1" name="t1" width="25"
																					height="25" id="t12" /><a href="#">ddd</a> </span>
																			</td>
																			<td width="132"></td>
																			<td width="68" align="right"><button
																					id="review_button<%=i%>" class="btn btn-primary"
																					href="#">评论</button>
																			</td>
																		</tr>
																	</table></td>
															</tr>
															<tr>
																<td width="83%"><p></p>
																</td>
																<td width="9%" align="center"><a
																	style="font-size:12px" href="#">评论</a>
																</td>
																<td width="8%" align="center"><a
																	style="font-size:12px" href="#">转载</a>
																</td>
															</tr>
														</table>
													</div>
												</td>
											</tr>
										</table>
									</div>
									<%
										}
									%>
									<div class="pagination pagination-right"></div>
								</div>
								<div id="myTab1_Content1" class="none">111</div>
								<div id="myTab1_Content2" class="none">222</div>
								<div id="myTab1_Content3" class="none">333</div>
							</div>
							<p>&nbsp;</p>
						</div>
					</div></td>
				<td></td>
				<td bgcolor="#C9F1FF" valign="top"><div>
						此处显示新 Div 标签的内容
						<table cellspacing="10" bgcolor="#C9F1FF">
							<tr style="width:500px;">
								<td width="25%"><font style="color: red">*</font><b>Email：</b>
								</td>
								<td width="75%"><input type="text" class="product_thumb"
									name="email" id="email" value="请务必填写有效的Email地址">
								</td>
							</tr>
							<tr>
								<td><font style="color: red">*</font><b>密码：</b>
								</td>
								<td><input type="text" class="product_thumb"
									name="password" value="请输入不少于6位的密码" id="password"><input
									name="password" type="password" class="product_thumb"
									id="real_password"></td>
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

								<td><div id="sex_radio">
										<input type="radio" value="man" name="sex" id="radio1">男
										<input type="radio" name="sex" value="woman" id="radio2">女
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
								</select>
								</td>
							</tr>
						</table>

					</div>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>
