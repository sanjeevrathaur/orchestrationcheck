package com.demomain.openlegacy.services;


import io.swagger.annotations.ApiModel;
import io.swagger.annotations.ApiModelProperty;

import java.math.BigInteger;

import org.openlegacy.annotations.OpenlegacyDesigntime;
import org.openlegacy.annotations.services.BindFrom;
import org.openlegacy.annotations.services.BindInputs;
import org.openlegacy.annotations.services.BindTo;
import org.openlegacy.annotations.services.EntityMapping;
import org.openlegacy.annotations.services.ServiceMethod;

/**
 *  A service interface and input/oputput definition for a web service.
 *  Defines the contract between the client and server. The client uses the same interface for testing the service via Java code. 
 *  The interface AccountBalanceService can be customized to enabling passing parameters to the service.     
 */

@OpenlegacyDesigntime(editor = "WebServiceEditor")
public interface AccountBalanceService {

	@ServiceMethod(name = "getAccountBalance", cacheDuration = 0, entities = {
			@EntityMapping(alias="a40212", entity=com.demo.openlegacy.A40212.class)})
	public AccountBalanceOut getAccountBalance(AccountBalanceIn accountBalanceIn) throws Exception;

	@BindInputs(endpoints = {
			@BindTo(endpoint = "a40212.acctbalinqrq.rqAccountnum", expression = "rqAccountnum"),
			@BindTo(endpoint = "a40212.acctbalinqrq.rqCoid", expression = "rqCoid"),
			@BindTo(endpoint = "a40212.acctbalinqrq.rqAccounttype", expression = "rqAccounttype")})
	public static class AccountBalanceIn{
		BigInteger rqAccountnum;
		Integer rqCoid;
		String rqAccounttype;
		
		public BigInteger getRqAccountnum(){
			return rqAccountnum;
		}
		
		public void setRqAccountnum(BigInteger rqAccountnum){
			this.rqAccountnum = rqAccountnum;
		}

		public Integer getRqCoid(){
			return rqCoid;
		}
		
		public void setRqCoid(Integer rqCoid){
			this.rqCoid = rqCoid;
		}

		public String getRqAccounttype(){
			return rqAccounttype;
		}
		
		public void setRqAccounttype(String rqAccounttype){
			this.rqAccounttype = rqAccounttype;
		}

	}
	@ApiModel(value="AccountBalanceOut", description="")
	public static class AccountBalanceOut{
		@BindFrom("a40212.acctbalinqrs.rsAccounttype")
		String rsAccounttype;
		@BindFrom("a40212.acctbalinqrs.rsAccountnum")
		BigInteger rsAccountnum;
		@BindFrom("a40212.acctbalinqrs.rsProduct")
		String rsProduct;
		@BindFrom("a40212.acctbalinqrs.rsAccountname")
		String rsAccountname;
		@BindFrom("a40212.acctbalinqrs.rsAvailablebalance")
		Double rsAvailablebalance;
		@BindFrom("a40212.acctbalinqrs.rsLedgerbalance")
		Double rsLedgerbalance;
		@BindFrom("a40212.acctbalinqrs.rsLineamount")
		Double rsLineamount;
		@BindFrom("a40212.acctbalinqrs.rsLoanbalance")
		Double rsLoanbalance;
		@BindFrom("a40212.acctbalinqrs.xstatus.statusmessage")
		String statusmessage;
		@BindFrom("a40212.acctbalinqrs.xstatus.severity")
		String severity;


		@ApiModelProperty(value="Rs Accounttype")
		public String getRsAccounttype(){
			return rsAccounttype;
		}
		
		public void setRsAccounttype(String rsAccounttype){
			this.rsAccounttype = rsAccounttype;
		}

		@ApiModelProperty(value="Rs Accountnum")
		public BigInteger getRsAccountnum(){
			return rsAccountnum;
		}
		
		public void setRsAccountnum(BigInteger rsAccountnum){
			this.rsAccountnum = rsAccountnum;
		}

		@ApiModelProperty(value="Rs Product")
		public String getRsProduct(){
			return rsProduct;
		}
		
		public void setRsProduct(String rsProduct){
			this.rsProduct = rsProduct;
		}

		@ApiModelProperty(value="Rs Accountname")
		public String getRsAccountname(){
			return rsAccountname;
		}
		
		public void setRsAccountname(String rsAccountname){
			this.rsAccountname = rsAccountname;
		}

		@ApiModelProperty(value="Rs Availablebalance")
		public Double getRsAvailablebalance(){
			return rsAvailablebalance;
		}
		
		public void setRsAvailablebalance(Double rsAvailablebalance){
			this.rsAvailablebalance = rsAvailablebalance;
		}

		@ApiModelProperty(value="Rs Ledgerbalance")
		public Double getRsLedgerbalance(){
			return rsLedgerbalance;
		}
		
		public void setRsLedgerbalance(Double rsLedgerbalance){
			this.rsLedgerbalance = rsLedgerbalance;
		}

		@ApiModelProperty(value="Rs Lineamount")
		public Double getRsLineamount(){
			return rsLineamount;
		}
		
		public void setRsLineamount(Double rsLineamount){
			this.rsLineamount = rsLineamount;
		}

		@ApiModelProperty(value="Rs Loanbalance")
		public Double getRsLoanbalance(){
			return rsLoanbalance;
		}
		
		public void setRsLoanbalance(Double rsLoanbalance){
			this.rsLoanbalance = rsLoanbalance;
		}

		@ApiModelProperty(value="Statusmessage")
		public String getStatusmessage(){
			return statusmessage;
		}
		
		public void setStatusmessage(String statusmessage){
			this.statusmessage = statusmessage;
		}

		@ApiModelProperty(value="Severity")
		public String getSeverity(){
			return severity;
		}
		
		public void setSeverity(String severity){
			this.severity = severity;
		}
	}
}
