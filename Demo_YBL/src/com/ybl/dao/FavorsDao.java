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
	
	//ͨ����ְ��Id����ƸId��ѯ��ְ���Ƿ��ղ��������Ƹ,�ղ���Ϊtrue
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
	
	//��ѯidΪuserId����ְ�� �������ղ�ְλ��Reciritment��xxxxxxxxxxxxxx
	public List<Reciritment> selectRecByEmpId(Integer userId) {
		List<Reciritment> rlist = new ArrayList<Reciritment>();
		List<Favors> flist = new ArrayList<Favors>();
		ReciritmentDao recDao = new ReciritmentDao();
		
		Session session = HibernateSessionFactory.getSession();
		Query query = session.createQuery("from Favors where userId=?"); //����userId�������Favors����
		query.setParameter(0, userId);
		flist = query.list(); //�õ�Favors����
		session.close();
		for (Favors favors : flist) {
			Reciritment r = recDao.selectById(favors.getCollectId()); //ͨ��f��ְλid����ְλ����
			rlist.add(r);
		}
		return rlist;
	}
	
	//ɾ����ְ��idΪuserId�� ְλIdΪreciritmentId�� ���ղ���Ϣ��Favors��
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
