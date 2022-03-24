$(document).ready(function(){
    $('.pass_show').append('<span class="ptxt">Show</span>');  
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
   