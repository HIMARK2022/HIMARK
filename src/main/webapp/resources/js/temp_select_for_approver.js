	$('.content-detail').on('click', function () {

		/*var t = $('#temptable tr td').text()


		if(t ==""){
			alert("지정 가능한 임시 승인자가 없습니다.");
		}else{
			$('.modal-wrapper').toggleClass('open');
		}*/
		$('.modal-wrapper').toggleClass('open');
		return false;
		
	});

	/*var manager = "${member.user_id}";
	var managerName = "${member.user_name}";
	var dept_id = "${member.dept_id}";*/
	
	var manager = $('input[name=OrgUserId ]').val();
	var managerName = $('input[name=OrgApprover ]').val();
	var dept_id = $('input[name=OrgDepartId ]').val();
	
	showTeamMember(dept_id);
	
	$('.RemoveBtn').on('click',function(){
		
		alert("임시 승인자 지정폼을 삭제합니다.");
		
		/* $('input[name=OrgApprover ]').attr('value', '');
		$('input[name=OrgUserId ]').attr('value', ''); */
		$('input[name=OrgDepartId ]').attr('value', '');
	
		$('input[name=TempApprover ]').attr('value', "");
		$('input[name=TempUserId ]').attr('value', "");
		$('input[name=TempDepartId ]').attr('value', "");	
		
		 $('#start-date1').val('');
		 $('#end-date1').val('');
		
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
			
			ApproverTempSelect.selectTempApprover(TempInfo,function(result){
				
					/* $('input[name=OrgApprover ]').attr('value', '');
					$('input[name=OrgUserId ]').attr('value', '');
					$('input[name=OrgDepartId ]').attr('value', ''); */
					
					$('input[name=TempApprover ]').attr('value', "");
					$('input[name=TempUserId ]').attr('value', "");
					$('input[name=TempDepartId ]').attr('value', "");	

					 $('#start-date1').val('');
					 $('#end-date1').val('');
					 showTeamMember(orgDepart);
					 

			});
		}	
	});
	function showTeamMember(team) {
		$('.teaminfo tr').remove();
		$('#temptable tr').remove();
		
		ApproverTempSelect.getTeamList(team, function(data) {
			showInfo(data);
		});
		
		ApproverTempSelect.getTempManagerList(team,function(data){
			showTemp(data);
		});
	}	
	function showInfo(data) {
		str = "";
		var tempApprover = "${temp[0].temp_manager}";
		
		for (var i = 0; i < data.length; i++) {
				
			var selectTempAppover ="selectTempAppover(\'"+data[i].user_name+"\',\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
			var delTempAppover ="delTempAppover(\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
			if(data[i].authority_code == "A1"){//승인가능 대상자.
				str += "<tr>"
					+ "<td>"+ data[i].user_id  + "</td>"
					+ "<td>"+ data[i].user_name+ "</td>"
					+ "<td>" + data[i].pos_name + "</td>"
					+ "<td>" + data[i].duty_name + "</td>"
					+ "<td><a class='btn btn-outline-primary selectBtn'"
					+ "onclick ="+selectTempAppover+" >"
					+ "<span class='text'>선택</span>"
					+ "</td>"
					+ "</tr>";
				
			}
			
		}
		$('.teaminfo').append(str);
	}
	function showTemp(data){
		str = "";
		for (var i = 0; i < data.length; i++) {
			var delTempAppoverList ="delTempAppoverList(\'"+data[i].dept_id+"\',\'"+data[i].temp_manager+"\')";
			
			var start  = new Date(data[i].approval_start );
			var finish = new Date(data[i].approval_finish);

			str += "<tr>"
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



	function selectTempAppover(user_name , user_id , dept_id){

		alert("권한을 부여받을 임시 승인자가 지정되었습니다.");
		
		$('input[name=OrgUserId ]').attr('value', manager);
		$('input[name=OrgDepartId ]').attr('value', dept_id);
		
		$('input[name=TempUserId ]').attr('value', user_id);
			
		$('input[name=OrgApprover ]').attr('value', managerName);
		$('input[name=TempApprover ]').attr('value', user_name);
		$('.modal-wrapper').removeClass('open');
	}
	

	function delTempAppover(user_id , dept_id){
		
		
		UserInfo = {
				temp_manager:user_id,
				manager_id : manager
		}
		
		ApproverTempSelect.getDelTemp(UserInfo,function(result){
			alert("임시 승인자가 삭제되었습니다");
			location.reload(true);
			showTeamMember(dept_id);		
		});
	}
	
	function delTempAppoverList(dept_id,temp_manager){
		var dept_id =dept_id;	
		dataInfo ={
				dept_id:dept_id,
				temp_manager:temp_manager
		}
		ApproverTempSelect.getDelManagerList(dataInfo,function(result){					
			alert("임시 승인자가 삭제되었습니다");
			showTeamMember(dataInfo.dept_id);
		});
	}