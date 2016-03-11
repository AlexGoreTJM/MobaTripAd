<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
	pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="${pathGioco}${listaGiocoRecente[0].img1}" alt="${listaGiocoRecente[0].titolo}">
		<div class="caption">
			<h4 class="pull-right">Voto: ${listaGiocoRecente[0].valutazioneSito}</h4>
			<h4>
				<a href="#">${listaGiocoRecente[0].titolo}</a>
			</h4>
			<p>
				${listaGiocoRecente[0].info}
			</p>
		</div>
		<div class="ratings">
			<p class="pull-right">${listaGiocoRecente[0].recensioni.size()} recensioni</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span>
			</p>
		</div>
	</div>
</div>

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="http://placehold.it/320x150" alt="">
		<div class="caption">
			<h4 class="pull-right">$64.99</h4>
			<h4>
				<a href="#">Second Product</a>
			</h4>
			<p>This is a short description. Lorem ipsum dolor sit amet,
				consectetur adipiscing elit.</p>
		</div>
		<div class="ratings">
			<p class="pull-right">12 reviews</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star-empty"></span>
			</p>
		</div>
	</div>
</div>

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="http://placehold.it/320x150" alt="">
		<div class="caption">
			<h4 class="pull-right">$74.99</h4>
			<h4>
				<a href="#">Third Product</a>
			</h4>
			<p>This is a short description. Lorem ipsum dolor sit amet,
				consectetur adipiscing elit.</p>
		</div>
		<div class="ratings">
			<p class="pull-right">31 reviews</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star-empty"></span>
			</p>
		</div>
	</div>
</div>

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="http://placehold.it/320x150" alt="">
		<div class="caption">
			<h4 class="pull-right">$84.99</h4>
			<h4>
				<a href="#">Fourth Product</a>
			</h4>
			<p>This is a short description. Lorem ipsum dolor sit amet,
				consectetur adipiscing elit.</p>
		</div>
		<div class="ratings">
			<p class="pull-right">6 reviews</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star-empty"></span> <span
					class="glyphicon glyphicon-star-empty"></span>
			</p>
		</div>
	</div>
</div>

<div class="col-sm-4 col-lg-4 col-md-4">
	<div class="thumbnail">
		<img src="http://placehold.it/320x150" alt="">
		<div class="caption">
			<h4 class="pull-right">$94.99</h4>
			<h4>
				<a href="#">Fifth Product</a>
			</h4>
			<p>This is a short description. Lorem ipsum dolor sit amet,
				consectetur adipiscing elit.</p>
		</div>
		<div class="ratings">
			<p class="pull-right">18 reviews</p>
			<p>
				<span class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star"></span> <span
					class="glyphicon glyphicon-star-empty"></span>
			</p>
		</div>
	</div>
</div>

