package com.ybl.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyGetResumeDao;
import com.ybl.dao.FavorsDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.dao.ResumeDao;
import com.ybl.model.*;
import com.ybl.tool.SendResume;

public class EmployeesFavorsAction extends ActionSupport{

	private Integer reciritmentId;
	//增加收藏
	public void inserFavor(){
		
		System.out.println("增加收藏"+reciritmentId);
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return;
			//return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		//通过求职者Id和招聘Id查询求职者是否收藏了这个招聘,收藏了为true
		if(!favDao.selectByEmpIdRecId(userId,reciritmentId)){
			favDao.inser(userId,reciritmentId,new Date());
		}
		//return "inserFavor";
	}
	//查询求职者的收藏职位
	public String selectFavors(){
		System.out.println("查询求职者的收藏职位...");
		Map request = (Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity = (Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId = (Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		System.out.println("收藏者： " + userId);
		//查询id为userId的求职者 的所有收藏职位（Reciritment）
		List<Reciritment> recList = favDao.selectRecByEmpId(userId);
		System.out.println("收藏成功！");
		System.out.println(recList.size());
		request.put("recList", recList);
		return "selectFavors";
	}
	//取消收藏
	public String deleteFavors(){
		System.out.println("取消收藏");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		
		//删除求职者id为userId且 职位Id为reciritmentId的 的收藏信息（Favors）
		favDao.deleteByEmpIdRecId(userId,reciritmentId);
		return "deleteFavors";
	}
	//投递简历
	public String sendResume(){
		System.out.println("投递简历");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			//求职者才能投递简历
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		System.out.println("简历编号 = " + resId);
		SendResume sendResume = new SendResume();
		if(sendResume.sendResume(resId, reciritmentId)==false){
			//招聘已下线
			return "expired";
		}
		
		return "sendResume";
	}
	public Integer getReciritmentId() {
		return reciritmentId;
	}
	public void setReciritmentId(Integer reciritmentId) {
		this.reciritmentId = reciritmentId;
	}
	
}
