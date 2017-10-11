<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Book Entry Page</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<link href="bootstrap/css/bootstrap-datepicker.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<script src="bootstrap/js/bootstrap-datepicker.min.js"></script>
<script>
	$(document).ready(function() {
		$('#datePicker').datepicker({
			format : 'dd/mm/yyyy'
		}).on('changeDate', function(e) {
			// Revalidate the date field
			$('#bookadd').formValidation('revalidateField', 'date');
		});
	});
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

	<%
		String message = (String) request.getAttribute("message");
		if (null != message) {
	%>
	<div class="col-sm-3 col-sm-offset-3 alert alert-info"><%=request.getAttribute("message")%></div>
	<%
		}
	%>
	<form class="form-horizontal" name="bookadd" method="POST"
		action="AddBooksServlet">
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
			<label class="col-sm-2 control-label text-white">Price</label>
			<div class="col-sm-3">
				<input class="form-control" id="price" name="price" type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Purchase
				Date</label>
			<div class="col-sm-3 date">
				<div class="input-group input-append date" id="datePicker">
					<input type="text" class="form-control" name="date" /> <span
						class="input-group-addon add-on"><span
						class="glyphicon glyphicon-calendar"></span></span>
				</div>
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Reference</label>
			<div class="col-sm-3">
				<input class="form-control" id="reference" name="reference"
					type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white">Available</label>
			<div class="col-sm-3">
				<input class="form-control" id="available" name="available"
					type="text">
			</div>
		</div>
		<div class="form-group">
			<label class="col-sm-2 control-label text-white"></label>

			<div class="col-sm-4">
				<button class="btn btn-success btn-primary" type="submit"
					name="addbook" id="addbook">Add Book</button>
			</div>
		</div>
	</form>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>