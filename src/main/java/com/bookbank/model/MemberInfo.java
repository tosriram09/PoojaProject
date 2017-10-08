package com.bookbank.model;

import java.util.ArrayList;
import java.util.List;

public class MemberInfo {
	private String userName;
	private int memberId;
	private float totalFineAmount;

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

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	public float getTotalFineAmount() {
		return totalFineAmount;
	}

	public void setTotalFineAmount(float totalFineAmount) {
		this.totalFineAmount = totalFineAmount;
	}

	@Override
	public String toString() {
		return "MemberInfo [userName=" + userName + ", memberTransactions=" + memberTransactions + "]";
	}

}