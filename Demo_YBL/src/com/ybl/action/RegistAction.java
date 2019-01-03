package com.ybl.action;

import java.security.GeneralSecurityException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.*;
import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.model.Registinfo;
import com.ybl.model.Resume;
import com.ybl.model.Userinfo;
import com.ybl.tool.SendEmail;
import com.ybl.tool.YblHashCode;
import com.ybl.tool.YblRand;


public class RegistAction extends ActionSupport {
	private Registinfo registinfo;
	private Integer identity;
	private String code;
	
	//注册第一步,发送激活码
	public String regist2() throws GeneralSecurityException{
		System.out.println("****起使信息****："+registinfo.getEmail()+" "+registinfo.getPassword()+" "+identity);
		RegistInfoDao reDao = new RegistInfoDao();
		Registinfo tem = reDao.selectByEmail(registinfo.getEmail());
		System.out.println("*************************"); //
		registinfo.setPassword(null);
		UserInfoDao userDao = new UserInfoDao();
		//检查是否被注册过
		if(userDao.selectByEmail(registinfo.getEmail())!=null){
			return ERROR;
		}
		//查看注册表是否已有记录，如已有，则更新
		if(tem!=null){
			reDao.deleteByEmail(registinfo.getEmail());
		}
		System.out.println("----------------11111");
		YblRand yblrand = new YblRand();
		registinfo.setCode(yblrand.stringRand(6));//6位激活码
		System.out.println("+++++++++++++++++11111");
		reDao.inser(registinfo);
		System.out.println("发送邮件前的执行！！!");
		SendEmail sendemail= new SendEmail();
		sendemail.sendCode(registinfo.getEmail(), registinfo.getCode());
		System.out.println("发送邮件后的执行~~~");
		return SUCCESS;
	}
	//注册第二步,验证激活码，insert表
	public String regist3() throws GeneralSecurityException{
		System.out.println("插入信息： "+registinfo.getEmail()+" "+registinfo.getPassword()+" "
							+identity+" "+code+" "+registinfo.getCode());
		String email=registinfo.getEmail();
		
		RegistInfoDao reDao = new RegistInfoDao();
		
		//激活码是否正确
		System.out.println("比较激活码：" + reDao.selectByEmail(registinfo.getEmail()).getCode() + "  " + code);
		if(!reDao.selectByEmail(registinfo.getEmail()).getCode().equals(code))	{
			System.out.println("激活码错误！");
			return ERROR;
		}
		
		UserInfoDao userDao = new UserInfoDao();
		Userinfo userInfo = new Userinfo();
		userInfo.setEmail(registinfo.getEmail());
		YblHashCode yblhash = new YblHashCode();
		userInfo.setPassword(yblhash.encrypt(registinfo.getPassword()));
		userInfo.setIdentity(1);
		
		//插入求职者表或公司表
		if(identity==0){
			EmployeeDao empDao = new EmployeeDao();
			Employee emp=empDao.inseEmail(registinfo.getEmail());
			userInfo.setId(emp.getId());
			userInfo.setIdentity(0);
			//插入用户表
			System.out.println("+++++++++++++886886");
			userDao.inser(userInfo);
			Resume resume = new Resume();
			resume.setEmployee(emp);
			ResumeDao recDao = new ResumeDao();
			recDao.inser(resume);
			System.out.println("------------成功插入");
			reDao.deleteByEmail(registinfo.getEmail()); 
			return SUCCESS;
		}
		
		CompanyDao comDao = new CompanyDao();
		Company com = comDao.inseEmail(registinfo.getEmail());
		//插入用户表
		userInfo.setId(com.getId());
		userDao.inser(userInfo);
		System.out.println("执行删除前................");
		reDao.deleteByEmail(registinfo.getEmail()); //void
		System.out.println("执行删除后................");
		System.out.println(registinfo.getEmail());
		//if(code.equals("123456"))
		//return SUCCESS;
		return SUCCESS;
	}
	public Registinfo getRegistinfo() {
		return registinfo;
	}
	public void setRegistinfo(Registinfo registinfo) {
		this.registinfo = registinfo;
	}
	public Integer getIdentity() {
		return identity;
	}
	public void setIdentity(Integer identity) {
		this.identity = identity;
	}
	public String getCode() {
		return code;
	}
	public void setCode(String code) {
		this.code = code;
	}
	
	
}
