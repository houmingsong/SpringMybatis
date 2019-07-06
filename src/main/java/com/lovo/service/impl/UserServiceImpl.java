package com.lovo.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.lovo.dao.IUserDao;
import com.lovo.entity.UserEntity;
import com.lovo.service.IUserService;
@Service(value="userService")
public class UserServiceImpl implements IUserService{
	
	@Autowired
	private IUserDao userDao; 
	
	@Override
	public UserEntity login(String username, String password) {
		
		return userDao.login(username, password);
	}

	@Override
	public void addUser(UserEntity user) {
		userDao.addUser(user);
		
	}

}
