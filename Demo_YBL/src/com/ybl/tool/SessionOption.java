package com.ybl.tool;

import org.hibernate.Session;

public class SessionOption {
	private static Session session;
	public static void getCurrentSession() {
		 session = HibernateSessionFactory.getSession();
    }
    //πÿ±’session¡¨Ω”
    public static void closeSession() {
        if(session != null){
            HibernateSessionFactory.closeSession();
        }
    }
}
