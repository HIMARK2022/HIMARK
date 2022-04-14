<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 - 승인자</title>
<link href="/resources/css/approver_home.css" rel="stylesheet">
<script src="/resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<page:applyDecorator name="approverSide" />
		<!-- End of Topbar 헤더 끝 -->
		<!-- Begin Page Content -->
		<div class="container-fluid">

		<c:choose>
		<c:when test="${fn:length(dlist)==0}">
		<div class="row">
					<div class="col-lg-5 mb-5">
						<div class="card shadow mb-0">
							<!-- Card Header - Dropdown -->
							<div
								class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
								<h6 class="m-0 font-weight-bold text-primary">직원 현황</h6>
							</div>
							<!-- Card Body -->
							<div class="card-body" id="table" style='height:523px'>
								<div class="table-responsive">
									<table class="table table-bordered bg-primary text-white"
										id="dataTable topbar" width="100%" cellspacing="0">
										<tr>
											<td><b> 이름</b></td>
											<td><b> 직급</b></td>
										</tr>
									</table>
									<div id="table_content" style="height:27rem">
										<table class="table table-bordered" id="dataTable"
											width="100%" cellspacing="0">

											<c:forEach var="list" items="${all}">
												<tr>
													<td>${list.userName}</td>
													<td>${list.pos}</td>
												</tr>
											</c:forEach>


										</table>
									</div>
								</div>
							</div>
						</div>
					</div>
				
			<div class="col-lg-7 mb-7">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">받은 결재 요청</h6>
					</div>
					<div class="card-body" id="request" style="padding: 1em;">
						<div class="row">
							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="ging"
										onclick="location.href='/approver/payment?userId=${ceo.userId}#tab1'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gprogress"
													class="text-sm font-weight-bold text-primary text-uppercase mb-1">
													대기</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gprogress}' />
													건
												</div>
											</div>
											<div class="col-auto ging">
												<i class="fas fa-hourglass-half fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100 ">
									<div class="card-body state" id="complete"
										onclick="location.href='/approver/payment?userId=${ceo.userId}#tab2'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gcomplete"
													class="text-sm font-weight-bold text-success text-uppercase mb-1">
													승인</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gcomplete}' />
													건
												</div>
											</div>
											<div class="col-auto gcomplete">
												<i class="fas fa-check fa-2x text-success"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
	
							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="back"
										onclick="location.href='/approver/payment?userId=${ceo.userId}#tab3'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gback"
													class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
													반려</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gback}' />
													건
												</div>
											</div>
											<div class="col-auto gback">
												<i class="fas fa-reply fa-2x text-secondary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
	
					<!-- Pie Chart -->
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mb-4">
	
							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<canvas id="myPieChart2"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2"> <i class="fas fa-circle text-primary"></i>
										대기
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-success"></i> 승인
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-secondary"></i> 반려
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		</div>
	</c:when>
	<c:otherwise>



		<!-- Page Heading -->
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">Home</h1>
		</div>

		<!-- Content Row 1 -->
		<div class="row">
			<!-- 나의 정보 Start -->
			<div class="col-xl-7 col-lg-7">
				<div class="card shadow mb-0" style="height: 375px;">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">나의 정보</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body" id="profile">
						<p>
						<div class="pic">
							<svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
								fill="currentColor" class="bi bi-person-circle"
								viewBox="0 0 16 16">
                                            <path
									d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                            <path fill-rule="evenodd"
									d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                        </svg>
						</div>



						<div class="profile">
							<b>${member.user_name }</b> / ${member.duty_name } <small
								class="text-xs font-weight-bold text-primary"
								style="margin-top: 20px;"> <c:if
									test="${fn:length(dlist)==0}">(대표)</c:if> <c:if
									test="${empty tempOrigin}">(승인자)</c:if> <c:if
									test="${!empty tempOrigin}">(임시승인자)</c:if>
							</small><br> ${member.head}
							<c:choose>
								<c:when test="${empty member.depart}">&nbsp;</c:when>
								<c:when test="${empty member.team}">/${member.depart} &nbsp;</c:when>
								<c:otherwise>/${member.depart}/${member.team}&nbsp;</c:otherwise>
							</c:choose>
						</div>
						</p>
						<br>
						<p>
							<b>아이디</b> ${member.user_id }
						</p>
						<b>이메일</b> ${member.email }


					</div>
				</div>
			</div>
			<!-- 나의 정보 End -->


			<div class="col-lg-5 mb-5">
				<div class="card shadow mb-0">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">직원 현황</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body" id="table">
						<div class="table-responsive">
							<table class="table table-bordered bg-primary text-white"
								id="dataTable topbar" width="100%" cellspacing="0">
								<tr>
									<td><b> 이름</b></td>
									<td><b> 직급</b></td>
								</tr>
							</table>
							<div id="table_content">
								<table class="table table-bordered" id="dataTable" width="100%"
									cellspacing="0">

									<c:forEach var="list" items="${dlist}">
										<tr>
											<td>${list.userName}</td>
											<td>${list.pos}</td>
										</tr>
									</c:forEach>

								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<!-- 승인자 목록 Start -->
			<div class="col-xl-6 col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">보낸 결재 요청</h6>
					</div>
					<div class="card-body" id="request" style="padding: 1em;">
						<div class="row">
							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="ing"
										onclick="location.href='/approver/request_list?userId=${member.user_id}#tab1'">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="progress"
													class="text-sm font-weight-bold text-primary text-uppercase mb-1">
													대기</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${progress}' />
													건
												</div>
											</div>
											<div class="col-auto ing">
												<i class="fas fa-hourglass-half fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100 ">
									<div class="card-body state" id="complete"
										onclick="location.href='/approver/request_list?userId=${member.user_id}#tab2'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-sm font-weight-bold text-success text-uppercase mb-1">
													승인</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${complete}' />
													건
												</div>
											</div>
											<div class="col-auto complete">
												<i class="fas fa-check fa-2x text-success"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="back"
										onclick="location.href='/approver/request_list?userId=${member.user_id}#tab3'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div
													class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
													반려</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${back}' />
													건
												</div>
											</div>
											<div class="col-auto back">
												<i class="fa fa-reply fa-2x text-secondary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Pie Chart -->
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mb-4">

							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<canvas id="myPieChart"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2"> <i
										class="fas fa-circle text-primary"></i> 대기
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-success"></i> 승인
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-secondary"></i> 반려
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- 승인자 목록 Start -->
			<div class="col-xl-6 col-lg-6">
				<div class="card shadow mb-4">
					<div class="card-header py-3">
						<h6 class="m-0 font-weight-bold text-primary">받은 결재 요청</h6>
					</div>
					<div class="card-body" id="request" style="padding: 1em;">
						<div class="row">
							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="ging"
										onclick="location.href='/approver/payment?userId=${member.user_id}#tab1'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gprogress"
													class="text-sm font-weight-bold text-primary text-uppercase mb-1">
													대기</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gprogress}' />
													건
												</div>
											</div>
											<div class="col-auto ging">
												<i class="fas fa-hourglass-half fa-2x text-primary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100 ">
									<div class="card-body state" id="complete"
										onclick="location.href='/approver/payment?userId=${member.user_id}#tab2'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gcomplete"
													class="text-sm font-weight-bold text-success text-uppercase mb-1">
													승인</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gcomplete}' />
													건
												</div>
											</div>
											<div class="col-auto gcomplete">
												<i class="fas fa-check fa-2x text-success"></i>
											</div>
										</div>
									</div>
								</div>
							</div>

							<div class="col-lg-4 mb-2">
								<div class="card border shadow h-100">
									<div class="card-body state" id="back"
										onclick="location.href='/approver/payment?userId=${member.user_id}#tab3'"
										data-toggle="tab">
										<div class="row no-gutters align-items-center">
											<div class="col mr-2">
												<div id="gback"
													class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
													반려</div>
												<div class="h5 mb-0 font-weight-bold text-gray-800">
													<c:out value='${gback}' />
													건
												</div>
											</div>
											<div class="col-auto gback">
												<i class="fas fa-reply fa-2x text-secondary"></i>
											</div>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>

					<!-- Pie Chart -->
					<div class="col-xl-12 col-lg-12">
						<div class="card shadow mb-4">

							<!-- Card Body -->
							<div class="card-body">
								<div class="chart-pie pt-4 pb-2">
									<canvas id="myPieChart2"></canvas>
								</div>
								<div class="mt-4 text-center small">
									<span class="mr-2"> <i
										class="fas fa-circle text-primary"></i> 대기
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-success"></i> 승인
									</span> <span class="mr-2"> <i
										class="fas fa-circle text-secondary"></i> 반려
									</span>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</c:otherwise>
	</c:choose>
	<!-- 승인자 목록 End -->
	<!-- /.container-fluid -->

	</div>
	<!-- End of Main Content -->
	<script>
		// Pie Chart Example
				Chart.defaults.global.defaultFontFamily = 'Nunito',
				'-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
		Chart.defaults.global.defaultFontColor = '#858796';
		
		var ctx2 = document.getElementById("myPieChart2");
		var myPieChart2 = new Chart(ctx2, {
			type : 'doughnut',
			data : {
				labels : [ "진행중", "완료", "반려" ],
				datasets : [ {
					data : [ <c:out value='${gprogress}'/>,
							<c:out value='${gcomplete}'/>,
							<c:out value='${gback}'/> ],
					backgroundColor : [ '#4e73df', '#1cc88a', '#858796' ],
					hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
					hoverBorderColor : "rgba(234, 236, 244, 1)",
				} ],
			},
			options : {
				maintainAspectRatio : false,
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10,
				},
				legend : {
					display : false
				},
				cutoutPercentage : 80,
			},
		});
		var ctx = document.getElementById("myPieChart");
		var myPieChart = new Chart(ctx, {
			type : 'doughnut',
			data : {
				labels : [ "진행중", "완료", "반려" ],
				datasets : [ {
					data : [ <c:out value='${progress}'/>,
							<c:out value='${complete}'/>,
							<c:out value='${back}'/> ],
					backgroundColor : [ '#4e73df', '#1cc88a', '#858796' ],
					hoverBackgroundColor : [ '#2e59d9', '#17a673', '#2c9faf' ],
					hoverBorderColor : "rgba(234, 236, 244, 1)",
				} ],
			},
			options : {
				maintainAspectRatio : false,
				tooltips : {
					backgroundColor : "rgb(255,255,255)",
					bodyFontColor : "#858796",
					borderColor : '#dddfeb',
					borderWidth : 1,
					xPadding : 15,
					yPadding : 15,
					displayColors : false,
					caretPadding : 10,
				},
				legend : {
					display : false
				},
				cutoutPercentage : 80,
			},
		});

		
		
		
		$("#ing")
				.hover(
						function() {
							$(".ing i").remove();
							$(".ing")
									.append(
											"<i class='fas fa-hourglass-half fa-2x fa-spin text-primary'></i>");
						},
						function() {
							$(".ing i").remove();
							$(".ing")
									.append(
											"<i class='fas fa-hourglass-half fa-2x text-primary'></i>");
						});
		$("#ging")
				.hover(
						function() {
							$(".ging i").remove();
							$(".ging")
									.append(
											"<i class='fas fa-hourglass-half fa-2x fa-spin text-primary'></i>");
						},
						function() {
							$(".ging i").remove();
							$(".ging")
									.append(
											"<i class='fas fa-hourglass-half fa-2x text-primary'></i>");
						});

		$("#complete")
				.hover(
						function() {
							$(".complete i").remove();
							$(".complete")
									.append(
											" <i class='fas fa-check fa-2x fa-bounce text-success'></i>");
						},
						function() {
							$(".complete i").remove();
							$(".complete")
									.append(
											" <i class='fas fa-check fa-2x text-success'></i>");
						});
		$("#gcomplete")
				.hover(
						function() {
							$(".gcomplete i").remove();
							$(".gcomplete")
									.append(
											" <i class='fas fa-check fa-2x fa-bounce text-success'></i>");
						},
						function() {
							$(".gcomplete i").remove();
							$(".gcomplete")
									.append(
											" <i class='fas fa-check fa-2x text-success'></i>");
						});

		$("#back")
				.hover(
						function() {
							$(".back i").remove();
							$(".back")
									.append(
											"<i class='fa fa-reply fa-2x fa-flip text-secondary'></i>");
						},
						function() {
							$(".back i").remove();
							$(".back")
									.append(
											"<i class='fa fa-reply fa-2x text-secondary'></i>");
						});
		$("#gback")
				.hover(
						function() {
							$(".gback i").remove();
							$(".gback")
									.append(
											"<i class='fa fa-reply fa-2x fa-flip text-secondary'></i>");
						},
						function() {
							$(".gback i").remove();
							$(".gback")
									.append(
											"<i class='fa fa-reply fa-2x text-secondary'></i>");
						});
	</script>
	<page:applyDecorator name="footer" />

</body>
</html>