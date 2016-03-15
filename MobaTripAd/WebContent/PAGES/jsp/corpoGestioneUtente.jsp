<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:forEach items="${listaGestioneUtente}" var="utente">
	<div class="col-sm-4 col-lg-4 col-md-4">
		<div class="thumbnail">
			<img src="${pathUtente}${utente.avatar}"
				alt="${utente.nome}">
			<div class="caption">
				<h4 class="pull-right">Grado: ${utente.grado}</h4>
				<h4>
					${utente.nickname}
				</h4>
				<p>${utente.nome} ${utente.cognome}$<br>{utente.dataReg}</p>
			</div>
		</div>
	</div>
</c:forEach>
