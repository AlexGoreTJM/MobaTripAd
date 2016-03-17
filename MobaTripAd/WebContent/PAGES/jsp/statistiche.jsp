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



<%@ include file="../jsp/navigation.jsp"%>




<!-- Page Content -->
<div class="container centered">

	<div class="row">

		<%@ include file="../jsp/menu.jsp"%>

		<div class="col-md-9 col-sm-12" id="contenuto">

			<div class="col-sm-6 col-lg-6 col-md-6 col-md-offset-3">
				<div class="statistiche">
					<h1>Statistiche</h1>
					<p>
					<p style="font-size: 15px;">N° Utenti: ${numeroUtenti}</p>

					<p>
					<p style="font-size: 15px;">N° Giochi: ${numeroGiochi}</p>

					<p>
					<p style="font-size: 15px;">N° Recensioni: ${numeroRecensioni}</p>


					<br>

					<table class="table table-condensed">
						<thead>
							<tr>
								<th>Utente</th>
								<th>N° Recensioni</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${recPerUtente}" var="RecUtente">
								<tr>
									<td>${RecUtente.key}</td>
									<td>${RecUtente.value}</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<br>

					<table class="table table-condensed">
						<thead>
							<tr>
								<th>Utente</th>
								<th>Gioco</th>
								<th>Likes</th>
								<th>Dislikes</th>
							</tr>
						</thead>
						<tbody>
							<c:forEach items="${recensioni}" var="Recensione">
								<tr>
									<c:forEach items="${Recensione}" var="Dato">
										<td>${Dato}</td>
									</c:forEach>
								</tr>
							</c:forEach>
						</tbody>
					</table>






				</div>
			</div>
			<!-- /.container -->




			<%-- <%@ include file="../jsp/footer.jsp" %> --%>

		</div>
	</div>
</div>
<!-- /.container -->

<!-- jQuery -->

