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
                el.style.position = "fixed";
            } else {
                el.style.top = elTop + 'px';
                el.style.position = "absolute";
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

    function showUserRelationMenu() {
        $.ajax({
            type : "post",
            url : "getCurUserRelaData",
            cache : false,
            dataType : "json",
            success : function(data) {
                var res = data.message;

                $("#mybroadcast").text(res.mybroadcast);
                $("#ihavelistened").text(res.ihavelistened);
                $("#mylistener").text(res.mylistener);

            }
        });
    }

    showUserRelationMenu();

    //刷微博
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
                    //	console.log("终于刷了一条");
                } else {
                    //console.log(data.message);
                    //	console.log("刷不出来啊啊，亲");
                }
                showUserRelationMenu();
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

    //显示图片
    function showPicIntheBlog(imgpath) {
        var div_html = "";
        for ( var i = 0; i < imgpath.length; i++) {
            div_html += "<div class='tl_imgGroup_item'>"
                + "<img class='' width='90' src='"+imgpath[i]+"' style='display: inline;'></div>";
        }
        return div_html;
    }

    function showPic() {
        for ( var i = 0; i < pageSize; i++) {
            var imgpath = $("#imgpath" + i).text();
            if (imgpath != "null") {
                //var te = eval(imgpath);
                imgpath = $.parseJSON(imgpath);
                console.log(imgpath);
                $("#showpic" + i).css("display", "block");
                $("#showpic" + i).find(".tl_imgGroup").html("");
                $("#showpic" + i).find(".tl_imgGroup").html(
                    showPicIntheBlog(imgpath));
            }
        }
    }
    showPic();
    //生成分页工具条的html代码
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

    //向数据库发送请求，分页显示数据
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
                    $("#blog_id" + i).val(blog_temp.id);
                    $("#blog_review_div" + i).hide();

                    var imgpath = blog_temp.imagepath;
                    $("#imgpath" + i).text(imgpath);
                    //	console.log($("#imgpath" + i).text());
                    console.log(imgpath);
                    $("#showpic" + i).find(".tl_imgGroup").html("");

                    if (imgpath != null) {
                        //var te = eval(imgpath);
                        imgpath = $.parseJSON(imgpath);
                        console.log(imgpath);
                        $("#showpic" + i).css("display", "block");
                        $("#showpic" + i).find(".tl_imgGroup").html(
                            showPicIntheBlog(imgpath));
                    }

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

    //先数据库发送请求，显示“评论”
    function showComment(blog_id, current_blog) {
        $.ajax({
            type : "post",
            //	url : "http://192.168.0.103:8080/xysta/findCommentByBlogid",
            url : "findCommentByBlogid",
            data : {
                blog_id : blog_id
            },
            cache : false,
            dataType : "json",
            success : function(data) {
                var res = data.message;
                var comment_html = "";
                if (res.length != 0) {
                    for ( var i = 0; i < res.length; i++) {
                        var temp_comment = res[i];
                        comment_html += "<p><span style='color:red'>(评论人)"
                            + temp_comment.reviewer
                            + "：</span><span>评论内容："
                            + temp_comment.comment + "</span></p>";
                    }
                    $("#show_comment" + current_blog).html(comment_html);
                } else {
                    //console.log(data.message);
                    $("#show_comment" + current_blog).html("暂无相关评论！")
                }
            }
        });

    }

    //先数据库发送请求，添加“评论”
    function commentSave(blog_id, comment) {
        $.ajax({
            type : "post",
            //url : "http://192.168.0.103:8080/xysta/commentSave",
            url : "commentSave",
            data : {
                blog_id : blog_id,
                comment : comment
            },
            cache : false,
            dataType : "json",
            success : function(data) {
                var res = data.message;
                if (res != null) {
                    //console.log("评论成功！" + res.comment);
                } else {
                    //console.log(data.message);
                    //console.log("评论失败？");
                }
            }
        });

    }

    //动态切换的评论div的显示或者隐藏
    var current_blog = 0;
    function reviw_function() {
        for ( var i = 0; i < pageSize; i++) {

            $("#blog_review_div" + i).hide();
            $("#go_to_review" + i).click(function() {

                current_blog = parseInt($(this).val());

                if ($("#blog_review_div" + current_blog).is(":hidden")) {
                    $("#blog_review_div" + current_blog).show();
                } else {
                    $("#blog_review_div" + current_blog).hide();
                }

                var blog_id = $("#blog_id" + current_blog).val();
                showComment(blog_id, current_blog);

            });

            $("#review_button" + i).click(function() {
                current_blog = parseInt($(this).val());
                var blog_id = $("#blog_id" + current_blog).val();
                var comment = $("#comment" + current_blog).val().trim();
                //console.log("当前blog: "+current_blog+", blog_id为："+blog_id+",内容为："+comment);
                if (comment.length > 0) {
                    //console.log("+"+comment+"+")
                    commentSave(blog_id, comment);
                    showComment(blog_id, current_blog);

                } else {
                    $("#comment" + current_blog).val("评论信息不能我空！");
                }
                setTimeout(function() {
                    $("#comment" + current_blog).val("");
                }, 1500);

            });

        }
    }
    reviw_function();

    //分页工具条相关的js代码
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

    //分页工具条的显示相关
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

});

$(function() {
    $("#td1").hover(function() {
        $("#td1").addClass("hoveron");
    }, function() {
        $("#td1").removeClass('hoveron')
    });

    $("#td2").hover(function() {
        $("#td2").addClass("hoveron");
    }, function() {
        $("#td2").removeClass('hoveron')
    });

    $("#td3").hover(function() {
        $("#td3").addClass("hoveron");
    }, function() {
        $("#td3").removeClass('hoveron')
    });

    $("#td4").hover(function() {
        $("#td4").addClass("hoveron2");
    }, function() {
        $("#td4").removeClass("hoveron2");
    });

    $(".dropdown-toggle").dropdown();
    $(".navbar-inner").scrollspy();

    $('#myTab a').click(function(e) {
        e.preventDefault();
        $(this).tab('show');
    });

    $("#set").click(function() {
        if ($("#user_set").attr("style") == "visibility: hidden") {
            $("#user_set").attr("style", "visibility: visible");
        } else {
            $("#user_set").attr("style", "visibility: hidden");
        }
        //$("#user_set").hide();
    });
});