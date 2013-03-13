package com.xysta.web.controller;

import com.jfinal.aop.Before;
import com.jfinal.core.Controller;
import com.xysta.web.interceptor.MainInterceptor;

public class MainController extends Controller{


	public void index(){
		renderJsp("index.jsp");
	}
	
	
}
