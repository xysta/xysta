package com.xysta.web.service;

import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Set;

import com.google.gson.JsonObject;
import com.xysta.web.model.Relation;
import com.xysta.web.model.User;

public class RelationService {

	public static Set<Integer> getSet1(Set<Integer> s1, List<Relation> l2) {
		for (int i = 0; i < l2.size(); i++) {
			Relation re = l2.get(i);
			s1.add(re.getInt("sayer_id"));
		}
		return s1;
	}

	public static Set<Integer> getSet2(Set<Integer> s1, List<Relation> l2) {
		for (int i = 0; i < l2.size(); i++) {
			Relation re = l2.get(i);
			s1.add(re.getInt("listener_id"));
		}
		return s1;
	}

	public static List<User> getUserList(List<User> l1, Set<Integer> s1) {
		Iterator<Integer> it = s1.iterator();
		while (it.hasNext()) {
			int id = (Integer) it.next();
			l1.add(User.findById(id));
		}
		return l1;
	}

    public JsonObject count(Map<String, Object> params){
        return null;
    }
}
