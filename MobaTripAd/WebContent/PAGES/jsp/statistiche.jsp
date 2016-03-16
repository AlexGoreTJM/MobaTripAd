<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<%@ include file="/PAGES/jsp/customTag.jsp"%>





<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->



	<%@ include file="../jsp/navigation.jsp" %>
	
	
		

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<%@ include file="../jsp/menu.jsp" %>

			<div class="col-md-9 col-sm-12" id="contenuto">

<c:forEach items="${listaGiocoRecente}" var="GiocoRecente">
	<div class="col-sm-4 col-lg-4 col-md-4">
		<div class="thumbnail" >
			<p><a href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}"><img src="${pathGioco}${GiocoRecente.img1}"
				alt="${GiocoRecente.titolo}"></a>
			<div class="caption">
				<h4 class="pull-right">Voto: ${GiocoRecente.valutazioneSito/2}/5</h4><br><br>
				<h4>
					<a href="schedaGioco.do?idGioco=${GiocoRecente.idGioco}" style="color: black;">${GiocoRecente.titolo}</a>
				</h4>
				<p>${GiocoRecente.info}</p>
			</div>
			<div class="ratings">
				<p class="pull-right">${GiocoRecente.recensioni.size()}
					recensioni</p>
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


				


				

			</div>

		</div>

	</div>
	<!-- /.container -->

	

		<hr>
<%-- <%@ include file="../jsp/footer.jsp" %> --%>
		

	
	<!-- /.container -->

	<!-- jQuery -->
	
