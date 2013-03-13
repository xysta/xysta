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

<meta http-equiv="pragma" content="no-cache">
<meta http-equiv="cache-control" content="no-cache">
<meta http-equiv="expires" content="0">
<meta http-equiv="keywords" content="keyword1,keyword2,keyword3">
<meta http-equiv="description" content="This is my page">
<script type="text/javascript" src="jquery/jquery-1.7.2.js"></script>
<script type="text/javascript" src="jquery/jquery.form.js"></script>
<style>
textarea {
	overflow: auto;
	width: 98%;
	resize: none;
	border: none;
}

#bianji {
	width: 100%;
	border: 1px solid #999;
	border-radius: 6px;
}

.D3 {
	position: absolute;
	z-index: 19;
	clear: both;
	width: 500px;
	margin-left: -1px;
	filter: none;
	background-color: #fff;
	border: 1px solid #D2D2D2;
	-webkit-box-shadow: 2px 2px 2px rgba(51, 51, 51, 0.2);
	margin-left: -1px;
}

.picDiv {
	position: relative;
	margin: 0 auto;
	padding: 5px;
}

.gb_btn {
	display: inline-block;
	height: 20px;
	padding: 2px 8px 1px;
	margin: 0;
	text-align: center;
	line-height: normal;
	white-space: nowrap;
	border-width: 1px;
	border-style: solid;
	background-repeat: repeat-x;
	-webkit-border-radius: 2px;
	border-radius: 2px;
	cursor: pointer;
}

.gb_btn1,.gb_btn2 {
	border-color: #288FC9;
	background-color: #43ABDC;
	background-position: 0 -18px;
}

.gb_btn1,.gb_btn3,.gb_btn5,.gb_btn7 {
	min-width: 47px;
}

.border1 {
	border-color: blue;
}

#image-list {
	list-style: none;
	margin: 0;
	padding: 0;
}

#image-list li {
	background: #fff;
	display: inline-block;
	border: 1px solid #ccc;
	padding: 5px;
	margin-bottom: 2px;
}

#image-list li img {
	border: 1px solid;
	height: 90px;
	width: 90px;
}
</style>

<script>
	$(function() {

		$("#gotoupload").click(function() {
			if ($("#uploadPic").css("display") == "block") {
				$("#uploadPic").css("display", "none");
			} else {
				$("#uploadPic").css("display", "block");
			}
		});

		$("#cancelButton").click(function() {
			if ($("#uploadPic").css("display") == "block") {
				$("#uploadPic").css("display", "none");
			} else {
				$("#uploadPic").css("display", "block");
			}
		});

		$("#uploadicon").hover(function(e) {
			$(this).attr("src", "img/upicon1.jpg");
			$(this).css("border-color", "red");
		}, function() {
			$(this).attr("src", "img/upicon2.jpg");
			$(this).css("border-color", "#474747");
		});

		// 显示上传图片
		function showUploadedItem(source) {
			var li = $("<li></li>");
			var img = $("<img></img>");
			img.attr("src", source);
			img.attr("class", "border1");
			img.attr("title", "点击删除该图片");
			img.attr("alt", "点击删除该图片");
			li.prepend(img);
			$("#image-list").prepend(li);

			$(".border1").click(function() {
				var r = confirm("您确定删除这张'刚刚上传'的图片吗？");
				if (r == true) {
					$(this).parent().remove();
				} else {
				}
			});
			$(".border1").hover(function() {
				$(this).css("border-color", "blue");
			}, function() {
				$(this).css("border-color", "pink");
			});
		}

		//图片预览
		function uploadPrivew(id) {
			var input = document.getElementById(id);//文件上传框
			var formdata = false;
			// 如果浏览器不支持FormData，隐藏按钮
			if (window.FormData) {
				formdata = new FormData();
				// document.getElementById("btn").style.display = "none";
			}
			// 监听上传框的change事件
			input.addEventListener("change",
					function(evt) {
						// 改变消息层的文案
						// document.getElementById("response").innerHTML = "Uploading . . ."
						var i = 0, len = this.files.length, img, reader, file;
						// 遍历文件
						for (; i < len; i++) {
							file = this.files[i];
							// 文件类型为图片
							if (!!file.type.match(/image.*/)) {
								// 浏览器支持FileReader对象
								if (window.FileReader) {
									reader = new FileReader();
									// 监听文件读取结束后事件
									reader.onloadend = function(e) {
										// 将图片添加到显示列表
										showUploadedItem(e.target.result,
												file.fileName);
									};
									// 读取文件
									reader.readAsDataURL(file);
								}
								// 将文件数据添加到FormData对象内
								if (formdata) {
									formdata.append("images[]", file);
								}
							}
						}

					}, false);
		}

		var idnum = 1;
		$("#uploadicon").click(function() {

			$("#images" + idnum).trigger("click");
			idnum++;
			if (idnum > 3) {
				idnum = 1;
			}
		});
		
		uploadPrivew("images1");
		uploadPrivew("images2");
		uploadPrivew("images3");
		
		$("#uploadForm").ajaxForm({	
			dataType: 'json',	
			complete : function(xhr) {
				
				console.log(xhr);
			}
		});
		
		
		$("#sendUpload").click(function() {
			$("#submitbutton").trigger("click");
		});
	});
</script>

</head>

<body>
	<label for="msgTxt">来，说说你在做什么，想什么</label>
	<div id="bianji">

		<div>
			<textarea id="new_blog" rows="7"></textarea>
		</div>
		<span> </span>
		<div>
			<table>
				<tr>
					<td><span><img name="t1" src="" width="25" height="25"
							alt="tupian1" /><a href="#">表情</a> </span></td>
					<td><span id="gotoupload"><img src="" alt="tupian1"
							name="t1" width="25" height="25" id="t1" /><a
							href="javascript: void(0)">图片</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t2" /><a href="#">朋友</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t3" /><a href="#">ddd</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t4" /><a href="#">eee</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t5" /><a href="#">fff</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t6" /><a href="#">ggg</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t7" /><a href="#">hhh</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t8" /><a href="#">iii</a> </span></td>
					<td><span><img src="" alt="tupian1" name="t1"
							width="25" height="25" id="t9" /><a href="#">jjj</a> </span></td>
				</tr>
			</table>
		</div>
		<div id="uploadPic" class="D3"
			style="display: none; line-height: 1.3333;">
			<div class="picDiv">
				<p style="color: #999; display: inline-block">
					<span>最多上传4张图片（请勿连续上传相同的图片）</span>
				<div style="float: right; display: inline-block">
					<button id="cancelButton" class="btn btn-danger btn-mini">
						<i style="vertical-align:middle;" class="icon-remove"></i>关闭
					</button>
				</div>
				</p>
				<div style="padding: 5px 0 0 0;">
					<!-- padding:5px 10px 15px 20px;     上5px　右10px　下15px 　左20px -->
					<div style="display:none">
						<form id="uploadForm" action="uploadImg" method="post"
							enctype="multipart/form-data">
							<input type="file" name="images1" id="images1" multiple><input
								type="file" name="images2" id="images2" multiple><input
								type="file" name="images3" id="images3" multiple><input
								type="submit" id="submitbutton" value="Upload File to Server">
						</form>
					</div>
					<div class="" id="peiview">
						<ul id="image-list">
							<li><img id="uploadicon" src="img/upicon2.jpg"
								title="点击上传图片" alt="点击上传图片" class="img-rounded" /></li>
						</ul>

					</div>

					<div style="text-align: right; padding-top: 2px;">
						<div style="float: left"></div>
						<div style="float: right;">
							<div class="btn-group">
								<button id="sendUpload" class="btn btn-success btn-mini">上传</button>
								<button id="cancelUpload" class="btn btn-mini">取消</button>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<!--uploadPic div  -->
	</div>
	<div>
		<table width="100%" border="0" cellspacing="2" cellpadding="2">
			<tr>
				<td width="63%">&nbsp;</td>
				<td width="26%" align="right"><span class="label">我是提示哟</span>
				</td>
				<td width="11%" align="right"><button id="broadcast"
						class="btn btn-primary">广播</button>
				</td>
			</tr>
		</table>

	</div>
</body>
</html>