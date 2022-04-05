<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add employee </title>
</head>
<body>
<%@include file="../sidebar/admin_side.jsp"%>
<link href="/resources/css/admin_tree.css" rel="stylesheet">
<link href="/resources/css/admin_add_employee.css" rel="stylesheet">
<link href="/resources/css/admin_select_approver.css" rel="stylesheet">
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">승인자 관리</h1>
	</div>
	<p class="mb-4"><b>승인자를 지정할 수 있는 페이지입니다.<br> 좌측 부서 정보를 클릭하시면 해당 부서의 승인자 정보와, 승인자 지정 가능 대상들을 확인할 수 있고 승인자 지정이 가능합니다. </b></p>
	
	<!-- 상단 정보 -->
	<div class="row">
		<!-- 부서정보 트리 카드 -->
		<div class="col-xl-3 col-lg-3">
			<div class="card shadow mb-4" >
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">부서 정보</h6>
				</div>
				<!-- 부서트리 -->
				<div class="card-body" style="height: 60vh;">
					<div class="container" >
						<div class="row">
							<div class="row12">
								<c:forEach var="head" items="${head}">
	 								<ul class="tree"> 
										 <li> <i class="fa-solid fa-folder-open"></i><a class="head" id="${head.head_id}">${head.head}</a>
											<ul>
											<c:forEach var="depart" items="${depart}">
		                                        <c:if test="${depart.head eq head.head}">
		    										<li><i class="fa-solid fa-folder"></i><a class="dept" id="${depart.dept_id}">${depart.depart}</a>
		 												<ul>
		 												<c:forEach var="team" items="${team}">
		                                                    <c:if test="${depart.depart eq team.depart}">
																<li><i class="fas fa-fw fa-file"></i><a class="team" id="${team.team_id}">${team.team}</a>
																</li>
															</c:if>
	                                                    </c:forEach>
														</ul>
													</li>
												</c:if>
	                                        </c:forEach> 
											</ul>
										</li>   
									</ul>
								</c:forEach> 
							</div>
						</div>
					</div>
				</div>
				<!-- 부서트리 -->
			</div>
		</div>
      	<!-- 부서정보 트리 카드 -->
      	
		<div class="col-xl-9 col-lg-9" >
			<div class="card shadow mb-4 right_info" >
            	<div  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">승인자 지정</h6>
				</div>
				<div class="card-body" style="height: 60vh;">
					<div>
						<p class="mb-4"><b>선택한 부서의 승인자 가능 후보를 보실수 있습니다.</b></p>
						<br>
						<div class="selectApprover" style="display:none;">
						<h4 class="teaminfo"></h4>
						<h4 id="InfoApprover"></h4>
							<br>
							<div id="tableAreaSe">
								<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
									<thead>
										<tr>
											<th>아이디</th>
											<th>이름</th>
											<th>직책</th>
											<th>직급</th>
											<th>지정</th>
										</tr>
									</thead>
									<tbody id='tbody'>
										
									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>             
	</div>
	<!-- 상단 정보 -->
	<div class="col-xl-12 col-lg-12" >
		<div class="card shadow mb-4 right_info" >
			<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
            	<h6 class="m-0 font-weight-bold text-primary">승인자 목록</h6>
            </div>
        <div class="card-body">
        	<p class="mb-4"><b>선택하신 부서의 승인자를 확인할 수 있습니다.</b></p>
			<br>
			<div class="OrgApprover" style="display:none;">
			<h4 class="teaminfo"></h4>
				<br>
	        	<table class="table table-bordered" id="dataTable15"  cellspacing="0" >
	        		<thead>
	        			<tr>
	        				<th>아이디</th>
	        				<th>이름</th>
	        				<th>직책</th>
	        				<th>직급</th>
	        				<th>삭제</th>
	                   	</tr>
	                </thead>
	                <tbody id="approverTable">
	                </tbody>
	         	</table>
			</div>
        </div>
   	</div>
                            
</div>
</div>

<%@include file="../sidebar/footer.jsp"%>

<script src="/resources/js/tree.js"></script>
<script src="/resources/js/birth.js"></script>
<script src="/resources/js/add_user.js"></script>
<script src="/resources/js/select_approver.js"></script>

</body>
<script>
	$('.head').on('click', function() {	
	if($('.selectApprover').css("display")=="none" && $('.OrgApprover').css('display')=="none"){
		$('.selectApprover').show();
		$('.OrgApprover').show();
		
    }else{
    	$('.selectApprover').hide();
    	$('.OrgApprover').hide();
    }
	});
	$(".team").click(function(e){
	 	var teamN = $(this).text();
	    var team = $(this).attr("id");
	    showTeamMember(team)
	    console.log("선택 명 :"+teamN);
	    $('input[name=departIn ]').attr('value', teamN);
	    $('input[name=AdddeptId ]').attr('value', team);
	});
	$(".dept").click(function(e){
		var deptN = $(this).text();
	    var dept = $(this).attr("id");
		showDepartMember(dept);
		console.log("선택 명 :"+deptN);
		$('input[name=departIn ]').attr('value', deptN);
		$('input[name=AdddeptId ]').attr('value', dept);
	});
	$(".head").click(function(e) {
		var headN = $(this).text();
	    var head = $(this).attr("id");
		showHeadMember(head);
		console.log("선택 명 :"+headN);
		$('input[name=departIn ]').attr('value', headN);
		$('input[name=AdddeptId ]').attr('value', head);
	});

function showTeamMember(team) {
	$('#tbody tr').remove();
	$('#InfoApprover span').remove();
	$('.teaminfo span').remove();
	$('#approverTable tr').remove();
	AddModifyService.getTeamList(team, function(data) {
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
	AddModifyService.getDepartList(depart, function(data) {
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
	AddModifyService.getHeadList(head, function(data) {
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
		var selectAppover ="selectAppover(\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
		var delAppover ="delAppover(\'"+data[i].user_id+"\',\'"+data[i].dept_id+"\')";
		if(data[i].authority_code == "A1"){			
			info = "";
			str += "<tr><td>"
					+ data[i].user_id
					+ "</td>"
					+ "<td>"
					+ data[i].user_name
					+ "</td>"
					+ "<td>"
					+ data[i].duty_name
					+ "</td>" 
					+"<td>" + data[i].pos_name + "</td>"
					+ "<td><a class='btn btn-outline-primary selectBtn'"
					+"onclick ="+selectAppover+" >"
					+ "<span class='text'>승인자 지정</span>"
					+"</tr>";
			
		}
		else{
			info = "<span>※지정 가능한 승인자가 없습니다.※</span>";
			if(data[i].duty_name == "팀장" || data[i].duty_name == "부서장" || data[i].duty_name == "본부장"){
				strApprover += "<tr><td>"
					+ data[i].user_id
					+ "</td>"
					+ "<td>"
					+ data[i].user_name
					+ "</td>"
					+ "<td>"
					+ data[i].duty_name
					+ "</td>"
					+"<td>" + data[i].pos_name + "</td>"
					+ "<td>삭제 불가</td>"
					+"</tr>";
			}else{
				strApprover += "<tr><td>"
					+ data[i].user_id
					+ "</td>"
					+ "<td>"
					+ data[i].user_name
					+ "</td>"
					+ "<td>"
					+ data[i].duty_name
					+ "</td>"
					+"<td>" + data[i].pos_name + "</td>"
					+ "<td><a class='btn btn-outline-danger delBtn'"
					+"onclick ="+delAppover+" >"
					+ "<span class='text'>승인자 취소</span></td>"
					+"</tr>";	
			}
			
		}
	}
	$('#InfoApprover').append(info);
	$('#tbody').append(str);
	$('#approverTable').append(strApprover);
	
}
function selectAppover(user_id,dept_id){
	
	userInfo={
			user_id:user_id,
			dept_id:dept_id
	}
	SelectApproverService.uppdateAthority(userInfo,function(result){
		
		console.log("사용자 아이디 : " +userInfo.user_id);
		console.log("사용자 부서코드 : "+userInfo.dept_id);
		
		if(userInfo.dept_id.length == 3){
			alert('승인자 지정이 완료되었습니다.');
			showTeamMember(userInfo.dept_id);
		}else if(userInfo.dept_id.length == 2){
			alert('승인자 지정이 완료되었습니다.');
			showDepartMember(userInfo.dept_id)
		}else if(userInfo.dept_id.length == 1){
			alert('승인자 지정이 완료되었습니다.');
			showHeadMember(userInfo.dept_id)
		} 
		
	});
}
function delAppover(user_id,dept_id){
	userInfo={
			user_id:user_id,
			dept_id:dept_id
	}
	SelectApproverService.deleteAthority(userInfo,function(result){
		
		console.log("사용자 아이디 : " +userInfo.user_id);
		console.log("사용자 부서코드 : "+userInfo.dept_id);
		
		if(userInfo.dept_id.length == 3){
			alert('승인자 지정이 최소되었습니다.');
			showTeamMember(userInfo.dept_id);
		}else if(userInfo.dept_id.length == 2){
			alert('승인자 지정이 취소되었습니다.');
			showDepartMember(userInfo.dept_id)
		}else if(userInfo.dept_id.length == 1){
			alert('승인자 지정이 취소되었습니다.');
			showHeadMember(userInfo.dept_id)
		} 
		
	});
}


</script>
</html>