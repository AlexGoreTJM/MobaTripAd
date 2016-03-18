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
    <h1>Crea Profilo</h1>
  	<hr>
	<div class="row">
      <!-- left column -->
      <div class="col-md-3">
        <div class="text-center">
          <img src="/MobaTripAd/IMGDB/Utente/MOBAavatar.png" class="avatar img-circle" alt="avatar" height="256" width="256">
        </div>
      </div>
      
      <!-- edit form column -->
      <div class="col-md-9 personal-info">
        
        <h3>Informazioni Personali</h3>
	
	<div class="form-horizontal">
        <html:form action="signup.do" method="post">
          <div class="form-group">
            <label class="col-lg-3 control-label">Nome:</label>
            <div class="col-lg-8">
            	<div class="form-control">
              		<html:text name="SignupForm" property="nome" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">Cognome:</label>
            <div class="col-lg-8">
              	<div class="form-control">
              		<html:text name="SignupForm" property="cognome" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">* Username:</label>
            <div class="col-md-8">
              	<div class="form-control">
              		<html:text name="SignupForm" property="username" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
              <div class="erroriWithe"><html:errors property="username" bundle="errori" /></div>
            </div>
            
          </div>
          <div class="form-group">
            <label class="col-lg-3 control-label">* Email:</label>
            <div class="col-lg-8">
              	<div class="form-control">
              		<html:text name="SignupForm" property="email" style="color:black; border-style:none; width: 100%;height: 20px; " />
              	</div>
              <div class="erroriWithe"><html:errors property="email" bundle="errori" /></div>
            </div>
            
          </div>
         <div class="form-group">
            <label class="col-lg-3 control-label">* Conferma Email:</label>
            <div class="col-lg-8">
              	<div class="form-control">
              		<html:text name="SignupForm" property="email_c" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
               <div class="erroriWithe"><html:errors property="email_c" bundle="errori" /></div>
            </div>
           
          </div>
      
          <div class="form-group">
            <label class="col-md-3 control-label">* / ** Password:</label>
            <div class="col-md-8">
              	<div class="form-control">
              		<html:password name="SignupForm" property="password" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
              	<div class="erroriWithe"><html:errors property="password" bundle="errori" /></div>
            </div>           
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label">* Conferma password:</label>
            <div class="col-md-8">
             	 <div class="form-control">
              		<html:password name="SignupForm" property="password_c" style="color:black; border-style:none; width: 100%;height: 20px;"/>
              	</div>
              <div class="erroriWithe"><html:errors property="password_c" bundle="errori" /></div>
            </div>
          </div>
           <div class="form-group">
            <label class="col-md-3 control-label">Parlaci di te:</label>
            <div class="col-md-8">
              	<div class="form-control">
              		<html:text name="SignupForm" property="info" style="color:black; border-style:none; width: 100%;height: 20px;" />
              	</div>
            </div>
          </div>
          <div class="form-group">
            <label class="col-md-3 control-label"></label>
            <div class="col-md-8">
              <input type="submit" class="btn btn-primary" value="Registrati">
              <span></span>
             	<input type="reset"  value="Reset" class="btn btn-default">
            </div>
          </div>
        </html:form>
    </div>
        <h6>* campi obbligatori <br>
        ** La password deve essere di almeno 8 caratteri, contenere almeno una lettera maiuscola e un numero</h6>
      </div>
  </div>
</div>

</body>
</html>
