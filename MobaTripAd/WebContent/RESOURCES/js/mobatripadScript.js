$(document).ready(function() {
	$('#logout').on('click', function(e) {
		e.preventDefault();
		var msg = $(this).attr("data-nickname");
		$.notify("ciao " + msg + " alla prossima");
		setTimeout(prova, 1500);
	});


	$('#inviaPDF').on('click', function(e) {
		e.preventDefault();
		var myVar = $(this).attr("data-pdf");
		var myVar2 = $(this).attr("data-idgioco");
		$.notify("Pdf inviato a " + myVar);

		setTimeout(prova1(myVar2), 1500);
	});
	
	
	
	
	
	$(".like1").click(
			function() {
				var input = $(this).find('.qty1');
				input.val(parseInt(input.val()) + 1);

				var idutente = $(this).attr("data-idutente");
				var idgioco = $(this).attr("data-idgioco");
				window.location.href = "incrementaLike.do?idu=" + idutente
						+ "&idg=" + idgioco;
			});
	
	$(".dislike1").click(
			function() {
				var input = $(this).find('.qty2');
				input.val(input.val() + 1);

				var idutente = $(this).attr("data-idutente");
				var idgioco = $(this).attr("data-idgioco");
				window.location.href = "incrementaDislike.do?idu="
						+ idutente + "&idg=" + idgioco;

			});
	
	$(".like0").click(
			function() {
				var input = $(this).find('.qty1');
				input.val(parseInt(input.val()) - 1);

				var idutente = $(this).attr("data-idutente");
				var idgioco = $(this).attr("data-idgioco");
				window.location.href = "decrementaLike.do?idu=" + idutente
						+ "&idg=" + idgioco;
			});

	$(".dislike0").click(
			function() {
				var input = $(this).find('.qty2');
				input.val(input.val() - 1);

				var idutente = $(this).attr("data-idutente");
				var idgioco = $(this).attr("data-idgioco");
				window.location.href = "decrementaDislike.do?idu="
						+ idutente + "&idg=" + idgioco;

			});

	$('#nav').affix({
		offset : {
			top : $('header').height() - $('#nav').height()
		}
	});

	/* highlight the top nav as scrolling occurs */
	$('body').scrollspy({
		target : '#nav'
	})

	/* smooth scrolling for scroll to top */
	$('.scroll-top').click(function() {
		$('body,html').animate({
			scrollTop : 0
		}, 500);
	})

	/* smooth scrolling for nav sections */
	$('#nav .navbar-nav li>a').click(function() {
		var link = $(this).attr('href');
		var posi = $(link).offset().top + 20;
		$('body,html').animate({
			scrollTop : posi
		}, 700);
	})
	
	
	

});

function prova() {
	window.location.href = "logout.do";
}

function prova1(myVar2) {
	window.location.href = "sendPDF.do?idGioco=" + myVar2;
}

function cutString() {
	var titoli = document.getElementsByClassName("tit");
	var i, j;
	var charsToCutTo = 12;
	for (i = 0; i < titoli.length; i++) {
		if (titoli[i].innerHTML.length > charsToCutTo) {
			var strShort = "";
			for (j = 0; j < charsToCutTo; j++) {
				strShort += titoli[i].innerHTML[j];
			}
			document.getElementsByClassName("tit")[i].title = titoli[i].innerHTML;
			document.getElementsByClassName("tit")[i].innerHTML = strShort
					+ "...";
		}
	}

	var info = document.getElementsByClassName("inf");
	var x, y;
	var charsToCutTo2 = 90;
	for (x = 0; x < info.length; x++) {
		if (info[x].innerHTML.length > charsToCutTo2) {
			var strShort = "";
			for (y = 0; y < charsToCutTo2; y++) {
				strShort += info[x].innerHTML[y];
			}
			document.getElementsByClassName("inf")[x].title = "text";
			document.getElementsByClassName("inf")[x].innerHTML = strShort
					+ "...";
		}
	}
}

function cutData() {
	var date = document.getElementsByClassName("date");
	var i, j;
	var charsToCutTo = 10;
	for (i = 0; i < date.length; i++) {
		if (date[i].innerHTML.length > charsToCutTo) {
			var strShort = "";
			for (j = 0; j < charsToCutTo; j++) {
				strShort += date[i].innerHTML[j];
			}
			document.getElementsByClassName("date")[i].innerHTML = strShort;
		}
	}
}




