package com.offcn.crm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.offcn.crm.bean.Role;
import com.offcn.crm.bean.User;

@Repository
public interface SystemUserMapper {

	public List<User> getAllUserList();

	public int createUser(User user);

	public Long getUsersMaxId();

	public void deleteSystemUserById(Long id);

	public User getOneById(Long id);

	public int createSystemUser(User user);

	public Long getRoleMaxId();

	public int createRole(Role role);

	public List<Role> getAllRoles();

	public int deleteRole(Long id);

	
}
