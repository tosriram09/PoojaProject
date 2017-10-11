<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Entry Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script>
	function myFunction() {
		alert("An email message has been sent to the vendor.");
	}
</script>
<style>
html, body {
	height: 100vh;
	background: url('./images/bg.jpg') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.text-white {
	color: white;
}

.hiddendiv {
	display: none;
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
			<li><a href="searchPage.jsp">Search</a></li>
			<li><a href="issue.jsp">Issue</a></li>
			<li><a href="returns.jsp">Returns</a></li>
			<li class="active"><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>
	<div style="display: none" id="message">Your order is submitted
		to the vendor.</div>
	<form class="form-horizontal" name="bookadd" method="POST">
		<div class="col-xs-12" style="height: 50px;"></div>

		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Author</label>
			<div class="col-sm-3">
				<input class="form-control" id="author" name="author" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Title</label>
			<div class="col-sm-3">
				<input class="form-control" id="title" name="title" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Edition</label>
			<div class="col-sm-3">
				<input class="form-control" id="edition" name="edition" type="text">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Publication</label>
			<div class="col-sm-3">
				<input class="form-control" id="publication" name="publication"
					type="text">
			</div>
		</div>

		<div class="form-group">
			<label class="col-sm-2 control-label text-white"></label>

			<div class="col-sm-4">
				<button class="btn btn-success btn-primary" name="addbook"
					id="addbook" onclick="myfunction()">Send to Vendor</button>
			</div>
		</div>
	</form>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>