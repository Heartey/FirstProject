package com.offcn.crm.bean;

public class ResultEntity<T> {

	private int status;
	private T data;
	
	
	public ResultEntity(int status, T data) {
		super();
		this.status = status;
		this.data = data;
	}
	public int getStatus() {
		return status;
	}
	public void setStatus(int status) {
		this.status = status;
	}
	public T getData() {
		return data;
	}
	public void setData(T data) {
		this.data = data;
	}
	
	
}
