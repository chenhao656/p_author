package com.heeexy.example.service;

import com.alibaba.fastjson.JSONObject;

/**
 * @author: hxy
 * @date: 2017/10/24 16:06
 */
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
	 * 更新文章
	 */
//	JSONObject updateArticle(JSONObject jsonObject);
}
