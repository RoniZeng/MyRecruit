package com.ybl.tool;

import com.ybl.dao.CompanyGetResumeDao;
import com.ybl.dao.ReciritmentDao;
import com.ybl.dao.ResumeDao;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;

public class SendResume {
	public boolean sendResume(Integer resId,Integer reciritmentId){
		ReciritmentDao recDao = new ReciritmentDao();
		Reciritment rec = recDao.selectById(reciritmentId);
		if(rec.getIsOk()==0){
			//招聘已下线
			return false;
		}
		//默认为1待处理简历
		Integer status=1;
		ResumeDao resDao = new ResumeDao();
		System.out.println("简历ID：" + resId + "职位ID：" + reciritmentId);
		//过滤简历
		if(!filterResume(resDao.selectById(resId), recDao.selectById(reciritmentId))){
			status=4;
		}
		CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
		System.out.println("准备投递简历！！！");
		//传入参数为简历编号、公司发布职位编号、简历状态，向company_get_resume表插入数据
		cgrDao.inser(resId,reciritmentId,status);
		System.out.println("提交成功@@");
		return true;
	}
	//过滤简历
	public boolean filterResume(Resume res,Reciritment rec){
		System.out.println("res0：" + res.getEmployee().getDegree()  + " rec1 = " + rec.getDegree());
		//按学历
		if(res.getEmployee().getDegree()<rec.getDegree()){
			return false;
		}
		System.out.println("工作经验=" + res.getEmployee().getExperience() + "  rec=" + rec.getJobExperience());
		//按工作经验
		if(rec.getJobExperience()==0)return true;
		if(rec.getJobExperience()==1&&res.getEmployee().getExperience()==0)return true;
		if(rec.getJobExperience()==2&&res.getEmployee().getExperience()>=1&&res.getEmployee().getExperience()<3)return true;
		if(rec.getJobExperience()==3&&res.getEmployee().getExperience()>=3&&res.getEmployee().getExperience()<5)return true;
		if(rec.getJobExperience()==4&&res.getEmployee().getExperience()>=5&&res.getEmployee().getExperience()<10)return true;
		if(rec.getJobExperience()==5&&res.getEmployee().getExperience()>=10)return true;
		
		
		return false;
	}
}
