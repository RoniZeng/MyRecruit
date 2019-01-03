package com.ybl.dao;
import java.io.Serializable;
import java.util.List;
import java.util.Map;

import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Example;

import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;

public class BaseHibernateDao {
	
	
	protected List search(Class cla, Object condition) {
		Session session = null;
		List list = null;
		try{
			session = HibernateSessionFactory.getSession();
			list = session.createCriteria(cla).add(Example.create(condition)).list();
		} catch (Exception e) {
			e.printStackTrace();
		} finally{
			HibernateSessionFactory.closeSession();
		}
		return list;
	}
	
    protected void add(Object object) {
        Transaction t = null;
        Session session = HibernateSessionFactory.getSession();
        try{
            t = session.beginTransaction();
            session.save(object);
            t.commit();
        }catch (Exception e) {
            if(t!=null){
                t.rollback();
            }
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession();
        }
    }
    
    protected Object get(Class cla, Serializable id) {
        Object object = null;
        Session session = HibernateSessionFactory.getSession();
        try{
            object = session.get(cla, id);
        }catch (Exception e) {
            e.printStackTrace();
        }finally{
            HibernateSessionFactory.closeSession();
        }
        return object;
    }
    
    
    protected void delete(Object object) {
        Transaction t = null;
        Session session = HibernateSessionFactory.getSession();
        try {
            t = session.beginTransaction();
            session.delete(object);
            t.commit();
        } catch (Exception e) {
            if(t!=null){
                t.rollback();
            }
            e.printStackTrace();
        } finally{
            HibernateSessionFactory.closeSession();
        }
    }
    
    
    protected void update(Object object) {
        Transaction t = null;
        Session session = HibernateSessionFactory.getSession();
        try {
            t = session.beginTransaction();
            session.update(object);
            t.commit();
        } catch (Exception e) {
            if(t!=null){
                t.rollback();
            }
            e.printStackTrace();
        } finally{
            HibernateSessionFactory.closeSession();
        }
     }
    
}