package com.xysta.web.model;

import com.jfinal.plugin.activerecord.Model;
import com.jfinal.plugin.activerecord.Page;

public class MiniBlog extends Model<MiniBlog> {
	/**
	 * 
	 */

	private static final long serialVersionUID = 2757228935607940213L;
	public static MiniBlog dao = new MiniBlog();
	
	public static Page initial(int pageSize){
		Page firstPage = dao.paginate(1, pageSize, "select *", "from xysta_blog order by id desc");
	
		//List list = firstPage.getList();
		return firstPage;
		//return new Gson().toJson(firstPage);
	}
}
