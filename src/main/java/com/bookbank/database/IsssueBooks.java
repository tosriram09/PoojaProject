package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.time.LocalDate;
import java.util.List;

import com.bookbank.model.BookInfo;

public class IsssueBooks {
	public void issueBooks(int memberid, List<BookInfo> books) {
		final String insertQuery = "INSERT INTO transactions(userid,bookid,bookname,duedate) VALUES(?,?,?,?)";
		final String updateQuery = "UPDATE book SET available = ? WHERE bookid = ?";

		Connection conn = getConnection();

		try {
			for (BookInfo bookInfo : books) {
				PreparedStatement stmt = conn.prepareStatement(insertQuery);
				stmt.setInt(1, memberid);
				stmt.setInt(2, bookInfo.getBookNbr());
				stmt.setString(3, bookInfo.getTitle());

				LocalDate returnDate = LocalDate.now().plusDays(14);
				stmt.setDate(4, java.sql.Date.valueOf(returnDate));

				stmt.executeUpdate();
				stmt.close();

				stmt = conn.prepareStatement(updateQuery);
				stmt.setString(1, "N");
				stmt.setInt(2, bookInfo.getBookNbr());
				stmt.executeUpdate();
				stmt.close();
			}
		} catch (Exception e) {
			e.printStackTrace();

		}
	}
	
	public void extendBooks(int memberId, List<BookInfo> books) {
		final String updateQuery = "UPDATE transaction SET duedate = ? WHERE userid = ? AND bookid = ?";
		Connection conn = getConnection();
		
		try {
			for (BookInfo bookInfo: books) {
				PreparedStatement stmt = conn.prepareStatement(updateQuery);
				LocalDate returnDate = LocalDate.now().plusDays(14);
				
				stmt.setDate(1, java.sql.Date.valueOf(returnDate));
				stmt.setInt(2, memberId);
				stmt.setInt(3,  bookInfo.getBookNbr());
				
				stmt.executeUpdate();
				stmt.close();
				conn.close();
			}
		} catch(Exception e) {
			e.printStackTrace();
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

}
