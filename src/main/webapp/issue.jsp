<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Manage Issues</title>
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<style>
.entry












:not






 






(
:first-of-type






 






)
{
margin-top












:






 






10
px












;
}
.glyphicon {
	font-size: 18px;
}

html, body {
	height: 100vh;
	background: url('./images/bg.jpg') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.text-white {
color:white;
}
</style>
<script>
	$(function() {
		$(document)
				.on(
						'click',
						'.btn-add',
						function(e) {
							e.preventDefault();
							var controlForm = $('.controls form:first'), currentEntry = $(
									this).parents('.entry:first'), newEntry = $(
									currentEntry.clone()).appendTo(controlForm);
							newEntry.find('input').val('');
							controlForm
									.find('.entry:not(:last) .btn-add')
									.removeClass('btn-add')
									.addClass('btn-remove')
									.removeClass('btn-success')
									.addClass('btn-danger')
									.html(
											'<span class="glyphicon glyphicon-minus"></span>');
						}).on('click', '.btn-remove', function(e) {
					$(this).parents('.entry:first').remove();

					e.preventDefault();
					return false;
				});
	});
</script>

<script>
	$(function() {
		$('#addbook').on('click', function() {
			var booksselected = "";
			$("[name='fields[]']").each(function() {
				booksselected = booksselected + "," + $(this).val();
			});
			document.getElementById("bookstoissue").value = booksselected;
			document.issueform.submit();
		});
	});
</script>
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
			<li class="active"><a href="issue.jsp">Issue</a></li>
			<li><a href="returns.jsp">Returns</a></li>
			<li><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>
	<%
		String message = (String) request.getAttribute("message");

		if (null != message) {
	%>
	<div class="col-sm-8 col-sm-offset-1 alert alert-info"><%=request.getAttribute("message")%></div>
	<%
		}
	%>
	<div class="container">
		<div class="col-xs-12" style="height: 50px;"></div>
		<div class="row">
			<div class="control-group" id="fields">
				<div class="controls">
						<form class="form-horizontal" role="form"
							action="IssueBookServlet" method="POST" name="issueform">
								<div class="form-group">
									<label for="memberid" class="col-sm-2 control-label text-white"> Member
										ID </label>

									<div class="col-sm-3">
										<input type="text" class="form-control" id="memberid"
											name="memberid">
									</div>
								</div>

								<div class="entry form-group">
									<label for="fields[]" class="col-sm-2 control-label text-white">Book
										Number</label>

									<div class="col-sm-3 inline">
										<input type="text" class="form-control" id="fields[]"
											name="fields[]">
									</div>
									<button class="btn btn-success btn-add" type="button">
										<span class="glyphicon glyphicon-plus"></span>
									</button>
								</div>
								<input type="hidden" id="bookstoissue" name="bookstoissue"
									value="" />
						</form>
					</div>
					<div class="col-xs-12" style="height: 50px;"></div>

					<div class="col-sm-offset-2 col-sm-3 text-left">
						<button class="btn btn-success btn-primary" type="submit"
							name="addbook" id="addbook">Issue Books</button>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>