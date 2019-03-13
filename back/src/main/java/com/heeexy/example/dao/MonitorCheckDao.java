package com.heeexy.example.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface MonitorCheckDao {
	/**
	 * 检查是否有布控人员进入
	 */
	List<JSONObject> listMonitorCheck(JSONObject jsonObject);
}
