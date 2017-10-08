<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Entry Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
</head>
<body>
	<!-- Navigation -->
	<nav class="navbar navbar-inverse bg-primary">
	<div class="container-fluid">
		<div class="navbar-header">
			<a class="navbar-brand" href="#">Students Book Bank</a>
		</div>
		<ul class="nav navbar-nav navbar-right">
			<li><a href="searchPage.jsp">Search</a></li>
			<li class="active"><a href="returns.jsp">Returns</a></li>
			<li><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>

	<div class="container">
		<h2>Add new books</h2>
		<form class="form-horizontal" id="returnform" role="form"
			method="POST" action="AddBooksServlet">
			<%
				String message = (String) request.getAttribute("message");

				if (message != null) {
			%>
			<div class="col-sm-6 col-sm-offset-3 alert alert-info"><%=request.getAttribute("message")%></div>
			<%
				}
			%>
			<div class="form-group">
				<label class="col-sm-2 control-label">Book Name</label>
				<div class="col-sm-10">
					<input class="form-control" id="bookname" type="text"
						value="Book Name">
				</div>
			</div>
			<button class="btn btn-primary btn-sm" type="submit">Add
				a book</button>
		</form>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>