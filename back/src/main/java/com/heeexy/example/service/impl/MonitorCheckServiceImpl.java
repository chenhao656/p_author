package com.heeexy.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.MonitorCheckDao;
import com.heeexy.example.service.MonitorCheckService;
import com.heeexy.example.util.CommonUtil;


@Service
public class MonitorCheckServiceImpl implements MonitorCheckService{

	
	@Autowired
	private MonitorCheckDao monitorCheckDao;
	
	
	@Override
	public JSONObject listMonitorCheck(JSONObject jsonObject) {
		// TODO Auto-generated method stub
		CommonUtil.fillPageParam(jsonObject);

		List<JSONObject> list = monitorCheckDao.listMonitorCheck(jsonObject);
		return CommonUtil.successPage(jsonObject, list, 0);
	}

}
