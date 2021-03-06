<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<!-- Creazione di un carosello per la visualizzazione di immagini. -->

<div class="row carousel-holder">

					<div class="col-md-12 col-sm-12">
						<div id="carousel-example-generic" class="carousel slide"
							data-ride="carousel">
							<ol class="carousel-indicators">
								<li data-target="#carousel-example-generic" data-slide-to="0"
									class="active"></li>
								<li data-target="#carousel-example-generic" data-slide-to="1"></li>
								<li data-target="#carousel-example-generic" data-slide-to="2"></li>
							</ol>
							<div class="carousel-inner">
								<div class="item active">
									<a href="schedaGioco.do?idGioco=${listaGiocoPopolari[0].idGioco}">
										<img class="slide-image" src="${pathGioco}${listaGiocoPopolari[0].img1}" title="${listaGiocoPopolari[0].titolo}">
									</a>
								</div>
								<div class="item">
									<a href="schedaGioco.do?idGioco=${listaGiocoPopolari[1].idGioco}">
										<img class="slide-image" src="${pathGioco}${listaGiocoPopolari[1].img1}" title="${listaGiocoPopolari[1].titolo}">
									</a>
								</div>
								<div class="item">
									<a href="schedaGioco.do?idGioco=${listaGiocoPopolari[2].idGioco}">
										<img class="slide-image" src="${pathGioco}${listaGiocoPopolari[2].img1}" title="${listaGiocoPopolari[2].titolo}">
									</a>
								</div>
							</div>
							<a class="left carousel-control" href="#carousel-example-generic"
								data-slide="prev"> <span
								class="glyphicon glyphicon-chevron-left"></span>
							</a> <a class="right carousel-control"
								href="#carousel-example-generic" data-slide="next"> <span
								class="glyphicon glyphicon-chevron-right"></span>
							</a>
						</div>
					</div>

				</div>