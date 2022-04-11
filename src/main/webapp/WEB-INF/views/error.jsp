<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    
    <style>
    	.err {
    		color: #5a5c69;
    	  	font-size: 4rem;
		    position: relative;
		    line-height: 1;
    	}  
    </style>
</head>
<body>
	
	<!-- Begin Page Content -->
	<div class="container-fluid">
		
		<!-- 404 Error Text -->
		<div class="text-center">
			<div class="err mx-auto">정상적인 접근이 아닙니다.</div>
			<br>
			<br>
			<br>
			<a href="javascript:history.back();">&larr; 이전 페이지로 돌아가기</a>
		</div>

	</div>
	<!-- /.container-fluid -->
	
	<!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>
	
	<script>
		$(document).ready(function() {
			var element_height = $(".container-fluid").height();
			$(".container-fluid").css("margin-top", "calc((100vh - " + element_height + "px)/2)");
		});
	</script>
</body>
</html>