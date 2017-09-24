<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Cache-Control" content="no-cache, no-store, must-revalidate" />
<title>Book Bank</title>
</head>
<body>
	<form action="BookBankServlet" method="POST">
		User Name: <input type="text" name="username" size="20px" />
		Password: <input type="password" name="password" size="20px" /> 
		<input type="submit" value="Login!" />
	</form>
</body>
</html>