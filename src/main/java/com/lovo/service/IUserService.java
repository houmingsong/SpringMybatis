package com.lovo.service;

import com.lovo.entity.UserEntity;

public interface IUserService {

	public UserEntity login(String username, String password);

	public void addUser(UserEntity user);
}
