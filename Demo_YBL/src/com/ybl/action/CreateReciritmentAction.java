package com.ybl.action;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.model.Company;
import com.ybl.model.Reciritment;
//createReciriment
public class CreateReciritmentAction extends ActionSupport{
	private Reciritment newRec;//发布的职位信息
	
	//公司发布职位
	public String createReciriment(){
		System.out.println("进入发布职位Action........");
		newRec.getPosition().setName(newRec.getPosition().getName().trim());
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity==0){
			return ERROR;
		}
		Integer userId = (Integer)session.get("userId");
		System.out.println("用户ID：" + userId);
		CompanyDao comDao = new CompanyDao();
		Company com = comDao.selectById(userId); //根据公司用户ID获得公司对象
		//自动填入公司id
		System.out.println("公司对象 = "+ com.getEmail());
		newRec.setCompany(com);
		SimpleDateFormat df = new SimpleDateFormat("yyyy-MM-dd HH:mm:ss");//设置日期格式
		//发布时间为当前系统时间
		newRec.setSendDate(new Date());
        System.out.println(df.format(new Date()));// new Date()为获取当前系统时间
        //刚发布的招聘一定有效
        newRec.setIsOk(1);
        ReciritmentDao recDao = new ReciritmentDao();
        System.out.println("插入招聘信息前.........");
        //向Reciritment插入一条信息
        
        recDao.inser(newRec);
        System.out.println("插入招聘信息!!!");
		return SUCCESS;
	}
	public Reciritment getNewRec() {
		return newRec;
	}
	public void setNewRec(Reciritment newRec) {
		this.newRec = newRec;
	}
	
}
