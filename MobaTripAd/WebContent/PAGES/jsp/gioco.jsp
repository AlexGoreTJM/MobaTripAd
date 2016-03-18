<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<%@ include file="/PAGES/jsp/customTag.jsp"%>


<jsp:useBean id="dateValue" class="java.util.Date" />
<jsp:useBean id="dateRec" class="java.util.Date" />
<jsp:setProperty name="dateValue" property="time"
	value="${gioco.dataReg.time}" />

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>MobaTripAd --Scheda Gioco--</title>
</head>
<body onload="cutData();">
	<%@ include file="../jsp/navigation.jsp"%>
	<div class="container">
		<div class="row">
			<%@ include file="../jsp/menu.jsp"%>
			<!-- Blog Post Content Column -->
			<div class="col-md-9 col-sm-12">

				<!-- Blog Post -->
				<!-- Title -->
				<img class="img-responsive" src="${pathGioco}${gioco.img1}" alt="">
				<div class="col-md-8 col-sm-8">
					<h1>
						Valutazione: <a style="color: gold; text-decoration: none;">${gioco.valutazioneSito/2}/5</a>
					</h1>
				</div>

				<br>

				<div class="col-md-6 col-sm-6">
					Data di lancio: ${gioco.dataUscita} <br>
					<br> Costo lancio: ${gioco.costoLancio} &euro; <br>
					<br> <span class="glyphicon glyphicon-time"></span> Gioco
					inserito il:
					<fmt:formatDate value="${dateValue}" pattern="yyyy-MM-dd" />
					<br>
					<br>
				</div>

				<div class="col-md-6 col-sm-6">
					Software House:<a style="color: rgba(0, 255, 48, 0.86); text-decoration:none;"href="${gioco.urlSh}"> ${gioco.sh}</a> <br>
					<br> Giocatori: ${gioco.players}; Multiplayer: ${gioco.web()}
					<br>
					<br> PEGI: ${gioco.etaMin}
					 
				</div>

				<div class="col-md-12 col-sm-12">
				<br>
				
					Piattaforme:<c:if test="${gioco.shop.size() == 0}">
					<c:forEach items="${gioco.piattaforme}" var="piattaforma">
					${piattaforma.nome}
					</c:forEach>
					</c:if>
					<c:if test="${gioco.shop.size() != 0}">
					<c:forEach items="${gioco.shop}" var="shop">
					
				- ${shop.piattaforma}  <a style="color: rgba(0, 255, 48, 0.86); text-decoration:none;" href="${shop.link}">Compra</a>
			
					</c:forEach>
</c:if> 

				</div>
				
				

				<div class="col-md-12 col-sm-12" align="center">
				<br>
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
									<span class="glyphicon glyphicon-star-empty"
										style="color: gold;"></span>
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



				
					<div class="col-md-6 col-sm-6">
					<br>
						<font color="green">PRO:</font>${gioco.pro}
						</div>
					<div class="col-md-6 col-sm-6">	
					<br>
						<font color="red">CONTRO:</font>${gioco.contro}
						
						</div>
					



				
<div class="col-md-12 col-sm-12" align="center" style="text-align: justify;">
<hr>

				<!-- Preview Image -->


				<hr>
				<!-- Post Content -->
				<font>${gioco.info}</font>
				<hr>
</div>
				
<div class="col-md-12 col-sm-12" align="center">
				<!-- Preview Image -->
				<img class="img-responsive" src="${pathGioco}${gioco.img2}" alt="">
				<hr>
</div>
				
<div class="col-md-12 col-sm-12" align="center">
				<iframe width=100% height="480" src="${gioco.urlVideo}"
					frameborder="0" allowfullscreen></iframe>
</div>






<div class="col-md-12 col-sm-12">
<br>
				<!-- Comments Form -->
				
				<c:set var="recensioneInserita" value="0" scope="request"/>
				
				<c:forEach var="rec" items="${gioco.recensioni}">
				
				<c:if test="${rec.utente.idUtente == utente.idUtente}">
								<c:set var="recensioneInserita" value="1" scope="request"/>
				
				
				</c:if>
				
				
				
				</c:forEach>
				
				
				<c:if
					test="${sessionScope.utente != null && recensioneInserita == 0 && utente.dataReg != null }">
					<hr>
					<div class="well" style="background: url('../img/background.jpg');">
						<h4>Scrivi una recensione:</h4>
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
							<button type="submit" class="btn btn-primary">Conferma</button>
						</form>
					</div>
				</c:if>




				<c:if test="${sessionScope.utente != null}">
					<form role="form" action="sendPDF.do" method="post">
						<div class="form-group">
							<input type="hidden" name="idGioco" value="${gioco.idGioco}">
						</div>
						Download scheda gioco:
						<button type="submit" class="btn btn-primary" id="inviaPDF"
							data-idgioco="${gioco.idGioco}"
							data-pdf="${sessionScope.utente.email}">Invia PDF</button>
					</form>
				</c:if>






				

				<!-- Posted Comments -->
				<c:forEach items="${gioco.recensioni}" var="recensioni">

						<jsp:setProperty name="dateRec" property="time"
							value="${recensioni.dataRec.time}" />
				
					<!-- Comment -->
					<div class="media">
						<a class="pull-left" href="#"> <img class="media-object"
							src="" alt="">
						</a>
						<div class="media-body">
							<img src="${pathUtente}${recensioni.utente.avatar}" alt=""
								height="48" width="48" class="img-circle" /> <b
								style="color: red">${recensioni.utente.nickname}</b> <img
								alt="grado"
								src="${pathGrado}${recensioni.utente.grado.nome}.png"
								height="50" width="50" class="img-circle">
							<br><br><fmt:formatDate value="${recensioni.dataRec}" pattern="yyyy-MM-dd" />


						</div>
						<br>
					</div>

					<!-- Comment -->

				



							<!-- Nested Comment -->
							${recensioni.info} <br>
							
								<c:if test="${ sessionScope.utente != null}">
									<c:choose>
										<c:when test="${like == null || like == 0}">
											<a class="like1"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}"> <i
												class="fa fa-thumbs-o-up"></i> Like <input class="qty1"
												name="qty1" readonly="readonly" type="text"
												value="${recensioni.ctrLike}" /> 
											
											<%
 												if (request.getSession().getAttribute("like") != null)
 													if (((String) request.getSession().getAttribute("like")).equals("0"))
 														request.getSession().setAttribute("like", "1");
 													else
 														request.getSession().setAttribute("like", "0");
 												else
 													request.getSession().setAttribute("like", "1");
									 		%>
									 		
											</a>&nbsp;&nbsp;&nbsp;
    										<a class="dislike1"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}"><i
												class="fa fa-thumbs-o-down"></i> Dislike <input class="qty2"
												name="qty2" readonly="readonly" type="text"
												value="${recensioni.ctrDislike}"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}" /> 
												
											<%
 												if (request.getSession().getAttribute("dislike") != null)
 													if (((String) request.getSession().getAttribute("dislike")).equals("0"))
 														request.getSession().setAttribute("dislike", "1");
 													else
 														request.getSession().setAttribute("dislike", "0");
 												else
 													request.getSession().setAttribute("dislike", "1");
 											%> 
 											
 											</a>&nbsp;&nbsp;&nbsp;
 										
   								 	</c:when>
										<c:otherwise>
											<a class="like0"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}"> <i
												class="fa fa-thumbs-o-up"></i> Like <input class="qty1"
												name="qty1" readonly="readonly" type="text"
												value="${recensioni.ctrLike}" /> 
												
												<%
 													if (request.getSession().getAttribute("like") != null)
 														if (((String) request.getSession().getAttribute("like")).equals("1"))
 															request.getSession().setAttribute("like", "0");
 														else
 															request.getSession().setAttribute("like", "1");
 													else
 														request.getSession().setAttribute("like", "1");
 												%>
 												
											</a>&nbsp;&nbsp;&nbsp;
											
    										<a class="dislike0"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}"><i
												class="fa fa-thumbs-o-down"></i> Dislike <input class="qty2"
												name="qty2" readonly="readonly" type="text"
												value="${recensioni.ctrDislike}"
												data-idutente="${recensioni.utente.idUtente}"
												data-idgioco="${gioco.idGioco}" /> 
												
												<%
 													if (request.getSession().getAttribute("dislike") != null)
 														if (((String) request.getSession().getAttribute("dislike")).equals("1"))
 															request.getSession().setAttribute("dislike", "0");
 														else
 															request.getSession().setAttribute("dislike", "1");
 													else
 														request.getSession().setAttribute("dislike", "1");
 												%> 
 												
 											</a>&nbsp;&nbsp;&nbsp;
   								 	</c:otherwise>
									</c:choose>
								</c:if>
								<p>
									<c:if test="${utente != null}">
										<form action="segnala.do">
											<input type="hidden" name="idGioco"
												value="${recensioni.idGioco}"> <input type="hidden"
												name="idUtente" value="${recensioni.utente.idUtente}">
											<input type="submit" value="Segnala" class="btn btn-primary">

										</form>
									</c:if>
							


							<!-- End Nested Comment -->
						
						<c:if test="${utente.admin}">
							<p>
							<form action="/MobaTripAd/eliminaRecensione.do">
								Segnalazioni: ${recensioni.segnalata} <input type="hidden"
									name="idGioco" value="${recensioni.idGioco}"> <input
									type="hidden" name="idUtente"
									value="${recensioni.utente.idUtente}">
								<button type="submit" class="btn btn-primary pull-right">ELIMINA</button>
							</form>
						</c:if>
						<p>
							<c:if test="${recensioni.utente.idUtente == utente.idUtente}">
								<form action="/MobaTripAd/eliminaRecensione.do">
									<input type="hidden" name="idGioco"
										value="${recensioni.idGioco}"> <input type="hidden"
										name="idUtente" value="${recensioni.utente.idUtente}">
									<button type="submit" class="btn btn-primary pull-right">ELIMINA</button>
								</form>
							</c:if>
						<hr>
					
				</c:forEach>
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


