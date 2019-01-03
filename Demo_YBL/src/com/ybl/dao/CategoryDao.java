package com.ybl.dao;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Category;
import com.ybl.tool.HibernateSessionFactory;

public class CategoryDao extends BaseHibernateDao{
	
	public Category selectById(Integer id) {
		return (Category) super.get(Category.class, id);
	}
	
	public static void main(String[] args) {
//		CategoryDao dao = new CategoryDao();
//		Category c = dao.selectById(1);
//		System.out.println(c.getId() + " " + c.getName());
	}

	public Category selectByName(String findString) {
		Session session = HibernateSessionFactory.getSession();
		Category category = new Category();
		try {
			Query query = session.createQuery("from Category where name = ?");
			query.setParameter(0, findString);
			category = (Category) query.uniqueResult();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return category;
	}

	public void inser(String newCategoryName) {
		Category category = new Category();
		category.setName(newCategoryName);
		super.add(category);
	}
}
