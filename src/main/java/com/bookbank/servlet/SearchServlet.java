package com.bookbank.servlet;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.bookbank.database.MemberDetails;
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
		}
	}
}
