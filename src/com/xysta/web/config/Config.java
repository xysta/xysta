package com.xysta.web.config;

import com.jfinal.config.Constants;
import com.jfinal.config.Handlers;
import com.jfinal.config.Interceptors;
import com.jfinal.config.JFinalConfig;
import com.jfinal.config.Plugins;
import com.jfinal.config.Routes;
import com.jfinal.plugin.activerecord.ActiveRecordPlugin;
import com.jfinal.plugin.c3p0.C3p0Plugin;
import com.jfinal.render.ViewType;
import com.xysta.web.controller.CommentController;
import com.xysta.web.controller.MainController;
import com.xysta.web.controller.MiniBlogController;
import com.xysta.web.controller.UserController;
import com.xysta.web.model.Comment;
import com.xysta.web.model.MiniBlog;
import com.xysta.web.model.User;

public class Config extends JFinalConfig {

	@Override
	public void configConstant(Constants me) {
		me.setViewType(ViewType.JSP);
		me.setDevMode(true);
	}

	@Override
	public void configRoute(Routes me) {
		me.add("/",MainController.class);
		me.add("/user",UserController.class);
		me.add("/miniblog",MiniBlogController.class);
		me.add("/review",CommentController.class);
	}

	@Override
	public void configPlugin(Plugins me) {
		C3p0Plugin cp = new C3p0Plugin("jdbc:mysql:///xysta?useUnicode=true&characterEncoding=utf-8", "root", "123456");
		me.add(cp);
		ActiveRecordPlugin arp = new ActiveRecordPlugin(cp);
		me.add(arp);
		
		arp.addMapping("xysta_user", User.class);
		arp.addMapping("xysta_blog", MiniBlog.class);
		arp.addMapping("xysta_comment", Comment.class);
	}

	@Override
	public void configInterceptor(Interceptors me) {
		
	}

	@Override
	public void configHandler(Handlers me) {
		
	}

}
