package com.bookbank.servlet;

import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;
import java.util.StringTokenizer;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.BookDetails;
import com.bookbank.database.IssueBooks;
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
		int memberId = Integer.parseInt(request.getParameter("memberid"));
		System.out.println(booksToIssue);

		StringTokenizer st = new StringTokenizer(booksToIssue, ",");
		IssueBooks issuebooks = new IssueBooks();

		List<BookInfo> books = new ArrayList<BookInfo>();
		while (st.hasMoreTokens()) {
			String token = st.nextToken();
			int bookNbr = Integer.parseInt(token);

			BookDetails bookDetails = new BookDetails();
			List<BookInfo> bookInfo = bookDetails.getBookInfo(bookNbr);
			books.add(bookInfo.get(0));
		}
		issuebooks.issueBooks(memberId, books);
		request.setAttribute("message", "Books issued to the user");
		request.getRequestDispatcher("/issue.jsp").forward(request, response);
	}
}
