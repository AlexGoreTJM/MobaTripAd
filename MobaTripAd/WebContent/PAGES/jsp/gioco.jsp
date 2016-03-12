<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
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
		<div class="row">
		
			<%@ include file="../jsp/menu.jsp"%>
			
			<div class="col-md-9">
				<img src="${pathGioco}${gioco.img1}" alt="testo" />

				<div class="row">
					Titolo: ${gioco.titolo} <br> Uscita: ${gioco.dataUscita} <br>
					Valutazione sito: ${gioco.valutazioneSito/2} <br> Valutazione
					utenti:
					
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
						
						<p>
						</div>
						Recensione sito: ${gioco.info}
						<p>Recensioni:<p>
						
						<c:forEach items="${gioco.recensioni}" var="recensioni">
							${recensioni.utente.nickname}
							<span class="glyphicon glyphicon-thumbs-up"></span>
							<span class="glyphicon glyphicon-thumbs-down"></span>
							<br>
							${recensioni.info}
							
							<p>
						</c:forEach>
						
						Commenta:<br/>
						<form>
							<div>
  								<input id="rating5" type="radio" name="rating" value="5">
  								<label for="rating5">5</label>
  								<input id="rating4" type="radio" name="rating" value="4">
  								<label for="rating4">4</label>
  								<input id="rating3" type="radio" name="rating" value="3">
  								<label for="rating3">3</label>
  								<input id="rating2" type="radio" name="rating" value="2">
  								<label for="rating2">2</label>
  								<input id="rating1" type="radio" name="rating" value="1">
  								<label for="rating1">1</label>
							</div><br>
							
							<textarea name='comment' id='comment'></textarea><br/> 
							<input type='hidden' name='articleid' id='articleid' value='' /> 
							<input type='submit' value='Submit' />
						</form>
				</div>
			</div>
		</div>
	</div>
</body>
</html>