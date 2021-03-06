<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control"
	content="no-cache, no-store, must-revalidate" />
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link href="bootstrap/css/bootstrap.min.css" rel="stylesheet">
<!-- Custom styles for this template -->
<link href="css/login.css" rel="stylesheet">
<script src="bootstrap/js/jquery-3.2.1.min.js"></script>
<title>Book Bank</title>
</head>
<body>
	<div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-7">
				<div class="panel panel-default">
					<div class="panel-heading">
						<span class="glyphicon glyphicon-lock"></span> Login
					</div>
					<div class="panel-body">
						<form class="form-horizontal" role="form" method="POST"
							action="LoginServlet">
							<%
								if (null != request.getAttribute("message")) {
							%>
							<div class="alert alert-danger">
								<strong>Invalid Username/Password</strong>
							</div>
							<%
								}
							%>
							<div class="form-group">
								<label for="inputEmail" class="col-sm-3 control-label">
									Email</label>
								<div class="col-sm-9">
									<input type="email" class="form-control" id="inputEmail"
										name="inputEmail" placeholder="Email" required />
								</div>
							</div>
							<div class="form-group">
								<label for="inputPassword" class="col-sm-3 control-label">
									Password</label>
								<div class="col-sm-9">
									<input type="password" class="form-control" id="inputPassword"
										name="inputPassword" placeholder="Password" required />
								</div>
							</div>
							<div class="form-group">
								<div class="col-sm-offset-3 col-sm-9">
									<div class="checkbox">
										<label> <input type="checkbox" /> Remember me
										</label>
									</div>
								</div>
							</div>
							<div class="form-group last">
								<div class="col-sm-offset-3 col-sm-9">
									<button type="submit" class="btn btn-success btn-sm">
										Sign in</button>
									<button type="reset" class="btn btn-default btn-sm">
										Reset</button>
								</div>
							</div>
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="bootstrap/js/bootstrap.min.js"></script>
</body>
</html>
