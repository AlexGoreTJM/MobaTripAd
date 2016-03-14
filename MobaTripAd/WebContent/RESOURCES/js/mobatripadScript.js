



$('#logout').on('click', function(e){
		e.preventDefault();
//		url= $(this).attr("logout.do");
//		var msg = $('#mv').val();
		var msg = $(this).attr("data-sesFeedback");
//		alert(msg);
		$.notify(msg);
		
//		window.setTimeout(1000);
//		window.location.href= "logout.do";
		
		
		
		function prova(){
			window.location.href= "logout.do";
		}
		
		setTimeout(prova, 1500);
		
	});



//
//function doAjaxPost() {
//
//	// get the form values
//
//	var name = $('#loginn').val();
//
//	$.ajax({
//
//		type : "POST",
//
//		url : "/MobaTripAd/vaiLogin.do",
//
//		data : name,
//
//		success : function(response) {
//
//			// we have the response
//
//			$('#contenuto').html(response);
//
//		},
//
//		error : function(e) {
//
//			alert('Error: ' + e);
//
//		}
//
//	});
//
//}
