package com.xysta.web.controller;

import java.util.List;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;

import com.xysta.web.model.Comment;
import com.xysta.web.model.User;
import com.xysta.web.util.DateTimeUtil;
import com.xysta.web.util.ResponseData;

public class CommentController extends Controller {
	private ResponseData responseData = new ResponseData();

	@ActionKey("commentSave")
	public void commentSave() {
		Comment ct = new Comment();
		User user = (User)this.getSessionAttr("user");
		String nickname = user.getStr("nickname");
		ct.set("blog_id", getParaToInt("blog_id"))
				.set("comment", getPara("comment"))
			//	.set("reviewer", getPara("reviewer"))
				.set("reviewer", "����sb��")
				.set("review_time", DateTimeUtil.getTimeString());
		ct.save();
		renderJson(responseData.set(true).set(ct));
	}
	

	@ActionKey("showSessionUser")
	public void showSessionUser() {
		
		User user = (User)this.getSessionAttr("user");
		//String nickname = user.getStr("nickname");
		String nickname = user.get("nickname");
		renderJson(responseData.set(true).set(nickname));
	}
	
	@ActionKey("findCommentByBlogid") //url太长了，可以直接用find，然后根据参数查找
	public void findCommentByBlogid() {
		List list =Comment.dao.find(
				"select * from xysta_comment where blog_id=?",
				getParaToInt("blog_id"));
		renderJson(responseData.set(true).set(list));
	}
}
