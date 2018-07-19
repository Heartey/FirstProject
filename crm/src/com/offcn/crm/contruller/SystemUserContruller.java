package com.offcn.crm.contruller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.offcn.crm.bean.Role;
import com.offcn.crm.bean.User;
import com.offcn.crm.service.SystemUserService;


@Controller
public class SystemUserContruller {
	
	@Autowired
	private SystemUserService service;

	@RequestMapping(value="/user/list",method=RequestMethod.GET)
	public ModelAndView userList() {
		ModelAndView mv = new ModelAndView("systemuser/user");
		List<User> userList= service.getAllUserList();
		mv.addObject("userList", userList);
		return mv;
	}
	
	/**
	 * 跳往新建用户页面
	 */
	@RequestMapping("/user/new")
	public String createNewList(Long id) {
		return "systemuser/create";
	}
	
	/**
	 * 新建用户保存
	 */
	@RequestMapping("/user/createUser")
	public String createUser(User user) {
		service.createUser(user);
		return "redirect:/user/list";
	}
	
	/**
	 * 修改用户回显页面
	 */
	@RequestMapping("/user/create")
	public ModelAndView createList(Long id) {
		ModelAndView mv = new ModelAndView("systemuser/update");
		User user = service.getOneById(id);
		mv.addObject("user", user);
		return mv;
	}
	
	/**
	 * 修改用户保存
	 */
	@RequestMapping("/user/UpdateUser")
	public String createSystemUser(Long id,User user) {
		service.createSystemUser(id,user);
		return "redirect:/user/list";
	}
	
	/**
	 * 删除系统用户
	 */
	@RequestMapping("/user/delete")
	public String deleteSystemUserById(Long id) {
		service.deleteSystemUserById(id);
		return "redirect:/user/list";
	}
	
	/**
	 * 跳往角色页面
	 */
	@RequestMapping("/role/list")
	public ModelAndView roleList() {
		ModelAndView mv = new ModelAndView("/systemuser/role");
		List<Role> roleList = service.getAllRoles();
		mv.addObject("roleList", roleList);
		return mv;
	}
	
	/**
	 * 跳往新建角色页面
	 */
	@RequestMapping("/role/input")
	public String roleInput() {
		return "systemuser/Input";
	}
	
	/**
	 * 新建角色保存
	 */
	@RequestMapping("/createRole")
	public String createRole(Role role) {
		service.createRole(role);
		return "redirect:/systemuser/role";
	}
	
	/**
	 * 删除角色
	 */
	@RequestMapping("/role/delete")
	public String deleteRole(Long id) {
		service.deleteRole(id);
		return "redirect:/systemuser/role";
	}
	
	
	
}
