package com.ybl.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Employee;
import com.ybl.model.School;
import com.ybl.tool.HibernateSessionFactory;

public class SchoolDao extends BaseHibernateDao{
	public School selectById(Integer id) {
		return (School) super.get(School.class, id);
	}

	public School selectByName(String name) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from School where name = ?");
		query.setParameter(0, name);
		School school = (School) query.uniqueResult();
		return school;
	}
	
	public List<School> selectByNameA(String str) {
		Session session = HibernateSessionFactory.getSession();
		List<School> list = new ArrayList<School>();
			try {
				Query query = session.createQuery("from School where name like '%"+str+"%'");
				list = query.list();
			} catch (Exception e) {
				e.printStackTrace();
			} finally {
				session.close();
			}
			return list;
	}
	
	public static void main(String[] args) {
//		SchoolDao dao = new SchoolDao();
//		List<School> school = dao.selectByNameA("до");
//		for (School s : school) {
//			System.out.println(s.getName());
//		}
	}

	public void inser(School school) {
		super.add(school);
	}

}
