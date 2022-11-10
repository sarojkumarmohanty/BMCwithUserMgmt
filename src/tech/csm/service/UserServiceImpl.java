package tech.csm.service;

import tech.csm.dao.UserDao;
import tech.csm.dao.UserDaoImpl;
import tech.csm.entity.User1;

public class UserServiceImpl implements UserService {

	@Override
	public String saveUser(User1 user) {
		UserDao userDao=new UserDaoImpl();
		return userDao.saveUser(user);
	}

}