package com.heeexy.example.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


public interface PersonmonitorService {
	/**
	 * 新增布控人员
	 */
	JSONObject addPersonmonitor(JSONObject jsonObject);

	/**
	 * 查询布控人员
	 */
	JSONObject listPersonmonitor(JSONObject jsonObject);

	/**
	 * 批量导入
	 */
	JSONObject bulkimportPersonmonitor(JSONArray requestJson);
	/**
	 * 修改布控人员
	 */
	JSONObject updatePersonmonitor(JSONObject jsonObject);
	/**
	 * 删除布控人员
	 */
	JSONObject deletePersonmonitor(JSONArray jsonObject);
	/**
	 * 查询布控人员
	 */
	JSONObject queryPersonmonitor(JSONObject jsonObject);
	
}
