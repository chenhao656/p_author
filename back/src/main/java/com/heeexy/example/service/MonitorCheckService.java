package com.heeexy.example.service;

import com.alibaba.fastjson.JSONObject;


public interface MonitorCheckService {


	/**
	 * 查询已发生的布控人员列表
	 */
	JSONObject listMonitorCheck(JSONObject jsonObject);
	
	/**
	 *修改人员状态为已处理
	 */
	JSONObject changeMonitor(JSONObject jsonObject);
	
	/**
	 * 展示已经进入的监控人员
	 */
	JSONObject monitorEntry(JSONObject jsonObject);
	
}

