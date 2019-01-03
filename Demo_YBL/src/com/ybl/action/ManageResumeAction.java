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

//公司管理收到简历
public class ManageResumeAction extends ActionSupport {
	
	private Integer status;	//简历状态:0通过简历/1待处理简历/2待定简历/3不合适简历/4自动过滤简历
	private String returndata;
	private List<ComGetResumId> companyGetResumeIdList = new ArrayList<ComGetResumId>();//多选，修改这些简历状态
	private Integer statusChangeTo;//修改收到简历状态为
	private Integer resumeId;//查询该简历详细信息
	
	private String context;//通知求职者通过面试的站内信内容
	//查询公司收到的特定状态的简历
	public String selectResume(){
		Map session = ActionContext.getContext().getSession();
		Integer userId=(Integer)session.get("userId");
		Map request=(Map)ActionContext.getContext().get("request");
		CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
		//传入的参数是:
		//简历状态（CompanyGetResume.status）
		//招聘状态（CompanyGetResume.CompanyGetResumeId.Reciritment.isOK)
		//公司编号（CompanyGetResume.CompanyGetResumeId.Reciritment.Company.id）
		//返回满足以上条件的List<CompanyGetResumeId>
		List<CompanyGetResumeId> comgiList = cgrDao.selectByStatusIsOKComId(status, 1, userId);
		request.put("comGresList", comgiList);
		return "comgetResume"+status.toString();
	}
	
	//修改公司收到的某些简历状态
	public String changeStatus(){
		System.out.println("开始修改简历状态Action！！！");
		if(companyGetResumeIdList!=null){
			Iterator cgriIt = companyGetResumeIdList.iterator();
			int i=0;
			while(cgriIt.hasNext()){
				i++;
				System.out.println("**********i = " + i);
				ComGetResumId cgri = (ComGetResumId) cgriIt.next();
				System.out.println(cgri.getResId()+" "+cgri.getRecId());
				CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
				//将CompanyGetResumeId为cgri的CompanyGetResume状态修改为statusChangeTo
				System.out.println("开始修改简历状态！！！");
				cgrDao.updateStatusById(cgri,statusChangeTo);
//				if(statusChangeTo==0){
//					MessageDao mesDao = new MessageDao();
//					Message message = new Message();
//					message.setSendTime(new Date());
//					message.setGetId(cgri.getResume().getEmployee().getId());
//					message.setSendId(cgri.getReciritment().getCompany().getId());
//					message.setTitle("面试通知");
//					message.setIsRead(0);
//					if(context==null){
//						context="  恭喜您通过"+cgri.getReciritment().getCompany().getName()+"的筛选，进入面试阶段。";
//					}
//					message.setContext(context);
//					//向message表增加一条数据
//					mesDao.inser(message);
//				}
			}
		}
		return status.toString();
	}
	
	//查询id为comRecId的Resume详细信息
	public String detailsResume(){
		Map request=(Map)ActionContext.getContext().get("request");
		ResumeDao resDao = new ResumeDao();
		//查询Resume的id为resumeId的Resume
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
