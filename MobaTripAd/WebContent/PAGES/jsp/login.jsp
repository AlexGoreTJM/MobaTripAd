<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<!-- Pagina contenente il form per il login dell'utente al sito. -->

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Login--</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/bootstrap.min.css" />

<!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/shop-homepage.css" />

</head>
<body>
	<%@ include file="../jsp/navigation.jsp"%>
	<div class="container" style="margin-top: 40px">
		<div class="row">
			<div class="col-sm-6 col-md-4 col-md-offset-4">
				<div class="panel panel-default">
					<div class="panel-heading">
						<strong> Login to continue</strong>
					</div>
					<div class="panel-body">
						<html:form action="login.do" method="post">
							<fieldset>
								<div class="row">
									<div class="center-block">
										<img class="profile-img"
											src="https://lh5.googleusercontent.com/-b0-k99FZlyE/AAAAAAAAAAI/AAAAAAAAAAA/eu7opA4byxI/photo.jpg?sz=120"
											alt="">
									</div>
								</div>
								<div class="row">
									<div class="col-sm-12 col-md-10  col-md-offset-1 ">
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-user"></i>
												</span> 
												<div class="form-control">
													<html:text name="LoginForm" property="username" style="color:black;" />
												</div>
											</div>
											<div class="errori">
												<html:errors property="username" bundle="errori" />
											</div>
										</div>
										<div class="form-group">
											<div class="input-group">
												<span class="input-group-addon"> <i
													class="glyphicon glyphicon-lock"></i>
												</span> 
												<div class="form-control">
													<html:password name="LoginForm" property="password" style="color:black;" />
												</div>
											</div>
											<div class="errori">
												<html:errors property="password" bundle="errori" />
											</div>
										</div>
										<div class="form-group">
											<input type="submit" class="btn btn-lg btn-primary btn-block"
												value="Login">
										</div>
									</div>
								</div>
							</fieldset>
						</html:form>
					</div>
					<div class="panel-footer ">
						<a href="vaiSignup.do">Non hai un account? Registrati!</a>
						<p>
							<a href="vaiRecupera.do">Hai dimenticato username o password?</a>
						<p>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="container">
		<hr>
		<%@ include file="../jsp/footer.jsp"%>
	</div>
</body>
</html>