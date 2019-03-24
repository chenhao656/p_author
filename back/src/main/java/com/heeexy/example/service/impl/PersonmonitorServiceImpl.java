package com.heeexy.example.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.PersonmonitorDao;
import com.heeexy.example.service.PersonmonitorService;
import com.heeexy.example.util.CommonUtil;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;
import java.util.List;


@Service
public class PersonmonitorServiceImpl implements PersonmonitorService {

	@Autowired
	private PersonmonitorDao personmonitorDao;

	/**
	 * 新增布控人员
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public JSONObject addPersonmonitor(JSONObject jsonObject) {
		personmonitorDao.addPersonmonitor(jsonObject);
		return CommonUtil.successJson();
	}

	/**
	 * 列表
	 */
	@Override
	public JSONObject listPersonmonitor(JSONObject jsonObject) {
		CommonUtil.fillPageParam(jsonObject);
		int count=personmonitorDao.countPersonmonitor(jsonObject);
		List<JSONObject> list = personmonitorDao.listPersonmonitor(jsonObject);
		return CommonUtil.successPage(jsonObject, list, count);
	}

	
	/**
	 * 批量导入布控人员
	 */
	@Override
	@Transactional(rollbackFor = Exception.class)
	public JSONObject bulkimportPersonmonitor(JSONArray requestJson) {
		// TODO Auto-generated method stub
		for(int i=0;i<requestJson.size();i++) {
			int k=personmonitorDao.confirmPersonmonitor(requestJson.getJSONObject(i));
			if(0==k) {
			    personmonitorDao.addPersonmonitor(requestJson.getJSONObject(i));
			}else {
				personmonitorDao.updatePersonmonitor(requestJson.getJSONObject(i));
			}
		}
		
		return CommonUtil.successJson();
	}
	
	@Override
	public JSONObject updatePersonmonitor(JSONObject jsonObject) {
		
		personmonitorDao.updatePersonmonitorbyid(jsonObject);
		return CommonUtil.successJson();
	}
	
	@Override
	public JSONObject deletePersonmonitor(JSONArray jsonObject) {
		for(int i=0;i<jsonObject.size();i++) {
			personmonitorDao.deletePersonmonitor(jsonObject.getJSONObject(i));
		}
		return CommonUtil.successJson();
	}

	
	@Override
	public JSONObject queryPersonmonitor(JSONObject jsonObject) {		
		List<JSONObject> list = personmonitorDao.queryPersonmonitor(jsonObject);
		return CommonUtil.successPage(list);
	}

}
