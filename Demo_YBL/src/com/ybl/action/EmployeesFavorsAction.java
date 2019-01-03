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
	//�����ղ�
	public void inserFavor(){
		
		System.out.println("�����ղ�"+reciritmentId);
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return;
			//return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		//ͨ����ְ��Id����ƸId��ѯ��ְ���Ƿ��ղ��������Ƹ,�ղ���Ϊtrue
		if(!favDao.selectByEmpIdRecId(userId,reciritmentId)){
			favDao.inser(userId,reciritmentId,new Date());
		}
		//return "inserFavor";
	}
	//��ѯ��ְ�ߵ��ղ�ְλ
	public String selectFavors(){
		System.out.println("��ѯ��ְ�ߵ��ղ�ְλ...");
		Map request = (Map)ActionContext.getContext().get("request");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity = (Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId = (Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		System.out.println("�ղ��ߣ� " + userId);
		//��ѯidΪuserId����ְ�� �������ղ�ְλ��Reciritment��
		List<Reciritment> recList = favDao.selectRecByEmpId(userId);
		System.out.println("�ղسɹ���");
		System.out.println(recList.size());
		request.put("recList", recList);
		return "selectFavors";
	}
	//ȡ���ղ�
	public String deleteFavors(){
		System.out.println("ȡ���ղ�");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			return ERROR;
		}
		Integer userId=(Integer)session.get("userId");
		FavorsDao favDao = new FavorsDao();
		
		//ɾ����ְ��idΪuserId�� ְλIdΪreciritmentId�� ���ղ���Ϣ��Favors��
		favDao.deleteByEmpIdRecId(userId,reciritmentId);
		return "deleteFavors";
	}
	//Ͷ�ݼ���
	public String sendResume(){
		System.out.println("Ͷ�ݼ���");
		Map session = ActionContext.getContext().getSession();
		Integer userIdentity=(Integer)session.get("userIdentity");
		if(userIdentity!=0){
			//��ְ�߲���Ͷ�ݼ���
			return ERROR;
		}
		Integer resId=(Integer)session.get("myResumeId");
		System.out.println("������� = " + resId);
		SendResume sendResume = new SendResume();
		if(sendResume.sendResume(resId, reciritmentId)==false){
			//��Ƹ������
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
