package com.heeexy.example.dao;

import com.alibaba.fastjson.JSONObject;

import java.util.List;

/**
 * @author: hxy
 * @description: 文章Dao层
 * @date: 2017/10/24 16:06
 */
public interface PersonmonitorDao {
	/**
	 * 新增布控人员
	 */
	int addPersonmonitor(JSONObject jsonObject);

	/**
	 * 统计文章总数
	 */
//	int countArticle(JSONObject jsonObject);

	/**
	 * 查询布控人员
	 */
	List<JSONObject> listPersonmonitor(JSONObject jsonObject);

	/**
	 * 更新文章
	 */
	//int updateArticle(JSONObject jsonObject);
}
