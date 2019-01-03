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
	 * ��Ӹ�����ϸ��Ϣ�����ԣ�
	 */
	public void addEmp(Employee employee){
    	super.add(employee);
	}
	
	/**
	 * �޸ĸ�����ϸ��Ϣ
	 */
	public void updateEmp(Employee employee){
		System.out.println("�޸�ǰ����������");
		super.update(employee);
		System.out.println("�޸ĺ󡣡�������");
	}
	
	/**
	 * ͨ��ID��ѯ������ϸ��Ϣ
	 */
	public Employee selectById(Integer id){
		System.out.println("����ID��ȡ��ְ��.........");
		return (Employee) super.get(Employee.class, id);
	}
	
	/**
	 * ����һ��email�ֶ�
	 */
	public Employee inseEmail(String email) {
		Employee employee = new Employee();
		employee.setEmail(email);
		super.add(employee);
		return employee;
	}
	
	/**
	 * �����û���ģ������
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
//		List<Employee> l = dao.selectByName("��");
//		for (Employee e : l) {
//			System.out.println(e.getName());
//		}
	}
}
