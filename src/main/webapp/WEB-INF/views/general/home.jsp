<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 - 일반 사용자</title>
<link href="/resources/css/general_home.css" rel="stylesheet">
  <script src="/resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        		<page:applyDecorator name="generalSide" />
        <!-- End of Topbar 헤더 끝 -->
         <!-- 메인 시작 -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">Home</h1>
                    </div>

                    <!-- Content Row 1 -->
                    <div class="row">
                        <!-- 나의 정보 Start -->
                        <div class="col-xl-6 col-lg-6">
                            <div class="card shadow mb-2">
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
                                            fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                            <path fill-rule="evenodd"
                                                d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                        </svg>
                                    </div>
                                    <div class="profile">
                                        <b>${member.user_name }</b> / ${member.duty_name } <br> ${member.head}
                                         <c:choose>
                                            <c:when test="${empty member.depart}">&nbsp;</c:when>
                                            <c:when test="${empty member.team}">/${member.depart} &nbsp;</c:when>
                                            <c:otherwise>/${member.depart}/${member.team}&nbsp;</c:otherwise>
                                            </c:choose>
                                    </div>
                                    </p>
                                    <br>
                                    <p><b>아이디</b> ${member.user_id }</p>
                                    <b>이메일</b> ${member.email }
                                </div>
                            </div>


                            <!-- 나의 정보 End -->
                            <div class="row">
                                <!-- 승인자 목록 Start -->
                                <div class="col-xl-12 col-lg-12">
                                    <div class="card shadow mb-2">
                                        <!-- Card Header - Dropdown -->
                                        <div
                                            class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                            <h6 class="m-0 font-weight-bold text-primary">승인자 목록</h6>
                                        </div>
                                        <!-- Card Body -->
                                        <div class="card-body" id="table">
                                            <div class="table-responsive">
                                                <table class="table table-bordered bg-primary text-white"
                                                    id="dataTable topbar" width="100%" cellspacing="0">
                                                    <tr>
                                                        <th id="name" style="width:20%">이름</th>
				                                        <th id="headquarter" style="width:20%">본부</th>
				                                        <th id="department" style="width:20%">부서</th>
				                                        <th id="team" style="width:20%">팀</th>
				                                        <th id="position" style="width:20%">직책</th>
                                                    </tr>
                                                    
                                                </table>
                                                <div id="table_content">
                                                    <table class="table table-bordered" id="dataTable" width="100%"
                                                        cellspacing="0">
                                                       <c:forEach var="list" items="${alist}">
                  
								                        <tr>
								                           <td style="width:20%">${list.userName}</td>
								                           <td style="width:20%"><c:choose>
								                           <c:when test="${empty list.bonbu}">--</c:when>
								                           <c:otherwise>${list.bonbu}</c:otherwise>
								                           </c:choose>
								                           </td>
								                           <td style="width:20%"><c:choose>
								                           <c:when test="${empty list.buseo}">--</c:when>
								                           <c:otherwise>${list.buseo}</c:otherwise>
								                           </c:choose></td>
								                           <td style="width:20%"><c:choose>
								                           <c:when test="${empty list.team }">--</c:when>
								                           <c:otherwise>${list.team}</c:otherwise>
								                           </c:choose></td>
								                           <td style="width:20%">${list.duty}</td>
								                        </tr>
								                         </c:forEach>
								                         <tr>
								                           <td style="width:20%">${ceo.user_name}</td>
								                           <td style="width:20%">--</td>
								                           <td style="width:20%">--</td>
								                           <td style="width:20%">--</td>
								                           <td style="width:20%">${ceo.duty_name}</td>
								                        </tr>
                       
														</table>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>


                        <div class="col-lg-6 mb-6">
                            <section class="services py-0 bg-light1 text-center">
                               
                                    <div class="row">
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <a href="/general/myinfo" class="text-body">
                                                <div class="card bg-light mb-3">
                                                    <div class="card-body" id="menu_btn">
                                                        <i class="fa fa-user fa-4x" id="ad_icon1" aria-hidden="true"></i><br>
                                                        <h5>나의 정보</h5>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <a href="/general/approver_list" class="text-body">
                                                <div class="card bg-light mb-3">
                                                    <div class="card-body" id="menu_btn">
                                                       <i class="fa fa-users fa-4x" id="ad_icon2" style="width: 74px; height: 64px; opacity: 0.7;"></i></br>
                                                        <h5>나의 승인자</h5>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                        <div class="col-xs-12 col-sm-6 col-md-4">
                                            <a href="/general/request_list" class="text-body">
                                                <div class="card bg-light mb-3">
                                                    <div class="card-body" id="menu_btn">
                                                        <i class="fa fa-list-alt fa-4x " id="ad_icon3" aria-hidden="true"></i></br>
                                                        <h5>요청 목록</h5>
                                                    </div>
                                                </div>
                                            </a>
                                        </div>
                                    </div>
                                
                            </section>

                            <!-- Project Card Example -->
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                   <h6 class="m-0 font-weight-bold text-primary">보낸 결재 요청 </h6>
                                </div>
                                <div class="card-body" id="request" style="padding: 1em;">
                                    <div class="row">
                                        <div class="col-lg-4 mb-2">
                                            <div class="card border shadow h-100">
                                                <div class="card-body state" id="ing" onclick="location.href='/general/request_list?userId=${member.user_id}#tab1'">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div id="progress" 
                                                                class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                                대기</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${progress}'/>건</div>
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
                                                    <div class="card-body state" id="complete" onclick="location.href='/general/request_list?userId=${member.user_id}#tab2'" data-toggle="tab">
                                                        <div class="row no-gutters align-items-center">
                                                            <div class="col mr-2">
                                                                <div
                                                                    class="text-sm font-weight-bold text-success text-uppercase mb-1">
                                                                    승인</div>
                                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${complete}'/>건
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
                                                        <div class="card-body state" id="back" onclick="location.href='/general/request_list?userId=${member.user_id}#tab3'" data-toggle="tab">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div
                                                                        class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
                                                                        반려</div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                        <c:out value='${back}'/>건</div>
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
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-primary"></i> 대기
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-success"></i> 승인
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-secondary"></i> 반려
                                                </span>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>

                        </div>
                        <!-- /.container-fluid -->

                    </div>
                </div>  
                <!-- 메인 끝 -->
            <script>
            var button1 = document.getElementById("ad_icon1");
            var button2 = document.getElementById("ad_icon2");
            var button3 = document.getElementById("ad_icon3");
            button1.onclick = function(event) {
            	location.href = "myinfo?userId="+${member.user_id}
            }
            button2.onclick = function(event) {
            	location.href = "approver_list?userId="+${member.user_id}
              }
            button3.onclick = function(event) {
            	location.href = "request_list?userId="+${member.user_id}
              }
            
            Chart.defaults.global.defaultFontFamily = 'Nunito', '-apple-system,system-ui,BlinkMacSystemFont,"Segoe UI",Roboto,"Helvetica Neue",Arial,sans-serif';
			Chart.defaults.global.defaultFontColor = '#858796';
                var ctx = document.getElementById("myPieChart");
                var myPieChart = new Chart(ctx, {
                  type: 'doughnut',
                  data: {
                    labels: ["진행중", "완료", "반려"],
                    datasets: [{
                      data: [<c:out value='${progress}'/>, <c:out value='${complete}'/>, <c:out value='${back}'/>],
                      backgroundColor: ['#4e73df', '#1cc88a', '#858796'],
                      hoverBackgroundColor: ['#2e59d9', '#17a673', '#2c9faf'],
                      hoverBorderColor: "rgba(234, 236, 244, 1)",
                    }],
                  },
                  options: {
                    maintainAspectRatio: false,
                    tooltips: {
                      backgroundColor: "rgb(255,255,255)",
                      bodyFontColor: "#858796",
                      borderColor: '#dddfeb',
                      borderWidth: 1,
                      xPadding: 15,
                      yPadding: 15,
                      displayColors: false,
                      caretPadding: 10,
                    },
                    legend: {
                      display: false
                    },
                    cutoutPercentage: 80,
                  },
                });
                
                $("#ing").hover(function(){
                	$(".ing i").remove();
                	$(".ing").append("<i class='fas fa-hourglass-half fa-2x fa-spin text-primary'></i>");
                },function(){
                	$(".ing i").remove();
                	$(".ing").append("<i class='fas fa-hourglass-half fa-2x text-primary'></i>");
                }); 
                
                 
                 $("#complete").hover(function(){
                 	$(".complete i").remove();
                 	$(".complete").append(" <i class='fas fa-check fa-2x fa-bounce text-success'></i>");
                 },function(){
                 	$(".complete i").remove();
                 	$(".complete").append(" <i class='fas fa-check fa-2x text-success'></i>");
                 }); 
                
                 
                 $("#back").hover(function(){
                 	$(".back i").remove();
                 	$(".back").append("<i class='fa fa-reply fa-2x fa-flip text-secondary'></i>");
                 },function(){
                 	$(".back i").remove();
                 	$(".back").append("<i class='fa fa-reply fa-2x text-secondary'></i>");
                 }); 
                
            </script>
            <!-- End of Main Content -->
	<page:applyDecorator name="footer" />
</body>
</html>