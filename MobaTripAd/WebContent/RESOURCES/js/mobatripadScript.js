



$('#logout').on('click', function(e){
		e.preventDefault();
//		url= $(this).attr("logout.do");
//		var msg = $('#mv').val();
		
//		alert(msg);
		
		
//		window.setTimeout(1000);
//		window.location.href= "logout.do";
		
		
		
		function prova(){
			window.location.href= "logout.do";
		}
		var msg = $(this).attr("data-nickname");
		$.notify("ciao "+msg+ " alla prossima");
		setTimeout(prova, 1500);
		
	});

function doAjaxPost() {

$('#backup').click(function(){
	var msg = $(this).attr("data-FedBackup");
    $("#contenuto").load(msg);
   
    return false;

});
}

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
