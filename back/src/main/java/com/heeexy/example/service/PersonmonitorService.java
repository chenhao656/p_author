package com.heeexy.example.service;

import org.springframework.web.multipart.MultipartFile;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;


public interface PersonmonitorService {
	/**
	 * 新增布控人员
	 */
	JSONObject addPersonmonitor(JSONObject jsonObject);

	/**
	 * 查询布控人员
	 */
	JSONObject listPersonmonitor(JSONObject jsonObject);

	/**
	 * 批量导入
	 */
	JSONObject bulkimportPersonmonitor(JSONArray requestJson);
	/**
	 * 修改布控人员
	 */
	JSONObject updatePersonmonitor(JSONObject jsonObject);
	/**
	 * 删除布控人员
	 */
	JSONObject deletePersonmonitor(JSONArray jsonObject);
	/**
	 * 查询布控人员
	 */
	JSONObject queryPersonmonitor(JSONObject jsonObject);
	
	/**
	 * 上传照片
	 */
	String uploadPhoto(MultipartFile file,String path);
	
	/**
	 * 单张照片上传
	 */
	String uploadSinglePhoto(MultipartFile file,String path,String id_card);
}
