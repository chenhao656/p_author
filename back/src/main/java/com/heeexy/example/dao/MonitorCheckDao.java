package com.heeexy.example.dao;

import java.util.List;

import com.alibaba.fastjson.JSONObject;

public interface MonitorCheckDao {
	/**
	 * 检查是否有布控人员进入
	 */
	List<JSONObject> listMonitorCheck(JSONObject jsonObject);
	
	/**
	 * 更新布控人员状态
	 */
	int changeMonitor(JSONObject jsonObject);
	
	
	/**
	 * 展示新进入的监控人员列表
	 */
	List<JSONObject> monitorEntry(JSONObject jsonObject);
}
