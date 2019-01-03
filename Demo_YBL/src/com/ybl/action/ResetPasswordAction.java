package com.ybl.action;

import java.security.GeneralSecurityException;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.LoginDao;
import com.ybl.dao.RegistInfoDao;
import com.ybl.dao.UserInfoDao;
import com.ybl.model.Registinfo;
import com.ybl.model.Userinfo;
import com.ybl.tool.SendEmail;
import com.ybl.tool.YblHashCode;
import com.ybl.tool.YblRand;

//忘记密码，通过邮箱验证重置密码
public class ResetPasswordAction extends ActionSupport {
	private String email;
	private String code;
	private String password;
	
	private String oldPassword;
	private String newPassword;
	
	public String updatePassword() throws GeneralSecurityException {
		Map session = ActionContext.getContext().getSession();
		String email=(String)session.get("email");
		UserInfoDao userDao = new UserInfoDao();
		YblHashCode yblhash = new YblHashCode();
		oldPassword= yblhash.encrypt(oldPassword);
		Userinfo tem = new Userinfo();
		tem = userDao.selectByEmail(email);
		if(!tem.getPassword().equals(oldPassword)){
			return ERROR;
		}
		tem.setPassword(yblhash.encrypt(newPassword));
		userDao.updatePasswordByEmail(email, yblhash.encrypt(newPassword));
		
		return SUCCESS;
	}
	
	//1.发送验证码
	public String resetPassword1() throws Exception{
		UserInfoDao userDao = new UserInfoDao();
		Userinfo user = userDao.selectByEmail(email);
		if(user==null){
			//邮箱不存在
			return ERROR;
		}
		Registinfo registinfo = new Registinfo();
		registinfo.setEmail(email);
		YblRand t = new YblRand();
		registinfo.setCode(t.stringRand(6));
		SendEmail send = new SendEmail();
		send.sendCode(email, registinfo.getCode());
		RegistInfoDao regDao = new RegistInfoDao();
		if(regDao.selectByEmail(email)==null){
			regDao.inser(registinfo);
		}else{
			regDao.updateCodeByEmail(registinfo.getEmail(),registinfo.getCode());
		}
		
		Map session = ActionContext.getContext().getSession();
		session.put("email", email);
		session.put("OK", "0");
		return SUCCESS;
	}
	//2.邮箱验证
	public String resetPassword2(){
		Map session = ActionContext.getContext().getSession();
		email=(String)session.get("email");
		RegistInfoDao regDao = new RegistInfoDao();
		Registinfo registinfo = regDao.selectByEmail(email);
		if(registinfo==null||!registinfo.getCode().equals(code)){
			//code错误
			return ERROR;
		}
		session.put("OK", "1");
		return SUCCESS;
	}
	//3.修改密码
	public String resetPassword3() throws Exception{
		Map session = ActionContext.getContext().getSession();
		email=(String)session.get("email");
		if(((String)session.get("OK")).equals("0")){
			//请重新填写验证码
			return ERROR;
		}
		//加密
		YblHashCode hash = new YblHashCode();
		password = hash.encrypt(password);
		UserInfoDao userDao = new UserInfoDao();
		userDao.updatePasswordByEmail(email,password);
		return SUCCESS;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getOldPassword() {
		return oldPassword;
	}

	public void setOldPassword(String oldPassword) {
		this.oldPassword = oldPassword;
	}

	public String getNewPassword() {
		return newPassword;
	}

	public void setNewPassword(String newPassword) {
		this.newPassword = newPassword;
	}
}
