package com.heeexy.example.service.impl;

import com.alibaba.fastjson.JSONArray;
import com.alibaba.fastjson.JSONObject;
import com.heeexy.example.dao.PersonmonitorDao;
import com.heeexy.example.service.PersonmonitorService;
import com.heeexy.example.util.CommonUtil;

import org.apache.tomcat.util.http.fileupload.servlet.ServletFileUpload;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
//import org.springframework.transaction.annotation.Transactional;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.web.multipart.MultipartFile;

import java.io.File;
import java.io.IOException;
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

	@Override
	public String uploadPhoto(MultipartFile file, String path) {
		String fileName = file.getOriginalFilename();
        //String fileExtensionName = fileName.substring(fileName.lastIndexOf(".") + 1);
        //String uploadFileName = UUID.randomUUID().toString() + "." + fileExtensionName;
        //logger.info("开始上传文件，上传的文件名是: {}，上传的路径是: {}，新文件名：{}", fileName, path, uploadFileName);

        File fileDir = new File(path);
        if (!fileDir.exists()) {
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        
        File targetFile = new File(path, fileName);

        try {
            file.transferTo(targetFile);

        } catch (IOException e) {
            //logger.error("上传文件异常", e);
            return null;
        }
        JSONObject js=new JSONObject();
        String stock_path=path.substring(path.indexOf("static")-1, path.length())+"\\"+fileName;
        js.put("id_card", fileName.substring(0, fileName.indexOf(".")));
        js.put("stock_path",stock_path);
        personmonitorDao.updateStockphoto(js);
        return targetFile.getName();
	}

	@Override
	public String uploadSinglePhoto(MultipartFile file, String path,String id_card) {
		String fileName = file.getOriginalFilename();
		
		File fileDir = new File(path);
        if (!fileDir.exists()) {
            fileDir.setWritable(true);
            fileDir.mkdirs();
        }
        
        File targetFile = new File(path, fileName);

        try {
            file.transferTo(targetFile);

        } catch (IOException e) {
            //logger.error("上传文件异常", e);
            return null;
        }
        String stock_path=path.substring(path.indexOf("static")-1, path.length())+"\\"+fileName;
        JSONObject js=new JSONObject();
        js.put("id_card", id_card);
        js.put("stock_path",stock_path);
        personmonitorDao.updateStockphoto(js);
        
        return targetFile.getName();
	}

}
