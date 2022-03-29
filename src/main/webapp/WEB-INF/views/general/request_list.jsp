<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 목록(일반 사용자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/general_side.jsp"%>
        <!-- End of Topbar 헤더 끝 -->
        <!-- 목록.html -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">목록</h1>
                    <p class="mb-4">
                        결재 완료와 결재 반려를 확인 할 수 있습니다
                    </p>

                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow active" data-toggle="tab" href="#tab1">
                                <h6 class="m-0 font-weight-bold text-primary">결재 완료</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow " data-toggle="tab" href="#tab2">
                                <h6 class="m-0 font-weight-bold text-primary">결재 반려</h6>
                            </a>
                        </li>
                    </ul>
							<form id='actionForm2' action="/approver/request" method='get'>
								<input type='hidden' name='userId' value='${member.userId}'>
								<input type='hidden' name='userName' value='${member.userName}'>
							</form>

                    <div class="card shadow mb-4">
                        <div class="tab-content">
                            <!-- 결재 완료 Start -->
                                <div class="tab-pane fade show active" id="tab1">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                    	<th id="No">No</th>
				                                        <th id="classification">분류</th>
				                                        <th id="title">제목</th>
				                                        <th id="requestdate">요청일</th>
				                                        <th id="state">승인일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <c:forEach var="list" items="${clist}">
                                                <tr>
                                                   	<td>${list.requestNo}</td>
													<td>${list.category}</td>
													<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
													<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /> </td>
													<td><fmt:formatDate value="${list.cdate}" pattern="yyyy/MM/dd" /></td>
                                                </tr>
                                                </c:forEach>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            <!-- 결재 완료 End -->

                            <!-- 결재 반려 Start -->
                                <div class="tab-pane fade show" id="tab2">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
	                                                    <th id="No">No</th>
					                                    <th id="classification">분류</th>
					                                    <th id="title">제목</th>
					                                    <th id="requestdate">요청일</th>
					                                    <th id="refuse">반려일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                   <c:forEach var="list" items="${blist}">
                                                <tr>
                                                   	<td>${list.requestNo}</td>
													<td>${list.category}</td>
													<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
													<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /> </td>
													<td><fmt:formatDate value="${list.cdate}" pattern="yyyy/MM/dd" /></td>
                                                </tr>
                                                </c:forEach>
                                                    
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            <!-- 결재 반려 End -->
                            
                        </div>
                    </div>
                </div>
                <!-- 목록.html -->


            </div>
            <!-- End of Main Content -->
            <script>
var actionForm2 = $("#actionForm2");

$(".move").on("click",function(e) {
	console.log("click");
	e.preventDefault();
	actionForm2.find('#requestNo').remove();
	actionForm2.append("<input id='requestNo' type='hidden' name='requestNo' value='"
			+ $(this).attr("href") + "'>");
	
	actionForm2.attr("action", "/general/request_detail");
	actionForm2.submit();
});


$(function(){  
	console.log(location.hash);
	if (location.hash == "#tab1"){      
		$('.nav-tabs').find('a').eq(0).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab1').addClass('active show').siblings().removeClass('active show');   
		} 
	else if(location.hash == "#tab2"){    
		$('.nav-tabs').find('a').eq(0).addClass('active').removeClass();  
		$('.nav-tabs').find('li').eq(0).addClass('nav-link py-3 shadow');  
		$('.nav-tabs').find('a').eq(1).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab2').addClass('active show').siblings().removeClass('active show');    
		} 
	 	})
</script>

        <%@include file="../sidebar/footer.jsp"%>
        <script src="/resources/js/request.js"></script>
</body>
</html>