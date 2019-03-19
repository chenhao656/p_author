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
	
	/**
	 * 分页总数
	 */	
	int countPersonmonitor(JSONObject jsonObject);
	
	/**
	 * 导入更新
	 */	
    int updatePersonmonitor(JSONObject jsonObject);

	/**
	 *修改个人状态
	 */
    int updatePersonmonitorbyid(JSONObject jsonObject);
 
	/**
	 * 删除布控人员
	 */
    int deletePersonmonitor(JSONObject jsonObject);

	/**
	 * 查询布控人员
	 */
	List<JSONObject> queryPersonmonitor(JSONObject jsonObject);
}
