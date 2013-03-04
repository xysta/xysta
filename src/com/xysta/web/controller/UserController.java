package com.xysta.web.controller;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.xysta.web.model.User;
import com.xysta.web.util.DateTimeUtil;
import com.xysta.web.util.ResponseData;

public class UserController extends Controller{
	private ResponseData data = null;

	@ActionKey("/login")
	public void login() {
		String email = getPara("email");
		String password = getPara("password");

		User user = User.findOneUser(email, password);

		if(user!=null){
			//data=new ResponseData(true, user.getStr("email")+"鎭枩鎮紝鐧诲綍鎴愬姛锛�);
			// --------------by shao-------------
			data=new ResponseData(true, user);
			setSessionAttr("user", user);
			// --------------by shao-------------
		}else{
			data=new ResponseData(false, "登录失败");
		}
		renderJson(data);
	}

	@ActionKey("/logout")
	public void logout() {
		renderJson(new ResponseData().set(true).set(new User()));
	}



	@ActionKey("/register")
	public void register(){
		String email = getPara("email");
		String password = getPara("password");
		String nickname = getPara("nickname");
		String realname = getPara("realname");
		String sex = getPara("sex");
		String area = getPara("area");
		String  createtime = DateTimeUtil.getTimeString();

		User temp_user = User.findOneUser(email, password);
		
		if(temp_user == null){
			User user = new User();
			user.set("email", email).set("password", password).set("nickname", nickname)
			    .set("realname", realname).set("sex", sex).set("area", area).set("createtime",createtime);

			user.save();
			if(user.getInt("id")>0){
				//				data=new ResponseData(true, user.getStr("email")+"鎭枩鎮紝娉ㄥ唽鎴愬姛锛�);
				// --------------by shao-------------
				data=new ResponseData(true, user);
				setSessionAttr("user", user);
				// --------------by shao-------------
			}else{
				data=new ResponseData(false, "数据异常");
			}
		}else{
			data=new ResponseData(false, "该用户已存在！");
		}
		renderJson(data);
	}

	public void sync(){
		renderJson(new ResponseData(getSessionAttr("user") == null ?false:true,getSessionAttr("user")));
	}
}
