package com.offcn.crm.contruller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.offcn.crm.bean.Authority;
import com.offcn.crm.bean.User;
import com.offcn.crm.json.Navigation;
import com.offcn.crm.service.UserService;

/**
 * @author Administrator
 *
 */
@Controller
public class UserContruller {

	@Autowired
	private UserService service;
	
	/**
	 * 获取后台返回的Json数据,并让其在前端显示
	 */
	@RequestMapping("/menuee")
	@ResponseBody
	public List<Navigation> menus(HttpSession session,HttpServletRequest request){
		List<Navigation> list = new ArrayList<Navigation>();
		String contextPath = request.getContextPath();
		/**1.创建一级导航,获取用户的权限*/
		Navigation top = new Navigation(Long.MAX_VALUE, "客户关系管理系统");
		User user = (User) session.getAttribute("user");
		
		/**2.创建二级导航*/
		Map<Long,Navigation> parentMap = new HashMap<>();
		
		for(Authority authority:user.getRole().getAuthorities()) {
			
			/**3.创建三级权限,获得Url值*/
			Navigation sonnavigation = new Navigation(authority.getId(), authority.getDisplayName());
			sonnavigation.setUrl(contextPath+authority.getUrl());
			
			/**2.1获得二级权限和他的Id*/
			Authority parentAuthority = authority.getParentAuthority();
			Long id = parentAuthority.getId(); 
			Navigation parentNavigation = parentMap.get(id);
			if(parentNavigation == null) {
				parentNavigation = new Navigation(id, parentAuthority.getDisplayName());
				parentNavigation.setState("closed");
				/**2.2将权限及Id添加到二级导航中*/
				parentMap.put(id, parentNavigation);
				/**2.3将二级导航添加到一级导航的Children属性中*/
				top.getChildren().add(parentNavigation);
			}
			/**3.1将三级导航添加到二级导航的Children属性中*/
			parentNavigation.getChildren().add(sonnavigation);
		}
		
		list.add(top);
		return list;
	}
	
	/**
	 * 登入
	 */
	@RequestMapping(value="/login")
	public String login(User user,RedirectAttributes redirect,HttpSession session) {
		User user1 = service.getUserByName(user);
		if(user1 == null) {
			redirect.addFlashAttribute("msg","用户名或密码有误,请重新登	");
			return "redirect:/index";
		}
		
		session.setAttribute("user",user1);
		return "success";
	}
	
	/**
	 * 登出
	 */
	@RequestMapping(value="logout",method=RequestMethod.GET)
	public String logout(HttpSession session) {
		session.invalidate();
		return "redirect:/index";
	}
}
