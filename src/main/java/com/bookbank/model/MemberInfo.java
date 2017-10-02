package com.bookbank.model;

import java.util.ArrayList;
import java.util.List;

public class MemberInfo {
	@Override
	public String toString() {
		return "MemberInfo [userName=" + userName + ", memberTransactions=" + memberTransactions + "]";
	}

	private String userName;
	private List<MemberTransactions> memberTransactions = new ArrayList<MemberTransactions>();

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public List<MemberTransactions> getMemberTransactions() {
		return memberTransactions;
	}

	public void setMemberTransactions(List<MemberTransactions> memberTransactions) {
		this.memberTransactions = memberTransactions;
	}

}
