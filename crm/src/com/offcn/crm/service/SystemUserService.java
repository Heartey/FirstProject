package com.offcn.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.crm.bean.Role;
import com.offcn.crm.bean.User;
import com.offcn.crm.mapper.SystemUserMapper;


@Service
public class SystemUserService {

	@Autowired
	private SystemUserMapper mapper;

	public List<User> getAllUserList() {
		List<User> userList = mapper.getAllUserList();
		for(User listU:userList) {
			if(listU.getEnabled() == 1) {
				listU.setEnabledStatus("有效");
			}else if(listU.getEnabled() == 0){
				listU.setEnabledStatus("无效");
			}
		}
		return userList;
	}

	
	/**
	 * 创建用户
	 */
	public void createUser(User user) {
		user.setId(mapper.getUsersMaxId() + 1);
		mapper.createUser(user);
	}


	/**
	 * 删除系统用户
	 */
	public void deleteSystemUserById(Long id) {
		mapper.deleteSystemUserById(id);
	}

	/**
	 * 回显
	 */
	public User getOneById(Long id) {
		return mapper.getOneById(id);
	}

	/**
	 * 修改
	 */
	public void createSystemUser(Long id, User user) {
		user.setId(id);	
		mapper.createSystemUser(user);
	}

	/**
	 * 获取角色列表
	 */
	public List<Role> getAllRoles() {
		return mapper.getAllRoles();
	}
	
	/**
	 * 新建角色
	 */
	public void createRole(Role role) {
		//Long id = mapper.getRoleMaxId();
		role.setId(1l);
		mapper.createRole(role);
	}


	public void deleteRole(Long id) {
		mapper.deleteRole(id);
	}

	
	
	
	
}
