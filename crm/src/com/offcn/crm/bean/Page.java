package com.offcn.crm.bean;

import java.util.List;

/**
 * 封装分页信息
 */
public class Page<T> {

	private List<SalesChance> list;		//封装查询的数据列表,数据库中查询得到该值
	private  int totalRecord;			//记录条数,数据库中查询得到该值
	
	private int pageNumber;				//当前页
	private int pageSize = 3;				//每页显示的条数据的数量,固定值
	
	//private int totalPage;				//共几页,计算得到
	//private int index;					//起始索引,计算得到
	
	private String path;
	
	public Page(int totalRecord, int pageNumber) {
		super();
		this.totalRecord = totalRecord;
		this.pageNumber = pageNumber;
	}
	
	public List<SalesChance> getList() {
		return list;
	}
	
	public void setList(List<SalesChance> list) {
		this.list = list;
	}
	public int getTotalRecord() {
		return totalRecord;
	}
	public void setTotalRecord(int totalRecord) {
		this.totalRecord = totalRecord;
	}
	public int getPageNumber() {
		if(pageNumber < 1) {
			return 1;
		}
		if(pageNumber > getTotalPage()) {
			return getTotalPage();
		}
		return pageNumber;
	}
	public void setPageNumber(int pageNumber) {
		this.pageNumber = pageNumber;
	}
	public int getPageSize() {
		return pageSize;
	}
	/*public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}*/
	public int getTotalPage() {
		if(getTotalRecord() % getPageSize() == 0) {
			return getTotalRecord() / getPageSize();
		}else {
			return getTotalRecord() / getPageSize() + 1;
		}
			
	}
	
	/**当前页	     每页条数	       起始索引
	 *  1   	3  		0
	 *  2   	3  		3
	 *  3   	3  		6
	 *  (getPageNumber()-1) * getPageSize()*/
	public int getIndex() {
		return (getPageNumber()-1) * getPageSize();
	}

	public String getPath() {
		return path;
	}

	public void setPath(String path) {
		this.path = path;
	}

	@Override
	public String toString() {
		return "Page [ totalRecord=" + totalRecord + ", pageNumber=" + pageNumber + ", pageSize="
				+ pageSize + ", path=" + path + "]";
	}
	
	
	
}
