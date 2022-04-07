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
<link href="/resources/css/admin_modal_add.css" rel="stylesheet">
<link href="/resources/css/admin_modal_addm.css" rel="stylesheet">

	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">직원추가하기</h1>
	</div>
	<p class="mb-4"><b>조직도에서 소속을 선택한 후 직원을 추가할 수 있습니다.</b></p>
	<div class="row">
		<!-- 부서정보 트리 카드 -->
		<div class="col-xl-3 col-lg-3">
			<div class="card shadow mb-4" >
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">부서 정보</h6>
				</div>
				<!-- 부서트리 -->
				<div class="card-body">
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
					<h6 class="m-0 font-weight-bold text-primary">상세 정보</h6>
				</div>
				<div class="card-body about-detail" style="display:none;">
					<div>
						<h4 id="teaminfo"></h4>
						<div style="float: right;">
							<a href="#" class="btn btn-outline-primary btn-lg btn-icon-split content-detail2 page-wrapper2">
                            	<span class="icon text-white-50">
                                	<i class="fas fa-plus"></i>
                                </span>
                                <span class="text">추가하기</span>
                        	</a>
						</div>
						<div>
							<br><br><br><br>
							<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
								<thead>
									<tr>
										<th>아이디</th>
										<th>이름</th>
										<th>직책</th>
										<th>직급</th>
									</tr>
								</thead>
								<tbody id="tbody">
									
								</tbody>
							</table>
						</div>
					</div>
				</div>
			</div>
		</div>            
	</div>
</div>
</div>

	<!-- 수정 모달 -->
	<form name="modForm" id="modForm">
		<input type='hidden' value="" name ='Muser_id' id='Muser_id'>
		<input type='hidden' value="" name ='Mdept_id' id='Mdept_id'>
		<div class="modal-wrapper">
			<div class="modal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">직원 수정하기</h4>
					<button type="button" class="close content-detail mod-content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div>
                        <table class="table table-bordered" id="dataTable modtable" cellspacing="0" >
                            <tr>
                                <th >소속(변경 불가)</th>
                                <td >
                                    <div>
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="" name="ModBelong" id="ModBelong"
                                            aria-label="Search" aria-describedby="basic-addon2" readonly>
                                    </div>
                                </td>
                            </tr>
                             
                              <tr>
                                <th >직급(변경 불가)</th>
                                <td >
                                    <div>
                                    	<input type="text" class="form-control bg-light border-0 small" placeholder="사원/선임/책임/수석/임원" name="ModPos" id="ModPos"
                                          aria-label="Search" aria-describedby="basic-addon2" readonly>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <th >등록 형태(변경 불가)</th>
                                <td >
                                    <div class="form-check-inline">
                                    	<label class="form-check-label" for="inlineRadiosex1">
                                    		<input class="form-check-input" type="radio"id="howIn1" name="ModhowIn" onclick="return(false);" >인사연동
                                        </label>
                                    </div>
                                    <div class="form-check-inline">
                                    	<label class="form-check-label" for="inlineRadiosex2">
                                    		<input class="form-check-input" type="radio" id="howIn2" name="ModhowIn"  onclick="return(false);" >웹
                                        </label>
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                                <th >이름</th>
                                <td>
                                    <div>
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="이름을 입력하시오" name="ModUserName" id ="ModUserName"
                                            aria-label="Search" aria-describedby="basic-addon2">
                                    </div>
                                </td>
                            </tr>
                            
                            <tr>
                              <th>생년월일</th>
                              <td>
                                <input type="text" class="form-control bg-light border-0 small" placeholder="생년월일을 입력하세요 ex) 1900-01-01" name="ModBirth" id ="ModBirth"
                                            aria-label="Search" aria-describedby="basic-addon2">
                              </td>
                            </tr>
                            <tr>
                              <th>성별</th>
                              <td>
                                <div>
                                    <input type="text" class="form-control bg-light border-0 small" placeholder="성별을 입력하세요 ex) 남/여" name="ModSex" id="ModSex"
                                            aria-label="Search" aria-describedby="basic-addon2">
                                </div>
                                
                              </td>
                            </tr>
							<tr>
                                <th >이메일</th>
                                <td >
                                    <div>
                                        <input type="text" class="form-control bg-light border-0 small" placeholder="이메일을 입력하세요" name="ModEmail" id="ModEmail"
                                            aria-label="Search" aria-describedby="basic-addon2">
                                    </div>
                                </td>
                            </tr>
                            <tr>
                                <th>휴대폰 번호</th>
                                <td>
                                  <div>
                                      <input type="text" class="form-control bg-light border-0 small" placeholder="전화번호를 입력하시오" name="ModPhone" id="ModPhone"
                                          aria-label="Search" aria-describedby="basic-addon2">
                                  </div>
                                </td>
                              </tr>
                        </table>
                    </div>
                 </div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default content-detail mod-content-detail" 
								data-dismiss="modal" role="button">취소</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="modMember"
								class="btn btn-default btn-hover-green mod-content-detail " role="button">수정하기</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 생성 모달 -->
	<form name="createForm" id="createForm">
		<input type="hidden" value="" name="AdddeptId"/>
		<div class="modal-wrapper2">
			<div class="modal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">직원추가</h4>
					<button type="button" class="close create-content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
                    <div>
						<table class="table table-bordered" id="dataTable" cellspacing="0">
							<tr>
								<th>소속</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small" placeholder="" id="departIn" name="departIn"
											aria-label="Search" aria-describedby="basic-addon2" readonly>
									</div>
								</td>
							</tr>
							<tr>
								<th>이름</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="이름을 입력하시오" aria-label="Search" name="AdduserName" id="AdduserName"
											aria-describedby="basic-addon2">
									</div>
								</td>
							</tr>

							<tr>
								<th>생년월일</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="생일을 입력하시오 ex) 1900-01-01" aria-label="Search"  name="AddBirth" id="AddBirth"
											aria-describedby="basic-addon2">
									</div>
								</td>
							</tr>
							<tr>
								<th>성별</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="성별을 입력하시오 ex) 남/여" aria-label="Search"  name="Addsex" id="Addsex"
											aria-describedby="basic-addon2">
									</div>
								</td>
							</tr>
							<tr>
								<th>휴대폰 번호</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="전화번호를 입력하시오" aria-label="Search"  name="AddPhone" id="AddPhone"
											aria-describedby="basic-addon2">
									</div>
								</td>
							</tr>
							<tr>
								<th>이메일</th>
								<td>
									<div>
										<input type="text"
											class="form-control bg-light border-0 small"
											placeholder="이메일을 입력하세요" aria-label="Search" name="AddEmail" id="AddEmail"
											aria-describedby="basic-addon2">
									</div>
								</td>
							</tr>
							<tr>
								<th>직급</th>
								<td>
									<div>
										<select class="form-select form-control col-lg-5" name="pos" required>
                                        	<c:forEach  var="pos" items="${pos}">
                                        		<option value="${pos.pos_id}" >${pos.pos_name}</option>  
                                            </c:forEach>
                                       	</select>
                            		</div>
								</td>
							</tr>
						</table>
					</div>
                 </div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default create-content-detail"
								data-dismiss="modal" role="button">취소</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="addMember"
								class="btn btn-default btn-hover-green" role="button">생성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

<%@include file="../sidebar/footer.jsp"%>

<script src="/resources/js/tree.js"></script>
<script src="/resources/js/birth.js"></script>
<script src="/resources/js/add_user.js"></script>
<script>
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
		$('#modForm')[0].reset();
		$('#modForm')[1].reset();
	});
</script>

<script>
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
			$('#modForm')[0].reset();
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
			
			$('input[name=ModBelong]').attr('value', head);
			$('input[name=ModPos]').attr('value', pos);
			
			
			if(birth == "null"){
				birth="";
			}
			if(sex == "null"){
				sex="";
			}
			if(email == "null"){
				email="";
			}
			if(phone == "null"){
				phone="";
			}
			
			
			if(flag =="인사연동"){				
				$('input[name=ModhowIn]:input[id="howIn1"]').attr("checked",true);
			}
			
			if(flag =="웹"){
				$('input[name=ModhowIn]:input[id="howIn2"]').attr("checked",true);
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
		
		var modInfo ={
			user_name:user_name,
			birth_date:birth_date,
			sex:sex,
			email:email,
			phone_number:phone_number,
			user_id:user_id,
			dept_id:dept_id
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
	
	
	
</script>

</body>
</html>