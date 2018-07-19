package junit.test;

import java.sql.Connection;
import java.sql.SQLException;

import javax.sql.DataSource;

import org.junit.Test;
import org.springframework.context.ApplicationContext;
import org.springframework.context.support.ClassPathXmlApplicationContext;

import com.mchange.v2.c3p0.ComboPooledDataSource;
import com.offcn.crm.bean.Authority;
import com.offcn.crm.bean.User;
import com.offcn.crm.service.UserService;

public class TestCrm {

	@Test
	public void test() throws SQLException {
		ApplicationContext ac = new ClassPathXmlApplicationContext("applicationContext.xml");
		UserService bean = ac.getBean(UserService.class);
		User user = new User();
		user.setName("bcde");
		user.setPassword("4f6ed9e4ab25a6dac05933a8a0c5822ada8177e5");
		User user2 = bean.getUserByName(user);
		for(Authority authority:user2.getRole().getAuthorities()) {
			System.out.println(authority.getId()+":"+authority.getDisplayName()
			+":"+authority.getParentAuthority().getDisplayName());
		}
	}

}
