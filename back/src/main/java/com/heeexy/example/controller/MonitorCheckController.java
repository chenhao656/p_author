package com.heeexy.example.controller;

import javax.servlet.http.HttpServletRequest;

import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.service.MonitorCheckService;
import com.heeexy.example.util.CommonUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

//import javax.servlet.http.HttpServletRequest;

@RestController
@RequestMapping("/monitorcheck")
public class MonitorCheckController {
	
	@Autowired
	private MonitorCheckService monitorCheckService;
	
	/**
	 * 查询是否有黑名单人员进入
	 */
	@RequiresPermissions("monitorcheck:list")
	@GetMapping("/listmonitorcheck")
	public JSONObject listPersonmonitor(HttpServletRequest request) {
		return monitorCheckService.listMonitorCheck(CommonUtil.request2Json(request));
	}
}
