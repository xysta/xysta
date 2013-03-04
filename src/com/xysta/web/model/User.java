package com.xysta.web.model;

import java.util.List;

import com.jfinal.plugin.activerecord.Model;

public class User extends Model<User> {
	/**
	 * 
	 */
	private static final long serialVersionUID = 4232506497204598819L;

	public static final User dao = new User();

	public static List<User> findAll() {
		
		return dao.find("select * from xysta_user");
	}

	public static User findOneUser(String email, String password) {
		return dao.findFirst(
				"select * from xysta_user where email=? and password = ?",
				email, password);
	}

	public User findByEmail(String email) {
		return dao.findFirst("SELECT * FROM xysta_user WHERE email=?", email);
	}
}
