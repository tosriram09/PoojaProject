package com.bookbank.database;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

public class LoginValidator {
	public boolean validateUser(String userName, String password) {
		final String sqlQuery = "SELECT 1 FROM user WHERE username = ? AND password = ?";
		boolean isValidUser = false;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			Connection conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/bookbank", "pooja", "pooja");

			PreparedStatement stmt = conn.prepareStatement(sqlQuery);
			stmt.setString(1, userName);
			stmt.setString(2, password);

			System.out.println("User Name -> " + userName + "=" + password);

			ResultSet rs = stmt.executeQuery();

			while (rs.next()) {
				isValidUser = true;
				break;
			}
			rs.close();
			stmt.close();
			conn.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return isValidUser;
	}
}
