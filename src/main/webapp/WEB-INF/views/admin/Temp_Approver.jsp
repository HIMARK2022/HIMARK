<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
   <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>

</head>
<body>
 <page:applyDecorator name="adminSide" />
<link href="/resources/css/admin_tree.css" rel="stylesheet">
<link href="/resources/css/admin_add_employee.css" rel="stylesheet">
<link href="/resources/css/calendar.css" rel="stylesheet">
<link href="/resources/css/admin_temp_apprver.css" rel="stylesheet">
	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
		<h1 class="h3 mb-0 text-gray-800">임시승인자 관리</h1>
	</div>
	<p class="mb-4"><b>일정 기간동안 일반 사용자에게 승인자의 권한을 부여할 수 있습니다.<br>※임시승인자 지정 가능 대상은 승인자와 같은 소속으로 한정됩니다.</b></p>
	<div>
		<div class="card border-left-primary shadow h-100 py-2">
			<div class="card-body">
				<div class="row no-gutters align-items-center">
					<div class="col mr-2">
						<div class="font-weight-bold text-primary text-uppercase mb-1">
							임시승인자 지정 폼
						</div>
						<!-- 상단 지정 -->
						<form action="#" method="post" id="searchForm">
							<div class="h5 mb-0 font-weight-bold text-gray-800" id="filter">
								<div class="h5 mb-0 font-weight-bold text-gray-800">
									<div style="float:right;">
										<a href="#" class="btn btn-outline-danger btn-lg btn-icon-split RemoveBtn">
											<span class="icon text-white-50"> 
												<i class="fa-solid fa-x"></i>
											</span>
											<span class="text">폼 초기화</span>
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
										<input type="hidden" value="" name="OrgUserId">
										<input type="hidden" value="" name="OrgDepartId">
										<input type="hidden" value="" name="TempUserId">
										<input type="hidden" value="" name="TempDepartId">
																			
											<div class="col-lg-12 row" >
												<div class="col-lg-3">
													<p class="HText">승인자</p> 
												
													<input type="text" class="form-control bg-light border-0 small " placeholder="승인자" name="OrgApprover" id='OrgApprover'
													aria-label="Search" aria-describedby="basic-addon2" readonly>
												</div>
												<div class="col-lg-3">
													<p class="HText">임시승인자</p>
													<input type="text" class="form-control bg-light border-0 small" placeholder="임시 승인자" name="TempApprover" id="TempApprover"
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
					</div>
				</div>
			</div>
		</div>
		<br>
	<!-- 상단 정보 -->
	<div class="row">
		<!-- 부서정보 트리 카드 -->
		<div class="col-xl-3 col-lg-3">
			<div class="card shadow mb-4" >
				<div class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">조직도</h6>
				</div>
				<!-- 부서트리 -->
				<div class="card-body" style="height: 60vh;">
					<div class="container" >
						<div class="row">
							<div class="row12">
								<c:forEach var="head" items="${head}">
	 								<ul class="tree"> 
										 <li> <i class="fa-solid fa-user"></i><a  class="head" id="${head.head_id}">${head.head}</a>
											<ul>
											<c:forEach var="depart" items="${depart}">
		                                        <c:if test="${depart.head eq head.head}">
		    										<li><i class="fa-solid fa-user"></i><a class="dept" id="${depart.dept_id}">${depart.depart}</a>
		 												<ul>
		 												<c:forEach var="team" items="${team}">
		                                                    <c:if test="${depart.depart eq team.depart}">
																<li><i class="fa-solid fa-user"></i><a class="team" id="${team.team_id}">${team.team}</a>
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
      	<div class="col-xl-4 col-lg-4" >
			<div class="card shadow mb-4" >
            	<div  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">직원 정보</h6>
				</div>
				<div class="card-body tables" style="height: 60vh; overflow-y:scroll">
					<div class="tables" style="display:none; ">
						
						<h4 class="teaminfo"></h4>
						<p>승인자와 임시승인자 가능 대상을 확인 및 지정하실 수 있습니다.</p>
						<div>
							<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
								<thead>
									<tr>
										<th>아이디</th>
										<th>이름</th>
										<th>직급</th>
										<th>선택</th>
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
		<div class="col-xl-5 col-lg-5" >
			<div class="card shadow mb-4 ">
            	<div  class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
					<h6 class="m-0 font-weight-bold text-primary">임시승인자 정보</h6>
				</div>
				<div class="card-body tables" style="height: 60vh;" >
					<div  class="card-body tables" style=" display:none;">
						<h4 class="teaminfo"></h4>
						<p>지정된 임시 승인자 정보를 확인 및 삭제 하실 수 있습니다.</p>
						<div>
							<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
								<thead>
									<tr>
										<th>승인자</th>
					
										<th>임시 승인자</th>
									
										<th>지정일</th>
										<th>만료일</th>
										<th>관리</th>
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
	</div>
	<!-- 상단 정보 -->
	
</div>
</div>

<page:applyDecorator name="footer" />

<script src="/resources/js/cal.js"></script>
<script src="/resources/js/tree.js"></script>
<script src="/resources/js/birth.js"></script>
<script src="/resources/js/temp_approver.js"></script>
<script src="/resources/js/select_temp_approver.js"></script>

</body>
</html>