<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>


	<%@ include file="../jsp/navigation.jsp"%>
	<div class="container">
		<div class="row">
			<%@ include file="../jsp/menu.jsp"%>
			<div class="col-md-9">
				<img src="${pathGioco}${gioco.img1}" alt="testo" />

				<div class="row">

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
						<p>
					</div>
					Recensione sito: ${gioco.info}
					<p>
						Recensioni:
						<c:forEach items="${gioco.recensioni}" var="recensioni">
							<span class="glyphicon glyphicon-thumbs-up"></span>
							<span class="glyphicon glyphicon-print"></span>
							${recensioni.utente.nickname}
							${recensioni.info}
							<p>
						</c:forEach>
				</div>
			</div>
		</div>
	</div>
	


