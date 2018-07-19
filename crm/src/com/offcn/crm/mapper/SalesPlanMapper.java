package com.offcn.crm.mapper;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.bean.SalesPlan;

@Repository("mapper")
public interface SalesPlanMapper {
	
	public int getSalesplanMaxIndex();

	public int addSalesplan(SalesPlan salesPlan);

	public List<SalesChance> getSalesPlanList();

	public List<SalesChance> getSalesPlanById(Integer id);
}
