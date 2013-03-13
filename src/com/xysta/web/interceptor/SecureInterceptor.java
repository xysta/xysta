package com.xysta.web.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;
import com.jfinal.core.Controller;
import com.xysta.web.model.User;

/**
 * Created with IntelliJ IDEA.
 * User: Administrator
 * Date: 13-3-13
 * Time: 下午12:13
 * To change this template use File | Settings | File Templates.
 */
public class SecureInterceptor implements Interceptor{
    @Override
    public void intercept(ActionInvocation actionInvocation) {
        Controller controller = actionInvocation.getController();
        if (controller.getSessionAttr("user") != null && controller.<User>getSessionAttr("user").getInt("id") > 0){
            actionInvocation.invoke();
        }else {
            controller.redirect("/login");
        }

    }
}
