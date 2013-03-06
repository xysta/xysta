package com.xysta.web.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.ext.interceptor.POST;
import com.xysta.web.model.User;
import com.xysta.web.util.DateTimeUtil;
import com.xysta.web.util.ResponseData;

public class MainController extends Controller{

    private ResponseData data = null;

	public void index(){
		renderJsp("index.jsp");
	}

    @ActionKey("/login")
    @Before({POST.class})   //POST.class 过滤请求方式
    public void login() {
        String email = getPara("email");
        String password = getPara("password");

        User user = User.findOneUser(email, password);

        if(user!=null){
            data=new ResponseData(true, user);
            setSessionAttr("user", user);
        }else{
            data=new ResponseData(false, "登录失败");
        }
        renderJson(data);
    }

    @ActionKey("/logout")
    @Before({POST.class})
    public void logout() {
        renderJson(new ResponseData().set(true).set(new User()));
    }



    @ActionKey("/register")
    @Before({POST.class})
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

}
