package com.ybl.action;

import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.EducationDao;
import com.ybl.dao.EmployeeDao;
import com.ybl.dao.ExperienceDao;
import com.ybl.dao.ResumeDao;
import com.ybl.dao.SchoolDao;
import com.ybl.model.Education;
import com.ybl.model.Employee;
import com.ybl.model.Experience;
import com.ybl.model.Resume;
import com.ybl.model.School;

public class EmpHomeAction extends ActionSupport {
	private Integer userId;//用户ID
	private Integer userIdentity;
	
	//进入编辑简历界面
	public String myResume(){
		Map session = ActionContext.getContext().getSession();
		userId=(Integer)session.get("userId");
		Map request=(Map)ActionContext.getContext().get("request");
		EmployeeDao emDao = new EmployeeDao();
		Employee employee = emDao.selectById(userId);
		request.put("userInfo", employee);
		
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
	
	
}
