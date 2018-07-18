package com.offcn.test;

import org.apache.cxf.jaxrs.client.JAXRSClientFactory;

import com.offcn.po.User;
import com.offcn.server.REST;

public class Test {

	public static void main(String[] args) {
		REST rest = JAXRSClientFactory.create("http://localhost:8080/day05_JAX_RS/service/bbb", REST.class);
		User user = rest.get(999);
		System.out.println(user.toString());
	}

}
