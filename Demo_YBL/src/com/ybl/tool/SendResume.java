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
			//��Ƹ������
			return false;
		}
		//Ĭ��Ϊ1���������
		Integer status=1;
		ResumeDao resDao = new ResumeDao();
		System.out.println("����ID��" + resId + "ְλID��" + reciritmentId);
		//���˼���
		if(!filterResume(resDao.selectById(resId), recDao.selectById(reciritmentId))){
			status=4;
		}
		CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
		System.out.println("׼��Ͷ�ݼ���������");
		//�������Ϊ������š���˾����ְλ��š�����״̬����company_get_resume���������
		cgrDao.inser(resId,reciritmentId,status);
		System.out.println("�ύ�ɹ�@@");
		return true;
	}
	//���˼���
	public boolean filterResume(Resume res,Reciritment rec){
		System.out.println("res0��" + res.getEmployee().getDegree()  + " rec1 = " + rec.getDegree());
		//��ѧ��
		if(res.getEmployee().getDegree()<rec.getDegree()){
			return false;
		}
		System.out.println("��������=" + res.getEmployee().getExperience() + "  rec=" + rec.getJobExperience());
		//����������
		if(rec.getJobExperience()==0)return true;
		if(rec.getJobExperience()==1&&res.getEmployee().getExperience()==0)return true;
		if(rec.getJobExperience()==2&&res.getEmployee().getExperience()>=1&&res.getEmployee().getExperience()<3)return true;
		if(rec.getJobExperience()==3&&res.getEmployee().getExperience()>=3&&res.getEmployee().getExperience()<5)return true;
		if(rec.getJobExperience()==4&&res.getEmployee().getExperience()>=5&&res.getEmployee().getExperience()<10)return true;
		if(rec.getJobExperience()==5&&res.getEmployee().getExperience()>=10)return true;
		
		
		return false;
	}
}
