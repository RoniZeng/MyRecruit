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
	private Reciritment reciritment = new Reciritment();//������ʱ�䣬����ɸѡ������������
	private int day;//����ʱ���ɸѡ������ɸѡ�����<=day�ļ���
	private Integer recId;//ְλ����ID
	
	public String selectReciritment(){
		System.out.println("+++++++++++++000000000000++++++++++++++++++++++++++");
		if(reciritment != null){
			System.out.println("��� ����ֵ��");
			if(reciritment.getPosition() != null) {
				System.out.println("ְλ���ƣ�" + reciritment.getPosition().getName());
			} 
			if(reciritment.getCompany()!=null) {
				System.out.println("��˾���ƣ�" + reciritment.getCompany().getName());
			}
		}
		else {
			System.out.println("reciritmentΪ�գ�����");
		}
		Map request=(Map)ActionContext.getContext().get("request");
		ReciritmentDao recDao = new ReciritmentDao();
		List<Reciritment> recList = new ArrayList<Reciritment>();
		Pager page = null;
		System.out.println("֮ǰ.............");
		recList = recDao.findJob(pageNow,pagesize,reciritment);
		System.out.println("recList");
		//������ѯ�����
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
