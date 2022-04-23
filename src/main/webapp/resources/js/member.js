$(document).ready(function(){
    $('.pass_show').append('<span class="ptxt">Show</span>');

	$('.pwd').keyup(function() {
		var new_pwd = $('#new_pwd').val();
		var confirm_pwd = $('#confirm_pwd').val();
		console.log(new_pwd);
		console.log(confirm_pwd);
		
		 if (new_pwd == '' && confirm_pwd == '') {
         	null;
         } else if (new_pwd != "" || confirm_pwd != "") {
         	if (new_pwd == confirm_pwd) {
                $("#alert-success").css('display', 'inline-block');
                $("#alert-danger").css('display', 'none');
            } else {
                $("#alert-success").css('display', 'none');
                $("#alert-danger").css('display', 'inline-block');
            }
        }
	});

});
      
    
$(document).on('click','.pass_show .ptxt', function(){ 
    
	$(this).text($(this).text() == "Show" ? "Hide" : "Show"); 
    
	$(this).prev().attr('type', function(index, attr){return attr == 'password' ? 'text' : 'password'; }); 
    
});  

$(function(){
    
	$(".input-group-btn .dropdown-menu li a").click(function(){
    
    	var selText = $(this).html();
        
    	//working version - for single button //
    	//$('.btn:first-child').html(selText+'<span class="caret"></span>');  
           
    	//working version - for multiple buttons //
    	$(this).parents('.input-group-btn').find('.btn-search').html(selText);
    
	});

});

function changePwd() {
	var new_pwd = $('#new_pwd').val();
	var confirm_pwd = $('#confirm_pwd').val();
	
	if (new_pwd == '' && confirm_pwd == '') {
		alert('비밀번호를 입력해주세요.');	
	} else if (new_pwd != "" || confirm_pwd != "") {
		if (new_pwd == confirm_pwd) {
			$.ajax({
				url : '/general/myinfo',
				type : 'POST',
				data : {userPwd : new_pwd},
				success: function(result) {
					location.href = '/general/myinfo';
						
				}, error: function(xhr, status, error) {
					alert('오류가 발생했습니다.');
				}
			});
		} else {
			alert("비밀번호가 일치하지 않습니다.");
		}
	}	
}