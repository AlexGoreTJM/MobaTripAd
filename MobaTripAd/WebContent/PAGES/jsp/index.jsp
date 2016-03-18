<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>
<%@ include file="../jsp/navigation.jsp"%>

<!-- Pagine di index dove vengono caricati i contenuti iniziali /inizia -->

<div class="container">
	<div class="row">
		<%@ include file="../jsp/menu.jsp"%>
		<div class="col-md-9 col-sm-12" id="contenuto">
			<%@ include file="../jsp/carousel.jsp"%>
			<%@ include file="../jsp/corpo.jsp"%>
		</div>
	</div>
</div>
<div class="container">
		<hr>
		<%@ include file="../jsp/footer.jsp"%>
</div>







