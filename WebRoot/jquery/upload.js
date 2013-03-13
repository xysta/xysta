(function() {
	var input = document.getElementById("images");
	var formdata = false;
	// 显示上传图片
	function showUploadedItem(source) {
		/*
		 * //var list = document.getElementById("image-list"); var li =
		 * document.createElement("li"); var img =
		 * document.createElement("img"); img.src = source; li.appendChild(img);
		 * list.appendChild(li);
		 */
		var li = $("<li></li>");
		var img = $("<img></img>");
		img.attr("src", source);
		img.attr("class", "broder");
		img.attr("title", "点击删除该图片");
		img.attr("alt", "点击删除该图片");
		li.prepend(img);
		$("#image-list").prepend(li);

		$(".broder").click(function() {
			var r = confirm("您确定删除这张'刚刚上传'的图片吗？");
			if (r == true) {
				$(this).parent().remove();
			} else {

			}

		});

		$(".broder").hover(function(e) {
			$(this).css("border-color", "blue");
			// console.log(0);
		}, function() {
			$(this).css("border-color", "pink");
			// console.log(1);
		});

	}
	// 如果浏览器不支持FormData，隐藏按钮
	if (window.FormData) {
		formdata = new FormData();
		// document.getElementById("btn").style.display = "none";
	}
	// 监听上传框的change事件
	input.addEventListener("change", function(evt) {
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
					var reader = new FileReader();
					// 监听文件读取结束后事件
					reader.onloadend = function(e) {
						// 将图片添加到显示列表
						showUploadedItem(e.target.result, file.fileName);
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
}());
