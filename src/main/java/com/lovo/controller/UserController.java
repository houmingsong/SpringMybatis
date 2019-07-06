package com.lovo.controller;

import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.lovo.entity.MesEntity;
import com.lovo.entity.MessageEntity;
import com.lovo.entity.PageEntity;
import com.lovo.entity.UserEntity;
import com.lovo.service.IMessageService;
import com.lovo.service.IUserService;
import com.lovo.uuid.Uuid;

/**
 * 用户控制层
 * 
 * @author castle
 *
 */
@Controller
public class UserController {

	@Autowired
	private IUserService userService;

	@Autowired
	private IMessageService messageService;

	/**
	 * 登录
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return 展示页面
	 */
	@RequestMapping("login.lovo")
	public ModelAndView login(String username, String password) {
		ModelAndView mv = new ModelAndView("show");
		UserEntity user = userService.login(username, password);
		if (user == null) {
			mv.setViewName("login");
		}
		return mv;
	}

	/**
	 * 添加用户
	 * 
	 * @param username
	 *            用户名
	 * @param password
	 *            密码
	 * @return 登录页面
	 */
	@RequestMapping("testing.lovo")
	public ModelAndView addUser(String username, String password) {
		ModelAndView mv = new ModelAndView("login");
		UserEntity user = new UserEntity();
		user.setId(Uuid.uuid());
		user.setUsername(username);
		user.setPassword(password);
		userService.addUser(user);
		return mv;
	}

	/**
	 * jsp用ajax获取数据库数据
	 * 
	 * @param currentPage
	 *            当前页面
	 * @return 分页数据
	 */
	@RequestMapping("show.lovo")
	@ResponseBody
	public PageEntity<MessageEntity> show(Integer currentPage) {
		Integer totalPage = messageService.getTotalPage();
		if (currentPage < 1) {
			currentPage = 1;
		} else if (currentPage > totalPage) {
			currentPage = totalPage;
		}
		List<MessageEntity> list = messageService.show(currentPage);
		System.out.println(list);
		PageEntity<MessageEntity> page = new PageEntity<MessageEntity>();
		page.setCurrentPage(currentPage);
		page.setTotalPage(totalPage);
		page.setList(list);
		return page;
	}
	
	@RequestMapping("user.lovo")
	public ModelAndView show1(Integer id) {
		ModelAndView mv = new ModelAndView("show1");
		List<MesEntity> user = messageService.show1(id);
		mv.addObject("user",user);
		return mv;
	}
	
	
	@RequestMapping("poi.lovo")
	public ModelAndView poi() throws IOException {
		ModelAndView mv = new ModelAndView("show");
		List<MessageEntity> list = messageService.show2();
		Excle2.dbToExcle(list);
		return mv;		
	}
	
	@RequestMapping("QueryAllUsers.lovo")
	@ResponseBody
	public List<MessageEntity> QueryAllUsers(){
		List<MessageEntity> list = messageService.QueryAllUsers();		
		return list;		
	}
	
	@RequestMapping("exhibition.lovo")
	public ModelAndView exhibition(String[] kk) {
		ModelAndView mv = new ModelAndView("show2");
		for(String string:kk) {		
			mv.addObject("String", string);
		}
		return mv;		
	}
	
	@RequestMapping("select.lovo")
	@ResponseBody
	public List<MessageEntity> select(String sex,String scondition) {
		List<MessageEntity> mes = messageService.select(sex, scondition);
		return  mes;
	}
}
