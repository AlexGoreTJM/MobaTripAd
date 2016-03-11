<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Home Page--</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/bootstrap.min.css"/>
  
<!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/shop-homepage.css"/>

</head>
<body>
<%@ include file="../jsp/navigation.jsp" %>

<div class="container">

		<div class="row">
<%@ include file="../jsp/menu.jsp" %>
<div class="col-md-9">

				

				<div class="row">
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
	</div>

			</div>

		</div>

	</div>
	<div class="container">

		<hr>
<%@ include file="../jsp/footer.jsp" %>
		

	</div>

</body>
</html>