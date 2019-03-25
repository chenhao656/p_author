package com.heeexy.example.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface CollectPointDao {
	/**
	 * 新增采集点
	 */
	int addCollectPoint(JSONObject jsonObject);
	/**
	 * 获取采集点是否存在信息
	 */
	int getCollectPoint(JSONObject jsonObject);
	/**
	 * 获取采集点信息
	 */
	List<JSONObject> listCollectPoint(JSONObject jsonObject);
	/**
	 * 删除采集点
	 */
	int delCollectPoint(JSONObject jsonObject);
	/**
	 * 同步布控人员信息到采集点
	 */
	int addCollectPointSync(JSONObject jsonObject);
	
	/**
	 * 获取同步信息
	 */
	List<JSONObject> listCollectPointSync(JSONObject jsonObject);
	/**
	 * 删除同步信息
	 */
	int delCollectPointSync(JSONObject jsonObject);	
	/**
	 * 删除同步信息
	 */
	List<JSONObject> getCollectPointid(JSONObject jsonObject);	
}
