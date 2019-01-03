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
	//��ѯ����Ƹ��Ϣ�յ���״̬Ϊstatus�ļ���
	public List<Resume> selectByRecIdStatus(Integer id, Integer status) {
		List<Resume> list = new ArrayList<Resume>();
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			//����ID��ȡְλ����
			Reciritment reciritment = (Reciritment) session.get(Reciritment.class, id);
			//��ְλ�����ȡͶ�ݵ���ְλ���м����󼯺�
			Set<CompanyGetResume> set = reciritment.getCompanyGetResumes();
			if(set!=null) {
				for (CompanyGetResume c : set) {
					if(c.getStatus().equals(status)) {
						Resume r = c.getId().getResume();
						list.add(r);
					}
				}
			} else {
				System.out.println("û�ҵ�ƥ��ļ�����");
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
	 * @return List<�м������>
	 */
	public List<CompanyGetResumeId> selectByStatusIsOKComId(Integer status, Integer isOk, Integer comId) { //, Integer isOk, Integer comId
		List<CompanyGetResume> list = new ArrayList<CompanyGetResume>();
		List<CompanyGetResumeId> list1 = new ArrayList<CompanyGetResumeId>();//null; //ɸѡ�м���ְλ��Ϣ��isOk�ĺ�ְλ��Ϣ��Ӧ�Ĺ�˾ΪID��
		Session session = null;
		try {
			session = HibernateSessionFactory.getSession();
			Query query = session.createQuery("from CompanyGetResume where status=?");
			query.setParameter(0, status);
			list = query.list(); //ɸѡ����status�������м����(����)
			if(list != null) {
				System.out.println("��������Ϊ�գ�����");
				for (CompanyGetResume c : list) {
					if(c.getId().getReciritment().getIsOk().equals(isOk) 
					&& c.getId().getReciritment().getCompany().getId().equals(comId))
					{
						//System.out.println("isOk֮ǰ��������: " + c.getId().getReciritment().getIsOk() + " city: " + c.getId().getReciritment().getCity());
						//CompanyGetResumeId cc = c.getId();
						list1.add(c.getId());
						System.out.println("isOk: " + c.getId().getReciritment().getIsOk() + " city: " + c.getId().getReciritment().getCity());
						System.out.println("ְλ�� " + c.getId().getReciritment().getPosition().getName());
					}
				}
			}
			else {
				System.out.println("û�ҵ���Ӧ��ְλ����Id���ϣ�����");
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list1;
	}
	
	public void updateStatusById(CompanyGetResumeId id, Integer status) {
		System.out.print("�޸ļ���״̬");
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
		System.out.print("�޸ļ���״̬�ɹ�");
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
	
	//�������Ϊ������š���˾����ְλ��š�����״̬����C_R_G�м���������
	public void inser(Integer resId, Integer reciritmentId, Integer status) { //Integer resId, Integer reciritmentId, 
		Session session = HibernateSessionFactory.getSession();
		CompanyGetResume companyGetResume = new CompanyGetResume(); //�м��
		CompanyGetResumeId id = new CompanyGetResumeId();
		Reciritment reciritment = (Reciritment) session.get(Reciritment.class, reciritmentId); 
		Resume resume = (Resume) session.get(Resume.class, resId);
		id.setReciritment(reciritment);
		id.setResume(resume);
		companyGetResume.setId(id);
		companyGetResume.setStatus(status);
		super.add(companyGetResume);
	}
	//���ݼ���״̬�ͼ���ID����ѯ
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
	
