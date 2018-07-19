package com.offcn.crm.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.offcn.crm.bean.User;
import com.offcn.crm.mapper.UserMapper;

@Service
public class UserService {

	@Autowired
	private UserMapper mapper;
	
	@Transactional
	public User getUserByName(User user) {
		User user2 = mapper.getUserByName(user.getName());
		if(user2 != null && user2.getEnabled() == 1 && user.getPassword().equals(user2.getPassword())) {
			return user2;
		}
		return null;
	}
}
