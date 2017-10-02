package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import com.bookbank.model.MemberInfo;
import com.bookbank.model.MemberTransactions;

public class MemberDetails {
	public MemberInfo getMemberInfo(String memberId) {
		final String sqlQuery = "SELECT u.*, t.* FROM user u, transactions t WHERE u.userid = ? AND u.userid = t.userid";
		MemberInfo memberInfo = new MemberInfo();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setInt(1, Integer.parseInt(memberId));

			ResultSet rs = stmt.executeQuery();

			String userName = null;
			while (rs.next()) {
				if (null == userName) {
					memberInfo.setUserName(rs.getString("firstname"));
				}
				MemberTransactions memberTransactions = new MemberTransactions();
				memberTransactions.setTransactionId(rs.getInt("transactionid"));
				memberTransactions.setBookId(rs.getString("bookid"));
				memberTransactions.setBookName(rs.getString("bookname"));
				memberTransactions.setDueDate(rs.getString("duedate"));

				memberInfo.getMemberTransactions().add(memberTransactions);
			}
			System.out.println(memberInfo);
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return memberInfo;

	}
}
