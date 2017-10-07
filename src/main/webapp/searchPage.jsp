<!DOCTYPE html>
<%@page import="com.bookbank.model.MemberTransactions"%>
<%@page import="com.bookbank.model.BookInfo"%>
<%@page import="java.util.List"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<html>
<head>
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<style>
html, body {
	height: 100%;
}

.container {
	height: 90%;
	display: flex;
	justify-content: center;
	align-items: center;
}
</style>
<!-- Custom styles for this template -->
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script>
	$(document).ready(function(e) {
		$('.search-panel .dropdown-menu').find('a').click(function(e) {
			e.preventDefault();
			var param = $(this).attr("href").replace("#", "");
			var concept = $(this).text();
			$('.search-panel span#search_concept').text(concept);
			$('.input-group #search_param').val(param);
		});
	});
</script>
<%@ page import="com.bookbank.model.MemberInfo"%>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse bg-primary">
		<div class="container-fluid">
			<div class="navbar-header">
				<a class="navbar-brand" href="#">Students Book Bank</a>
			</div>
			<ul class="nav navbar-nav navbar-right">
				<li class="active"><a href="#">Search</a></li>
				<li><a href="returns.jsp">Returns</a></li>
				<li><a href="bookentry.jsp">Book Entry</a></li>
				<li><a href="orderbooks.jsp">Order Books</a></li>
			</ul>
		</div>
	</nav>
	<div class="container">
		<form class="form-horizontal" role="form" method="POST"
			action="SearchServlet">

			<div class="row">
				<div class="col-xs-8 col-xs-offset-2">
					<div class="input-group">
						<div class="input-group-btn search-panel">
							<button type="button" class="btn btn-default dropdown-toggle"
								data-toggle="dropdown">
								<span id="search_concept">Search by</span> <span class="caret"></span>
							</button>
							<ul class="dropdown-menu" role="menu">
								<li><a href="#memberid">Member ID</a></li>
								<li><a href="#booknumber">Book Number</a></li>
								<li><a href="#authorname">Author Name</a></li>
							</ul>
						</div>
						<input type="hidden" name="search_param" value="all"
							id="search_param"> <input type="text"
							class="form-control" name="userInput"
							placeholder="Search term..."> <span
							class="input-group-btn">
							<button class="btn btn-default" type="submit">
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
						<th>Transaction ID</th>
						<th>Book ID</th>
						<th>Book Name</th>
						<th>Due Date</th>
					</tr>
				</thead>
				<%
					List<MemberTransactions> transactions = memberInfo.getMemberTransactions();

						for (MemberTransactions transaction : transactions) {
				%>
				<tr>
					<td><%=transaction.getTransactionId()%></td>
					<td><%=transaction.getBookId()%></td>
					<td><%=transaction.getBookName()%></td>
					<td><%=transaction.getDueDate()%></td>
				</tr>

				<%
					}
				%>

			</table>
			<%
				}
			%>

			<!-- Book Information -->
			<%
				List<BookInfo> availableBooks = (List<BookInfo>) request.getAttribute("bookInfo");

				if (availableBooks != null) {
			%>
			<table id="example" class="table table-striped table-bordered"
				cellspacing="0" width="100%">
				<thead>
					<tr>
						<th>Book ID</th>
						<th>Title</th>
						<th>Author</th>
						<th>Edition</th>
						<th>Publication</th>
						<th>Price</th>
						<th>Purchased Date</th>
						<th>Reference Book</th>
					</tr>
				</thead>
				<%
					for (BookInfo bookInfo : availableBooks) {
				%>
				<tr>
					<td><%=bookInfo.getBookNbr()%></td>
					<td><%=bookInfo.getTitle()%></td>
					<td><%=bookInfo.getAuthor()%></td>
					<td><%=bookInfo.getEdition()%></td>
					<td><%=bookInfo.getPublication()%></td>
					<td><%=bookInfo.getPrice()%></td>
					<td><%=bookInfo.getPurchaseDate()%></td>
					<td><%=bookInfo.isReference()%></td>
				</tr>
				<%
					}
				%>

			</table>
			<%
				}
			%>
		</form>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
