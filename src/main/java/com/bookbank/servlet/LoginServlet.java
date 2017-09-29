package com.bookbank.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.LoginValidator;

/**
 * Servlet implementation class BookBankServlet
 */
public class LoginServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		final String userName = request.getParameter("inputEmail").trim();
		final String password = request.getParameter("inputPassword").trim();
		
		LoginValidator loginValidator = new LoginValidator();
		boolean isValidUser = loginValidator.validateUser(userName, password);
		
		if (isValidUser == false) {
			request.setAttribute("message", "Invalid username/password");
		}
	}
}
