<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
    <h1>Profilo</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="${pathUtente}${utente.avatar}" height="256" width="256" alt="avatar">
          <br> <br>
          <img alt="grado" src="${pathGrado}${utente.grado.nome}.png" height="150" width="150" class="img-circle">
          <br>
          <b>GRADO:</b> ${utente.grado.nome}
          
        </div>
      </div>
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        <form class="form-horizontal" role="form" action="vaiModificaProfilo.do" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="nome" readonly="text" value="${utente.nome}">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cognome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="cognome" readonly="text" value="${utente.cognome}">
            </div>
          </div>   
                    <div class="form-group">
            <label class="col-md-3 control-label">Nickname:</label>
            <div class="col-md-8">
              <input class="form-control" name="nickname" readonly="text" value="${utente.nickname}">
            </div>
          </div>
                    <div class="form-group">
            <label class="col-md-3 control-label">Email:</label>
            <div class="col-md-8">
              <input class="form-control" name="email" readonly="text" value="${utente.email}">
            </div>
          </div>
                 
                    <div class="form-group">
            <label class="col-md-3 control-label">Data Registrazione:</label>
            <div class="col-md-8">
              <input class="form-control" name="dataRage" readonly="text" value="${utente.dataReg}">
            </div>
          </div>
          
           <div class="form-group">
            <label class="col-md-3 control-label">Parlaci di te:</label>
            <div class="col-md-8">
              <input class="form-control" readonly="text" name="info" value="${utente.info}">
            </div>
          </div>
          
          
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Modifica">
            </div>
          </div>
        </form>
      </div>
  </div>
</div>












<!-- <form action="signup.do" method="post">
<table>
    <tr>
      <td>Nome:</td>
      <td><input type="text" name="nome"></td>
    </tr>
    
    <tr>
      <td>Cognome:</td>
      <td><input type="text" name="cognome"></td>
    </tr>
    
    <tr>
      <td>*Username:</td>
      <td><input type="text" name="username"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>*Email:</td>
      <td><input type="text" name="email"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>*Conferma email:</td>
      <td><input type="text" name="email_c"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>*Password:</td>
      <td><input type="password" name="password"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>*Conferma password:</td>
      <td><input type="password" name="password_c"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>*Avatar:</td>
      <td><input type="text" name="avatar"></td>
      <td></td>
    </tr>
    
    <tr>
      <td>Parlaci di te:</td>
      <td><input type="text" name="info"></td>
    </tr>
    <tr>
    <td colspan="2"><input type="submit" ></td>

</table>



</form> -->




</body>
</html>


















 <!--   
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Pagina del profilo</title>
</head>
<body>

<table>
	<tr>
		<td>Nickname</td>
		<td>${utente.nickname}</td>
	</tr>
	<tr>
		<td>Email</td>
		<td>${utente.email}</td>
	</tr>
	<tr>
		<td>Password</td>
		<td>${utente.password}</td>
	</tr>
	<tr>
		<td>Nome</td>
		<td>${utente.nome}</td>
	</tr>
	<tr>
		<td>Cognome</td>
		<td>${utente.cognome}</td>
	</tr>
	<tr>
		<td>Grado</td>
		<td>${utente.grado.getNome()}</td>
	</tr>
	<tr>
		<td>Data Registrazione</td>
		<td>${utente.dataReg}</td>
	</tr>
	<tr>
		<td>Informazioni Personali</td>
		<td>${utente.info}</td>
	</tr>
	<tr>
		<td colspan="2">
			<a href="vaiModificaProfilo.do">Modifica</a>
		</td>
	</tr>
</table>


</body>
</html>





 -->