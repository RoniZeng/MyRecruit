package com.ybl.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ybl.model.Company;
import com.ybl.model.Employee;
import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;

public class EmployeeDao extends BaseHibernateDao {
	
	/**
	 * 添加个人详细信息（可以）
	 */
	public void addEmp(Employee employee){
    	super.add(employee);
	}
	
	/**
	 * 修改个人详细信息
	 */
	public void updateEmp(Employee employee){
		System.out.println("修改前。。。函数");
		super.update(employee);
		System.out.println("修改后。。。函数");
	}
	
	/**
	 * 通过ID查询个人详细信息
	 */
	public Employee selectById(Integer id){
		System.out.println("根据ID获取求职者.........");
		return (Employee) super.get(Employee.class, id);
	}
	
	/**
	 * 插入一个email字段
	 */
	public Employee inseEmail(String email) {
		Employee employee = new Employee();
		employee.setEmail(email);
		super.add(employee);
		return employee;
	}
	
	/**
	 * 根据用户名模糊搜索
	 * @param args
	 */
	public List<Employee> selectByName(String findString) {
		Session session = HibernateSessionFactory.getSession();
		List<Employee> list = new ArrayList<Employee>();
		try {
			Query query = session.createQuery("from Employee where name like '%"+findString+"%'");
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	public static void main(String[] args) {
//		EmployeeDao dao = new EmployeeDao();
//		List<Employee> l = dao.selectByName("黎");
//		for (Employee e : l) {
//			System.out.println(e.getName());
//		}
	}
}
