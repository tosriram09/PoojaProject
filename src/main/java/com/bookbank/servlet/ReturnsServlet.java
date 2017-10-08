package com.bookbank.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.MemberDetails;
import com.bookbank.database.ReturnBooks;
import com.bookbank.model.MemberInfo;

/**
 * Servlet implementation class ReturnsServlet
 */
public class ReturnsServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public ReturnsServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String memberId = request.getParameter("memberid");
		String userAction = request.getParameter("useraction");

		if (userAction.equals("search")) {
			MemberDetails memberDetails = new MemberDetails();
			MemberInfo memberInfo = memberDetails.getMemberInfoWithFine(memberId);
			request.setAttribute("memberInfo", memberInfo);
			request.getRequestDispatcher("/returns.jsp").forward(request, response);
		} else if (userAction.equals("return")) {
			ReturnBooks returnBooks = new ReturnBooks();
			String returnedBooks = request.getParameter("booksreturned");
			returnBooks.returnBooks(returnedBooks);
			request.setAttribute("message", "Books returned successfully");

			MemberDetails memberDetails = new MemberDetails();
			memberId = request.getParameter("memberid1");
			MemberInfo memberInfo = memberDetails.getMemberInfoWithFine(memberId);
			request.setAttribute("memberInfo", memberInfo);
			request.getRequestDispatcher("/returns.jsp").forward(request, response);
		}
	}
}
