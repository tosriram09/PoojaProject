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
<script>
	function submit1(action) {
		var checkboxes = document.getElementsByName('transaction');
		var selectedTransactions = "";
		var totalFineAmount = 0.0;
		for (var i = 0, n = checkboxes.length; i < n; i++) {
			if (checkboxes[i].checked) {
				var checkboxValue = checkboxes[i].value;
				selectedTransactions += "," + checkboxValue;
				var fields = checkboxValue.split(/-/);
				totalFineAmount = totalFineAmount + parseInt(fields[3]);
			}
		}
		document.getElementById("booksreturned").value = selectedTransactions;
		document.getElementById("useraction").value = action;
		document.getElementById("returnform").action = "ReturnsServlet";

		if (totalFineAmount > 0) {
			var retVal = confirm("Pls.collect a fine of Rs." + totalFineAmount
					+ ". Click Ok to Proceed.");
			if (retVal == true) {
			} else {
				return false;
			}
		}
		document.getElementById("returnform").submit();
	}
</script>
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

html, body {
	height: 100%;
	background: url('./images/bg.jpg') no-repeat center center fixed;
	-webkit-background-size: cover;
	-moz-background-size: cover;
	-o-background-size: cover;
	background-size: cover;
}

.table-striped>tbody>tr:nth-child(odd)>td, .table-striped>tbody>tr:nth-child(odd)>th
	{
	background-color: grey;
	//
	Choose
	your
	own
	color
	here
}

.bg-overlay {
	background-repeat: no-repeat;
	background-size: cover;
	background-position: center center;
	color: #fff;
	height: 450px;
	padding-top: 50px;
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
			<li class="active"><a href="returns.jsp">Returns</a></li>
			<li><a href="bookentry.jsp">Book Entry</a></li>
			<li><a href="orderbooks.jsp">Order Books</a></li>
		</ul>
	</div>
	</nav>

	<div class="container col-lg-12 spacer"></div>
	<form class="form-horizontal" id="returnform" role="form" method="POST"
		action="ReturnsServlet">
		<div class="container bg-overlay">
			<div class="row">
				<div class="col-sm-6 col-sm-offset-3">
					<div id="imaginary_container">
						<div class="input-group">
							<input type="text" class="form-control"
								placeholder="Search for Member Transactions" name="memberid">
							<span class="input-group-addon">
								<button class="btn btn-default" type="submit">
									<span class="glyphicon glyphicon-search"></span>
								</button>
							</span>
						</div>
					</div>
				</div>
				<div class="col-xs-12" style="height: 50px;"></div>

				<%
					String message = (String) request.getAttribute("message");
					if (null != message) {
				%>
				<div class="col-sm-6 col-sm-offset-3 alert alert-info"><%=request.getAttribute("message")%></div>
				<%
					}
				%>


				<!-- Member Info -->
				<%
					MemberInfo memberInfo = (MemberInfo) request.getAttribute("memberInfo");
					List<MemberTransactions> transactions = null;
					int memberId = 0;
					if (memberInfo != null) {
						transactions = memberInfo.getMemberTransactions();
						if (transactions != null && transactions.size() == 0) {
				%>

				<div class="col-sm-6 col-sm-offset-3 alert alert-info">No
					transaction details found for the member</div>
				<%
					} else {
				%>
				<input type="hidden" value="<%=memberInfo.getTotalFineAmount()%>"
					id="totalfineamount" name="totalfineamount" />
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
						for (MemberTransactions transaction : transactions) {
									memberId = memberInfo.getMemberId();
					%>
					<tr>
						<td><input class="form-check-input" type="checkbox"
							name="transaction"
							value="<%=transaction.getTransactionId() + "-" + transaction.getBookId() + "-"
								+ memberInfo.getMemberId() + "-" + transaction.getFineAmount()%>" /></td>
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
					}
					if (transactions != null && transactions.size() > 0) {
				%>
				<button type="button" class="btn btn-primary btn-sm"
					onclick="submit1('return');">Return</button>
				
				<button type="button" class="btn btn-primary btn-sm"
					onclick="submit1('extend');">Extend</button>
				
				<%
					}
				%>
			</div>
		</div>
		<input type="hidden" id="useraction" name="useraction" value="search" />
		<input type="hidden" id="booksreturned" name="booksreturned" value="" />
		<input type="hidden" id="memberid1" name="memberid1"
			value="<%=memberId%>" />
	</form>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>