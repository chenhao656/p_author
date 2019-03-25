package com.heeexy.example.controller;

import javax.servlet.http.HttpServletRequest;

import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.service.CollectPointService;
import com.heeexy.example.util.CommonUtil;

@RestController
@RequestMapping("/collectpoint")
public class CollectPointController {
	
	@Autowired
	private CollectPointService collectPointService;
	
	/**
	 * 新增采集点
	 */
	@PostMapping("/addCollectPoint")
	public JSONObject addCollectPoint(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.addCollectPoint(requestJson);
	}
	/**
	 * 删除采集点
	 */
	@PostMapping("/delCollectPoint")
	public JSONObject delCollectPoint(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.deleteCollectPoint(requestJson);
	}
	
	/**
	 * 获取采集点
	 */
	@GetMapping("/listCollectPoint")
	public JSONObject listCollectPoint(HttpServletRequest request) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.listCollectPoint(CommonUtil.request2Json(request));
	}
	
	/**
	 * 新增同步信息
	 */
	@PostMapping("/addCollectPointSync")
	public JSONObject addCollectPointSync(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.addCollectPointSync(requestJson);
	}
	
	/**
	 * 删除同步信息
	 */
	@PostMapping("/delCollectPointSync")
	public JSONObject delCollectPointSync(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.delCollectPointSync(requestJson);
	}
	/**
	 * 获取同步信息
	 */
	@GetMapping("/listCollectPointSync")
	public JSONObject listCollectPointSync(HttpServletRequest request) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return collectPointService.listCollectPointSync(CommonUtil.request2Json(request));
	}
}
