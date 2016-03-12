<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
    <%@ include file="/PAGES/jsp/customTag.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
 <!-- l'header contiene la testata del sito  -->
 <nav class="navbar navbar-default">
  <div class="container-fluid">
    <!-- Brand and toggle get grouped for better mobile display -->
    <div class="navbar-header">
      <button type="button" class="navbar-toggle collapsed" data-toggle="collapse" data-target="#bs-example-navbar-collapse-1" aria-expanded="false">
        <span class="sr-only">Toggle navigation</span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
        <span class="icon-bar"></span>
      </button>
      <a class="navbar-brand" href="/MobaTripAd/inizia.do">MobaTripAd</a>
    </div>

    <!-- Collect the nav links, forms, and other content for toggling -->
    <div class="collapse navbar-collapse" id="bs-example-navbar-collapse-1">
      <ul class="nav navbar-nav">
        <li><a href="#">About <span class="sr-only">(current)</span></a></li>
        <li><a href="#">Contact</a></li>
        
        
        
      </ul>
      
      <ul class="nav navbar-nav navbar-right">
      <c:choose>
					<c:when test="${sessionScope.utente == null}">
					
        <li><a class="navbar-link" href="vaiSignup.do">Sign Up</a></li>
        <li><a class="navbar-link" href="vaiLogin.do">Login</a></li>
        
        </c:when>
					<c:otherwise>
					<li><a href="vaiProfilo.do" class="navbar-link">Ciao  ${sessionScope.utente.nickname}</a></li> 				
						<li><a href="logout.do" class="navbar-link">Logout<span class="glyphicon glyphicon-log-out"></span></a>
        </li>
        
        </c:otherwise>
				</c:choose>
			<form class="navbar-form navbar-left" role="search">
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
      </ul>
    </div><!-- /.navbar-collapse -->
  </div><!-- /.container-fluid -->
</nav>

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
	
	
	
	
	
	
	
      
      