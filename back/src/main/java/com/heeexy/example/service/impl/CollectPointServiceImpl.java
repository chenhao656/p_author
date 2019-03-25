package com.heeexy.example.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.CollectPointDao;
import com.heeexy.example.service.CollectPointService;
import com.heeexy.example.util.CommonUtil;


@Service
public class CollectPointServiceImpl implements CollectPointService{

	
	@Autowired
	private CollectPointDao collectPointDao;
	
	
	@Override
	public JSONObject deleteCollectPoint(JSONObject jsonObject) {
		collectPointDao.delCollectPoint(jsonObject);
		return CommonUtil.successJson();
	}

	@Override
	public JSONObject addCollectPoint(JSONObject jsonObject) {
		int i=collectPointDao.getCollectPoint(jsonObject);
		if(i==0) {
		   collectPointDao.addCollectPoint(jsonObject);
		}
		return CommonUtil.successJson();
	}

	@Override
	public JSONObject addCollectPointSync(JSONObject jsonObject) {
		// TODO Auto-generated method stub
		List<JSONObject> id_list=collectPointDao.getCollectPointid(null);
		JSONObject syncJson=new JSONObject();
		for(int i=0;i<id_list.size();i++) {
			syncJson.put("point_id", id_list.get(i).get("id"));
			syncJson.put("deal_type", jsonObject.get("deal_type"));
			collectPointDao.addCollectPointSync(syncJson);
		}
		return CommonUtil.successJson();
	}

	@Override
	public JSONObject listCollectPoint(JSONObject jsonObject) {
		// TODO Auto-generated method stub
		CommonUtil.fillPageParam(jsonObject);

		List<JSONObject> list = collectPointDao.listCollectPoint(jsonObject);
		return CommonUtil.successPage(jsonObject, list, 0);
	}

	@Override
	public JSONObject listCollectPointSync(JSONObject jsonObject) {
		// TODO Auto-generated method stub
		CommonUtil.fillPageParam(jsonObject);

		List<JSONObject> list = collectPointDao.listCollectPointSync(jsonObject);
		return CommonUtil.successPage(jsonObject, list, 0);
	}

	@Override
	public JSONObject delCollectPointSync(JSONObject jsonObject) {
		collectPointDao.delCollectPointSync(jsonObject);
		return CommonUtil.successJson();
	}

}
