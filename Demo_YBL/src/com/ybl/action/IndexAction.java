package com.ybl.action;

import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.*;
import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.model.Experience;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;
import com.ybl.tool.ObjectFieldValue;
import com.ybl.tool.Pager;

public class IndexAction  extends ActionSupport {
	private Integer userId;//用户ID
	private Integer userIdentity;
	private String returndata;
	
	//进入我的主页
	public String myHomePage(){
		
		Map session = ActionContext.getContext().getSession();
		userIdentity=(Integer)session.get("userIdentity");
		userId=(Integer)session.get("userId");
		if(userIdentity==0){
			EmployeeDao emDao = new EmployeeDao();
			Employee employee = emDao.selectById(userId);
			Map request=(Map)ActionContext.getContext().get("request");
			request.put("userInfo", employee);
			return "empHomePage";
		}
		CompanyDao comDao = new CompanyDao();
		Company company = comDao.selectById(userId);
		Map request=(Map)ActionContext.getContext().get("request");
		
		request.put("userInfo", company);
		return "comHomePage";
	}
	public String myResume(){
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		ResumeDao reDao = new ResumeDao();
		Resume resume = reDao.selectByUserId(userId);
		Map<String,String> maps = new HashMap<String,String>();
		
		ObjectFieldValue.pushAllField(maps, resume, 4, "resume");
		JSONObject json=JSONObject.fromObject(maps);
        returndata=json.toString();
		return "myResume";
	}

	public Integer getUserId() {
		return userId;
	}
	public void setUserId(Integer userId) {
		this.userId = userId;
	}
	public Integer getUserIdentity() {
		return userIdentity;
	}
	public void setUserIdentity(Integer userIdentity) {
		this.userIdentity = userIdentity;
	}
	public String getReturndata() {
		return returndata;
	}
	public void setReturndata(String returndata) {
		this.returndata = returndata;
	}
	
}
