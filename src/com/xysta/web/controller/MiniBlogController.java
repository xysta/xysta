package com.xysta.web.controller;

import java.io.File;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import com.google.gson.Gson;
import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.jfinal.plugin.activerecord.Page;
import com.jfinal.upload.UploadFile;
import com.xysta.web.model.MiniBlog;
import com.xysta.web.model.User;
import com.xysta.web.util.PathUtil;
import com.xysta.web.util.ResponseData;

public class MiniBlogController extends Controller {

	private ResponseData responseData = new ResponseData();

	@ActionKey("/save")
	public void save() {
		MiniBlog mb = new MiniBlog();
		mb.set("content", getPara("content"))
				.set("imagepath", this.getSessionAttr("imagepath"))
				.set("author",
						this.<User> getSessionAttr("user").get("nickname"))
				.set("createtime", new Timestamp(new Date().getTime()));
		mb.save();
		this.removeSessionAttr("imagepath");
		renderJson(responseData.set(true).set(mb));
	}

	// 分页插件
	@ActionKey("/paginate")
	public void paginate() {
		Page page = MiniBlog.dao.paginate(getParaToInt("pageNumber", 1),
				getParaToInt("pageSize", 15), "select *",
				"from xysta_blog order by id desc");
		renderJson(responseData.set(true).set(page));
	}

	@ActionKey("/uploadAImg")
	public void uploadAImg() {
		// 使用绝对路径
		// String filePath =
		// "E://MyEclipse_Workspaces/MyEclipse/xysta/WebRoot/upload";
		UploadFile file = getFile();
		// String fileId = getPara("fileId");
		String fileId = "2";
		String oriFileName = file.getOriginalFileName();
		String exName = PathUtil.getExtensionName(oriFileName);

		file.getFile()
				.renameTo(
						new File(PathUtil.BASE__PATH + "/img/" + fileId + "."
								+ exName));
		String filePath = "upload/img/" + fileId + "." + exName;
		String path = "{'filePath':" + "'" + filePath + "'}";
		renderHtml(filePath);

	}

	@ActionKey("/uploadImg")
	public void uploadImg() {
		// String mHttpUrl = request.getRealPath("") + "/" + SYSTEM.ROOT_PATH;
		String mHttpUrl = getSession().getServletContext().getRealPath("")+ File.separator+ PathUtil.UPLOAD_IMG;
		System.out.println(mHttpUrl);
		List<UploadFile> ups = getFiles(mHttpUrl);
		List<String> fileList = new ArrayList<String>();
		for (int i = 0; i < ups.size(); i++) {
			UploadFile uploadFile = ups.get(i);

			File f = uploadFile.getFile();
			// String param = uploadFile.getParameterName();
			String type = f.getName().substring(f.getName().lastIndexOf("."),
					f.getName().length());
			System.out.println(type + "---" + ups.size());
			File newFile = new File(mHttpUrl + System.currentTimeMillis()
					+ type);
			f.renameTo(newFile);
			// /System.out.println("第"+i+"个文件的名字："+ newFile.getName());
			fileList.add(PathUtil.UPLOAD_IMG + newFile.getName());

		}

		setSessionAttr("imagepath", new Gson().toJson(fileList));
		renderHtml("图片上传成功!");

	}

	@ActionKey("/list")
	public void list() {
		renderJson(responseData.set(true).set(
				MiniBlog.dao.find("select * from xysta_blog")));
	}
	
	@ActionKey("/getco")
	public void getco(){
		String nickname = getPara("nickname");
		renderJson(responseData.set(true).set(MiniBlog.getCount(nickname)));
	}
}
