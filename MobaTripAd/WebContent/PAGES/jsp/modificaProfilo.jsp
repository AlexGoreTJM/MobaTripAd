<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body>

<form>
	<table>
		<tr>
			<td>Email</td>
			<td><input type="text" value="${utente.email }"/></td>
		</tr>
		<tr>
			<td>Password</td>
			<td><input type="text" value="${utente.password }"/></td>
		</tr>
		<tr>
			<td>Nome</td>
			<td><input type="text" value="${utente.nome }"/></td>
		</tr>
		<tr>
			<td>Cognome</td>
			<td><input type="text" value="${utente.cognome }"/></td>
		</tr>
		<tr>
			<td>Informazioni Personali</td>
			<td><input type="text" value="${utente.info }"/></td>
		</tr>
		<tr>
			<td><input type="submit" value="Aggiorna" /></td>
		</tr>
	</table>
</form>

</body>
</html>