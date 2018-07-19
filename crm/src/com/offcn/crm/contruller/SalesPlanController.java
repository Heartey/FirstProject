package com.offcn.crm.contruller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.bean.SalesPlan;
import com.offcn.crm.service.SalesPlanService;

@Controller
@RequestMapping("/plan")
public class SalesPlanController {
	
	@Autowired
	private SalesPlanService service;

	@RequestMapping(value="/list",method=RequestMethod.GET)
	public ModelAndView salesPlan(HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/salesplan/salesPlanList");
		List<SalesChance> chanceList = service.getSalesPlanList();
		mv.addObject("chanceList", chanceList);
		return mv;
	}
	
	@RequestMapping(value="/make",method=RequestMethod.GET)
	public ModelAndView makePlan(Integer id, HttpServletRequest request) {
		ModelAndView mv = new ModelAndView("/salesplan/make");
		List<SalesChance> salesPlanList = service.getSalesPlanById(id);
		mv.addObject("salesPlanList", salesPlanList);
		return mv;
	}
	
	@RequestMapping(value="/execution",method=RequestMethod.GET)
	public String executionPlan(Integer id, HttpServletRequest request) {
		return "/salesplan/execution";
	}
	
	
	@RequestMapping(value="/create",method=RequestMethod.POST)
	public String makePlan1(SalesPlan salesPlan) {
		service.addSalesplan(salesPlan);
		return "/salesplan/make";
	}
	
	/*@RequestMapping(value="/create",method=RequestMethod.POST)
	@ResponseBody
	public ResultEntity<SalesPlan> makePlan1(SalesPlan salesPlan) {
		service.addSalesplan(salesPlan);
		ResultEntity<SalesPlan> re = new ResultEntity(200,salesPlan.getTodo());
		return re;
	}*/
	
	@RequestMapping(value="/assign",method=RequestMethod.GET)
	public ModelAndView assignPlan(Integer id) {
		ModelAndView mv = new ModelAndView("/systemuser/assign");
		return mv;
	}
}
