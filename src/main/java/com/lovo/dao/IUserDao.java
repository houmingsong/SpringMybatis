package com.lovo.dao;

import com.lovo.entity.UserEntity;

public interface IUserDao {
	
	public UserEntity login(String username, String password);

	public void addUser(UserEntity user);
	
	
}
