package com.ybl.action;

import java.io.File;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.model.Company;
import com.ybl.model.Reciritment;
import com.ybl.tool.ObjectFieldValue;
import com.ybl.tool.Upload;

public class ComHomeAction extends ActionSupport {
	private Integer userId;//用户ID
	private Company userInfo = new Company();
	private File upload;//上传的文件
	private String uploadFileName;//文件名
	private String returndata;
	
	//<!-- 进入公司主页，查询部分公司基本信息 -->
	public String companyHome(){
		System.out.println("companyHome");
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		System.out.println("companyHome"+" "+userId);
		CompanyDao comDao = new CompanyDao();
		Company company = comDao.selectById(userId);
		System.out.println("companyHome"+company.getName());
		Map<String,String> maps = new HashMap<String,String>();
		
		//介绍、logo、是否被认证、名称、城市、领域、规模、主页、
		maps.put("comIntroduce", company.getIntroduce());
		maps.put("comLogo", company.getLogo());
		maps.put("comisOk", "已认证");
		if(company.getPhoto()==null){
			maps.put("comisOk", "未认证");
		}
		maps.put("comName", company.getName());
		maps.put("comLocation", company.getLocation());
		maps.put("comField", company.getField());
		System.out.println("wecompanyHome");
		if(company.getSize()!=null)
			maps.put("comSize", company.getSize().toString());
		else
			maps.put("comSize", null);
		System.out.println("recompanyHome");
		maps.put("comWebSite", company.getWebsite());
		
		System.out.println("companyHome"+company.getName());
		//ObjectFieldValue.pushAllField(maps, company, 3, "company");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
		return "comHomePage";
	}
	//查询公司招聘信息
	public String selectReciritment(){
		System.out.println("selectReciritment");
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		ReciritmentDao reDao = new ReciritmentDao();
		System.out.println("selectReciritment");
		List<Reciritment> re = reDao.uSendDateSelectById(userId,3);
		System.out.println("selectReciritment");
		Map<String,String> maps = new HashMap<String,String>();
		//招聘表：最新三条    名字、 发布时间、城市、 月薪、工作年限、学位
		if(re!=null) {
			Iterator it = re.iterator();
			int i=0;
			while(it.hasNext()) {
				i++;
				Reciritment rr = (Reciritment) it.next();
				maps.put("comRecId"+String.valueOf(i), rr.getId().toString());
				maps.put("comRecName"+String.valueOf(i), rr.getPosition().getName());
				if(rr.getSendDate()==null)
					maps.put("comRecSendDate"+String.valueOf(i), null);
				else
					maps.put("comRecSendDate"+String.valueOf(i), rr.getSendDate().toString());
				
				maps.put("comRecCity"+String.valueOf(i), rr.getCity());
				if(rr.getMinSalary()==null)
					maps.put("comRecMinSalary"+String.valueOf(i), null);
				else
					maps.put("comRecMinSalary"+String.valueOf(i), rr.getMinSalary().toString());
				if(rr.getMaxSalary()==null)
					maps.put("comRecMaxSalary"+String.valueOf(i), null);
				else
					maps.put("comRecMaxSalary"+String.valueOf(i), rr.getMaxSalary().toString());
				if(rr.getJobExperience()==null)
					maps.put("comRecJobExperience"+String.valueOf(i),null);
				else 
					maps.put("comRecJobExperience"+String.valueOf(i), rr.getJobExperience().toString());
				if(rr.getDegree()==null)
					maps.put("comRecDegree"+String.valueOf(i), null);
				else
					maps.put("comRecDegree"+String.valueOf(i), rr.getDegree().toString());
			}
		}
		//ObjectFieldValue.pushAllField(maps, re, 3, "reciritment");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
        System.out.println("selectReciritment");
        return "reciritment";
	}
	
	
	//修改公司名字
	public String updateName(){
		Map session = ActionContext.getContext().getSession();
		userId = (Integer)session.get("userId");
		CompanyDao comDao = new CompanyDao();
		if(userInfo == null){
			System.out.println("空空..........");
		}
		userInfo = comDao.updateNameById(userId,userInfo.getName());
		Map<String,String> maps = new HashMap<String,String>();
		maps.put("comName", userInfo.getName());
		maps.put("returnStatus", "1");
		//ObjectFieldValue.pushAllField(maps, userInfo, 0, "company");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
		/*
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("userInfo", userInfo);
		*/
		return SUCCESS;
	}
	//修改公司Logo
	public String updateLogo(){
		Map<String,String> maps = new HashMap<String,String>();
		uploadFileName = uploadFileName.substring(uploadFileName.lastIndexOf('.'));
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		uploadFileName="img\\company\\logo\\"+userId.toString()+uploadFileName;
		Upload up = new Upload(upload,uploadFileName);
		try {
			uploadFileName=up.upload();//存储地址
		} catch (Exception e) {
			e.printStackTrace();
			maps.put("returnStatus", "0");
			JSONObject json=JSONObject.fromObject(maps);
	        returndata=json.toString();
			return "error";
		}
		CompanyDao comDao = new CompanyDao();
		userInfo = comDao.updateLogoById(userId,uploadFileName);
		
		maps.put("comLogo", userInfo.getLogo());
		maps.put("returnStatus", "1");
		//ObjectFieldValue.pushAllField(maps, userInfo, 3, "company");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
        /*
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("userInfo", userInfo);*/
		return SUCCESS;
	}
	
	//修改公司简介
	public String updateIntroduce(){
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		CompanyDao comDao = new CompanyDao();
		userInfo = comDao.updateIntroduceById(userId,userInfo.getIntroduce());
		Map<String,String> maps = new HashMap<String,String>();
		maps.put("comIntroduce", userInfo.getIntroduce());
		maps.put("returnStatus", "1");
		//ObjectFieldValue.pushAllField(maps, userInfo, 0, "company");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
		/*
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("userInfo", userInfo);
		*/
		return SUCCESS;
	}
	
	//修改地点、规模、主页
	public String updateLSW(){
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		CompanyDao comDao = new CompanyDao();
		userInfo = comDao.updateLSWById(userId,userInfo.getLocation(),userInfo.getSize(),userInfo.getWebsite());
		Map<String,String> maps = new HashMap<String,String>();
		maps.put("returnStatus", "1");
		maps.put("comLocation", userInfo.getLocation());
		if(userInfo.getSize()==null)
			maps.put("comSize", null);
		else
			maps.put("comSize", userInfo.getSize().toString());
		maps.put("comWebSite", userInfo.getWebsite());
		//ObjectFieldValue.pushAllField(maps, userInfo, 0, "company");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
		/*
		Map request=(Map)ActionContext.getContext().get("request");
		request.put("userInfo", userInfo);
		*/
        System.out.println("修改地点、规模、主页后..........");
		return SUCCESS;
	}
	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Company getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(Company userInfo) {
		this.userInfo = userInfo;
	}
	public File getUpload() {
		return upload;
	}
	public void setUpload(File upload) {
		this.upload = upload;
	}
	public String getUploadFileName() {
		return uploadFileName;
	}
	public void setUploadFileName(String uploadFileName) {
		this.uploadFileName = uploadFileName;
	}
	public String getReturndata() {
		return returndata;
	}
	public void setReturndata(String returndata) {
		this.returndata = returndata;
	}
	
}
