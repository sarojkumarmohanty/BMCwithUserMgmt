package tech.csm.util;

import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.cfg.Configuration;

import tech.csm.entity.Role;
import tech.csm.entity.User1;



public class HibernateUtil {
	private static Session session=null;
	static {
		Configuration cfg=new Configuration().configure();
		cfg.addAnnotatedClass(Role.class);
		cfg.addAnnotatedClass(User1.class);
		SessionFactory sessionFactory=cfg.buildSessionFactory();
		session=sessionFactory.openSession();
	}
	public static Session getSession() {
		return session;
	}

}
