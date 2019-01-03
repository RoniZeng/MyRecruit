package com.ybl.action;

import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyDao;
import com.ybl.dao.FavorsDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.model.Company;
import com.ybl.model.Reciritment;

public class ManageReciritmentAction extends ActionSupport {
	
	private Integer isOK;
	private String returndata;
	private int pageNow=1;
	private int pagesize=15;
	private Integer comRecId;
	
	//查询该公司发布的状态为isOK的职位
 	public String selectReciritmentisOK(){
 		Map request=(Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("userId");
		System.out.println("公司Id = "+userId);
		ReciritmentDao recDao = new ReciritmentDao();
		List<Reciritment> recList = recDao.selectByComIdIsOK(userId,isOK);
		System.out.println("查询该公司发布的状态为isOK的职位");
		request.put("recList", recList);
		return "isOK"+isOK.toString();
	}
	
	//职位下线
	public String downline(){
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity==0){
			return ERROR;
		}
		ReciritmentDao recDao = new ReciritmentDao();
		//把编号为comRecId的招聘信息的IsOK改为0
		recDao.updateIsOKById(comRecId,(Integer)0);
		return SUCCESS;
	}
	
	//查询id为comRecId的Reciritment详细信息
	public String detailsReciritment(){
		System.out.println("进入查看招聘详细详细action！");
		Map request = (Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity = (Integer)session.get("userIdentity");
		Integer userId = (Integer)session.get("userId");
		System.out.println("userIdentity = " + userIdentity + " userId = " + userId);
		
		if(userIdentity==0){
			FavorsDao favDao = new FavorsDao();
			//通过求职者Id和招聘Id查询求职者是否收藏了这个招聘,收藏了为true
			request.put("isFavors", favDao.selectByEmpIdRecId(userId,comRecId));
		}
		
		ReciritmentDao recDao = new ReciritmentDao();
		//查询Reciritment的id为comRecId的Reciritment
		Reciritment rec = recDao.selectById(comRecId);
		System.out.println("招聘信息：" + rec.getCity() + "  "  +rec.getNum());
		request.put("detailsReciritment", rec);
		return "detailsReciritment";
	}

	public Integer getIsOK() {
		return isOK;
	}

	public void setIsOK(Integer isOK) {
		this.isOK = isOK;
	}

	public String getReturndata() {
		return returndata;
	}

	public void setReturndata(String returndata) {
		this.returndata = returndata;
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

	public Integer getComRecId() {
		return comRecId;
	}

	public void setComRecId(Integer comRecId) {
		this.comRecId = comRecId;
	}
	
	
}
