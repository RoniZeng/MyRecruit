package com.ybl.dao;

import java.util.Set;

import org.hibernate.Session;

import com.ybl.model.Education;
import com.ybl.model.Employee;
import com.ybl.model.Resume;
import com.ybl.model.Userinfo;
import com.ybl.tool.HibernateSessionFactory;

public class ResumeDao extends BaseHibernateDao{
	
	public Resume selectByUserId(Integer id) {
		Employee employee = (Employee) super.get(Employee.class, id);
		return employee.getResume();
	}
	
	public void upDateEvaluationById(Integer resId, String eva) {
		Resume resume = (Resume) super.get(Resume.class, resId);
		resume.setEvaluation(eva);
		super.update(resume);
	}

	public void upDateProExpByEmpId(Integer id, String expr) {
		Session session = HibernateSessionFactory.getSession();
		Employee employee = (Employee) session.get(Employee.class, id);
		Resume resume = employee.getResume();
		System.out.println("DAO:setterǰ....");
		resume.setProjectExperience(expr);
		System.out.println("DAO:setter��");
		super.update(resume); 
		System.out.println("����DAO");
	}

	public Resume selectById(Integer resumeId) {
		return (Resume) super.get(Resume.class, resumeId);
	}
	
	//�޸ļ���idΪresId�� ����ΪmyResume.getPaper()
		public void upDatePaperById(Integer resId, String paper) {
			Resume resume = (Resume) super.get(Resume.class, resId);
			resume.setPaper(paper);
			System.out.println("DAO�����������ֶ�");
			super.update(resume);
		}
	
		
		
	//�޸ļ���idΪresId�� ��������ΪmyResume.getEducation()
	public void upDateEducationById(Integer resId, Education education) {
		Session session = HibernateSessionFactory.getSession();
		Resume resume = (Resume) session.get(Resume.class, resId);
		EducationDao eduDao = new EducationDao();
		education.setId(resume.getEducation().getId());
		session.close();
		eduDao.updateEdu(education);
	}

	public static void main(String[] args) {
//		ResumeDao dao = new ResumeDao();
//		Education edu = new Education();
//		Resume resume = dao.selectById(8);
//		edu = resume.getEducation();
//		edu.setMajor("����ѧ");
//		edu.setDegree(0);
//		dao.upDateEducationById(8, edu);
	}

	public void inser(Resume resume) {
		super.add(resume);
	}

	public void inserEducation(Integer resId, Education education) {
		Resume resume = (Resume) super.get(Resume.class, resId);
		resume.setEducation(education);
		super.update(resume);
	}
	
}
