package com.xysta.web.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.jfinal.core.ActionKey;
import com.jfinal.core.Controller;
import com.xysta.web.model.MiniBlog;
import com.xysta.web.model.Relation;
import com.xysta.web.model.User;
import com.xysta.web.service.RelationService;
import com.xysta.web.util.ResponseData;

public class RelationController extends Controller {
	private ResponseData data = null;

	@ActionKey("/getCurUserRelaData")
	public void getCurUserRelaData() {

		int mybroadcast = 0, ihavelistened = 0, mylistener = 0;
		Map<String, Integer> userData = new HashMap<String, Integer>();
		User user = this.<User> getSessionAttr("user");
		if (user != null) {
			String nickname = user.getStr("nickname");
			int userId = user.getInt("id");

			mybroadcast = MiniBlog.getCount(nickname);
			ihavelistened = Relation.getlisten1(userId).size()
					+ Relation.getlisten2(userId).size();
			mylistener = Relation.getsay1(userId).size()
					+ Relation.getsay2(userId).size();

		}
		userData.put("mybroadcast", mybroadcast);
		userData.put("ihavelistened", ihavelistened);
		userData.put("mylistener", mylistener);
		data = new ResponseData(true, userData);
		renderJson(data);
	}

	@ActionKey("/relationCheck")
	public void relationCheck() {
		int listenerId = getParaToInt("listenerid");
		int sayerId = getParaToInt("sayerid");

		Relation relation = Relation.findone(sayerId, listenerId);

		if (relation != null) {
			int type = relation.getInt("type");
			if (type == 0) {
				relation.set("type", 1);
				relation.update();
				data = new ResponseData(true, relation);
				setSessionAttr("relation", relation);
			} else {
				data = new ResponseData(false, "已收听");
			}
		} else {

			Relation r = Relation.findone(listenerId, sayerId);
			if (r != null) {
				data = new ResponseData(false, "已收听");
			} else {
				Relation rel = new Relation();
				rel.set("listener_id", listenerId).set("sayer_id", sayerId);
				rel.save();
				data = new ResponseData(true, rel);
				setSessionAttr("relation", rel);
			}

		}
		renderJson(data);
	}

	@ActionKey("/getlistencount")
	public void getlistencount() {
		int listenerId = getParaToInt("listenerid");
		// Relation relation = new Relation();
		int count = Relation.getlisten1(listenerId).size()
				+ Relation.getlisten2(listenerId).size();
		data = new ResponseData(true, count);
		renderJson(data);
	}

	@ActionKey("/getsaycount")
	public void getsaycount() {
		int sayerid = getParaToInt("sayerid");
		int count = Relation.getsay1(sayerid).size()
				+ Relation.getsay2(sayerid).size();
		data = new ResponseData(true, count);
		renderJson(data);
	}

	@ActionKey("/getlistenerlist")
	public void getlistenerlist() {
		int listenerid = getParaToInt("listenerid");
		List<User> user = new ArrayList<User>();
		List<Relation> userList1 = Relation.getlisten1(listenerid);
		List<Relation> userList2 = Relation.getlisten2(listenerid);
		Set<Integer> userid = new HashSet<Integer>();
		RelationService.getSet1(userid, userList1);
		RelationService.getSet2(userid, userList2);
		data = new ResponseData(true, RelationService.getUserList(user, userid));
		renderJson(data);
	}

	@ActionKey("/getsayerlist")
	public void getsayerlist() {
		int sayerid = getParaToInt("sayerid");
		List<Relation> userList1 = Relation.getsay1(sayerid);
		List<Relation> userList2 = Relation.getsay2(sayerid);
		Set<Integer> userid = new HashSet<Integer>();
		List<User> user = new ArrayList<User>();
		RelationService.getSet2(userid, userList1);
		RelationService.getSet1(userid, userList2);
		data = new ResponseData(true, RelationService.getUserList(user, userid));
		renderJson(data);

	}

	@ActionKey("/cancelListen")
	public void cancelListen() {
		int listenerId = getParaToInt("listenerid");
		int sayerId = getParaToInt("sayerid");

		Relation relation = Relation.findone(listenerId, sayerId);
		if (relation != null) {
			if (relation.getInt("type") == 0) {
				data = new ResponseData(relation.delete(), null);
			} else {
				relation.set("listener_id", sayerId)
						.set("sayer_id", listenerId).set("type", 0);
				relation.update();
				data = new ResponseData(true, relation);
				setSessionAttr("relation", relation);
			}
		} else {
			Relation rel = Relation.findone(sayerId, listenerId);
			if (rel != null) {
				if (rel.getInt("type") != 0) {
					rel.set("type", 0);
					rel.update();
					data = new ResponseData(true, relation);
					setSessionAttr("relation", relation);
				} else {
					data = new ResponseData(false, "已经取消收听");
				}
			} else {
				data = new ResponseData(false, "取消错误");
			}
		}
		renderJson(data);
	}
}
