<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Home Page--</title>

<!-- Bootstrap Core CSS -->
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/bootstrap.min.css" />

<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">

<!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css"
	href="RESOURCES/css/shop-homepage.css" />
<!-- Notify CSS -->
<link href="RESOURCES/css/notify.css" rel="stylesheet">
<link href="RESOURCES/css/star-rating.css" media="all" rel="stylesheet"
	type="text/css" />

</head>

<body onload="cutString();">
	<!-- l'header contiene la testata del sito  -->
	<nav class="navbar navbar-default">
	<div class="container-fluid">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle collapsed"
				data-toggle="collapse" data-target="#bs-example-navbar-collapse-1"
				aria-expanded="false">
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/MobaTripAd/inizia.do">MobaTripAd</a>
		</div>

		<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				<li><a href="vaiAbout.do">About <span class="sr-only">(current)</span></a></li>
				<c:if test="${!utente.admin}">
					<li><a href="vaiContact.do">Contatti</a></li>
				</c:if>
			</ul>

			<ul class="nav navbar-nav navbar-right">
				<c:choose>
					<c:when test="${sessionScope.utente == null}">

						<li><a class="navbar-link" href="vaiSignup.do">Sign Up</a></li>
						<li><a class="navbar-link" href="vaiLogin.do">Login</a></li>

					</c:when>
					<c:otherwise>
						<li><a href="vaiProfilo.do" class="navbar-link">Ciao
								${sessionScope.utente.nickname}</a></li>
						<li><a href="logout.do" class="navbar-link logout"
							id="logout" data-nickname="${sessionScope.utente.nickname}">Logout<span
								class="glyphicon glyphicon-log-out"></span></a></li>

					</c:otherwise>
				</c:choose>
				<form class="navbar-form navbar-left" role="search"
					action="cercaGioco.do">
					<div class="form-group">
						<input type="text" class="form-control"
							placeholder="Cerca gioco..." name="titoloGioco">
					</div>
					<button type="submit" class="btn btn-default">Cerca</button>
				</form>
			</ul>
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container-fluid --> </nav>



	<%-- <!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
	<div class="container">
		<!-- Brand and toggle get grouped for better mobile display -->
		<div class="navbar-header">
			<button type="button" class="navbar-toggle" data-toggle="collapse"
				data-target="#bs-example-navbar-collapse-1">
				<p align="center" style="color: white; font-size: 2px; ">Signin/Signup</p>
				<span class="sr-only">Toggle navigation</span> <span
					class="icon-bar"></span> <span class="icon-bar"></span> <span
					class="icon-bar"></span>
			</button>
			<a class="navbar-brand" href="/MobaTripAd/inizia.do">MobaTripAd</a>
		</div>
	<!-- Collect the nav links, forms, and other content for toggling -->
		<div class="collapse navbar-collapse"
			id="bs-example-navbar-collapse-1">
			<ul class="nav navbar-nav">
				
				<c:choose>
					<c:when test="${sessionScope.utente == null}">
						<li><a class="login" href="vaiLogin.do">Login</a></li>
						<li><a class="signup" href="vaiSignup.do">Sign in</a></li>
					</c:when>
					<c:otherwise>
					
						<li> <div style="position: absolute; width: 200px;"><a href="vaiProfilo.do" class="navbar-link">Ciao  ${sessionScope.utente.nickname}|  </a> 				
						<a href="logout.do" class="navbar-link">Logout
          <span class="glyphicon glyphicon-log-out"></span></a></div>
        </li>
							
					
								
							
						
					</c:otherwise>
				</c:choose>
			</ul>
			
		</div>
		<!-- /.navbar-collapse -->
	</div>
	<!-- /.container --> </nav> <br><br> --%>

	<script src="RESOURCES/js/jquery.js"></script>
	<script src="RESOURCES/js/notify.js"></script>
	<script src="RESOURCES/js/mobatripadScript.js"></script>
	<!-- Bootstrap Core JavaScript -->
	<script src="RESOURCES/js/bootstrap.min.js"></script>
	<script src="RESOURCES/js/star-rating.js" type="text/javascript"></script>
</body>

</html>