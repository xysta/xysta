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
	width: 590px;
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
		var current_input_file = 1;//当前选中的上传文件input
		var total_file = 0; //已经上传的文件数
		var current_input_num = 0; //数组循环序号
		var hasRemoveFalg = false;//是否有过删除(默认没有删除操作发生)

		var removeFile = new Array();

		function sortNumber(a, b) {
			return a - b;
		}

		function addToRemoveFile(elem) {
			var len = removeFile.length;
			removeFile[len] = elem;
			removeFile.sort(sortNumber);
			return removeFile[0];
		}

		

		$("#gotoupload").click(function() {
			if ($("#uploadPic").css("display") == "block") {
				$("#uploadPic").css("display", "none");
			} else {
				$("#uploadPic").css("display", "block");
			}
		});

		$("#cancelButton").click(function() {			
				$("#uploadPic").css("display", "none");			
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
			img.attr("id", current_input_file);
			img.attr("class", "border1");
			img.attr("title", "双击删除该图片");
			img.attr("alt", "双击删除该图片");
			li.prepend(img);
			$("#image-list").prepend(li);

			$("#" + current_input_file).dblclick(function() {
				var r = confirm("您确定删除这张'刚刚上传'的图片吗？");
				if (r == true) {
					$(this).parent().remove();
					hasRemoveFalg = true;
					total_file = total_file - 1;
					var id = parseInt(this.id);
					console.log($("#images" + id).val());
					$("#images" + id).val("");
					current_input_file = addToRemoveFile(id);
					console.log("删除的 数组为：" + removeFile);
					//current_input_file = parseInt(this.id);
					console.log("总文件数：" + total_file);
					console.log("删除后，继续上传使用的为：：" + current_input_file);
					//	console.log(this.id);
					showUploadPic();
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
			input
					.addEventListener(
							"change",
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
												showUploadedItem(
														e.target.result,
														file.fileName);

												total_file = total_file + 1;
												if (hasRemoveFalg) {
													current_input_num++;
													if (current_input_num >= removeFile.length) {
														hasRemoveFalg = false;
														removeFile = new Array();
														current_input_file = total_file + 1;
													} else {
														current_input_file = removeFile[current_input_num];
													}
												} else {
													current_input_num = 0;

													current_input_file = current_input_file + 1;
												}

												console.log("加载一张图片之后的中图片数："
														+ total_file);
												console.log("加载一张图片之后的当前file："
														+ current_input_file);

												showUploadPic();
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

		$("#uploadicon").click(function() {
			console.log("当前inputfile为：" + current_input_file);
			$("#images" + current_input_file).trigger("click");
			//current_input_file++;
			//showUploadPic();

		});

		showUploadPic();

		function showUploadPic() {
			if (total_file == 5) {
				current_input_file = 1;
				$("#uploadicon").parent().hide();
				$("#status").text("已添加5张图片，无法继续添加！");

			} else {
				$("#uploadicon").parent().show();
				$("#status").text("");
			}
		}

		uploadPrivew("images1");
		uploadPrivew("images2");
		uploadPrivew("images3");
		uploadPrivew("images4");
		uploadPrivew("images5");

		$("#uploadForm").ajaxForm({
			dataType : 'json',
			complete : function(xhr) {
				total_file = 0;
				console.log(xhr);
				$("#status").text(xhr.responseText);
				setTimeout(function() {
					$("#uploadPic").css("display", "none");
					$(".border1").parent().remove();
					$("#status").text("");
				}, 2000);

				if ($("#new_blog").val() == "") {
					$("#new_blog").val("#分享图片#......");
				}

				current_input_file = 1;
				total_file = 0; //已经上传的文件数
				current_input_num = 0; //数组循环序号
				hasRemoveFalg = false;//是否有过删除(默认没有删除操作发生)
				removeFile = new Array();

				for ( var i = 1; i <= 5; i++) {
					$("#images" + i).val("");
				}
			}
		});

		$("#sendUpload").click(function() {
			$("#submitbutton").trigger("click");
		});
		
		$("#cancelUpload").click(function() {
			$("#uploadPic").hide();
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
					<td><span id="gotoupload"><img src="" alt="tupian1"
							name="t1" width="25" height="25" id="t1" /><a
							href="javascript: void(0)">图片</a> </span>
					</td>
				</tr>
			</table>
		</div>
		<div id="uploadPic" class="D3"
			style="display: none; line-height: 1.3333;">
			<div class="picDiv">
				<p style="color: #999; display: inline-block">
					<span>最多上传5张图片（请勿连续上传相同的图片）</span>
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
								type="file" name="images4" id="images4" multiple><input
								type="file" name="images5" id="images5" multiple><input
								type="submit" id="submitbutton" value="Upload File to Server">
						</form>
					</div>
					<div class="" id="peiview">
						<ul id="image-list">
							<li><img id="uploadicon" src="img/upicon2.jpg"
								title="点击上传图片" alt="点击上传图片" class="img-rounded" />
							</li>
						</ul>

					</div>

					<div style="text-align: right; padding-top: 2px;">
						<div style="float: left">
							<span id="status" style="color: orange;"></span>
						</div>
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
				<td width="26%" align="right"><span class="label"></span>
				</td>
				<td width="11%" align="right"><button id="broadcast"
						class="btn btn-primary">广播</button></td>
			</tr>
		</table>

	</div>
</body>
</html>