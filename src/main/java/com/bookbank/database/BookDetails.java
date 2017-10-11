package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

import com.bookbank.model.BookInfo;

public class BookDetails {
	public List<BookInfo> getBookInfo(int bookNumber) {
		final String sqlQuery = "SELECT b.* FROM book b WHERE b.bookid = ?";

		List<BookInfo> bookDetails = new ArrayList<BookInfo>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setInt(1, bookNumber);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				BookInfo bookInfo = new BookInfo();
				bookInfo.setAuthor(rs.getString("author"));
				bookInfo.setBookNbr(rs.getInt("bookid"));
				bookInfo.setEdition(rs.getString("edition"));
				bookInfo.setPrice(rs.getDouble("price"));
				bookInfo.setPublication(rs.getString("publication"));
				bookInfo.setReference(rs.getString("reference"));
				bookInfo.setTitle(rs.getString("title"));
				bookInfo.setPurchaseDate(rs.getString("purchasedate"));

				bookDetails.add(bookInfo);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookDetails;
	}

	public List<BookInfo> searchBooksByAuthorName(String authorName) {
		final String sqlQuery = "SELECT b.* FROM book b WHERE b.author = ?";

		List<BookInfo> bookDetails = new ArrayList<BookInfo>();

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setString(1, authorName);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				BookInfo bookInfo = new BookInfo();
				bookInfo.setAuthor(rs.getString("author"));
				bookInfo.setBookNbr(rs.getInt("bookid"));
				bookInfo.setEdition(rs.getString("edition"));
				bookInfo.setPrice(rs.getDouble("price"));
				bookInfo.setPublication(rs.getString("publication"));
				bookInfo.setReference(rs.getString("reference"));
				bookInfo.setTitle(rs.getString("title"));
				bookInfo.setPurchaseDate(rs.getString("purchasedate"));

				bookDetails.add(bookInfo);
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return bookDetails;

	}

	public void addBooks(BookInfo bookInfo) {
		final String sqlQuery = "INSERT INTO book VALUES(?, ?, ?,?, ?, ?, ?, ?, ?)";

		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setInt(1, bookInfo.getBookNbr());
			stmt.setString(2, bookInfo.getAuthor());
			stmt.setString(3, bookInfo.getTitle());
			stmt.setString(4, bookInfo.getEdition());
			stmt.setString(5, bookInfo.getPublication());
			stmt.setDouble(6, bookInfo.getPrice());
			stmt.setString(7, bookInfo.getPurchaseDate());
			stmt.setString(8, bookInfo.isReference());
			stmt.setString(9, bookInfo.getIsAvailable());

			stmt.executeUpdate();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
