package com.ybl.tool;

import org.hibernate.Session;

public class SessionOption {
	private static Session session;
	public static void getCurrentSession() {
		 session = HibernateSessionFactory.getSession();
    }
    //�ر�session����
    public static void closeSession() {
        if(session != null){
            HibernateSessionFactory.closeSession();
        }
    }
}
