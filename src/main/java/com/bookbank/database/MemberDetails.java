package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.concurrent.TimeUnit;

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
					memberInfo.setUserName(rs.getString("firstname") + " " + rs.getString("last"));
					memberInfo.setMemberId(rs.getInt("userid"));
				}
				System.out.println("Userid -> " + memberInfo.getMemberId());
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

	public MemberInfo getMemberInfoWithFine(String memberId) {
		final String sqlQuery = "SELECT u.*, t.* FROM user u, transactions t WHERE u.userid = ? AND u.userid = t.userid";
		MemberInfo memberInfo = new MemberInfo();
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setInt(1, Integer.parseInt(memberId));

			ResultSet rs = stmt.executeQuery();

			String userName = null;
			float totalFineAmount = 0;

			while (rs.next()) {
				if (null == userName) {
					memberInfo.setUserName(rs.getString("firstname") + " " + rs.getString("last"));
					memberInfo.setMemberId(rs.getInt("userid"));
				}
				System.out.println("Userid -> " + memberInfo.getMemberId());

				MemberTransactions memberTransactions = new MemberTransactions();
				memberTransactions.setTransactionId(rs.getInt("transactionid"));
				memberTransactions.setBookId(rs.getString("bookid"));
				memberTransactions.setBookName(rs.getString("bookname"));

				String dueDate = rs.getString("duedate");
				Date returnDate = new SimpleDateFormat("yyyy-MM-dd").parse(dueDate);
				Date currentDate = new Date();

				TimeUnit timeUnit = TimeUnit.DAYS;
				long diff = getDateDiff(currentDate, returnDate, timeUnit);
				long dueByDays = timeUnit.convert(diff, timeUnit);

				memberTransactions.setDueDate(dueDate);
				memberTransactions.setDueByDays(dueByDays);
				if (dueByDays < 0) {
					memberTransactions.setDueByDays(-dueByDays);
					memberTransactions.setFineAmount(-dueByDays * 1.00);
					totalFineAmount += -dueByDays * 1.00;
				}
				memberInfo.setTotalFineAmount(totalFineAmount);
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

	public static long getDateDiff(Date date1, Date date2, TimeUnit timeUnit) {
		long diffInMillies = date2.getTime() - date1.getTime();
		return timeUnit.convert(diffInMillies, TimeUnit.MILLISECONDS);
	}

}
