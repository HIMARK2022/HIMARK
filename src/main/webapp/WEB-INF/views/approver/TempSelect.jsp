<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>임시 승인자 지정(승인자)</title>
</head>
<body id="page-top">
	<div id="wrapper">
		<page:applyDecorator name="approverSide" />
		<link href="/resources/css/calendar.css" rel="stylesheet">
		<link href="/resources/css/approver_myDepart.css" rel="stylesheet">
		<link href="/resources/css/admin_modal_add.css" rel="stylesheet">
		<div class="container-fluid">
			<div
				class="d-sm-flex align-items-center justify-content-between mb-4">
				<h1 class="h3 mb-0 text-gray-800">임시 승인자 지정</h1>
			</div>
			<p class="mb-4">
				<b>나의 승인 권한을 임시로 부여할 수 있는 페이지입니다.</b>
			</p>
			
			<br>
			<div class="col-xl-12 col-lg-12">
				<div class="card border-left-primary shadow h-100 py-2 ">
					<div class="card-body">
						<div class="row no-gutters align-items-center">
						<div class="col mr-2">
							<div class="font-weight-bold text-primary text-uppercase mb-1">임시 승인자 기간 지정</div>
							<!-- 상단 지정 -->
							<form action="#" method="post" id="searchForm">
								<div class="h5 mb-0 font-weight-bold text-gray-800" id="filter">
									<div class="h5 mb-0 font-weight-bold text-gray-800">
										<div style="float:right;">
											<a href="#" class="btn btn-outline-danger btn-lg btn-icon-split RemoveBtn">
												<span class="icon text-white-50"> 
													<i class="fa-solid fa-x"></i>
												</span>
												<span class="text">지정 초기화</span>
											</a>
											<a href="#" class="btn btn-outline-primary btn-lg btn-icon-split SelectBtn">
												<span class="icon text-white-50"> 
													<i class="fas fa-plus"></i>
												</span>
												<span class="text">지정하기</span>
											</a>
										</div>
										<br><br><br>
										<div class="clearfix">
											<input type="hidden" value="${member.user_id}" name="OrgUserId">
											<input type="hidden" value="${member.dept_id}" name="OrgDepartId">
											<input type="hidden" value="" name="TempUserId">
											<input type="hidden" value="" name="TempDepartId">
											<div class="col-lg-12 row" >
												<div class="col-lg-3">
													<p class="HText">승인자</p> 
													<input type="text" class="form-control bg-light border-0 small " value="${member.user_name }" name="OrgApprover" id='OrgApprover'
														aria-label="Search" aria-describedby="basic-addon2" readonly>
												</div>
												<div class="col-lg-3">
													<p class="HText">임시 승인자</p>
													<input type="text" class="form-control bg-light border-0 small content-detail" placeholder="임시 승인자" name="TempApprover" id="TempApprover"
															aria-label="Search" aria-describedby="basic-addon2" readonly>
												</div>
												<div class="col-lg-3">
													<p class="HText">지정일</p> 
													<input type="text" name="start-date1" value="" class="datepicker form-control bg-light border-0 small " 
															id="start-date1" placeholder="지정일" readonly />
												</div>
												<div class="col-lg-3"> 
													<p class="HText">만료일</p> 									
													<input type="text" name="end-date1" value="" class="datepicker form-control bg-light border-0 small " 
															id="end-date1" placeholder="만료일" readonly />
												</div> 
											</div>
										</div>
									</div>
								</div>
							</form>
						<!-- 모달 폼 마지막 -->
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="col-xl-12 col-lg-12" >
			<br>
			<div class="card shadow mb-4 " >
            	<div  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">임시 승인자</h6>
				</div>
				<div class="card-body about-detail" >
					<div>
						<h4 id="teaminfo">임시 승인자 정보</h4>
						
						<div>
							<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
								<thead>
									<tr>
									
										<th>임시 승인자 아이디</th>
										<th>임시 승인자 이름</th>
										<th>지정일</th>
										<th>만료일</th>
										<th>삭제</th>
									</tr>
								</thead>
								<tbody id="temptable">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>     
		
	
	<!-- 모달 -->
	<form name="modForm" id="modForm">
		<div class="modal-wrapper">
			<div class="modal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">임시 승인자 가능 후보</h4>
					<button type="button" class="close content-detail mod-content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div>
                       <table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
							<thead>
								<tr>
									<th>아이디</th>
									<th>이름</th>
									<th>직책</th>
									<th>직급</th>
									<th>선택</th>
								</tr>
							</thead>
							<tbody class="teaminfo">
									
							</tbody>
						</table>    
                    </div>
                 </div>
			</div>
		</div>
	</form>
	<!-- 모달 -->
	
	</div>
	</div>
	<page:applyDecorator name="footer" />
<script src="/resources/js/cal.js"></script>
<script src="/resources/js/approver_temp_select.js"></script>
<script>
$('.content-detail').on('click', function () {
	    $('.modal-wrapper').toggleClass('open');
	    return false;
	});

	var manager = "${member.user_id}";
	var managerName = "${member.user_name}";
	var dept_id = "${member.dept_id}";
	
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
</script>

</body>
</html>