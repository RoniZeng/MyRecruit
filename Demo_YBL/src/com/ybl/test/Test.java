package com.ybl.test;

import java.util.ArrayList;
import java.util.Date;
import java.util.Iterator;
import java.util.List;
import java.util.Map;

import com.opensymphony.xwork2.ActionContext;
import com.ybl.dao.BaseHibernateDao;
import com.ybl.dao.CompanyGetResumeDao;
import com.ybl.dao.CompanyDao;
import com.ybl.model.Category;
import com.ybl.model.ComGetResumId;
import com.ybl.model.Company;
import com.ybl.model.CompanyGetResume;
import com.ybl.model.CompanyGetResumeId;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;

public class Test extends BaseHibernateDao{
		//�޸Ĺ�˾�յ���ĳЩ����״̬
		public String changeStatus(List<ComGetResumId> companyGetResumeIdList,Integer status,Integer statusChangeTo){
			if(companyGetResumeIdList!=null){
				Iterator cgriIt = companyGetResumeIdList.iterator();
				System.out.println("ѭ��ǰ.........");
				while(cgriIt.hasNext()){
					ComGetResumId cgri = (ComGetResumId) cgriIt.next();
					Reciritment rec = new Reciritment();
					Resume res = new Resume();
					rec.setId(cgri.getRecId());
					res.setId(cgri.getResId());
					CompanyGetResumeId id = new CompanyGetResumeId();
					id.setReciritment(rec);
					id.setResume(res);
					System.out.println("�ı�״̬ǰ������������������������");
					CompanyGetResumeDao cgrDao = new CompanyGetResumeDao();
					//��CompanyGetResumeIdΪcgri��CompanyGetResume״̬�޸�ΪstatusChangeTo
					cgrDao.updateStatusById(id,statusChangeTo);
					System.out.println("�ı�״̬��.......................");
				}
				System.out.println("ѭ���󡣡���������������������");
			}
			return status.toString();
		}
		
	public static void main(String[] args) {
		Test test = new Test();
		List<ComGetResumId> list = new ArrayList<ComGetResumId>();
		ComGetResumId comGetResumId = new ComGetResumId();
		ComGetResumId comGetResumId1 = new ComGetResumId();
		
		comGetResumId.setRecId(3);
		comGetResumId.setResId(5);
		
		comGetResumId1.setRecId(5);
		comGetResumId1.setResId(5);
		
		list.add(comGetResumId);
		list.add(comGetResumId1);
		
		System.out.println(test.changeStatus(list, 1, 0));
	}
}
