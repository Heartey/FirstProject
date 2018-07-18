package com.offcn.server;

import javax.ws.rs.DELETE;
import javax.ws.rs.GET;
import javax.ws.rs.POST;
import javax.ws.rs.PUT;
import javax.ws.rs.Path;
import javax.ws.rs.PathParam;
import javax.ws.rs.Produces;
import javax.ws.rs.core.MediaType;

import com.offcn.po.User;

public interface REST {

	/**
	 * get方法
	 */
	@GET
	@Path("/get/{id}")
	@Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	public User get(@PathParam("id") int id);
	
	/**
	 * post方法
	 */
	@POST
	@Path("/post/{id}")
	@Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	public User post(@PathParam("id") int id,User u);
	
	
	/**
	 * put方法
	 */
	@PUT
	@Path("/put/{id}")
	@Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	public User put(@PathParam("id") int id,User u);
	
	/**
	 * delete方法
	 */
	@DELETE
	@Path("/delete/{id}")
	@Produces({MediaType.APPLICATION_XML,MediaType.APPLICATION_JSON})
	public User delete(@PathParam("id") int id);
}
