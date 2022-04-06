<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>일반사용자 사이드바</title>
<link
	href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i" rel="stylesheet">

<!-- new fontawesome -->
<script src="https://kit.fontawesome.com/e8c5575acc.js" crossorigin="anonymous"></script>

<!-- Custom styles for this template -->
<link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">

<!-- Custom styles for this page -->
<link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">

<!-- jQuery -->
<script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>

<!-- calendar -->
<link type="text/css"
	href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css" rel="stylesheet" />
<script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

<link href="/resources/css/general_side.css" rel="stylesheet">
</head>
<body>


	  <!-- Sidebar 사이드바-->
        <ul class="navbar-nav bg-gradient-primary sidebar sidebar-dark accordion" id="accordionSidebar">

            <!-- Sidebar - Brand -->
            <a class="sidebar-brand d-flex align-items-center justify-content-center" href="/general/home">
                <div class="sidebar-brand-icon rotate-n-15">
                    <i class="fas fa-laugh-wink"></i>
                </div>
                <div class="sidebar-brand-text mx-3">Hi Mark!</div>
            </a>

		<!-- Divider -->
		<hr class="sidebar-divider">

		<!-- Heading -->
		<div class="sidebar-heading">General</div>

		<!-- Nav Item - Dashboard -->

		<li class="nav-item"><a class="nav-link" href="#"> <i
				class="fa-solid fa-address-book"></i> <span>나의 정보</span></a></li>
		<li class="nav-item"><a class="nav-link" href="/general/approver_list?userId=${member.userId}"> <i
				class="fa-solid fa-users"></i> <span>나의 승인자</span></a></li>



		<li class="nav-item"><a class="nav-link collapsed" href="#"
			data-toggle="collapse" data-target="#collapseUtilities"
			aria-expanded="true" aria-controls="collapseUtilities"> <i
				class="fa-solid fa-list-ol"></i> <span>결재 상신</span>
		</a>
			<div id="collapseUtilities" class="collapse"
				aria-labelledby="headingUtilities" data-parent="#accordionSidebar">
				<div class="bg-white py-2 collapse-inner rounded">
					 <a class="collapse-item" href="/general/request?userId=${member.userId}">요청작성</a>
                        <a class="collapse-item" href="/general/request_list?userId=${member.userId}">요청목록</a>
				</div>
			</div></li>

		<!-- Divider -->
		<hr class="sidebar-divider d-none d-md-block">

		<!-- Sidebar Toggler (Sidebar) -->
		<div class="text-center d-none d-md-inline">
			<button class="rounded-circle border-0" id="sidebarToggle"></button>
		</div>

	</ul>
	<!-- End of Sidebar 사이드바 끝-->

	<!-- Content Wrapper 바디-->
	<div id="content-wrapper" class="d-flex flex-column">

		<!-- Main Content -->
		<div id="content">

			<!-- Topbar 헤더 -->
			<nav
				class="navbar navbar-expand navbar-light bg-white topbar mb-4 static-top shadow">

				 <b id="date"></b>

				<!-- Topbar Navbar -->
				<ul class="navbar-nav ml-auto">
				


					<div class="topbar-divider d-none d-sm-block"></div>

					<!-- Nav Item - User Information -->
					<li class="nav-item dropdown no-arrow"><a
						class="nav-link dropdown-toggle" href="#" id="userDropdown"
						role="button" data-toggle="dropdown" aria-haspopup="true"
						aria-expanded="false"> <span
							class="mr-2 d-none d-lg-inline text-gray-600 small">${member.userName}(일반사용자)</span> 
							<span class="mr-1 text-gray-600"><i class="fa-solid fa-user fa-lg"></i></span>
					</a> <!-- Dropdown - User Information -->
						<div
							class="dropdown-menu dropdown-menu-right shadow animated--grow-in"
							aria-labelledby="userDropdown">

							<a class="dropdown-item" href="#" id="logout"> 
							<i class="fas fa-sign-out-alt fa-sm fa-fw mr-2 text-gray-400"></i>
								Logout
							</a>
						</div></li>

				</ul>

			</nav>
			<!-- End of Topbar 헤더 끝 -->
			<script>
				var today = new Date();
				var year = today.getFullYear();
				var month = ('0' + (today.getMonth() + 1)).slice(-2);
				var day = ('0' + today.getDate()).slice(-2);
				var week = new Array('일','월','화','수','목','금','토');
				
				var dateString ="<b>"+ year + '년 ' + month  + '월 ' + day +'일 '+week[today.getDay()]+"요일" + "</b>";
				$("#date").append(dateString);
				
				$("#logout").click(function() {
					if(confirm('로그아웃 하시겠습니까?')) {
						window.location.replace('/logout');
					}
				});
				
			</script>
</body>
</html>