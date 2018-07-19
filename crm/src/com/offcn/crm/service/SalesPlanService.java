package com.offcn.crm.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.bean.SalesPlan;
import com.offcn.crm.mapper.SalesPlanMapper;

@Service
public class SalesPlanService {

	@Autowired
	private SalesPlanMapper mapper;
	
	public int addSalesplan(SalesPlan salesPlan) {
		Long index = (long) mapper.getSalesplanMaxIndex();
		salesPlan.setId(index + 1);
		int i = mapper.addSalesplan(salesPlan);
		System.out.println(i);
		return i;
	}

	public List<SalesChance> getSalesPlanList() {
		
		return mapper.getSalesPlanList();
	}

	public List<SalesChance> getSalesPlanById(Integer id) {
		
		return mapper.getSalesPlanById(id);
	}
}
