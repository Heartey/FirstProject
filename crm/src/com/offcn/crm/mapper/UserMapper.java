package com.offcn.crm.mapper;

import org.springframework.stereotype.Repository;

import com.offcn.crm.bean.User;

@Repository
public interface UserMapper {
	
	public User getUserByName(String username);
}
