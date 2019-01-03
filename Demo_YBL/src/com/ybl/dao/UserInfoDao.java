package com.ybl.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ybl.model.Registinfo;
import com.ybl.model.Userinfo;
import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;

public class UserInfoDao extends BaseHibernateDao {
	
	/**
	 * 通过id（主键）获取用户对象
	 */
	public Userinfo selectById(Integer id) {
		Session session = HibernateSessionFactory.getSession();
		return (Userinfo) super.get(Userinfo.class, id);
	}
	/**
	 * 通过email(非主键)获取用户对象
	 * @param email
	 * @return
	 */
	public Userinfo selectByEmail(String email) {
		Session session = null;
		Userinfo userinfo = null;
		Transaction t = null;
		try {
			session = HibernateSessionFactory.getSession(); //
			t = session.beginTransaction();
			Query query = session.createQuery("from Userinfo where email=?");
			query.setParameter(0, email);
			//query.setMaxResults(1);
			userinfo = (Userinfo) query.uniqueResult();
			t.commit();
		} catch (Exception e) {
			if(t!=null) t.rollback();
			e.printStackTrace();
		} finally{
			SessionOption.closeSession();
		}
		return userinfo;
	}
	
	public void inser(Userinfo userInfo) {
		Session session = HibernateSessionFactory.getSession();
		super.add(userInfo);
	}
	
	public void updatePasswordByEmail(String email, String password) {
		Session session = null;
		Userinfo userinfo = null;
		Transaction t = null;
		try {
			session = HibernateSessionFactory.getSession(); 
			Query query = session.createQuery("from Userinfo where email=?");
			query.setParameter(0, email);
			userinfo = (Userinfo) query.uniqueResult();
			userinfo.setPassword(password); 	//重置该用户的密码
			super.update(userinfo); 			//提交修改
			//t.commit();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			SessionOption.closeSession();
		}
	}
	
	public static void main(String[] args) {
		UserInfoDao dao = new UserInfoDao();
		//Userinfo userinfo = dao.selectByEmail("123456789@163.com");
		//dao.updatePasswordByEmail("987654321@163.com", "fafcbsui");
		//System.out.println(userinfo.toString());
	}
	
}
