package com.heeexy.example.dao;

import com.alibaba.fastjson.JSONObject;

import java.util.List;


public interface PersonmonitorDao {
	/**
	 * 新增布控人员
	 */
	int addPersonmonitor(JSONObject jsonObject);



	/**
	 * 查询布控人员
	 */
	List<JSONObject> listPersonmonitor(JSONObject jsonObject);

}
