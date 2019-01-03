package com.ybl.dao;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.Query;
import org.hibernate.Session;

import com.ybl.model.Position;
import com.ybl.model.School;
import com.ybl.tool.HibernateSessionFactory;

public class PositionDao extends BaseHibernateDao{
//	public List<Position> selectByName(String str) {
//		Session session = HibernateSessionFactory.getSession();
//		List<Position> list = new ArrayList<Position>();
//			try {
//				Query query = session.createQuery("from Position where name like '%"+str+"%'");
//				list = query.list();
//			} catch (Exception e) {
//				e.printStackTrace();
//			} finally {
//				session.close();
//			}
//			return list;
//	}
	public static void main(String[] args) {
//		PositionDao dao = new PositionDao();
//		dao.selectByName("ÉúÎï");
	}
	public void inser(Position position) {
		super.add(position);
	}
}
