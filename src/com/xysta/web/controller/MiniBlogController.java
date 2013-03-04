package com.xysta.web.controller;

import java.sql.Timestamp;
import java.util.Date;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.xysta.web.model.MiniBlog;
import com.xysta.web.model.User;
import com.xysta.web.util.ResponseData;

public class MiniBlogController extends Controller{
	
	private ResponseData responseData = new ResponseData();
	
	@ActionKey("/count")
	public void count(){
		renderJson(new ResponseData(true, 10));
	}
	
	@ActionKey("save")
	public void save(){
		MiniBlog mb = new MiniBlog();
		mb.set("content", getPara("content"))
		//.set("author", getPara("author"))
		  .set("author", this.<User>getSessionAttr("user").get("nickname"))
		  .set("createtime", new Timestamp(new Date().getTime()));
		mb.save();
		renderJson(responseData.set(true).set(mb));
	}
	
	
	//·ÖÒ³²å¼þ
	@ActionKey("paginate")
	public void paginate() {
		//setAttr("blogPage",MiniBlog.dao.paginate(getParaToInt(0, 1), 3, "select *", "from xysta_blog order by id asc"));
		Page page= MiniBlog.dao.paginate(getParaToInt("pageNumber", 1), getParaToInt("pageSize", 15), "select *", "from xysta_blog order by id desc");
		renderJson(responseData.set(true).set(page));
	}
	
	@ActionKey("list")
	public void list(){
		renderJson(responseData.set(true).set(MiniBlog.dao.find("select * from xysta_blog")));
	}
}
