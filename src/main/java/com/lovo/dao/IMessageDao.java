package com.lovo.dao;

import java.util.List;

import com.lovo.entity.MesEntity;
import com.lovo.entity.MessageEntity;

public interface IMessageDao {

	public List<MessageEntity> show(int currentpage);

	public int getTotalPage();
	
	public List<MesEntity> show1(Integer id);
	
	public List<MessageEntity> show2();
	
	public List<MessageEntity> QueryAllUsers();
	
	public List<MessageEntity> select(String sex,String scondition);
}
