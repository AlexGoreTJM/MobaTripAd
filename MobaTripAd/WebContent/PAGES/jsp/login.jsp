<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Login</title>
</head>
<body>
<form action="login.do" method="post">
<table>
	<tr>
		<td>Username</td>
		<td><input type="text" name="username"></td>
	</tr>
	<tr>
		<td colspan="2"> <html:errors property="username" bundle="errori" /> </td>
	</tr>
	<tr>
		<td>Password</td>
		<td><input type="password" name="password"></td>
	</tr>
	<tr>
		<td colspan="2" > <html:errors property="password" bundle="errori" /> </td>
	</tr>
	<tr>
		<td></td>
		<td><input type="submit" ></td>
	</tr>
</table> 
Se non sei registrato<a href="/PAGES/jsp/signin.jsp">clicka qui</a>.
</form>

</body>
</html>