package com.ybl.dao;

import java.util.List;
import org.hibernate.Query;
import org.hibernate.Session;
import org.hibernate.Transaction;

import com.ybl.model.Registinfo;
import com.ybl.model.Userinfo;
import com.ybl.tool.HibernateSessionFactory;
import com.ybl.tool.SessionOption;
import com.ybl.tool.UUIDUtils;
import com.ybl.tool.YblHashCode;

public class LoginDao{
    /**
     * µ«¬º£∫—È÷§” œ‰∫Õ√‹¬Î
     * @param user 
     * @return Userinfo
     */
    public Userinfo login(String email, String password){
    	Session session = null;
        Transaction t = null;
    	Userinfo userinfo = null;
    	try{
	    	session = HibernateSessionFactory.getSession();
	    	t = session.beginTransaction();
	    	String hql = "from Userinfo where email=? and password=?";
	        Query query = session.createQuery(hql);
	        query.setParameter(0, email);
	        query.setParameter(1, password);
	        //List list = query.list();
	        userinfo = (Userinfo) query.uniqueResult();
	        t.commit();
    	} catch (Exception e) {
    		if(t!=null) t.rollback();
    		e.printStackTrace();
		} 
    	finally{
			session.close();
		}
    	
        if(userinfo!=null && !userinfo.equals("")) {
        	return userinfo;
        }
        else {
        	return null;
        }
    }
    
    public static void main(String[] args) {
		//LoginDao dao = new LoginDao();
		//Userinfo userinfo = dao.login("1111", "11");
	}
}