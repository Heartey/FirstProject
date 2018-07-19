package com.offcn.crm.contruller;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;
import java.util.Map.Entry;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.util.WebUtils;

import com.offcn.crm.bean.Page;
import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.bean.User;
import com.offcn.crm.service.SalesChanceService;


@Controller
@RequestMapping("/chance")
public class SalesChanceController {

	@Autowired
	private SalesChanceService service;
	
	/**
	 * 查询
	 */
	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView getSalesChanceList(@RequestParam(value="pageNumber",required=false) String pageNumber,
			HttpServletRequest request){
		/**补充:能让Page重复利用的办法*/
		String requestURI = request.getRequestURI();
		
		/**1.获取前端页面以serch_开头的对应的值,然后将请求封装到map中传给后台*/
		Map<String, Object> map = WebUtils.getParametersStartingWith(request, "search_");
		ModelAndView mv = new ModelAndView("saleschance/list");
		Page<SalesChance> page = service.SalesChancePage(map,pageNumber);
		page.setPath(requestURI);
		mv.addObject("page",page);
		
		/**2.将请求中的参数传给前端页面*/
		String queryString = parseParameterMapToQueryString(map);
		mv.addObject("queryString",queryString);
		return mv;
	}
	
	/**
	 * 增
	 */
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String addSalesChance(SalesChance salesChance,HttpSession session) {
		User user = (User) session.getAttribute("user");
		salesChance.setCreateBy(user);
		service.addSalesChance(salesChance);
		return "redirect:list";
	}
	
	/**
	 * 删
	 */
	@RequestMapping(value="/delete",method=RequestMethod.DELETE)
	public String delectSalesChance(Long id) {
		service.delectSalesChance(id);
		return "redirect:list";
	}
	
	/**
	 * 改
	 */
	@RequestMapping(value="/update",method=RequestMethod.GET)
	public ModelAndView updateSalesChance(Long id) {
		ModelAndView mv = new ModelAndView("saleschance/update");
		SalesChance sc = service.updateSalesChance(id);
		mv.addObject("sc", sc);
		return mv;
	}
	
	@RequestMapping(value="/updatetwo",method=RequestMethod.POST)
	public String updateSamesChance2(SalesChance salesChance) {
		service.updateSamesChance2(salesChance);
		return "redirect:/chance/list";
	}

	private String parseParameterMapToQueryString(Map<String, Object> map) {
		StringBuilder st = new StringBuilder();
		for(Entry<String, Object> entry:map.entrySet()) {
			String key = entry.getKey();
			String value = (String) entry.getValue();
			st.append("&").append("search_").append(key).append("=").append(value);
		}
		return st.toString();
	}
	
	
	/**
	 * 指派
	 */
	@RequestMapping(value="/dispatch")
	public ModelAndView dispatch(Long id,SalesChance saleschance1) {
		ModelAndView mv = new ModelAndView("saleschance/designate");
		SalesChance salesChance = service.updateSalesChance(id);
		if(!(saleschance1.getDesignee() == salesChance.getDesignee())) {
			service.updateDesignee(saleschance1);
		}
		
		
		
		//修改时间显示格式
		SimpleDateFormat sd = new SimpleDateFormat("yyyy-MM-dd");
		String date = sd.format(salesChance.getCreateDate());
		try {
			salesChance.setCreateDate(sd.parse(date));
		} catch (ParseException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		mv.addObject("salesChance", salesChance);
		return mv;
	}

}