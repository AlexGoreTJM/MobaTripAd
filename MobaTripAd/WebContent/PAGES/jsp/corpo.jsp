<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<c:forEach items="${listaGiocoRecente}" var="GiocoRecente">
<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="${pathGioco}${GiocoRecente.img1}" alt="${GiocoRecente.titolo}" height="50">
		<div class="caption">
			<h4 class="pull-right">Voto: ${GiocoRecente.valutazioneSito}</h4>
			<h4>
				<a href="#">${GiocoRecente.titolo}</a>
			</h4>
			<p>
				${GiocoRecente.info}
			</p>
		</div>
		<div class="ratings">
			<p class="pull-right">${GiocoRecente.recensioni.size()} recensioni</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span>
			</p>
		</div>
	</div>
</div>
</c:forEach>
