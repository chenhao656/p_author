package com.heeexy.example.service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;

public interface CollectPointService {
	/**
	 * 删除采集点
	 */
	JSONObject deleteCollectPoint(JSONObject jsonObject);
	/**
	 * 新增采集点
	 */
	JSONObject addCollectPoint(JSONObject jsonObject);
	/**
	 * 采集点同步信息
	 */
	JSONObject addCollectPointSync(JSONObject jsonObject);
	/**
	 * 查询采集点信息
	 */
	JSONObject listCollectPoint(JSONObject jsonObject);
	/**
	 * 获取同步信息
	 */
	JSONObject listCollectPointSync(JSONObject jsonObject);
	/**
	 * 删除同步信息
	 */
	JSONObject delCollectPointSync(JSONObject jsonObject);
}
