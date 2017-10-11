package com.bookbank.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.BookDetails;
import com.bookbank.model.BookInfo;

/**
 * Servlet implementation class AddBooksServlet
 */
public class AddBooksServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public AddBooksServlet() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		BookInfo bookInfo = new BookInfo();

		bookInfo.setAuthor(request.getParameter("author"));
		bookInfo.setTitle(request.getParameter("title"));
		bookInfo.setEdition(request.getParameter("edition"));
		bookInfo.setPublication(request.getParameter("publication"));
		bookInfo.setPrice(Double.parseDouble(request.getParameter("price")));
		bookInfo.setPurchaseDate(request.getParameter("date"));
		bookInfo.setReference(request.getParameter("reference"));
		bookInfo.setIsAvailable(request.getParameter("available"));

		BookDetails bookDetails = new BookDetails();
		bookDetails.addBooks(bookInfo);
		request.setAttribute("message", "Book Added Successfully");
		request.getRequestDispatcher("/bookentry.jsp").forward(request, response);
	}

}
