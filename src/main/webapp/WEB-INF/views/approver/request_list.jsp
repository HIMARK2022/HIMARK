<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 목록(승인자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/approver_side.jsp"%>
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

                    <div class="card shadow mb-4">
                        <div class="tab-content">
                            <!-- 결재 완료 Start -->
                                <div class="tab-pane fade show active" id="tab1">
                                    <div class="card-body">
                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                     <tr>
                                                     <th id="No" width="5%">No</th>
													<th id="classification" width="15%">분류</th>
													<th id="title" width="30%">제목</th>
													<th id="requestdate" width="15%">요청일</th>
													<th id="completedate" width="15%">승인일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <c:forEach var="list" items="${cpayment}">
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
                                                  
                                                  <th id="No" width="5%">No</th>
												<th id="classification" width="15%">분류</th>
												<th id="title" width="30%">제목</th>
												<th id="requestdate" width="15%">요청일</th>
												<th id="finishdate" width="15%">반려일</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="list" items="${bpayment}">
                                                <tr>
                                                   	<td>${list.requestNo}</td>
													<td>${list.category}</td>
													<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
													<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /> </td>
													<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
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
        <%@include file="../sidebar/footer.jsp"%>
        <script src="/resources/js/request.js"></script>
</body>
</html>