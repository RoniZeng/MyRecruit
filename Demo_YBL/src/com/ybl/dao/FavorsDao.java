package com.ybl.dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Set;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Favors;
import com.ybl.model.Reciritment;
import com.ybl.tool.HibernateSessionFactory;

public class FavorsDao extends BaseHibernateDao{
	
	//通过求职者Id和招聘Id查询求职者是否收藏了这个招聘,收藏了为true
	public boolean selectByEmpIdRecId(Integer empId, Integer recId) {
		Session session = HibernateSessionFactory.getSession();
		int sz = 0;
		Query query = session.createQuery("from Favors where userId=? and collectId=?");
		query.setParameter(0, empId);
		query.setParameter(1, recId);
		sz = query.list().size();
		session.close();
		if(sz!=0) {
			return true;
		}
		return false;
	}
	
	public void inser(Integer userId, Integer reciritmentId, Date date) {
		Favors favors = new Favors();
		favors.setUserId(userId);
		favors.setCollectId(reciritmentId);
		favors.setCollectTime(date);
		super.add(favors);
	}
	
	//查询id为userId的求职者 的所有收藏职位（Reciritment）xxxxxxxxxxxxxx
	public List<Reciritment> selectRecByEmpId(Integer userId) {
		List<Reciritment> rlist = new ArrayList<Reciritment>();
		List<Favors> flist = new ArrayList<Favors>();
		ReciritmentDao recDao = new ReciritmentDao();
		
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Favors where userId=?"); //根据userId搜索这个Favors对象
		query.setParameter(0, userId);
		flist = query.list(); //得到Favors对象
		session.close();
		for (Favors favors : flist) {
			Reciritment r = recDao.selectById(favors.getCollectId()); //通过f的职位id搜索职位对象
			rlist.add(r);
		}
		return rlist;
	}
	
	//删除求职者id为userId且 职位Id为reciritmentId的 的收藏信息（Favors）
	public void deleteByEmpIdRecId(Integer userId, Integer reciritmentId) {
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Favors where userId=? and collectId=?");
		query.setParameter(0, userId);
		query.setParameter(1, reciritmentId);
		Favors favors = (Favors) query.uniqueResult();
		super.delete(favors);
	}
	
	public static void main(String[] args) { 
		FavorsDao dao = new FavorsDao();
		List<Reciritment> rlist = new ArrayList<Reciritment>();
		dao.inser(100000000, 30, new Date());
//		rlist = dao.selectRecByEmpId(100000000);
//		for (Reciritment reciritment : rlist) {
//			System.out.println(reciritment.getCity() + " " + reciritment.getNum());
//		}
	}

}
