package com.demomain.openlegacy.services;

import com.demo.openlegacy.A40212;
import java.math.BigInteger;
import org.openlegacy.rpc.RpcSession;

import javax.ws.rs.core.MultivaluedMap;

import org.apache.commons.lang3.StringUtils;
import java.util.Collections;
import javax.inject.Inject;

import org.junit.Assert;
import org.junit.BeforeClass;
import org.junit.Test;
import org.junit.runner.RunWith;
import org.junit.Before;

import com.demomain.openlegacy.services.AccountBalanceService;
import com.demomain.openlegacy.services.AccountBalanceService.*;

import org.springframework.test.context.ContextConfiguration;
import org.springframework.test.context.junit4.SpringJUnit4ClassRunner;


/**
 *  A test which invokes AccountBalance service.
 *  To run the test, select Run As -> JUnit test.
 *  If the service has parameters, they should be set via the test.
 */
@ContextConfiguration("/META-INF/spring/applicationContext-test.xml")
@RunWith(SpringJUnit4ClassRunner.class)
public class AccountBalanceServiceTest {

	@Inject
	AccountBalanceService accountBalanceService;


	@Test
	public void testAccountBalanceService() throws Exception {
		long before = System.currentTimeMillis();

		AccountBalanceIn accountBalanceIn = new AccountBalanceIn();
		accountBalanceIn.setRqAccountnum(BigInteger.valueOf(0));
		accountBalanceIn.setRqCoid(Integer.valueOf("0"));
		accountBalanceIn.setRqAccounttype("");
		AccountBalanceOut accountBalanceOut = accountBalanceService.getAccountBalance(accountBalanceIn);
		Assert.assertNotNull(accountBalanceOut);

		long after = System.currentTimeMillis();
		System.out.println("Execution time:" + (after-before));
	}
}
