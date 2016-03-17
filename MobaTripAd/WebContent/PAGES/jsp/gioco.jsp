<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Scheda Gioco--</title>

<script src="https://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script type="text/javascript">

$(function () {
    $(".like1").click(function () {
        var input = $(this).find('.qty1');
        input.val(parseInt(input.val()) + 1);
		
        var idutente = $(this).attr("data-idutente");
        var idgioco = $(this).attr("data-idgioco");
        window.location.href= "incrementaLike.do?idu=" + idutente + "&idg=" + idgioco;
    });
    
	$(".dislike1").click(function () {
    var input = $(this).find('.qty2');
    input.val(input.val() + 1);
    
    var idutente = $(this).attr("data-idutente");
    var idgioco = $(this).attr("data-idgioco");
    window.location.href= "incrementaDislike.do?idu=" + idutente + "&idg=" + idgioco;
    
	});
	
	$(".like0").click(function () {
        var input = $(this).find('.qty1');
        input.val(parseInt(input.val()) - 1);
		
        var idutente = $(this).attr("data-idutente");
        var idgioco = $(this).attr("data-idgioco");
        window.location.href= "decrementaLike.do?idu=" + idutente + "&idg=" + idgioco;
    });
    
	$(".dislike0").click(function () {
    var input = $(this).find('.qty2');
    input.val(input.val() - 1);
    
    var idutente = $(this).attr("data-idutente");
    var idgioco = $(this).attr("data-idgioco");
    window.location.href= "decrementaDislike.do?idu=" + idutente + "&idg=" + idgioco;
    
    
	});
});
</script> 

</head>
<body>
	<%@ include file="../jsp/navigation.jsp"%>




	<div class="container">

		<div class="row">
			<%@ include file="../jsp/menu.jsp"%>

			<!-- Blog Post Content Column -->
			<div class="col-md-9 col-sm-12">

				<!-- Blog Post -->
				<!-- Title -->
				<h1><b>${gioco.titolo}</b></h1>
								<h1 class="pull-right">Valutazione: <a style="color: gold">${gioco.valutazioneSito/2}/5</a></h1>
				<br>
								<hr>
								
<p class="lead"><table class="lead" style="width: 100%;">
<tr> 
<td>Giocatori: ${gioco.players}
</td>
<td>Costo lancio: ${gioco.costoLancio} &euro;
</td>
</tr>
</table></p>									
							
								<hr>
				
				<p class="lead"><table class="lead" style="width: 100%;">
<tr> 
<td><a href="${gioco.urlSh}">Software House: ${gioco.sh}</a></td>
<td>Uscita: ${gioco.dataUscita}</td> 
<td>Multiplayer: ${gioco.web()}</td>
</tr>
</table></p>


				<hr>
<p class="lead"><table class="lead" style="width: 100%;">
<tr> 
<td><span class="glyphicon glyphicon-time"></span> Gioco inserito il: ${gioco.dataReg}</td>
<td>PEGI: ${gioco.etaMin}</td>
</tr>
</table>
</p>

<hr>

<p class="lead"><table class="lead" style="width: 100%;">
<tr> 
<td>Piattaforme: <c:forEach items="${gioco.piattaforme}" var="piattaforma">
${piattaforma.nome}
</c:forEach>
</td>
</tr>
</table></p>	
				<hr>
				<div class="lead" align="center">
<!-- ---------------------------------------------------------------------------------------- -->

Valutazione utenti:
					<c:choose>
						<c:when test="${gioco.valutazione != 0}">
							<c:if test="${gioco.valutazione != 10}">
							<c:set var="count" value="1" scope="page" />
							<c:forEach begin="${count}" end="${gioco.valutazione / 2}"
								varStatus="loop">
								<c:set var="count" value="${count + 1}" scope="page" />
								<span class="glyphicon glyphicon-star" style="color: gold;"></span>
							</c:forEach>

							<c:forEach begin="${count}" end="5" varStatus="loop">
								<c:set var="count" value="${count + 1}" scope="page" />
								<span class="glyphicon glyphicon-star-empty" style="color: gold;"></span>
							</c:forEach>
						</c:if>
						<c:if test="${gioco.valutazione == 10}">
						<span class="glyphicon glyphicon-star" style="color: gold;"></span>
						<span class="glyphicon glyphicon-star" style="color: gold;"></span>
						<span class="glyphicon glyphicon-star" style="color: gold;"></span>
						<span class="glyphicon glyphicon-star" style="color: gold;"></span>
						<span class="glyphicon glyphicon-star" style="color: gold;"></span>
						</c:if>
						</c:when>
						<c:otherwise>
							<span>N/P</span>
						</c:otherwise>
					</c:choose>

<!-- ---------------------------------------------------------------------------------------- -->

</div>

<hr>

<p class="lead"><table class="lead" style="width: 100%;">
<tr> 
<td><font color="green">PRO:</font>${gioco.pro}</td>
<td><font color="red">CONTRO:</font>${gioco.contro}</td>
</tr>
</table>
</p>



				<hr>

				<!-- Preview Image -->
				<img class="img-responsive" src="${pathGioco}${gioco.img1}" alt="">

				<hr>

				<!-- Post Content -->
				<p class="lead">${gioco.info}</p>

				<hr>

				<!-- Preview Image -->
				<img class="img-responsive" src="${pathGioco}${gioco.img2}" alt="">

				<hr>

				<iframe width=100% height="480" src="${gioco.urlVideo}" frameborder="0" allowfullscreen></iframe>









				<!-- Comments Form -->
				<c:if test="${sessionScope.utente != null && recensioneInserita == null }">
				<hr>
					<div class="well" style="background: url('../img/background.jpg');">
						<h4>Leave a Comment:</h4>
						<form role="form" action="recensione.do" method="post">
							<fieldset>
								<span class="star-cb-group"> <input type="radio"
									id="rating-5" name="voto" value="10" /><label for="rating-5">5</label>
									<input type="radio" id="rating-4" name="voto" value="8"
									checked="checked" /><label for="rating-4">4</label> <input
									type="radio" id="rating-3" name="voto" value="6" /><label
									for="rating-3">3</label> <input type="radio" id="rating-2"
									name="voto" value="4" /><label for="rating-2">2</label> <input
									type="radio" id="rating-1" name="voto" value="2" /><label
									for="rating-1">1</label> <input type="radio" id="rating-0"
									name="voto" value="0" class="star-cb-clear" /><label
									for="rating-0">0</label>
								</span>
							</fieldset>
							<div class="form-group">
								<input type="hidden" name="idGioco" value="${gioco.idGioco}">
								<textarea class="form-control" rows="3" name="recensione"></textarea>
								<html:errors property="recensione" bundle="errori" />
							</div>
							<button type="submit" class="btn btn-primary">Submit</button>
						</form>
					</div>
				</c:if>




             <c:if test="${sessionScope.utente != null}">
				<form role="form" action="sendPDF.do" method="post">
					<div class="form-group">
						<input type="hidden" name="idGioco" value="${gioco.idGioco}">
					</div> 
					Download scheda gioco: <button type="submit" class="btn btn-primary" id="inviaPDF" data-idgioco="${gioco.idGioco}" data-pdf="${sessionScope.utente.email}">Invia PDF</button>
				</form>
            </c:if>



			


			<hr>

			<!-- Posted Comments -->
			<c:forEach items="${gioco.recensioni}" var="recensioni">
				<!-- Comment -->
				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object" src=""
						alt="">
					</a>
					<div class="media-body">${recensioni.utente.nickname}
						${recensioni.dataRec}
						
						
						</div>
					<br>
				</div>

				<!-- Comment -->

				<div class="media">
					<a class="pull-left" href="#"> <img class="media-object" src=""
						alt="">
					</a>
					<div class="media-body">



						<!-- Nested Comment -->
						${recensioni.info}
						
						<br>
						
							<div class="container"> 
   							<c:if test="${ sessionScope.utente != null}">
								<c:choose>
									<c:when test="${like == null || like == 0}">
   										<a class="like1" data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}"> <i class="fa fa-thumbs-o-up"></i>  
       										Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${recensioni.ctrLike}" />
       										<%
       							 				if(request.getSession().getAttribute("like") != null)
       							 					if(((String)request.getSession().getAttribute("like")).equals("0"))
       							 						request.getSession().setAttribute("like", "1");
       							 					else
       							 						request.getSession().setAttribute("like", "0");
       							 				else
       							 					request.getSession().setAttribute("like", "1");
       										%>
    									</a>
    									<a class="dislike1" data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}"><i class="fa fa-thumbs-o-down"></i> 
        									Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${recensioni.ctrDislike}"
        									data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}" />
        									<%
       							 				if(request.getSession().getAttribute("dislike") != null)
       							 					if(((String)request.getSession().getAttribute("dislike")).equals("0"))
       							 						request.getSession().setAttribute("dislike", "1");
       							 					else
       							 						request.getSession().setAttribute("dislike", "0");
       							 				else
       							 					request.getSession().setAttribute("dislike", "1");
       										%>
   										 </a>
   								 	</c:when>
   								 	<c:otherwise>
   								 		<a class="like0" data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}"> <i class="fa fa-thumbs-o-up"></i>  
       										Like <input class="qty1" name="qty1" readonly="readonly" type="text" value="${recensioni.ctrLike}" />
       										<%
       							 				if(request.getSession().getAttribute("like") != null)
       							 					if(((String)request.getSession().getAttribute("like")).equals("1"))
       							 						request.getSession().setAttribute("like", "0");
       							 					else
       							 						request.getSession().setAttribute("like", "1");
       							 				else
       							 					request.getSession().setAttribute("like", "1");
       										%>
    									</a>
    									<a class="dislike0" data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}"><i class="fa fa-thumbs-o-down"></i> 
        									Dislike <input class="qty2"  name="qty2" readonly="readonly" type="text" value="${recensioni.ctrDislike}"
        									data-idutente="${recensioni.utente.idUtente}" data-idgioco="${gioco.idGioco}" />
        									<%
       							 				if(request.getSession().getAttribute("dislike") != null)
       							 					if(((String)request.getSession().getAttribute("dislike")).equals("1"))
       							 						request.getSession().setAttribute("dislike", "0");
       							 					else
       							 						request.getSession().setAttribute("dislike", "1");
       							 				else
       							 					request.getSession().setAttribute("dislike", "1");
       										%>
   										 </a>
   								 	</c:otherwise>
   								</c:choose>
   							</c:if>
   							
   								<form action="segnala.do">
   									<input type="submit" value="Segnala">
   									<input type="hidden" name="idGioco" value="${recensioni.idGioco}">
									<input type="hidden" name="idUtente" value="${recensioni.utente.idUtente}">
   								</form>
							</div>
	

						<!-- End Nested Comment -->
					</div>
					<c:if test="${utente.admin}">
						<form action="/MobaTripAd/eliminaRecensione.do">
							<input type="text" value="${recensioni.segnalata}" disabled="disabled">
							<input type="hidden" name="idGioco" value="${recensioni.idGioco}">
							<input type="hidden" name="idUtente" value="${recensioni.utente.idUtente}">
							<button type="submit" class="btn btn-primary pull-right">ELIMINA</button>
						</form>
					</c:if>
						<c:if test="${recensioni.utente.idUtente == utente.idUtente}">
						<form action="/MobaTripAd/eliminaRecensione.do">
							<input type="hidden" name="idGioco" value="${recensioni.idGioco}">
							<input type="hidden" name="idUtente" value="${recensioni.utente.idUtente}">
							<button type="submit" class="btn btn-primary pull-right">ELIMINA</button>
						</form>
					</c:if>
					<hr>
				</div>
			</c:forEach>
		</div>
	</div>

	<div class="container">

		<hr>
		<%@ include file="../jsp/footer.jsp"%>


	</div>
</body>
</html>


