package com.demomain.openlegacy.services.controllers;

import io.swagger.annotations.Api;
import io.swagger.annotations.ApiOperation;

import java.math.BigInteger;

import javax.inject.Inject;
import javax.ws.rs.Consumes;
import javax.ws.rs.GET;
import javax.ws.rs.Path;
import javax.ws.rs.Produces;
import javax.ws.rs.QueryParam;
import javax.ws.rs.core.MediaType;
import javax.ws.rs.core.Response;

import org.openlegacy.annotations.OpenlegacyDesigntime;
import org.springframework.stereotype.Component;

import com.demomain.core.annotation.PATCH;
import com.demomain.openlegacy.services.AccountBalanceService;
import com.demomain.openlegacy.services.AccountBalanceService.AccountBalanceIn;
import com.demomain.openlegacy.services.AccountBalanceService.AccountBalanceOut;

@Component
@Path("/accountbalance")
@Api(value="AccountBalance")
@Produces(MediaType.APPLICATION_JSON)
@Consumes(MediaType.APPLICATION_JSON)
@OpenlegacyDesigntime(editor = "WebServiceEditor")
public class AccountBalanceController {

	@Inject
	private AccountBalanceService accountBalanceService;

	@GET
	@ApiOperation(value="AccountBalance GET operation", response = AccountBalanceOut.class)
	public Response getAccountBalance(@QueryParam(value="rqAccountnum") BigInteger rqAccountnum, @QueryParam(value="rqCoid") Integer rqCoid, @QueryParam(value="rqAccounttype") String rqAccounttype) throws Exception {
		AccountBalanceIn accountBalanceIn = new AccountBalanceIn();
		accountBalanceIn.setRqAccountnum(rqAccountnum);
		accountBalanceIn.setRqCoid(rqCoid);
		accountBalanceIn.setRqAccounttype(rqAccounttype);
		AccountBalanceOut accountBalanceOut = accountBalanceService.getAccountBalance(accountBalanceIn);
		return Response.status(200).entity(accountBalanceOut).build();
	}
	
	@PATCH
	@ApiOperation(value="AccountBalance PATCH operation", response = AccountBalanceOut.class)
	public Response updateAccountBalance(AccountBalanceIn accountBalanceIn) {
		System.out.println("In Patch method...");
		
		return Response.status(200).entity("success").build();
	}
}
