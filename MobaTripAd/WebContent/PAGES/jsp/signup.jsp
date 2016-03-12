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
    <h1>Create Profile</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="//placehold.it/100" class="avatar img-circle" alt="avatar">
          <h6>Upload a different photo...</h6>
          
          <input type="file" name="avatar" class="form-control">
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        
        <h3>Personal info</h3>
        
        <form class="form-horizontal" role="form" action="signup.do" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="nome" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cognome:</label>
            <div class="col-lg-8">
              <input class="form-control" name="cognome" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Username:</label>
            <div class="col-md-8">
              <input class="form-control" name="username" type="text">
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Email:</label>
            <div class="col-lg-8">
              <input class="form-control" name="email" type="text">
            </div>
          </div>
         <div class="form-group">
            <label class="col-lg-3 control-label">Conferma Email:</label>
            <div class="col-lg-8">
              <input class="form-control" type="text" name="email_c">
            </div>
          </div>
      
          <div class="form-group">
            <label class="col-md-3 control-label">Password:</label>
            <div class="col-md-8">
              <input class="form-control" name="password" type="password">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">Confirm password:</label>
            <div class="col-md-8">
              <input class="form-control" type="password" name="password_c">
            </div>
          </div>
           <div class="form-group">
            <label class="col-md-3 control-label">Parlaci di te:</label>
            <div class="col-md-8">
              <input class="form-control" type="text" name="info">
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Save Changes">
              <span></span>
              <input type="reset" class="btn btn-default" value="Cancel">
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
