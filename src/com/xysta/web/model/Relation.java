package com.xysta.web.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class Relation extends Model<Relation> {

	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	public static Relation dao = new Relation();


	public static Relation findone(int listenerid,int sayerid){
		return dao.findFirst(
				"select * from xysta_relation where listener_id=? and sayer_id = ?", listenerid,sayerid);  
	}

	/**  listen list **/
	public static List<Relation> getlisten1(int listenerid){
		return dao.find("select * from xysta_relation where  listener_id=? ", listenerid);

	}

	/** type:1 listen list **/
	public static List<Relation> getlisten2(int listenerid){
		return dao.find("select * from xysta_relation where type=1 and sayer_id=?", listenerid);	
	}

	/**  say list **/
	public static List<Relation> getsay1(int sayerid){
		return dao.find("select * from xysta_relation  where sayer_id=? ", sayerid);	
	}

	/** type:1 say list **/
	public static List<Relation> getsay2(int sayerid){
		return dao.find("select * from xysta_relation where type=1 and listener_id=?", sayerid);	
	}

	public static boolean add(int listenerid,int sayerid){
		dao.set("listener_id", listenerid).set("sayer_id", sayerid);
		return dao.save();
	}


}
