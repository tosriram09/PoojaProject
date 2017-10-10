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
		$('#issuebooks').on('click', function() {
			var booksids = "";
			$('.form-control').each(function() {
				alert($(this).val);
				booksids = booksids + "," + $(this).val;
			});
			alert(booksids);
			document.getElementById("bookstoissue").value = booksids;
			document.displayform.submit();
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
			<li class="active"><a href="issue.jsp">Search</a></li>
			<li><a href="returns.jsp">Returns</a></li>
			<li><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>
	<div class="container">
		<div class="row">
			<div class="form-group">
				<label class="col-sm-2 control-label">Member ID</label>
				<div class="col-xs-3">
					<input id="memberid" type="text" />
				</div>
			</div>
			<div class="form-group" id="fields">
				<label class="col-sm-2 control-label">Book ID</label>
				<div class="controls">
					<form role="form" autocomplete="off" name="displayform"
						method="post">
						<div class="entry input-group col-xs-3">
							<input class="form-control" name="fields[]" type="text" /> <span
								class="input-group-btn">
								<button class="btn btn-success btn-add" type="button">
									<span class="glyphicon glyphicon-plus"></span>
								</button>
							</span>
						</div>
						<button class="btn btn-primary" type="button" id="issuebooks">Issue
							Books</button>
						<input type="hidden" id="bookstoissue" name="bookstoissue"
							value="" />
					</form>
				</div>
			</div>
		</div>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>