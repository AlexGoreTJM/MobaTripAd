<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>
<%@ include file="../jsp/navigation.jsp"%>
<!-- Creazione di un form per contattare l'admin. -->

<div class="container">
	<div class="row">
		<%@ include file="../jsp/menu.jsp"%>



		<form role="form" action="contattaci.do" method="post">
			<div class="col-md-8 col-sm-12">
				<h1>Contattaci</h1>
				<div class="form-group">
					<label for="InputName">Nome</label>
					<div class="input-group">
						<input type="text" class="form-control" name="nome" id="InputName"
							placeholder="Inserisci nome" required> <span
							class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="InputEmail">Email</label>
					<div class="input-group">
						<input type="email" class="form-control" id="InputEmail"
							name="email" placeholder="Inserisci email" required> <span
							class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="InputMessage">Messaggio</label>
					<div class="input-group">
						<textarea name="messaggio" id="InputMessage" class="form-control"
							rows="5" required></textarea>
						<span class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="InputReal">Quanto fa 4+3? (Spam Checker)</label>
					<div class="input-group">
						<input type="text" class="form-control" name="valore"
							id="InputReal" required> <span class="input-group-addon"></span>
					</div>
				</div>
				<input type="submit" name="submit" id="submit" value="Submit"
					class="btn btn-info pull-right">
			</div>
		</form>
		<hr class="featurette-divider hidden-lg">
	</div>
</div>

<script src="RESOURCES/js/jquery.js"></script>
<script src="RESOURCES/js/notify.js"></script>
<script src="RESOURCES/js/mobatripadScript.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="RESOURCES/js/bootstrap.min.js"></script>

<div class="container">
		<hr>
		<%@ include file="../jsp/footer.jsp"%>
</div>
</body>

</html>