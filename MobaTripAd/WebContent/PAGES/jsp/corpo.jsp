<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Creazione del corpo index con i giochi aggiunti recentemente nel database -->

<c:forEach items="${listaGiocoRecente}" var="GiocoRecente">

	<div id="x" class="col-sm-4 col-lg-4 col-md-4">
	<div class="cs-style-1">
	 
	<div id="y">Recensisci ora!!!</div>
		</div>
		<div class="thumbnail" style="background: url('RESOURCES/img/menu_background.png')">
		
			<p>
				<a href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}"><img
					src="${pathGioco}${GiocoRecente.img1}" alt="${GiocoRecente.titolo}" ></a>
			<div class="caption">
				<h4 class="pull-right">Voto:
					${GiocoRecente.valutazioneSito/2}/5</h4>
				<h4>
					<a class="tit"
						href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}"
						style="color: white;" title="${GiocoRecente.titolo}">${GiocoRecente.titolo}</a>
				</h4>
				<p class="inf">${GiocoRecente.info}</p>
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
							<c:set var="count" value="0" scope="page" />
							<c:forEach begin="${count}"
								end="${(GiocoRecente.valutazione / 2)-1}" varStatus="loop">
								<c:set var="count" value="${count + 1}" scope="page" />
								<span class="glyphicon glyphicon-star"></span>
							</c:forEach>
							<c:if test="${count != 5}">
								<c:forEach begin="${count}" end="4" varStatus="loop">
									<c:set var="count" value="${count + 1}" scope="page" />
									<span class="glyphicon glyphicon-star-empty"></span>
								</c:forEach>
							</c:if>
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
