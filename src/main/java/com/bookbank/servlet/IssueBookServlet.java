package com.bookbank.servlet;

import java.io.IOException;
import java.util.Arrays;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.model.BookInfo;

/**
 * Servlet implementation class IssueBookServlet
 */
public class IssueBookServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public IssueBookServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String booksToIssue = request.getParameter("bookstoissue");
		StringTokenizer st = new StringTokenizer(booksToIssue, ",");
		IssueBooks issuebooks = new IssueBooks();

		while (st.hasMoreTokens()) {
			String token = st.nextToken();
			BookInfo bookInfo = new BookInfo();
			bookInfo.setBookNbr(Integer.parseInt(token));

			issueBooks.issueBooks(100, Arrays.asList(bookInfo));
		}

		request.setAttribute("message", "Books issued to the user");
		request.getRequestDispatcher("/issue.jsp").forward(request, response);
	}

}
