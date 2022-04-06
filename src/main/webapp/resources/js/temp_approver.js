/**
 * 
 */

$('.head').on('click',function(e){
		if($('.tables').css("display")=="none"){
			$('.tables').show();
		}else{
			$('.tables').hide();
		}	
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

	$('.SelectBtn').on('click',function(){
		
		var OrgUserId = $('input[name=OrgUserId ]').val();
		var TempUserId = $('input[name=TempUserId ]').val();
		var orgDepart = $('input[name=OrgDepartId ]').val();
		var start = $('input[name=start-date1 ]').val();
		var end = $('input[name=end-date1 ]').val();

		TempInfo ={
			approval_start:start,
			approval_finish:end,
			temp_manager:TempUserId,
			manager_id:OrgUserId
		}
		
		if( OrgUserId == "" || TempUserId == "" || start == "" || end == "" ){
			alert("임시 승인자 지정 폼이 완성되지 않았습니다.");
		}else{
			alert("임시 승인자 지정을 완료하였습니다.");
			
			SelectTempApproverService.selectTempApprover(TempInfo,function(result){
				
				if(orgDepart.length == 3){
					$('input[name=OrgApprover ]').attr('value', '');
					$('input[name=OrgUserId ]').attr('value', '');
					$('input[name=OrgDepartId ]').attr('value', '');
					
					$('input[name=TempApprover ]').attr('value', "");
					$('input[name=TempUserId ]').attr('value', "");
					$('input[name=TempDepartId ]').attr('value', "");	

					 $('#start-date1').val('');
					 $('#end-date1').val('');
					showTeamMember(orgDepart);
					
				}else if(orgDepart.length == 2){
					$('input[name=OrgApprover ]').attr('value', '');
					$('input[name=OrgUserId ]').attr('value', '');
					$('input[name=OrgDepartId ]').attr('value', '');
					
					$('input[name=TempApprover ]').attr('value', "");
					$('input[name=TempUserId ]').attr('value', "");
					$('input[name=TempDepartId ]').attr('value', "");
					
					 $('#start-date1').val('');
					 $('#end-date1').val('');
					showDepartMember(orgDepart);
					
				}else if(orgDepart.length == 1){
					$('input[name=OrgApprover ]').attr('value', '');
					$('input[name=OrgUserId ]').attr('value', '');
					$('input[name=OrgDepartId ]').attr('value', '');
					
					$('input[name=TempApprover ]').attr('value', "");
					$('input[name=TempUserId ]').attr('value', "");
					$('input[name=TempDepartId ]').attr('value', "");				
					 $('#start-date1').val('');
					 $('#end-date1').val('');
					showHeadMember(orgDepart)
				} 		
			});
		}	
	});

function showTeamMember(team) {
		$('#tbody tr').remove();
		$('#InfoApprover span').remove();
		$('.teaminfo span').remove();
		$('#approverTable tr').remove();
		$('#temptable tr').remove();
		
		SelectTempApproverService.getTempManagerList(team,function(data){
			showTemp(data);
		});
		
		SelectTempApproverService.getTeamList(team, function(data) {
			teaminfo = "<span>" + data[0].team + "</span>";
			showInfo(data);
			$('.teaminfo').append(teaminfo);
		});
		
	}

	function showDepartMember(depart) {
		$('#tbody tr').remove();
		$('#InfoApprover span').remove();
		$('.teaminfo span').remove();
		$('#approverTable tr').remove();
		$('#temptable tr').remove();
		
		SelectTempApproverService.getTempManagerList(depart,function(data){
			showTemp(data);
		});
		
		SelectTempApproverService.getDepartList(depart, function(data) {
			teaminfo = "<span>" + data[0].depart + "</span>";
			showInfo(data);
			$('.teaminfo').append(teaminfo);
		});
		
	}

	function showHeadMember(head) {
	 	$('#tbody tr').remove();
	 	$('#InfoApprover span').remove();
	 	$('.teaminfo span').remove();
	 	$('#approverTable tr').remove();
	 	$('#temptable tr').remove();
	 	
	 	SelectTempApproverService.getTempManagerList(head,function(data){
			showTemp(data);
		});
	 	
	 	SelectTempApproverService.getHeadList(head, function(data) {
			teaminfo = "<span>" + data[0].head + "</span>";
			
			
			
			showInfo(data);
			$('.teaminfo').append(teaminfo);
		});
	 	
	}
	function showInfo(data) {
		str = "";
		strApprover ="";
		info = "";
			
			for (var i = 0; i < data.length; i++) {
				
				var selectAppover ="selectAppover(\'"+data[i].user_name+"\',\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
				
				var delAppover ="delAppover(\'"+data[i].user_name+"\',\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
				
				var selectTempAppover ="selectTempAppover(\'"+data[i].user_name+"\',\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
				
				var delTempAppover ="delTempAppover(\'"+data[i].user_name+"\',\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
				
				if(data[i].authority_code == "A1"){//지정가능 대상자 입장
					info = "";
					str += "<tr>"
						+ "<td>"+ data[i].user_id  + "</td>"
						+ "<td>"+ data[i].user_name+ "</td>"
						+ "<td>" + data[i].pos_name + "</td>"
						+ "<td><a class='btn btn-outline-danger delBtn'"
						+ "onclick ="+delTempAppover+" >"
						+ "<span class='text'>취소</span>"
						+ "<a class='btn btn-outline-primary selectBtn'"
						+ "onclick ="+selectTempAppover+" >"
						+ "<span class='text'>선택</span>"
						+ "</td>"
						+ "</tr>";
				}
			
				else if (data[i].authority_code != "A1"){ //승인자 입장	
					strApprover += "<tr id='"+data[i].user_id +"'>"
								+ "<td id='userA'>" + data[i].user_id   + "</td>"
								+ "<td>" + data[i].user_name + "</td>"
								+ "<td>" + data[i].pos_name  + "</td>"
								+ "<td><a class='btn btn-outline-danger delBtn'"
								+ "onclick ="+delAppover+" >"
								+ "<span class='text'>취소</span>"
								+ "<a class='btn btn-outline-primary selectBtn'"
								+ "onclick ="+selectAppover+" >"
								+ "<span class='text'>선택</span></td>"
								+ "</tr>";		
				}
		
		}
	$('#InfoApprover').append(info);
	$('#tbody').append(str);
	$('#approverTable').append(strApprover);
	
}
function showTemp(data){
	str = "";
	for (var i = 0; i < data.length; i++) {
		var delTempAppoverList ="delTempAppoverList(\'"+data[i].dept_id+"\',\'"+data[i].temp_manager+"\')";
		
		var start  = new Date(data[i].approval_start );
		var finish = new Date(data[i].approval_finish);

		str += "<tr>"
			+ "<td>" + data[i].manager_id      + "</td>"
			+ "<td>" + data[i].manager_name    + "</td>"
			+ "<td>" + data[i].temp_manager    + "</td>"
			+ "<td>" + data[i].user_name       + "</td>"
			+ "<td>" + start.getFullYear() +"-"+(start.getMonth()+1) +"-"+start.getDate()  + "</td>"
			+ "<td>" + finish.getFullYear()+"-"+(finish.getMonth()+1)+"-"+finish.getDate()  +"</td>"
			+ "<td><a class='btn btn-outline-danger delBtn_temp'"
			+ "onclick ="+delTempAppoverList+" >"
			+ "<span class='text'>삭제</span>"
			+ "</td>"
			+ "</tr>";
	}
	$('#temptable').append(str);
}

function selectAppover(user_name,user_id,dept_id){
	
	alert("권한을 부여할 승인자가 지정되었습니다.");
	$('input[name=OrgApprover ]').attr('value', user_name);
	$('input[name=OrgUserId ]').attr('value', user_id);
	$('input[name=OrgDepartId ]').attr('value', dept_id);
	
}
function selectTempAppover(user_name,user_id,dept_id){
	
	$('input[name=TempDepartId ]').attr('value', dept_id);	
	
	var orgDepart = $('input[name=OrgDepartId ]').val();
	var tempDepart = $('input[name=TempDepartId]').val();
	
	
	if(orgDepart == tempDepart){
		
		alert("권한을 부여받을 임시 승인자가 지정되었습니다.");
		$('input[name=TempApprover ]').attr('value', user_name);
		$('input[name=TempUserId ]').attr('value', user_id);
		
	}else{
		
		alert("승인 권한을 부여할 수 없습니다.");
		$('input[name=OrgApprover ]').attr('value', '');
		$('input[name=OrgUserId ]').attr('value', '');
		$('input[name=OrgDepartId ]').attr('value', '');
		
		$('input[name=TempApprover ]').attr('value', "");
		$('input[name=TempUserId ]').attr('value', "");
		$('input[name=TempDepartId ]').attr('value', "");
		
		 $('#start-date1').val('');
		 $('#end-date1').val('');
	}

}
function delAppover(user_name,user_id,dept_id){
	
	if($('input[name=OrgApprover ]').val() != ""){		
		
		alert("권한을 부여할 승인자를 초기화합니다.");
		$('input[name=OrgApprover ]').attr('value', "");
	}

}

function delTempAppover(user_name,user_id,dept_id){
	
	alert("권한을 부여받을 임시 승인자를 초기화합니다.");
	$('input[name=TempApprover ]').attr('value', "");
}

function delTempAppoverList(dept_id,temp_manager){
	var dept_id =dept_id;	
	console.log("1"+dept_id);
	dataInfo ={
			dept_id:dept_id,
			temp_manager:temp_manager
	}
	SelectTempApproverService.getDelManagerList(dataInfo,function(result){

		if(dataInfo.dept_id.length == 3){
			
			alert("임시 승인자가 삭제되었습니다");
			showTeamMember(dataInfo.dept_id);
			
			
		}else if(dataInfo.dept_id.length == 2){
			alert("임시 승인자가 삭제되었습니다");
			showDepartMember(dataInfo.dept_id);
			
		}else if(dataInfo.dept_id.length == 1){
			alert("임시 승인자가 삭제되었습니다");
			showHeadMember(dataInfo.dept_id)

		} 		
	});
}
