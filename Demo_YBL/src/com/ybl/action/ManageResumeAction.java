package com.ybl.action;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import net.sf.json.JSONObject;

import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.ybl.dao.CompanyGetResumeDao;
import com.ybl.dao.MessageDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.dao.ResumeDao;
import com.ybl.model.ComGetResumId;
import com.ybl.model.CompanyGetResumeId;
import com.ybl.model.Experience;
import com.ybl.model.Message;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;

//��˾�����յ�����
public class ManageResumeAction extends ActionSupport {
	
	private Integer status;	//����״̬:0ͨ������/1���������/2��������/3�����ʼ���/4�Զ����˼���
	private String returndata;
	private List<ComGetResumId> companyGetResumeIdList = new ArrayList<ComGetResumId>();//��ѡ���޸���Щ����״̬
	private Integer statusChangeTo;//�޸��յ�����״̬Ϊ
	private Integer resumeId;//��ѯ�ü�����ϸ��Ϣ
	
	private String context;//֪ͨ��ְ��ͨ�����Ե�վ��������
	//��ѯ��˾�յ����ض�״̬�ļ���
	public String selectResume(){
		Map session = ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("userId");
		Map request=(Map)ActionContext.getContext().get("request");
		CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
		//����Ĳ�����:
		//����״̬��CompanyGetResume.status��
		//��Ƹ״̬��CompanyGetResume.CompanyGetResumeId.Reciritment.isOK)
		//��˾��ţ�CompanyGetResume.CompanyGetResumeId.Reciritment.Company.id��
		//������������������List<CompanyGetResumeId>
		List<CompanyGetResumeId> comgiList = cgrDao.selectByStatusIsOKComId(status, 1, userId);
		request.put("comGresList", comgiList);
		return "comgetResume"+status.toString();
	}
	
	//�޸Ĺ�˾�յ���ĳЩ����״̬
	public String changeStatus(){
		System.out.println("��ʼ�޸ļ���״̬Action������");
		if(companyGetResumeIdList!=null){
			Iterator cgriIt = companyGetResumeIdList.iterator();
			int i=0;
			while(cgriIt.hasNext()){
				i++;
				System.out.println("**********i = " + i);
				ComGetResumId cgri = (ComGetResumId) cgriIt.next();
				System.out.println(cgri.getResId()+" "+cgri.getRecId());
				CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
				//��CompanyGetResumeIdΪcgri��CompanyGetResume״̬�޸�ΪstatusChangeTo
				System.out.println("��ʼ�޸ļ���״̬������");
				cgrDao.updateStatusById(cgri,statusChangeTo);
//				if(statusChangeTo==0){
//					MessageDao mesDao = new MessageDao();
//					Message message = new Message();
//					message.setSendTime(new Date());
//					message.setGetId(cgri.getResume().getEmployee().getId());
//					message.setSendId(cgri.getReciritment().getCompany().getId());
//					message.setTitle("����֪ͨ");
//					message.setIsRead(0);
//					if(context==null){
//						context="  ��ϲ��ͨ��"+cgri.getReciritment().getCompany().getName()+"��ɸѡ���������Խ׶Ρ�";
//					}
//					message.setContext(context);
//					//��message������һ������
//					mesDao.inser(message);
//				}
			}
		}
		return status.toString();
	}
	
	//��ѯidΪcomRecId��Resume��ϸ��Ϣ
	public String detailsResume(){
		Map request=(Map)ActionContext.getContext().get("request");
		ResumeDao resDao = new ResumeDao();
		//��ѯResume��idΪresumeId��Resume
		Resume res = resDao.selectById(resumeId);
		request.put("detailsResume", res);
		return "detailsResume";
	}
	
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public String getReturndata() {
		return returndata;
	}
	public void setReturndata(String returndata) {
		this.returndata = returndata;
	}
	
	public List<ComGetResumId> getCompanyGetResumeIdList() {
		return companyGetResumeIdList;
	}
	public void setCompanyGetResumeIdList(List<ComGetResumId> companyGetResumeIdList) {
		this.companyGetResumeIdList = companyGetResumeIdList;
	}
	public Integer getStatusChangeTo() {
		return statusChangeTo;
	}
	public void setStatusChangeTo(Integer statusChangeTo) {
		this.statusChangeTo = statusChangeTo;
	}
	public Integer getResumeId() {
		return resumeId;
	}
	public void setResumeId(Integer resumeId) {
		this.resumeId = resumeId;
	}
	public String getContext() {
		return context;
	}
	public void setContext(String context) {
		this.context = context;
	}
	
	
}
