package com.lovo.service.impl;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import com.lovo.dao.IMessageDao;
import com.lovo.entity.MesEntity;
import com.lovo.entity.MessageEntity;
import com.lovo.service.IMessageService;

@Service(value = "messageService")
public class MessageServiceImpl implements IMessageService {

	@Autowired
	private IMessageDao messageDao;

	@Override
	public List<MessageEntity> show(int currentpage) {
		currentpage = (currentpage - 1) * 4;
		List<MessageEntity> list = messageDao.show(currentpage);
		return list;
	}

	@Override
	public int getTotalPage() {
		Integer totalCount = messageDao.getTotalPage();
		Integer totalPage = (totalCount + 4 - 1) / 4;
		return totalPage;
	}

	@Override
	public List<MesEntity> show1(Integer id) {
		
		return messageDao.show1(id);
	}

	@Override
	public List<MessageEntity> show2() {
		
		return messageDao.show2();
	}

	@Override
	public List<MessageEntity> QueryAllUsers() {
		return messageDao.QueryAllUsers();
	}

	@Override
	public List<MessageEntity> select(String sex, String scondition) {
		return messageDao.select(sex, scondition);
	}

}
