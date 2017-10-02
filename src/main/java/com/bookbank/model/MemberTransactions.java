package com.bookbank.model;

public class MemberTransactions {
	@Override
	public String toString() {
		return "MemberTransactions [transactionId=" + transactionId + ", bookId=" + bookId + ", bookName=" + bookName
				+ ", dueDate=" + dueDate + "]";
	}

	private int transactionId;
	private String bookId;
	private String bookName;
	private String dueDate;

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

}
