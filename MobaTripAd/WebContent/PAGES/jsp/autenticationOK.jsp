<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ include file="../jsp/navigation.jsp" %>

<div class="container" style="margin-top:40px">
		<div class="row">
		
<div class="col-sm-6 col-md-4 col-md-offset-4">

Complimenti sei stato registrato! 
<% request.getSession().setAttribute("utente", null); %>

<a href="vaiLogin.do">Vai alla pagina di login</a> 
</div>
</div></div>


</body>
</html>