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
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/bootstrap.min.css" />

<!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/shop-homepage.css" />

</head>
<body>
	<%@ include file="../jsp/navigation.jsp"%>
	<div class="container">
		<h1>Profilo</h1>
		<hr>
		<div class="row">
			<!-- left column -->
			<div class="col-md-3">
				<div class="text-center">
					<img src="${pathUtente}${utente.avatar}" height="256" width="256"
						alt="avatar"> <br> <br> <img alt="grado"
						src="${pathGrado}${utente.grado.nome}.png" height="150"
						width="150" class="img-circle"> <br> <b>GRADO:</b>
					${utente.grado.nome}

				</div>
			</div>
			<!-- edit form column -->
			<div class="col-md-9 personal-info">
				<form class="form-horizontal" role="form"
					action="vaiModificaProfilo.do" method="post">
					<div class="form-group">
						<label class="col-lg-3 control-label">Nome:</label>
						<div class="col-lg-8">
							<input class="form-control" name="nome" readonly="text"
								value="${utente.nome}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-lg-3 control-label">Cognome:</label>
						<div class="col-lg-8">
							<input class="form-control" name="cognome" readonly="text"
								value="${utente.cognome}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Nickname:</label>
						<div class="col-md-8">
							<input class="form-control" name="nickname" readonly="text"
								value="${utente.nickname}">
						</div>
					</div>
					<div class="form-group">
						<label class="col-md-3 control-label">Email:</label>
						<div class="col-md-8">
							<input class="form-control" name="email" readonly="text"
								value="${utente.email}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Data Registrazione:</label>
						<div class="col-md-8">
							<input class="form-control" name="dataRage" readonly="text"
								value="${utente.dataReg}">
						</div>
					</div>

					<div class="form-group">
						<label class="col-md-3 control-label">Parlaci di te:</label>
						<div class="col-md-8">
							<input class="form-control" readonly="text" name="info"
								value="${utente.info}">
						</div>
					</div>

				<c:if test="${utente.dataReg != null }">
					<div class="form-group">
						<label class="col-md-3 control-label"></label>
						<div class="col-md-8">
							<input type="submit" class="btn btn-primary" value="Modifica">
						</div>
					</div>
				</c:if>
				</form>
			</div>
		</div>

	<c:if test="${utente.admin == '0' }">
		<h1>Recensioni</h1>
		<hr>
		<c:forEach items="${listaRecensioniUtente}" var="UtenteRecensione">
			<c:forEach items="${listaGiochi}" var="gioco">
				<c:if test="${UtenteRecensione.idGioco == gioco.idGioco}">
					<h4>
						<a style="color: rgba(0, 255, 48, 0.50); text-decoration: none;"
							href="schedaGioco.do?idGioco=${gioco.idGioco}">${gioco.titolo}</a>
					</h4>
				</c:if>
			</c:forEach>


			<p>${lista }${UtenteRecensione.info}
			<hr>
		</c:forEach>
	</c:if>
	</div>
<div class="container">
		<hr>
		<%@ include file="../jsp/footer.jsp"%>
</div>
</body>
</html>
