<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="com.bookbank.model.MemberTransactions"%>
<%@page import="com.bookbank.model.BookInfo"%>
<%@page import="com.bookbank.model.MemberInfo"%>
<%@page import="java.util.List"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link href="css/returns.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<title>Manage Book Returns</title>
<style>
#imaginary_container {
	margin-top: 20%; /* Don't copy this */
}

.stylish-input-group .input-group-addon {
	background: white !important;
}

.stylish-input-group .form-control {
	border-right: 0;
	box-shadow: 0 0 0;
	border-color: #ccc;
}

.stylish-input-group button {
	border: 0;
	background: transparent;
}
</style>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse bg-primary">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Students Book Bank</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="#">Search</a></li>
			<li class="active"><a href="returns.jsp">Returns</a></li>
			<li><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>

	<div class="container col-lg-12 spacer"></div>
	<form class="form-horizontal" role="form" method="POST"
		action="ReturnsServlet">
		<div class="container">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div id="imaginary_container">
						<div class="input-group stylish-input-group">
							<input type="text" class="form-control"
								placeholder="Search Member" name="memberid"> <span
								class="input-group-addon">
								<button type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="col-xs-12" style="height: 50px;"></div>

				<!-- Member Info -->
				<%
					MemberInfo memberInfo = (MemberInfo) request.getAttribute("memberInfo");

					if (memberInfo != null) {
				%>
				<table id="example" class="table table-striped table-bordered"
					cellspacing="0" width="100%">
					<thead>
						<tr>
							<th></th>
							<th>Transaction ID</th>
							<th>Book ID</th>
							<th>Book Name</th>
							<th>Due Date</th>
							<th>Due by (Days)</th>
							<th>Fine</th>
						</tr>
					</thead>
					<%
						List<MemberTransactions> transactions = memberInfo.getMemberTransactions();
						for (MemberTransactions transaction : transactions) {
					%>
					<tr>
						<td><input class="form-check-input" type="checkbox"
							value="<%=transaction.getTransactionId()%>" /></td>
						<td><%=transaction.getTransactionId()%></td>
						<td><%=transaction.getBookId()%></td>
						<td><%=transaction.getBookName()%></td>
						<td><%=transaction.getDueDate()%></td>
						<td><%=transaction.getDueByDays()%></td>
						<td><%=transaction.getFineAmount()%></td>
					</tr>
					<%
						}
					%>
				</table>
				<%
					}
					if (transactions.size() > 0) {
				%>
				<button type="button" class="btn btn-secondary btn-sm">Small
					button</button>
				<%
				}
				%>
			</div>
		</div>
	</form>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>