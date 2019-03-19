package com.heeexy.example.controller;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.service.PersonmonitorService;
import com.heeexy.example.util.CommonUtil;
import org.apache.shiro.authz.annotation.RequiresPermissions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.*;

import javax.servlet.http.HttpServletRequest;


@RestController
@RequestMapping("/personmonitor")
public class PersonMonitorController {

	@Autowired
	private PersonmonitorService personmonitorService;

	/**
	 * 查询布控人员详情
	 */
	@RequiresPermissions("personmonitor:list")
	@GetMapping("/listPersonmonitor")
	public JSONObject listPersonmonitor(HttpServletRequest request) {
		return personmonitorService.listPersonmonitor(CommonUtil.request2Json(request));
	}

	/**
	 * 新增布控人员
	 */
	@RequiresPermissions("personmonitor:add")
	@PostMapping("/addPersonmonitor")
	public JSONObject addPersonmonitor(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return personmonitorService.addPersonmonitor(requestJson);
	}

	/**
	 * 批量导入布控人员
	 */	
	@PostMapping("/bulkaddPersonmonitor")
	public JSONObject bulkaddPersonmonitor(@RequestBody JSONArray requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return personmonitorService.bulkimportPersonmonitor(requestJson);
	}
	
	/**
	 * 删除布控人员
	 */
	@RequiresPermissions("personmonitor:delete")
	@PostMapping("/deletePersonmonitor")
	public JSONObject deletePersonmonitor(@RequestBody JSONArray requestJson) {
		return personmonitorService.deletePersonmonitor(requestJson);
	}
	/**
	 * 修改布控人员
	 */
	@RequiresPermissions("personmonitor:update")
	@PostMapping("/updatepersonmonitor")
	public JSONObject updatePersonmonitor(@RequestBody JSONObject requestJson) {
		//CommonUtil.hasAllRequired(requestJson, "content");
		return personmonitorService.updatePersonmonitor(requestJson);
	}
	/**
	 * 条件布控人员详情
	 */
	@RequiresPermissions("personmonitor:list")
	@GetMapping("/queryPersonmonitor")
	public JSONObject queryPersonmonitor(HttpServletRequest request) {
		return personmonitorService.queryPersonmonitor(CommonUtil.request2Json(request));
	}
}
