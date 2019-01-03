package com.ybl.dao;

import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Admin;
import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.model.Reciritment;
import com.ybl.model.Resume;
import com.ybl.model.Userinfo;
import com.ybl.tool.DButil;
import com.ybl.tool.HibernateSessionFactory;

public class AdminDao extends BaseHibernateDao{
	/**
	 * 管理员登录
	 * @param admin
	 * @return
	 */
	public boolean login(Admin admin) {
		Session session = HibernateSessionFactory.getSession();
		Integer id = admin.getId();
		String password = admin.getPassword();
		Query query = session.createQuery("from Admin where id = ? and password = ?");
		query.setParameter(0,id);
		query.setParameter(1,password);
		List list = query.list();
		session.close();
		if(list.size()>0) {
			System.out.println("找到了用户！");
			return true;
		}
		return false;
	}
	
	public List findString(String tableName, String attributeName, String obj) {
		Session session = HibernateSessionFactory.getSession();
		String sql;
		if(attributeName==null||attributeName.trim().length()==0)
		{
			sql="from "+tableName;
			return session.createQuery(sql).list();
		}
		else
		{
			sql="from "+tableName+" where "+attributeName+" like ?";
			Query query=session.createQuery(sql);
			query.setParameter(0, "%"+obj+"%");
			return query.list();
		}
	}
	
	public List findInteger(String tableName, String attributeName, Integer obj) {
		Session session = HibernateSessionFactory.getSession();
		String sql;
		List<Object> list = null;
		if(attributeName==null||attributeName.trim().length()==0)
		{
			sql="from "+tableName;
			return session.createQuery(sql).list();
		}
		else
		{
			sql="from "+tableName+" where "+attributeName+" = ?"; //简历ID/职位ID
			Query query = session.createQuery(sql);
			query.setParameter(0, obj);
			return query.list();
		}
	}
	
	//根据求职者ID查询其简历信息
	public Resume findByEmpId(Integer empId) {
		Employee employee = (Employee) super.get(Employee.class, empId);
		return employee.getResume();
	}
	
	//根据公司ID查询其职位信息
	public List<Reciritment> selectByComId(Integer comId) {
		List<Reciritment> list = null;
		Company company = (Company) super.get(Company.class, comId);
		Set<Reciritment> set = company.getReciritments();
		for (Reciritment reciritment : set) {
			list.add(reciritment);
		}
		return list;
	}
	
	
	public Admin inser(Admin admin) {
		super.add(admin);
		return admin;
	}
	
	public void updatePassword(Integer adminId, String newPassword) {
		Session session = HibernateSessionFactory.getSession();
		Admin admin = new Admin();
		Query query = session.createQuery("from Admin where id = ?");
		query.setParameter(0, adminId);
		admin = (Admin) query.uniqueResult();
		admin.setPassword(newPassword); 	//重置该用户的密码
		super.update(admin); 			//提交修改
	}

	public void deleteAll(String tableName, Object tableId) { //根据表名和表的主键删除这张表
		Session session = HibernateSessionFactory.getSession();
		String hql = "from " + tableName + " where id=?";
		Query query = session.createQuery(hql);
		query.setParameter(0, tableId);
		Object object = query.uniqueResult();
		System.out.println("删除这个记录！");
		session.delete(object);
		session.close();
	}
}
