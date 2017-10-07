package com.bookbank.servlet;

import java.io.IOException;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.BookDetails;
import com.bookbank.database.MemberDetails;
import com.bookbank.model.BookInfo;
import com.bookbank.model.MemberInfo;

/**
 * Servlet implementation class SearchServlet
 */
public class SearchServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public SearchServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		String searchBy = request.getParameter("search_param");
		String searchInput = request.getParameter("userInput");

		System.out.println(searchBy + searchInput);

		if (searchBy.equals("memberid")) {
			System.out.println("Inside memberid");
			MemberDetails memberDetails = new MemberDetails();
			MemberInfo memberInfo = memberDetails.getMemberInfo(searchInput);
			request.setAttribute("memberInfo", memberInfo);
			request.getRequestDispatcher("/searchPage.jsp").forward(request, response);
		} else if (searchBy.equals("booknumber")) {
			BookDetails bookDetails = new BookDetails();
			int bookNumber = Integer.parseInt(searchInput);
			List<BookInfo> availableBooks = bookDetails.getBookInfo(bookNumber);
			request.setAttribute("bookInfo", availableBooks);
			request.getRequestDispatcher("/searchPage.jsp").forward(request, response);
		} else if (searchBy.equals("authorname")) {
			BookDetails bookDetails = new BookDetails();
			String authorName = searchInput;
			List<BookInfo> availableBooks = bookDetails.searchBooksByAuthorName(authorName);
			request.setAttribute("bookInfo", availableBooks);
			request.getRequestDispatcher("/searchPage.jsp").forward(request, response);
		}
	}
}
