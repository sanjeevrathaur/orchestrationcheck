package com.demo.openlegacy;

import java.math.BigInteger;

import org.openlegacy.annotations.rpc.Action;
import org.openlegacy.annotations.rpc.Languages;
import org.openlegacy.annotations.rpc.RpcActions;
import org.openlegacy.annotations.rpc.RpcEntity;
import org.openlegacy.annotations.rpc.RpcField;
import org.openlegacy.annotations.rpc.RpcNavigation;
import org.openlegacy.annotations.rpc.RpcNumericField;
import org.openlegacy.annotations.rpc.RpcPart;
import org.openlegacy.rpc.actions.RpcActions.EXECUTE;
import org.openlegacy.rpc.actions.RpcActions.SHOW;

@RpcNavigation(category = "")
@RpcEntity(name="A40212", language=Languages.COBOL)
@RpcActions(actions = {
				@Action(action = SHOW.class, path = ""), 
				@Action(action = EXECUTE.class, path = "A40226", displayName = "Execute", alias = "execute"
						)			})
public class A40212 {

	private Acctbalinqrq acctbalinqrq = new Acctbalinqrq();
	private Acctbalinqrs acctbalinqrs = new Acctbalinqrs();
	
	@RpcPart(name = "Acctbalinqrq", originalName = "ACCTBALINQRQ")
	public static class Acctbalinqrq {

	@RpcNumericField(decimalPlaces = 0)	
	@RpcField(length = 8, originalName = "RQ-ACCOUNTNUM", legacyType = "Mainframe Packed Decimal (+ve)")
	private BigInteger rqAccountnum;
	
	@RpcNumericField(minimumValue = -9999, maximumValue = 9999, decimalPlaces = 0)	
	@RpcField(length = 2, originalName = "RQ-COID", legacyType = "Binary Integer")
	private Integer rqCoid;
	
	
	@RpcField(length = 3, originalName = "RQ-ACCOUNTTYPE", legacyType = "Char")
	private String rqAccounttype;
	
	}
	@RpcPart(name = "Acctbalinqrs", originalName = "ACCTBALINQRS")
	public static class Acctbalinqrs {

	private Xstatus xstatus = new Xstatus();
	
	@RpcField(length = 3, originalName = "RS-ACCOUNTTYPE", legacyType = "Char")
	private String rsAccounttype;
	
	@RpcNumericField(decimalPlaces = 0)	
	@RpcField(length = 8, originalName = "RS-ACCOUNTNUM", legacyType = "Mainframe Packed Decimal (+ve)")
	private BigInteger rsAccountnum;
	
	
	@RpcField(length = 40, originalName = "RS-PRODUCT", legacyType = "Char")
	private String rsProduct;
	
	
	@RpcField(length = 25, originalName = "RS-ACCOUNTNAME", legacyType = "Char")
	private String rsAccountname;
	
	@RpcNumericField(minimumValue = -99999999999.99, maximumValue = 99999999999.99, decimalPlaces = 2)	
	@RpcField(length = 7, originalName = "RS-AVAILABLEBALANCE", legacyType = "Mainframe Packed Decimal (comp-3)")
	private Double rsAvailablebalance;
	
	@RpcNumericField(minimumValue = -99999999999.99, maximumValue = 99999999999.99, decimalPlaces = 2)	
	@RpcField(length = 7, originalName = "RS-LEDGERBALANCE", legacyType = "Mainframe Packed Decimal (comp-3)")
	private Double rsLedgerbalance;
	
	@RpcNumericField(minimumValue = -99999999999.99, maximumValue = 99999999999.99, decimalPlaces = 2)	
	@RpcField(length = 7, originalName = "RS-LINEAMOUNT", legacyType = "Mainframe Packed Decimal (comp-3)")
	private Double rsLineamount;
	
	@RpcNumericField(minimumValue = -99999999999.99, maximumValue = 99999999999.99, decimalPlaces = 2)	
	@RpcField(length = 7, originalName = "RS-LOANBALANCE", legacyType = "Mainframe Packed Decimal (comp-3)")
	private Double rsLoanbalance;
	
	}
	@RpcPart(name = "Xstatus", originalName = "XSTATUS")
	public static class Xstatus {

	
	@RpcField(length = 40, originalName = "STATUSMESSAGE", legacyType = "Char")
	private String statusmessage;
	
	
	@RpcField(length = 1, originalName = "SEVERITY", legacyType = "Char")
	private String severity;
	
	}
}

