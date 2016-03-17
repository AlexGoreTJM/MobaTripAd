<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Pagine di controllo admin per gestire gli utenti (elimina) -->
<c:forEach items="${listaGestioneUtente}" var="utente">
	<div class="col-sm-4 col-lg-4 col-md-4">
		<div class="thumbnail">
			<img src="${pathUtente}${utente.avatar}"
				alt="${utente.nome}" style="min-width:250px; min-height:190px;max-width:250px;max-height:190px;">
			<div class="caption">
				<h4 class="pull-right">Grado: ${utente.grado.nome}</h4>
				<h4>
					${utente.nickname}
				</h4>
				<p>${utente.nome} ${utente.cognome}<br>${utente.dataReg}<br>		 <a href="mailto:${utente.email}"><font color="blue">${utente.email}</font></a>  </p>
			</div>
			<div class="ratings">
				<p class="pull-right"><a href="eliminaUtente.do?idUtenteCanc=${utente.idUtente}"><font color="red">Elimina!</font></a></p>
				<p>
				.
				</p>
			</div>
		</div>
	</div>
</c:forEach>
