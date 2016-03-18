<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!-- Creazione di un form per l'aggiunta di un gioco. -->
<%@ include file="/PAGES/jsp/customTag.jsp"%>
<%@ include file="../jsp/navigation.jsp"%>
<div class="container">
	<div class="row">
		<%@ include file="../jsp/menu.jsp"%>
		<form role="form" action="aggiungiGioco.do" method="post" enctype="multipart/form-data">
			<div class="col-md-8 col-sm-12">
				<h1>Aggiungi Gioco</h1>
				<div class="form-group">
					<label for="titolo">* Titolo</label>
					<div class="input-group">
						<input type="text" class="form-control" name="titolo" id="titolo"
							placeholder="Inserisci titolo" required> <span
							class="input-group-addon"></span>
						<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
					</div>
				</div>
				<div class="form-group">
					<label for="sh">* Software house</label>
					<div class="input-group">
						<input type="text" class="form-control" name="sh" id="sh"
							placeholder="Inserisci Software House" required> <span
							class="input-group-addon"></span>
						<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
					</div>
				</div>
				<div class="form-group">
					<label for="players">* Players</label>
					<div class="input-group">
						<input type="text" class="form-control" name="players"
							id="players" placeholder="Inserisci players" required> <span
							class="input-group-addon"></span>
						<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
					</div>
				</div>
				<div class="form-group">
					<label for="web">* Web</label>
					<div class="input-group">
						<input type="text" class="form-control" name="web" id="web"
							placeholder="Inserisci web" required> <span
							class="input-group-addon"></span>
						<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
					</div>
				</div>
				<div class="form-group">
					<label for="dataUscita">* Data uscita</label>
					<div class="input-group">
						<input type="text" class="form-control" name="year" id="year"
							placeholder="Anno" required> <input type="text"
							class="form-control" name="month" id="month" placeholder="Mese"
							required> <input type="text" class="form-control"
							name="day" id="day" placeholder="Giorno" required> <span
							class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="etaMin">* Età min</label>
					<div class="input-group">
						<input type="text" class="form-control" name="etaMin" id="etaMin"
							placeholder="Inserisci età min" required> <span
							class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="costoLancio">* Costo lancio</label>
					<div class="input-group">
						<input type="text" class="form-control" name="costoLancio"
							id="costoLancio" placeholder="Inserisci costo lancio" required>
						<span class="input-group-addon"></span>
					</div>
				</div>
				<div class="form-group">
					<label for="idCategoria">Categoria</label>
					<div class="input-group">
						<fieldset>
							<select name="idCategoria">
								<c:forEach items="${listaCategoria}" var="categoria">
									<option value="${categoria.idCategoria}" style="color: black;">
										${categoria.nome}</option>
								</c:forEach>
							</select>
						</fieldset>
					</div>
					<br>
					<div class="form-group">
						<label for="valutazioneSito">* Valutazione sito</label>
						<div class="input-group">
							<input type="text" class="form-control" name="valutazioneSito"
								id="valutazioneSito" placeholder="Inserisci valutazione sito"
								required> <span class="input-group-addon"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="pro">* Pro</label>
						<div class="input-group">
							<input type="text" class="form-control" name="pro" id="pro"
								placeholder="Inserisci pro" required> <span
								class="input-group-addon"></span>
							<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
						</div>
					</div>
					<div class="form-group">
						<label for="contro">* Contro</label>
						<div class="input-group">
							<input type="text" class="form-control" name="contro" id="contro"
								placeholder="Inserisci contro" required> <span
								class="input-group-addon"></span>
							<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
						</div>
					</div>
					<div class="form-group">
						<label for="urlVideo">* Url video</label>
						<div class="input-group">
							<input type="text" class="form-control" name="urlVideo"
								id="urlVideo" placeholder="Inserisci URL video" required> <span
								class="input-group-addon"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="urlSh">* Url Software House</label>
						<div class="input-group">
							<input type="text" class="form-control" name="urlSh" id="urlSh"
								placeholder="Inserisci URL Software House" required> <span
								class="input-group-addon"></span>
							<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
						</div>
					</div>
					<div class="form-group">
						<label for="requisiti">* Requisiti</label>
						<div class="input-group">
							<input type="text" class="form-control" name="requisiti"
								id="requisiti" placeholder="Inserisci requisiti" required> <span
								class="input-group-addon"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="info">* Info</label>
						<div class="input-group">
							<input type="text" class="form-control" name="info" id="info"
								placeholder="Inserisci valutazione sito" required> <span
								class="input-group-addon"></span>
						</div>
					</div>
					<div class="form-group">
						<label for="info">* Image</label>
						<div class="input-group">
							<input type="file" name="file1" class="form-control"> <span
								class="input-group-addon"></span>
							<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
						</div>
					</div>
					<div class="form-group">
						<label for="info">* Image2</label>
						<div class="input-group">
							<input type="file" name="file2" class="form-control"> <span
								class="input-group-addon"></span>
						</div>
					</div>

					<input type="submit" name="submit" id="submit" value="Submit"
						class="btn btn-info pull-right">
				</div>
		</form>
		<hr class="featurette-divider hidden-lg">
		<h6>* campi obbligatori</h6>
	</div>
</div>
<script src="RESOURCES/js/jquery.js"></script>
<script src="RESOURCES/js/notify.js"></script>
<script src="RESOURCES/js/mobatripadScript.js"></script>
<!-- Bootstrap Core JavaScript -->
<script src="RESOURCES/js/bootstrap.min.js"></script>
</body>
</html>