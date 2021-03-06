<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
   <%@ include file="/PAGES/jsp/customTag.jsp"%>
   
<!-- Crea i form per la modifica da parte dell'utente delle sue inforamzioni personali -->

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta http-equiv="refresh" content="1;url=localhost:8080/MobaTripAd/vaiModificaProfilo.do"><!--  Serve per refreshare le immagini caricate -->
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Home Page--</title>
<!-- Bootstrap Core CSS -->
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/bootstrap.min.css"/>
  <!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/shop-homepage.css"/>
</head>
<body>
<%@ include file="../jsp/navigation.jsp" %>
<div class="container">
    <h1>Aggiorna Profilo</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="${pathUtente}${utente.avatar}" height="256" width="256" alt="avatar">
          <h6>Carica un'altra foto...</h6>
          <form name="formFile" action="upload.do" method="post" enctype="multipart/form-data">
          	<input type="file" name="file" class="form-control"><br>
          	<input type="submit" value="Carica" class="btn btn-primary">
          </form>
          
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form class="form-horizontal" role="form" action="modifica.do" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="nome" type="text" value="${utente.nome}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cognome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="cognome" type="text" value="${utente.cognome}">
            </div>
          </div>   
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" name="password" type="password" value="${utente.password}">
            </div>
          </div>
           <div class="form-group">
            <label class="col-md-3 control-label">Parlaci di te:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="info" value="${utente.info}">
            </div>
          </div>
  
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Salva">
              <span></span>
              <input type="reset" class="btn btn-default" value="Resetta">
            </div>
          </div>
        </form>
        <br>
        <br>
        
        <form class="form-horizontal" role="form" action="news.do" method="post">
          <div class="form-group">
		  <label class="col-md-3 control-label">Registrati alla NewsLetter:</label>
		  <div class="col-md-8">
			<input type="email" class="form-control" id="InputEmail"
				name="email" placeholder="Inserisci email" required> 
				 <div class="erroriWithe"><html:errors property="email" bundle="errori" /></div>
		 </div>
		 </div>
		 <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Registrati">
              <br>

              <h5><a style="color: rgba(0, 255, 48, 0.86); text-decoration: none"href="disiscrizioneNews.do">Cancellati dalla NewsLetter</a></h5>
              
              <br>
              <c:if test="${feedback_news_dis != null && feedback_news_dis == 'sei stato cancellato dalla newsletter'}">
            	<div class="alert alert-success">
  					<strong>Success!</strong> Sei stato cancellato dalla Newsletter.
				</div>
			  </c:if>
			  <c:if test="${ feedback_news_dis != null && feedback_news_dis == 'Impossibile cancellare perch� non sei registrato alla newsletter'}">
				<div class="alert alert-warning">
 			 		<strong>Warning!</strong> Non sei presente nella Newsletter.
				</div>
			  </c:if>
            </div> 
          </div>
        </form>
        
      </div>
  </div>
</div>
<div class="container">
		<hr>
		<div id="footer" class="">
	<div class="container">
		<p class="text-muted">Copyright Gruppo ATS 2016</p>
	</div>
</div>
	</div>
</body>
</html>
