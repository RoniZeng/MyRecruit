package com.ybl.dao;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ybl.model.Company;
import com.ybl.model.CompanyGetResume;
import com.ybl.model.CompanyGetResume;
import com.ybl.model.ComGetResumId;
import com.ybl.model.CompanyGetResumeId;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;
import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;

public class CompanyGetResumeDao extends BaseHibernateDao {
	
	public Resume selectByUserId(Integer id) {
		return (Resume) super.get(Resume.class, id);
	}
	//查询该招聘信息收到的状态为status的简历
	public List<Resume> selectByRecIdStatus(Integer id, Integer status) {
		List<Resume> list = new ArrayList<Resume>();
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			//根据ID获取职位对象
			Reciritment reciritment = (Reciritment) session.get(Reciritment.class, id);
			//由职位对象获取投递到该职位的中间表对象集合
			Set<CompanyGetResume> set = reciritment.getCompanyGetResumes();
			if(set!=null) {
				for (CompanyGetResume c : set) {
					if(c.getStatus().equals(status)) {
						Resume r = c.getId().getResume();
						list.add(r);
					}
				}
			} else {
				System.out.println("没找到匹配的简历！");
			}
		} catch (Exception e) {
			session.close();
		}
		return list;
	}
	
	/**
	 * @param status
	 * @param isOk
	 * @param comId
	 * @return List<中间表主键>
	 */
	public List<CompanyGetResumeId> selectByStatusIsOKComId(Integer status, Integer isOk, Integer comId) { //, Integer isOk, Integer comId
		List<CompanyGetResume> list = new ArrayList<CompanyGetResume>();
		List<CompanyGetResumeId> list1 = new ArrayList<CompanyGetResumeId>();//null; //筛选中间表的职位信息中isOk的和职位信息对应的公司为ID的
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery("from CompanyGetResume where status=?");
			query.setParameter(0, status);
			list = query.list(); //筛选满足status条件的中间表集合(可以)
			if(list != null) {
				System.out.println("！！！不为空！！！");
				for (CompanyGetResume c : list) {
					if(c.getId().getReciritment().getIsOk().equals(isOk) 
					&& c.getId().getReciritment().getCompany().getId().equals(comId))
					{
						//System.out.println("isOk之前。。。。: " + c.getId().getReciritment().getIsOk() + " city: " + c.getId().getReciritment().getCity());
						//CompanyGetResumeId cc = c.getId();
						list1.add(c.getId());
						System.out.println("isOk: " + c.getId().getReciritment().getIsOk() + " city: " + c.getId().getReciritment().getCity());
						System.out.println("职位： " + c.getId().getReciritment().getPosition().getName());
					}
				}
			}
			else {
				System.out.println("没找到对应的职位简历Id集合！！！");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list1;
	}
	
	public void updateStatusById(CompanyGetResumeId id, Integer status) {
		System.out.print("修改简历状态");
		Session session = HibernateSessionFactory.getSession();
		CompanyGetResume companyGetResume = new CompanyGetResume();
		try {
			companyGetResume = (CompanyGetResume) session.get(CompanyGetResume.class, id);
			companyGetResume.setStatus(status);
			super.update(companyGetResume);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			//session.close();
		}
		System.out.print("修改简历状态成功");
	}
	
	/************************/
	public void updateStatusById(ComGetResumId obj, Integer status) {
		Session session = HibernateSessionFactory.getSession();
		ComGetResumId comGetResumId = new ComGetResumId();
		CompanyGetResumeId getId = new CompanyGetResumeId();
		try {
			Reciritment rec = new Reciritment();
			Integer recId = obj.getRecId();
			rec = (Reciritment) session.get(Reciritment.class, recId);
			Resume res = new Resume();
			Integer resId = obj.getResId();
			res = (Resume) session.get(Resume.class, resId);
			getId.setReciritment(rec);
			getId.setResume(res);
			updateStatusById(getId, status);
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
	}

	public static void main(String[] args) {
		CompanyGetResumeDao dao = new CompanyGetResumeDao();
		dao.inser(8,25,4); //9, 23, 
//		//List<Resume> list = dao.selectByRecIdStatus(5, 1); //5 1
//		List<CompanyGetResumeId> list = dao.selectByStatusIsOkComId(1,0,5);
//		for (CompanyGetResumeId c : list) {
//			System.out.println(c.getReciritment().getId()+" "+c.getReciritment().getLocation());
//		}
	}
	
	//传入参数为简历编号、公司发布职位编号、简历状态，想C_R_G中间表插入数据
	public void inser(Integer resId, Integer reciritmentId, Integer status) { //Integer resId, Integer reciritmentId, 
		Session session = HibernateSessionFactory.getSession();
		CompanyGetResume companyGetResume = new CompanyGetResume(); //中间表
		CompanyGetResumeId id = new CompanyGetResumeId();
		Reciritment reciritment = (Reciritment) session.get(Reciritment.class, reciritmentId); 
		Resume resume = (Resume) session.get(Resume.class, resId);
		id.setReciritment(reciritment);
		id.setResume(resume);
		companyGetResume.setId(id);
		companyGetResume.setStatus(status);
		super.add(companyGetResume);
	}
	//根据简历状态和简历ID来查询
	public List<Reciritment> selectByStatusResId(Integer status, Integer resId) {
		Session session = HibernateSessionFactory.getSession();
		List<Reciritment> res = new ArrayList<Reciritment>();
		Query query = session.createQuery("from CompanyGetResume where resId = ? and status = ?");
		query.setParameter(0, resId);
		query.setParameter(1, status);
		List<CompanyGetResume> list = query.list();
		for (CompanyGetResume companyGetResume : list) {
			Reciritment reciritment = companyGetResume.getId().getReciritment();
			res.add(reciritment);
		}
		session.close();
		return res;
	}
}
	
