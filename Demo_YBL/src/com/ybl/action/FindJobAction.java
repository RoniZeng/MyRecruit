package com.ybl.action;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.*;
import com.ybl.model.Reciritment;
import com.ybl.model.ReciritmentSearch;
import com.ybl.tool.Pager;

public class FindJobAction extends ActionSupport {
	
	private int pageNow=1;
	private int pagesize=20;
	private Reciritment reciritment = new Reciritment();//除发布时间，其他筛选条件都放在这
	private int day;//发布时间的筛选条件，筛选出距今<=day的简历
	private Integer recId;//职位发布ID
	
	public String selectReciritment(){
		System.out.println("+++++++++++++000000000000++++++++++++++++++++++++++");
		if(reciritment != null){
			System.out.println("输出 传入值：");
			if(reciritment.getPosition() != null) {
				System.out.println("职位名称：" + reciritment.getPosition().getName());
			} 
			if(reciritment.getCompany()!=null) {
				System.out.println("公司名称：" + reciritment.getCompany().getName());
			}
		}
		else {
			System.out.println("reciritment为空！！！");
		}
		Map request=(Map)ActionContext.getContext().get("request");
		ReciritmentDao recDao = new ReciritmentDao();
		List<Reciritment> recList = new ArrayList<Reciritment>();
		Pager page = null;
		System.out.println("之前.............");
		recList = recDao.findJob(pageNow,pagesize,reciritment);
		System.out.println("recList");
		//上述查询结果数
		page= new Pager(pageNow,pagesize,recDao.findJobSize(reciritment));
		
		System.out.println("size = " + recDao.findJobSize(reciritment));
		
		request.put("recList", recList);
		request.put("page", page);
		request.put("reciritment", reciritment);
		return "selectReciritment";
	}
	public int getPageNow() {
		return pageNow;
	}

	public void setPageNow(int pageNow) {
		this.pageNow = pageNow;
	}

	public int getPagesize() {
		return pagesize;
	}

	public void setPagesize(int pagesize) {
		this.pagesize = pagesize;
	}

	public Integer getRecId() {
		return recId;
	}

	public void setRecId(Integer recId) {
		this.recId = recId;
	}
	public Reciritment getReciritment() {
		return reciritment;
	}
	public void setReciritment(Reciritment reciritment) {
		this.reciritment = reciritment;
	}
	public int getDay() {
		return day;
	}
	public void setDay(int day) {
		this.day = day;
	}
	
}
