package tech.csm.dao;

import org.hibernate.Session;
import org.hibernate.Transaction;

import tech.csm.entity.User1;
import tech.csm.util.HibernateUtil;

public class UserDaoImpl implements UserDao {
	private static Session session;
	static {
		session=HibernateUtil.getSession();
	}
	@Override
	public String saveUser(User1 user) {
		String id;
		Transaction tx = session.beginTransaction();
		id=(String)session.save(user);
		tx.commit();
		return id;
	}

}
