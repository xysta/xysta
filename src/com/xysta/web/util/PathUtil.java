package com.xysta.web.util;

public class PathUtil {
	//BASE_UPLOAD_PATH 为上传文件的绝对路径
	public static final String BASE__PATH = "E://MyEclipse_Workspaces/MyEclipse/xysta/WebRoot/";
	public static final String UPLOAD_IMG ="upload/img/";
	//获取文件的后缀名
	public static String getExtensionName(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length() - 1))) {
				return filename.substring(dot + 1);
			}
		}
		return filename;
	}

	public static String getFileNameNoEx(String filename) {
		if ((filename != null) && (filename.length() > 0)) {
			int dot = filename.lastIndexOf('.');
			if ((dot > -1) && (dot < (filename.length()))) {
				return filename.substring(0, dot);
			}
		}
		return filename;
	}
}
