package com.xysta.web.controller;

import com.jfinal.core.Controller;

public class MainController extends Controller{

	public void index(){
		renderJsp("index.jsp");
	}

}
