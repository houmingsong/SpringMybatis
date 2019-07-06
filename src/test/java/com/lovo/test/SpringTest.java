package com.lovo.test;

import org.junit.Before;
import org.junit.Test;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.lovo.entity.UserEntity;
import com.lovo.service.IUserService;
import com.lovo.uuid.Uuid;

public class SpringTest {
	
	ClassPathXmlApplicationContext app = null;
	
	@Before
	public void before() {
		app = new ClassPathXmlApplicationContext("application.xml");
	}
	
	@Test
	public void addUser() {
		IUserService user = (IUserService)app.getBean("userService");
		UserEntity user1 = new UserEntity();
		user1.setId(Uuid.uuid());
		user1.setUsername("紫云");
		user1.setPassword("159357");
		user.addUser(user1);
	}
}
