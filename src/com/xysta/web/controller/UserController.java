package com.xysta.web.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.POST;
import com.xysta.web.model.User;
import com.xysta.web.util.DateTimeUtil;
import com.xysta.web.util.ResponseData;

public class UserController extends Controller{
	private ResponseData data = null;

	public void sync(){
		renderJson(new ResponseData(getSessionAttr("user") == null ?false:true,getSessionAttr("user")));
	}
}
