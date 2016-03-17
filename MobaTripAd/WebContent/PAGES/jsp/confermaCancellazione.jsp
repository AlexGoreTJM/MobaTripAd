<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Pagine di feedback per l'admin quando cancella un utente. -->

<%@ include file="../jsp/navigation.jsp" %>
<div class="container" style="margin-top:40px">
		<div class="row">
            <div class="col-md-8 col-sm-12">
               <p> Bravo!hai cancellato l'utente ${utente.nickname}</p>
               <a href="inizia.do">Torna alla home</a>
            </div>
       </div>
 </div>