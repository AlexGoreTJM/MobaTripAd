<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>
    
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina del profilo</title>
</head>
<body>

<table>
	<tr>
		<td>Nickname</td>
		<td>${utente.nickname}</td>
	</tr>
	<tr>
		<td>Email</td>
		<td>${utente.email}</td>
	</tr>
	<tr>
		<td>Password</td>
		<td>${utente.password}</td>
	</tr>
	<tr>
		<td>Nome</td>
		<td>${utente.nome}</td>
	</tr>
	<tr>
		<td>Cognome</td>
		<td>${utente.cognome}</td>
	</tr>
	<tr>
		<td>Grado</td>
		<td>${utente.grado.getNome()}</td>
	</tr>
	<tr>
		<td>Data Registrazione</td>
		<td>${utente.dataReg}</td>
	</tr>
	<tr>
		<td>Informazioni Personali</td>
		<td>${utente.info}</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="vaiModificaProfilo.do">Modifica</a>
		</td>
	</tr>
</table>


</body>
</html>




<% 
/*
update di vari campi
cancellazione utente
caricamente immagine profilo

*/
%>