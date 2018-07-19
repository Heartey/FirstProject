package com.offcn.crm.mapper;

import java.util.List;
import java.util.Map;

import org.springframework.stereotype.Repository;

import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.bean.User;

@Repository
public interface SalesChanceMapper {

	public List<SalesChance> getSalesChanceList();

	public int getCountPage(Map<String, String> pPTMap);

	public List<SalesChance> getPageList(Map<String, String> pPTMap);

	public int getMaxId();

	public int addSalesChance(SalesChance salesChance);
	
	public int delectSalesPlan(Long id); 

	public int delectSalesChance(Long id);

	public SalesChance updateSalesChance(Long id);

	public void updateSamesChance2(SalesChance salesChance);

	public int updateDesignee(SalesChance saleschance);

	public Long getUserIdByName(User designee); 
	

}
