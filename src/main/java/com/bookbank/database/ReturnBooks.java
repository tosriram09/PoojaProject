package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;
import java.util.StringTokenizer;

import com.bookbank.model.BookInfo;
import com.bookbank.model.MemberInfo;
import com.bookbank.model.MemberTransactions;

public class ReturnBooks {
	public void returnBooks(String books) {
		List<MemberTransactions> memberTransactions = memberTransactions(books);

		Connection conn = getConnection();

		for (MemberTransactions transaction : memberTransactions) {
			final String deleteQuery = "DELETE FROM transactions WHERE userid = ? AND transactionid = ? AND bookid = ?";
			final String updateQuery = "UPDATE book SET available = 'Y' WHERE bookid = ?";
			MemberInfo memberInfo = new MemberInfo();
			try {
				PreparedStatement deleteStmt = conn.prepareStatement(deleteQuery);
				deleteStmt.setInt(1, transaction.getMemberId());
				deleteStmt.setInt(2, transaction.getTransactionId());
				deleteStmt.setInt(3, Integer.parseInt(transaction.getBookId()));
				System.out.println(
						transaction.getMemberId() + "-" + transaction.getMemberId() + "-" + transaction.getBookId());

				deleteStmt.executeUpdate();
				deleteStmt.close();

				PreparedStatement updateStmt = conn.prepareStatement(updateQuery);
				updateStmt.setString(1, transaction.getBookId());
				updateStmt.executeUpdate();
				updateStmt.close();

			} catch (Exception e) {
				e.printStackTrace();
			}
		}
	}

	private Connection getConnection() {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");
			return conn;
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return null;
	}

	private List<MemberTransactions> memberTransactions(String books) {
		List<MemberTransactions> memberTransactions = new ArrayList<MemberTransactions>();

		StringTokenizer st = new StringTokenizer(books, ",");

		while (st.hasMoreElements()) {
			String transaction = (String) st.nextElement();

			StringTokenizer tokens = new StringTokenizer(transaction, "-");

			while (tokens.hasMoreTokens()) {
				MemberTransactions memberTransaction = new MemberTransactions();

				String transactionId = tokens.nextToken();
				String bookId = tokens.nextToken();
				String memberId = tokens.nextToken();
				String fineAmount = tokens.nextToken();

				memberTransaction.setTransactionId(Integer.parseInt(transactionId));
				memberTransaction.setBookId(bookId);
				memberTransaction.setMemberId(Integer.parseInt(memberId));
				memberTransactions.add(memberTransaction);
			}
		}
		return memberTransactions;
	}

	public void extendBooks(int memberId, String books) {
		final String updateQuery = "UPDATE transactions SET duedate = ? WHERE userid = ? AND bookid = ?";
		Connection conn = getConnection();
		List<MemberTransactions> memberTransactions = memberTransactions(books);
		try {
			for (MemberTransactions transaction : memberTransactions) {
				PreparedStatement stmt = conn.prepareStatement(updateQuery);
				LocalDate returnDate = LocalDate.now().plusDays(14);

				stmt.setDate(1, java.sql.Date.valueOf(returnDate));
				stmt.setInt(2, memberId);
				stmt.setInt(3, Integer.parseInt(transaction.getBookId()));

				stmt.executeUpdate();
				stmt.close();
				conn.close();
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
