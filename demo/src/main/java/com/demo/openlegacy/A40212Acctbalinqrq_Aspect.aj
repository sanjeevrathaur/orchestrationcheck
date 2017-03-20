// WARNING: DO NOT EDIT THIS FILE.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.demo.openlegacy;

import com.fasterxml.jackson.annotation.JsonProperty;
import com.fasterxml.jackson.databind.annotation.JsonDeserialize;
import com.fasterxml.jackson.databind.annotation.JsonSerialize;

import java.util.*;
import java.math.BigDecimal;
import java.math.BigInteger;
import org.openlegacy.definitions.RpcActionDefinition;

import com.demo.openlegacy.A40212.*;

privileged @SuppressWarnings("unused") aspect A40212Acctbalinqrq_Aspect {
	private List<RpcActionDefinition> Acctbalinqrq.actions = new ArrayList<RpcActionDefinition>();

	public List<RpcActionDefinition> Acctbalinqrq.getActions(){
		return actions;
	}

	
	@JsonSerialize
	@JsonProperty("rqAccountnum")
	public BigInteger A40212.Acctbalinqrq.getRqAccountnum() {
		return this.rqAccountnum;
	}
	@JsonDeserialize
	@JsonProperty("rqAccountnum")
	public void A40212.Acctbalinqrq.setRqAccountnum(BigInteger rqAccountnum) {
		this.rqAccountnum = rqAccountnum;
	}
	
	@JsonSerialize
	@JsonProperty("rqCoid")
	public Integer A40212.Acctbalinqrq.getRqCoid() {
		return this.rqCoid;
	}
	@JsonDeserialize
	@JsonProperty("rqCoid")
	public void A40212.Acctbalinqrq.setRqCoid(Integer rqCoid) {
		this.rqCoid = rqCoid;
	}
	
	@JsonSerialize
	@JsonProperty("rqAccounttype")
	public String A40212.Acctbalinqrq.getRqAccounttype() {
		return this.rqAccounttype;
	}
	@JsonDeserialize
	@JsonProperty("rqAccounttype")
	public void A40212.Acctbalinqrq.setRqAccounttype(String rqAccounttype) {
		this.rqAccounttype = rqAccounttype;
	}

}