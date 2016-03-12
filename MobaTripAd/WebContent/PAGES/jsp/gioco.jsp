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
	<div class="container" style="margin-top: 40px">
		<div class="row">
			<div class="col-md-5 col-md-2 col-md-5">
				<img src="${pathGioco}${gioco.img1}" alt="testo" /> 
				Titolo: ${gioco.titolo}
				Uscita: ${gioco.dataUscita}
				Valutazione sito: ${gioco.valutazioneSito}
				Valutazione utenti: 
				<div class="ratings">
					<c:choose>
						<c:when test="${gioco.valutazione != 0}">
							<c:set var="count" value="1" scope="page" />
							<c:forEach begin="${count}" end="${gioco.valutazione / 2}"
								varStatus="loop">
								<c:set var="count" value="${count + 1}" scope="page" />
								<span class="glyphicon glyphicon-star"></span>
							</c:forEach>
							<c:forEach begin="${count}" end="5" varStatus="loop">
								<c:set var="count" value="${count + 1}" scope="page" />
								<span class="glyphicon glyphicon-star-empty"></span>
							</c:forEach>
						</c:when>
						<c:otherwise>
							<span>N/P</span>
						</c:otherwise>
					</c:choose>
				</p>
			</div>
			Recensione sito: ${gioco.info}
			<p>
			Recensioni: 
			<c:forEach items="${gioco.recensioni}" var="recensioni">
				${recensioni.utente.nickname}
				${recensioni.info}
				<p>
			</c:forEach>

			</div>
		</div>
	</div>
</body>
</html>