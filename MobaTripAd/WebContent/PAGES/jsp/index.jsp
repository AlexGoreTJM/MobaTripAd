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
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/bootstrap.min.css"/>
  
<!--<link type="text/css" rel="stylesheet"
	href="<c:url value="/css/bootstrap.min.css" />" /> -->
<!-- Custom CSS -->
<link rel="stylesheet" media="all" type="text/css" href="RESOURCES/css/shop-homepage.css"/>


<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<%@ include file="../jsp/navigation.jsp" %>
	
	
		

	<!-- Page Content -->
	<div class="container">

		<div class="row">

			<%@ include file="../jsp/menu.jsp" %>

			<div class="col-md-9">

				<%@ include file="../jsp/carousel.jsp" %>

				<div class="row">

					<%@ include file="../jsp/corpo.jsp" %>

				</div>

			</div>

		</div>

	</div>
	<!-- /.container -->

	<div class="container">

		<hr>
<%@ include file="../jsp/footer.jsp" %>
		

	</div>
	<!-- /.container -->

	<!-- jQuery -->
	<script src="RESOURCES/js/jquery.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="RESOURCES/js/bootstrap.min.js"></script>

</body>

</html>
