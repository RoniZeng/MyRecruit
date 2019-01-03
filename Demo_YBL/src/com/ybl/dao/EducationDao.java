package com.ybl.dao;

import java.util.Date;

import org.hibernate.Session;

import com.ybl.model.Company;
import com.ybl.model.Education;
import com.ybl.model.Employee;
import com.ybl.model.Resume;
import com.ybl.model.School;
import com.ybl.tool.HibernateSessionFactory;

public class EducationDao extends BaseHibernateDao {
	
	public Education inser(Education education) {
		super.add(education);
		System.out.println(education.getId());
		return education;
	}
	
	/*更改教育经历信息中的学校名称、学历、专业名称、开始年份、结束年份*/
	public void updateSchholNamwById(Integer id, String schoolName) {
		Session session = HibernateSessionFactory.getSession();
		Education education = (Education) super.get(Education.class, id);
		School school = new School();
		school.setName(schoolName);
		education.setSchool(school);
		session.update(education);
		session.close();
	}
	
	public void updateEdu(Education education) {
		super.update(education);
	}
	public static void main(String[] args) {
		ResumeDao resumeDao = new ResumeDao();
		Resume resume = resumeDao.selectById(10);
		Education education = new Education();
		EducationDao dao = new EducationDao();
		education.setDegree(2);
		education.setMajor("历史学");
		education.setEndTime(new Date());
		education.setResumes(resume);
		dao.inser(education);
//		Resume resume = dao.selectById(8);
//		edu = resume.getEducation();
//		edu.setMajor("软是德国件");
//		edu.setDegree(1);
//		EducationDao eduDao = new EducationDao();
//		//eduDao.updateEdu(edu);
	}

}
