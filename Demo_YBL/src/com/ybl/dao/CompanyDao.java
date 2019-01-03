package com.ybl.dao;

import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Company;
import com.ybl.tool.HibernateSessionFactory;

public class CompanyDao extends BaseHibernateDao {
//	Session session = null;
//    Transaction t = null;
	public void addCompany(Company company){
    	super.add(company);
	}
	
	public void updateCompany(Company company){
		super.update(company);
	}
	
	public Company selectById(Integer id){
		return (Company) super.get(Company.class, id);
	}
	
	public Company inseEmail(String email) {
		Company c = new Company();
		c.setEmail(email);
		super.add(c);
		return c;
	}

	public Company updateNameById(Integer userId, String name) {
		System.out.println("执行前...........");
		Company company = (Company) super.get(Company.class, userId);
		System.out.println("执行...........");
		company.setName(name);
		System.out.println("修改...........");
		super.update(company);
		System.out.println("======================");
		return company;
	}
	
	public Company updateLSWById(Integer userId, String location, Integer size,
			String website) {
		System.out.println(location);
		Company company = (Company) super.get(Company.class, userId);
		company.setLocation(location);
		company.setSize(size);
		company.setWebsite(website);
		super.update(company);
		System.out.println( company.getId() +" "+ company.getLocation());
		return company;
	}
	
	public Company updateIntroduceById(Integer userId, String introduce) {
		Company company = (Company) super.get(Company.class, userId);
		company.setIntroduce(introduce);
		super.update(company);
		return company;
	}
	
	public Company updateLogoById(Integer userId, String uploadFileName) {
		Company company = (Company) super.get(Company.class, userId);
		company.setLogo(uploadFileName);
		super.update(company);
		return company;
	}
	
	public List<Company> selectByName(String str) {
		Session session = HibernateSessionFactory.getSession();
		List<Company> list = null;
		try {
			Query query = session.createQuery("from Company where name like '%"+str+"%'");
			list = query.list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			session.close();
		}
		return list;
	}
	
	public static void main(String[] args) {
//		CompanyDao dao = new CompanyDao();
//		Company com = dao.selectById(14);
//		System.out.println( com.getId() +" "+ com.getName());
	}
	
}
