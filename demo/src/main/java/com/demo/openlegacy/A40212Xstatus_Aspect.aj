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

privileged @SuppressWarnings("unused") aspect A40212Xstatus_Aspect {
	private List<RpcActionDefinition> Xstatus.actions = new ArrayList<RpcActionDefinition>();

	public List<RpcActionDefinition> Xstatus.getActions(){
		return actions;
	}

	
	@JsonSerialize
	@JsonProperty("statusmessage")
	public String A40212.Xstatus.getStatusmessage() {
		return this.statusmessage;
	}
	@JsonDeserialize
	@JsonProperty("statusmessage")
	public void A40212.Xstatus.setStatusmessage(String statusmessage) {
		this.statusmessage = statusmessage;
	}
	
	@JsonSerialize
	@JsonProperty("severity")
	public String A40212.Xstatus.getSeverity() {
		return this.severity;
	}
	@JsonDeserialize
	@JsonProperty("severity")
	public void A40212.Xstatus.setSeverity(String severity) {
		this.severity = severity;
	}

}