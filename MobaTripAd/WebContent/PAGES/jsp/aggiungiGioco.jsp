<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>


	<%@ include file="../jsp/navigation.jsp" %>
	
	
	<div class="container">

        <div class="row">
        <%@ include file="../jsp/menu.jsp"%>
        
 
 
  <form role="form" action="" method="post" >
    <div class="col-md-8 col-sm-12">
    <h1>Aggiungi Gioco</h1>
      
      <div class="form-group">
        <label for="InputTitolo">Titolo</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputTitolo" id="InputTitolo" placeholder="Enter Titolo" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputSh">Software house</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputSh" id="InputSh" placeholder="Enter Software House" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputPlayers">Players</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputPlayers" id="InputPlayers" placeholder="Enter Players" required>
          <span class="input-group-addon"></span></div>
      </div>
            <div class="form-group">
        <label for="InputWeb">Web</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputWeb" id="InputWeb" placeholder="Enter Web" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputDataUscita">Data uscita</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputDataUscita" id="InputDataUscita" placeholder="Enter Data Uscita" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputEtaMin">Età min</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputEtaMin" id="InputEtaMin" placeholder="Enter Età min" required>
          <span class="input-group-addon"></span></div>
      </div>
      <div class="form-group">
        <label for="InputCostoLancio">Costo lancio</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputCostoLancio" id="InputCostoLancio" placeholder="Enter costo lancio" required>
          <span class="input-group-addon"></span></div>
      </div>
	  <div class="form-group">
        <label for="InputValutazioneSito">Valutazione sito</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputValutazioneSito" id="InputValutazioneSito" placeholder="Enter valutazione sito" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputPro">Pro</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputPro" id="InputPro" placeholder="Enter Pro" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputContro">Contro</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputContro" id="InputContro" placeholder="Enter Contro" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputUrlVideo">Url video</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputUrlVideo" id="InputUrlVideo" placeholder="Enter URL video" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputUrlSh">Url Software House</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputUrlSh" id="InputUrlSh" placeholder="Enter URL Software House" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputRequisiti">Requisiti</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputRequisiti" id="InputRequisiti" placeholder="Enter requisiti" required>
          <span class="input-group-addon"></span></div>
      </div>
      	  <div class="form-group">
        <label for="InputInfo">Info</label>
        <div class="input-group">
          <input type="text" class="form-control" name="InputInfo" id="InputInfo" placeholder="Enter valutazione sito" required>
          <span class="input-group-addon"></span></div>
      </div>
      <input type="submit" name="submit" id="submit" value="Submit" class="btn btn-info pull-right">
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
	</body>

</html>