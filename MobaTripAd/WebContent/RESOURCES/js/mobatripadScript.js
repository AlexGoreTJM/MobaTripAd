$('#loginn').click(function(){
    $("#contenuto").load("/MobaTripAd/vaiLogin.do");
    return false;
});

$('#signin').click(function(){
    $("#contenuto").load("/MobaTripAd/vaiSignin.do");
    return false;
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
