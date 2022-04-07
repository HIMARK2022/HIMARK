/**
 * 
 */

$('.content-detail').on('click', function () {
	    $('.modal-wrapper').toggleClass('open');
	    
	    return false;
	});
	$('.content-detail2').on('click', function () {
	    $('.modal-wrapper2').toggleClass('open');
	    
	    return false;
	});
	$('.head').on('click', function() {	
		if($('.about-detail').css("display")=="none"){
			$('.about-detail').show();
			
        }else{
        	$('.about-detail').hide();
        }
	});
	$('.create-content-detail').on('click', function () {
	    $('.modal-wrapper2').removeClass('open');
	    $('#createForm')[0].reset();
	    return false;
	});
	$('.mod-content-detail').on('click', function() {
		$('.modal-wrapper').removeClass('open');		
		
	});

	$(".team").click(function(e){
	 	var teamN = $(this).text();
	    var team = $(this).attr("id");
	    
	    showTeamMember(team)
	    
	    $('input[name=departIn ]').attr('value', teamN);
	    $('input[name=AdddeptId ]').attr('value', team);
	});
	
	$(".dept").click(function(e){
    	var deptN = $(this).text();
	    var dept = $(this).attr("id");
		
	    showDepartMember(dept);
		
		$('input[name=departIn ]').attr('value', deptN);
		$('input[name=AdddeptId ]').attr('value', dept);
	});
	
	$(".head").click(function(e) {
		var headN = $(this).text();
	    var head = $(this).attr("id");
		
	    showHeadMember(head);
		
		$('input[name=departIn ]').attr('value', headN);
		$('input[name=AdddeptId ]').attr('value', head);
	});
	
	function showTeamMember(team) {
		$('#tbody tr').remove();
		$('#teaminfo span').remove();
		
		AddModifyService.getTeamList(team, function(data) {
			teaminfo = "<span>" + data[0].team + "</span>";
			showInfo(data);
			$('#teaminfo').append(teaminfo);
		});
	}
	
	function showDepartMember(depart) {
		 $('#tbody tr').remove();
		$('#teaminfo span').remove();
		AddModifyService.getDepartList(depart, function(data) {
			teaminfo = "<span>" + data[0].depart + "</span>";
			showInfo(data);
			$('#teaminfo').append(teaminfo);
		});
	}
	
	function showHeadMember(head) {
		 $('#tbody tr').remove();
		 $('#teaminfo span').remove();
		AddModifyService.getHeadList(head, function(data) {
			teaminfo = "<span>" + data[0].head + "</span>";
			showInfo(data);
			$('#teaminfo').append(teaminfo);
		});
	}
	function showInfo(data) {
		str = "";
		for (var i = 0; i < data.length; i++) {
			if(data[i].head == null){
				data[i].head ="";
			}
			if(data[i].depart == null){
				data[i].depart="";
			}
			if(data[i].team == null){
				data[i].team="";
			}
			
			var modInfo = "modInfo(\'"+ data[i].head       +'/'+data[i].depart+'/'+data[i].team + "\'"
								+",\'"+ data[i].user_name  + "\',\'" + data[i].pos_name         + "\'"
								+",\'"+ data[i].birth_date + "\',\'" + data[i].sex              + "\'"
								+",\'"+ data[i].email      + "\',\'" + data[i].phone_number     + "\'"
								+",\'"+ data[i].user_id    + "\',\'" + data[i].dept_id          + "\',\'"+ data[i].flag + "\')";
			
			str += "<tr><td><div class='page-wrapper'><a class='content-detail' onclick="+modInfo+"><span class='clickId'>"
					+ data[i].user_id
					+ "</span></a></div></td>"
					+ "<td>"
					+ data[i].user_name
					+ "</td>"
					+ "<td>"
					+ data[i].duty_name
					+ "</td>" + "<td>" + data[i].pos_name + "</td></tr>"
		}
		$('#tbody').append(str);
		$('.content-detail').on('click', function() { //모달 클릭시 오픈
			$('.modal-wrapper').toggleClass('open');
			
			return false;
		});
		$('.mod-content-detail').on('click', function() {
			$('.modal-wrapper').removeClass('open');
		}); 
	}
	
	$('#addMember').on('click',function(){
		var year = $('input[name=AddBirth]').val();
		var user_id = $('input[name=AdddeptId]').val();
		
		var userInfo ={
			user_name : $('input[name=AdduserName]').val(),
			pos_id : $('select[name=pos]').val(),
			duty_id : "d01",
			dept_id :  $('input[name=AdddeptId]').val(),
			authority_code :"A1",
			birth_date : $('input[name=AddBirth]').val(),
			sex : $('input[name=Addsex]').val(),
			phone_number : $('input[name=AddPhone ]').val(),
			email : $('input[name=AddEmail]').val(),
			current_state : "재직",
			flag : "웹"
		}
		
		AddModifyService.addUser(userInfo,function(result){
			$('.modal-wrapper2').removeClass('open');
			$('.page-wrapper2').toggleClass('blur-it');
			$(".modal").find("input").val("");
			
			if(userInfo.dept_id.length == 3){
				showTeamMember(userInfo.dept_id);
			}else if(userInfo.dept_id.length == 2){
				alert('직원이 추가되었습니다.');
				showDepartMember(userInfo.dept_id)
			}else if(userInfo.dept_id.length == 1){
				alert('직원이 추가되었습니다.');
				showHeadMember(userInfo.dept_id)
			}
		});
	});
	
	function modInfo(head, user_name , pos , birth , sex , email , phone , user_id ,dept_id , flag) {
			
		$('#modForm')[0].reset();
		
		$('input[name=ModBelong]').attr('value', head);
		$('input[name=ModPos]').attr('value', pos);
			
		if(birth == "null"){birth="";}
		if(sex == "null"){sex="";}
		if(email == "null"){email="";}
		if(phone == "null"){phone="";}
		
		console.log("너는 뭐가 나오니 ? "+flag)
			
			if(flag =="인사연동"){				
				//$('input[name=ModhowIn]:input[id="howIn1"]').attr("checked","checked");
				$('#howIn1').prop("checked",true);
			}
			if(flag =="웹"){
				//$('input[name=ModhowIn]:input[id="howIn2"]').attr("checked","checked");
				$('#howIn2').prop("checked",true);
			}
			
			$('input[name=ModUserName]').attr('value', user_name);
			$('input[name=ModBirth]').attr('value', birth);
			
			$('input[name=ModSex]').attr('value', sex);
			
			$('input[name=ModEmail]').attr('value', email);
			$('input[name=ModPhone]').attr('value', phone);
			
			$('input[name=Muser_id]').attr('value', user_id);
			$('input[name=Mdept_id]').attr('value', dept_id);
		
	} 
	$('#modMember').on("click",function(e){
		
		
		var user_name =$('input[name=ModUserName]').val() ;
		var birth_date = $('input[name=ModBirth]').val() ;
		var sex =$('input[name=ModSex]').val() ;
		var email = $('input[name=ModEmail]').val(); 
		var phone_number = $('input[name=ModPhone]').val();
		var user_id = $('input[name=Muser_id]').val();
		var dept_id = $('input[name=Mdept_id]').val();
		var flag  = $('input[name=ModhowIn]:checked').val();
		
		var modInfo ={
			user_name:user_name,
			birth_date:birth_date,
			sex:sex,
			email:email,
			phone_number:phone_number,
			user_id:user_id,
			dept_id:dept_id,
			flag : flag
		}
		
		AddModifyService.modify(modInfo,function(result){

			if(modInfo.dept_id.length == 3){
				alert('정보가 수정되었습니다.');
				
				showTeamMember(modInfo.dept_id);
			}else if(modInfo.dept_id.length == 2){
				alert('정보가 수정되었습니다.');
				
				showDepartMember(modInfo.dept_id)
			}else if(modInfo.dept_id.length == 1){
				alert('정보가 수정되었습니다.');
				
				showHeadMember(modInfo.dept_id)
			} 
		})
	});