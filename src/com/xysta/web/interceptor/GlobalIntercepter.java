package com.xysta.web.interceptor;

import com.jfinal.aop.Interceptor;
import com.jfinal.core.ActionInvocation;

public class GlobalIntercepter implements Interceptor{
    @Override
    public void intercept(ActionInvocation ai) {
        ai.invoke();
    }
}
