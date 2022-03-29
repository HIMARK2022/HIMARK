<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
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
        <%@include file="../sidebar/approver_side.jsp"%>
        <!-- End of Topbar 헤더 끝 -->
        <!-- Begin Page Content -->
                <div class="container-fluid">

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
                                            fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                            <path fill-rule="evenodd"
                                                d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                        </svg>
                                    </div>
                                    <div class="profile">
                                        <b>${member.userName }</b> /  ${member.duty } <p class="text-xs font-weight-bold text-primary"
                                            style="float: right; margin-top: 20px;">(승인자)</p><br> ${member.dept }&nbsp;
                                    </div>
                                    </p>
                                    <br>
                                     <p><b>아이디</b> ${member.userId }</p>
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
                                        <table class="table table-bordered bg-primary text-white" id="dataTable topbar"
                                            width="100%" cellspacing="0">
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
                                    <h6 class="m-0 font-weight-bold text-primary">나의 요청 </h6>
                                </div>
                                <div class="card-body" id="request" style="padding: 1em;">
                                    <div class="row">
                                        <div class="col-lg-4 mb-2">
                                            <div class="card border shadow h-100">
                                                <div class="card-body state" onclick="location.href='/approver/request?userId=${member.userId}'">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div
                                                                class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                                진행중</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${progress}'/>건</div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-hourglass-half fa-2x text-primary"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                            <div class="col-lg-4 mb-2">
                                                <div class="card border shadow h-100 ">
                                                    <div class="card-body state" onclick="location.href='/approver/request_list?userId=${member.userId}'">
                                                        <div class="row no-gutters align-items-center">
                                                            <div class="col mr-2">
                                                                <div
                                                                    class="text-sm font-weight-bold text-success text-uppercase mb-1">
                                                                    완료</div>
                                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${complete}'/>건
                                                                </div>
                                                            </div>
                                                            <div class="col-auto">
                                                                <i class="fas fa-check fa-2x text-success"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                           </div>

                                                <div class="col-lg-4 mb-2">
                                                    <div class="card border shadow h-100">
                                                        <div class="card-body state" onclick="location.href='/approver/request_list?userId=${member.userId}'">
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div
                                                                        class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
                                                                        반려</div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                        <c:out value='${back}'/>건</div>
                                                                </div>
                                                                <div class="col-auto">
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
                                                    <i class="fas fa-circle text-primary"></i> 진행중
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-success"></i> 완료
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
                                                <div class="card-body state" onclick="location.href='/approver/payment?userId=${member.userId}'">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div
                                                                class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                                진행중</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${gprogress}'/>건
                                                            </div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-hourglass-half fa-2x text-primary"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 mb-2">
                                            <div class="card border shadow h-100 ">
                                                <div class="card-body state" onclick="location.href='/approver/payment?userId=${member.userId}'">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div
                                                                class="text-sm font-weight-bold text-success text-uppercase mb-1">
                                                                완료</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${gcomplete}'/>건
                                                            </div>
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-check fa-2x text-success"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                        <div class="col-lg-4 mb-2">
                                            <div class="card border shadow h-100">
                                                <div class="card-body state" onclick="location.href='/approver/payment?userId=${member.userId}'">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div
                                                                class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
                                                                반려</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                <c:out value='${gback}'/>건</div>
                                                        </div>
                                                        <div class="col-auto">
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
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-primary"></i> 진행중
                                                </span>
                                                <span class="mr-2">
                                                    <i class="fas fa-circle text-success"></i> 완료
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
                    <!-- 승인자 목록 End -->
                    <!-- /.container-fluid -->

                </div>
                <!-- End of Main Content -->
                <script>
             // Pie Chart Example
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

                var ctx = document.getElementById("myPieChart2");
                var myPieChart = new Chart(ctx, {
                  type: 'doughnut',
                  data: {
                    labels: ["진행중", "완료", "반려"],
                    datasets: [{
                      data:  [<c:out value='${gprogress}'/>, <c:out value='${gcomplete}'/>, <c:out value='${gback}'/>],
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
                </script>
	<%@include file="../sidebar/footer.jsp"%>

</body>
</html>