package com.bookbank.model;

public class MemberTransactions {
	private int memberId;
	private int transactionId;
	private String bookId;
	private String bookName;
	private String dueDate;
	private long dueByDays;
	private double fineAmount;

	public int getTransactionId() {
		return transactionId;
	}

	public void setTransactionId(int transactionId) {
		this.transactionId = transactionId;
	}

	public String getBookId() {
		return bookId;
	}

	public void setBookId(String bookId) {
		this.bookId = bookId;
	}

	public String getBookName() {
		return bookName;
	}

	public void setBookName(String bookName) {
		this.bookName = bookName;
	}

	public String getDueDate() {
		return dueDate;
	}

	public void setDueDate(String dueDate) {
		this.dueDate = dueDate;
	}

	public double getFineAmount() {
		return fineAmount;
	}

	public void setFineAmount(double fineAmount) {
		this.fineAmount = fineAmount;
	}

	public long getDueByDays() {
		return dueByDays;
	}

	public void setDueByDays(long dueByDays) {
		this.dueByDays = dueByDays;
	}

	public int getMemberId() {
		return memberId;
	}

	public void setMemberId(int memberId) {
		this.memberId = memberId;
	}

	@Override
	public String toString() {
		return "MemberTransactions [memberId=" + memberId + ", transactionId=" + transactionId + ", bookId=" + bookId
				+ ", bookName=" + bookName + ", dueDate=" + dueDate + ", dueByDays=" + dueByDays + ", fineAmount="
				+ fineAmount + "]";
	}

}
