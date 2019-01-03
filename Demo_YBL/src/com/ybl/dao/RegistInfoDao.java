package com.ybl.dao;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ybl.model.Registinfo;
import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;

public class RegistInfoDao extends BaseHibernateDao {
	
	public Registinfo selectByEmail(String email) {
		Session session = HibernateSessionFactory.getSession();
		return (Registinfo) super.get(Registinfo.class, email);
	}

	public void deleteByEmail(String email) {
		Session session = HibernateSessionFactory.getSession();
		System.out.println(email);
		Registinfo registinfo = null;
		Query query =  session.createQuery("from Registinfo where email=?");
		query.setParameter(0, email);
		registinfo = (Registinfo) query.uniqueResult();
		super.delete(registinfo);
	}
	public void inser(Registinfo registinfo) {
		super.add(registinfo);
	}
	
	public void updateCodeByEmail(String email, String code) { //通过Email在注册表找到对象，修改Code
		Session session = null;
		Registinfo registinfo = null;
		Transaction t = null;
		try {
			session = HibernateSessionFactory.getSession(); 
			Query query = session.createQuery("from Registinfo where email=?");
			query.setParameter(0, email);
			registinfo = (Registinfo) query.uniqueResult();
			registinfo.setCode(code);	//重置该用户的code
			super.update(registinfo); 			//提交修改
			//t.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			SessionOption.closeSession();
		}
	}
	
	public static void main(String[] args) {
		RegistInfoDao dao = new RegistInfoDao();
		Registinfo registinfo = new Registinfo();
		dao.deleteByEmail("123");
	}

}
