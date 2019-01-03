package com.ybl.action;

import java.util.HashMap;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.*;
import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.model.Userinfo;
import com.ybl.tool.YblHashCode;

public class LoginAction extends ActionSupport {
	
	private Userinfo userInfo = new Userinfo();
	private String returndata;
	private String email = new String();
	private String password = new String();
	
	//µÇÂ¼
	public String execute() throws Exception{
		Map session = ActionContext.getContext().getSession();
		userInfo.setEmail(email);
		userInfo.setPassword(password);
		LoginDao loginDao = new LoginDao();
		YblHashCode yblhash = new YblHashCode();
		userInfo.setPassword(yblhash.encrypt(userInfo.getPassword()));
		Userinfo tem = new Userinfo();
		tem = loginDao.login(userInfo.getEmail(),userInfo.getPassword());
		String name = new String();
		
		if(tem==null){
			return ERROR;
		} else {
			System.out.println("tem1:" + tem.toString()); //·Ç¿Õ
		}
		System.out.println("userId = " + userInfo.getId() + " temId = " + tem.getId());
		if(tem.getIdentity()==0){
			EmployeeDao empDao = new EmployeeDao();
			Employee emp = empDao.selectById(tem.getId());
			name=emp.getName();
			session.put("myResumeId", emp.getResume().getId());
		}else{
			CompanyDao comDao = new CompanyDao();
			Company com = comDao.selectById(tem.getId());
			name = com.getName();
		}
		session.put("userId", tem.getId());
		session.put("userIdentity", tem.getIdentity());
		session.put("userName", name);
		System.out.println("session = " + session.get("userId")+" "+tem.getIdentity()+" "+name);
		return "index";
	}
	public Userinfo getUserInfo() {
		return userInfo;
	}
	public void setUserInfo(Userinfo userInfo) {
		this.userInfo = userInfo;
	}
	public String getReturndata() {
		return returndata;
	}
	public void setReturndata(String returndata) {
		this.returndata = returndata;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPassword() {
		return password;
	}
	public void setPassword(String password) {
		this.password = password;
	}
}
