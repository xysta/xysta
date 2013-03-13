<%@page import="com.google.gson.Gson"%>
<%@page import="com.jfinal.plugin.activerecord.Page"%>
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

<title>My JSP 'b.jsp' starting page</title>

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<!--
	<link rel="stylesheet" type="text/css" href="styles.css">
	-->
<style>
div {
	display: block;
}

.userName {
	float: left;
	display: inline;
	height: 23px;
	font-size: 14px;
	line-height: 23px;
	color: #999;
}

.msgBox {
	overflow: hidden;
	margin-right: 20px;
	word-wrap: break-word;
	line-height: 23px;
}

.msgCnt {
	font-size: 14px;
	overflow: hidden;
	word-wrap: break-word;
	display: inline;
}

.mediaWrap {
	clear: both;
	padding: 8px 0 3px;
}

.tl_imgGroup {
	overflow: hidden;
	padding-top: 2px;
}

.tl_imgGroup_item {
	float: left;
	width: 100px;
	height: 100px;
	overflow: hidden;
	margin-left: 10px;
	margin-left: 10px;
	margin-bottom: 5px;
	margin-top: 5px;
}

</style>

</head>

<body>
	<div class="nTab" style="width: 98%; height: 100%">
		<div>
			<div class="nTab" style="width: 100%">
				<!-- 标题开始 -->
				<div class="TabTitle">
					<!-- 标题开始 -->
					<ul class="nav nav-tabs" id="mytab">
						<li class="active"><a href="#content0">Home</a>
						</li>
						<li><a href="#content1">Profile</a>
						</li>
						<li><a href="#content2">Messages</a>
						</li>
					</ul>
				</div>
			</div>
			<div class="tab-content">
				<div class="tab-pane active" id="content0">

					<%
						int pageSize = 10;
						Page firstPage = MiniBlog.dao.initial(pageSize);
						List<MiniBlog> list = firstPage.getList();
						int totalRow = firstPage.getTotalRow();
						int totalPage = firstPage.getTotalPage();
					%>
					<div>
						<input id="totalPage" type="hidden" value="<%=totalPage%>" /> <input
							id="totalRow" type="hidden" value="<%=totalRow%>" /> <input
							id="pageSize" type="hidden" value="<%=pageSize%>" />
					</div>
					<%
						for (int i = 0; i < list.size(); i++) {
							MiniBlog blog = list.get(i);
							//String imagepath = blog.getStr("imagepath");					
							/**
							ArrayList pathList = null;
							if (imagepath != null && imagepath != "") {
								try {
									pathList = new Gson().fromJson(imagepath,
											ArrayList.class);
								} catch (Exception e) {

								}
							}
							 */
					%>
					<div id="blog_content<%=i%>">
						<table width="100%" height="auto"
							style="border-bottom: solid 1px #C9F1FF">
							<tr>
								<td width="93" rowspan="2" align="center" valign="top">
									<p>
										<img src="img/touxiang.png" alt="" name="touxiang" width="74"
											height="77" id="touxiang<%=i%>" style="margin: 10px;" />
									</p></td>
								<td height="auto" colspan="4" valign="top">
									<div class="msgBox">
										<div class="userName">
											<strong> <a href="http://t.qq.com/yxx_250503265"
												title="" id="show_author<%=i%>" card="1" ctype="2"><%=blog.getStr("author")%></a>:&nbsp;</strong>
										</div>
										<div class="msgCnt" id="show_content<%=i%>"><%=blog.getStr("content")%></div>
										
										<div id="imgpath<%=i%>" style="display: none;"><%=blog.getStr("imagepath")%></div>
										<div class="mediaWrap" id="showpic<%=i%>"
											style="display:none;">
											<div class="tl_imgGroup">
												
											</div>
										</div>
									</div>
								</td>
							</tr>
							<tr>
								<td width="326" style="font-size: 12px"><span
									id="show_time<%=i%>"><%=blog.getTimestamp("createtime").toString()%></span>,
									来自@me微薄。 <a id="showallcomment<%=i%>" style="font-size: 12px;">查看全部评论</a>
								</td>
								<td width="48" align="center">
									<div class="btn-group" style="margin: 9px 0;">
										<input id="blog_id<%=i%>" type="hidden"
											value="<%=blog.getInt("id")%>" />
										<button id="forward<%=i%>" class="btn btn-info btn-small"
											value="<%=i%>">转播</button>
										<button id="go_to_review<%=i%>" class="btn btn-info btn-small"
											value="<%=i%>">评论</button>
										<button id="sendtouch<%=i%>" class="btn btn-info btn-small"
											value="<%=i%>">对话</button>
									</div>
								</td>

							</tr>
							<tr>
								<td width="93" align="center" valign="top">&nbsp;</td>
								<td colspan="4">
									<div id="blog_review_div<%=i%>">
										<table width="98%" border="0" align="center" cellpadding="2"
											cellspacing="2">
											<tr>
												<td colspan="3"><textarea id="comment<%=i%>"
														name="textarea" rows="3"></textarea>
													<table width="100%" height="53">
														<tr>
															
															<td width="100%" align="right" valign="middle">
																<button id="review_button<%=i%>" value="<%=i%>"
																	class="btn btn-primary btn-small">评论</button>
															</td>
														</tr>
													</table>
												</td>
											</tr>
											<tr>
												<td width="83%">
													<div id="show_comment<%=i%>"></div>
												</td>
												<td width="9%" align="center"><a
													style="font-size: 12px" href="#">评论</a>
												</td>
												<td width="8%" align="center"><a
													style="font-size: 12px" href="#">转载</a>
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
				<div class="tab-pane" id="content1">111</div>
				<div class="tab-pane" id="content2">222</div>

			</div>
			<p>&nbsp;</p>
		</div>
	</div>
</body>
</html>
