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
	
	//ע���һ��,���ͼ�����
	public String regist2() throws GeneralSecurityException{
		System.out.println("****��ʹ��Ϣ****��"+registinfo.getEmail()+" "+registinfo.getPassword()+" "+identity);
		RegistInfoDao reDao = new RegistInfoDao();
		Registinfo tem = reDao.selectByEmail(registinfo.getEmail());
		System.out.println("*************************"); //
		registinfo.setPassword(null);
		UserInfoDao userDao = new UserInfoDao();
		//����Ƿ�ע���
		if(userDao.selectByEmail(registinfo.getEmail())!=null){
			return ERROR;
		}
		//�鿴ע����Ƿ����м�¼�������У������
		if(tem!=null){
			reDao.deleteByEmail(registinfo.getEmail());
		}
		System.out.println("----------------11111");
		YblRand yblrand = new YblRand();
		registinfo.setCode(yblrand.stringRand(6));//6λ������
		System.out.println("+++++++++++++++++11111");
		reDao.inser(registinfo);
		System.out.println("�����ʼ�ǰ��ִ�У���!");
		SendEmail sendemail= new SendEmail();
		sendemail.sendCode(registinfo.getEmail(), registinfo.getCode());
		System.out.println("�����ʼ����ִ��~~~");
		return SUCCESS;
	}
	//ע��ڶ���,��֤�����룬insert��
	public String regist3() throws GeneralSecurityException{
		System.out.println("������Ϣ�� "+registinfo.getEmail()+" "+registinfo.getPassword()+" "
							+identity+" "+code+" "+registinfo.getCode());
		String email=registinfo.getEmail();
		
		RegistInfoDao reDao = new RegistInfoDao();
		
		//�������Ƿ���ȷ
		System.out.println("�Ƚϼ����룺" + reDao.selectByEmail(registinfo.getEmail()).getCode() + "  " + code);
		if(!reDao.selectByEmail(registinfo.getEmail()).getCode().equals(code))	{
			System.out.println("���������");
			return ERROR;
		}
		
		UserInfoDao userDao = new UserInfoDao();
		Userinfo userInfo = new Userinfo();
		userInfo.setEmail(registinfo.getEmail());
		YblHashCode yblhash = new YblHashCode();
		userInfo.setPassword(yblhash.encrypt(registinfo.getPassword()));
		userInfo.setIdentity(1);
		
		//������ְ�߱��˾��
		if(identity==0){
			EmployeeDao empDao = new EmployeeDao();
			Employee emp=empDao.inseEmail(registinfo.getEmail());
			userInfo.setId(emp.getId());
			userInfo.setIdentity(0);
			//�����û���
			System.out.println("+++++++++++++886886");
			userDao.inser(userInfo);
			Resume resume = new Resume();
			resume.setEmployee(emp);
			ResumeDao recDao = new ResumeDao();
			recDao.inser(resume);
			System.out.println("------------�ɹ�����");
			reDao.deleteByEmail(registinfo.getEmail()); 
			return SUCCESS;
		}
		
		CompanyDao comDao = new CompanyDao();
		Company com = comDao.inseEmail(registinfo.getEmail());
		//�����û���
		userInfo.setId(com.getId());
		userDao.inser(userInfo);
		System.out.println("ִ��ɾ��ǰ................");
		reDao.deleteByEmail(registinfo.getEmail()); //void
		System.out.println("ִ��ɾ����................");
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
