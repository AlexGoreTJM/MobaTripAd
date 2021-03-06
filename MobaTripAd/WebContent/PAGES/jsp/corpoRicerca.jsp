<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- viene creato il corpo con i giochi cercati nel form Search in alto a destra -->
<c:forEach items="${listaGiocoRicerca}" var="GiocoRecente">
	<div class="col-sm-4 col-lg-4 col-md-4">
		<div class="thumbnail" style="background: url('RESOURCES/img/menu_background.png')">
			<a href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}"><img src="${pathGioco}${GiocoRecente.img1}"
				alt="${GiocoRecente.titolo}"></a>
			<div class="caption">
				<h4 class="pull-right">Voto: ${GiocoRecente.valutazioneSito/2}/5</h4>
				<h4>
					<a class="tit" style="color:white;" href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}">${GiocoRecente.titolo}</a>
				</h4>
				<p>${GiocoRecente.info}</p>
			</div>
			<div class="ratings">
				<p class="pull-right">${GiocoRecente.recensioni.size()} 
					<c:if test="${GiocoRecente.recensioni.size() == 1}">
						recensione
					</c:if>
					<c:if test="${GiocoRecente.recensioni.size() != 1}">
						recensioni
					</c:if>
				</p>
				<p>
					<c:choose>
						<c:when test="${GiocoRecente.valutazione != 0}">
							<c:set var="count" value="1" scope="page" />
							<c:forEach begin="${count}" end="${GiocoRecente.valutazione / 2}"
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
		</div>
	</div>
</c:forEach>
