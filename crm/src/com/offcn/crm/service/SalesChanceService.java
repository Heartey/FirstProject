package com.offcn.crm.service;

import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;
import java.util.Map.Entry;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.offcn.crm.bean.Page;
import com.offcn.crm.bean.SalesChance;
import com.offcn.crm.mapper.SalesChanceMapper;

/**
 * @author Administrator
 *
 */
@Service
public class SalesChanceService {

	@Autowired
	private SalesChanceMapper mapper;
	
	/**
	 * 查询和分页
	 */
	@Transactional(readOnly=true)
	public Page<SalesChance> SalesChancePage(Map<String, Object> map, String pageNumber){
		int pageNo = 1;
		try {
			pageNo = Integer.parseInt(pageNumber);
		}catch(Exception e) {
//			e.printStackTrace();
		}
		
		Map<String, String> PPTMap = parseParameterMapToMubatisParameterMap(map);
		
		
		/**1.获得totalRecord的值*/
		int totalRecord = mapper.getCountPage(PPTMap);
		/**2.创建Page对象*/
		Page<SalesChance> page = new Page<SalesChance>(totalRecord, pageNo);
		
		/**3.从数据库获得数据列表,并封装进Page对象中*/
		int firstIndex = page.getIndex() + 1;
		int endIndex = page.getIndex() + 1 + page.getPageSize();
		PPTMap.put("firstIndex", firstIndex+"");;
		PPTMap.put("endIndex", endIndex+"");
		List<SalesChance> list = mapper.getPageList(PPTMap);
		page.setList(list);
		return page;
	}

	
	/**
	 * 将map的key值去掉LIKE_,value值前后加上%
	 */
	private Map<String, String> parseParameterMapToMubatisParameterMap(Map<String, Object> map) {
		Map<String,String> mybatisMap = new HashMap<>();
		/**1.首先遍历map集合*/
		for(Entry<String, Object> entry: map.entrySet()) {
			String key = entry.getKey();
			String value = (String) entry.getValue();
			
			/**2.修改key和value的值*/	
			if(key.startsWith("LIKE_")) {	//判断key的值是否以LIKE_开头
				 key = key.substring(key.indexOf("_") + 1);
				 value = "%"+value+"%";
			}
			mybatisMap.put(key, value);
		}
		return mybatisMap;
	}

	/**
	 * 增
	 */
	@Transactional
	public void addSalesChance(SalesChance salesChance) {
		Long id = (long) (mapper.getMaxId() + 1); 
		salesChance.setId(id);
		salesChance.setDesigneeDate(new Date());
		int i = mapper.addSalesChance(salesChance);
		System.out.println(i);
	}


	/**
	 * 删
	 */
	public int delectSalesChance(Long id) {
		mapper.delectSalesPlan(id);
		return mapper.delectSalesChance(id);
		
	}

	/**
	 * 改
	 */
	public SalesChance updateSalesChance(Long id) {
		
		return mapper.updateSalesChance(id);
	}


	public void updateSamesChance2(SalesChance salesChance) {
		Long id = mapper.getUserIdByName(salesChance.getDesignee());
		salesChance.getDesignee().setId(id);
		mapper.updateSamesChance2(salesChance);
	}

	
	public void updateDesignee(SalesChance saleschance) {
		mapper.updateDesignee(saleschance);
	}

	/**
	 * 改
	 */
	
}
