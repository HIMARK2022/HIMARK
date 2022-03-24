<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인자 리스트(일반사용자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/general_side.jsp"%>
        <!-- End of Topbar 헤더 끝 -->
 <!-- 승인자리스트.html -->
            <div class="container-fluid">
                <!-- Page Heading -->
                <h1 class="h3 mb-2 text-gray-800">승인자 리스트</h1>
                <p class="mb-4">
                    승인권한이 있는 승인자들과 현재 권한이 위임된 임시 승인자를 확인할 수 있습니다
                </p>
                    
                <!--승인자 목록 Start-->
                <div class="card shadow mb-4">
                    <div class="card-header py-3">
                        <h6 class="m-0 font-weight-bold text-primary">
                            승인자 목록
                        </h6>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                <thead>
                                    <tr>
                                        <th id="name">이름</th>
                                        <th id="headquarter">본부</th>
                                        <th id="department">부서</th>
                                        <th id="team">팀</th>
                                        <th id="position">직책</th>
                                        <th id="right">권한</th>
                  
                                    </tr>
                                </thead>
                                <tbody>
                                <c:forEach var="list" items="${list}">
                                    <tr>
                                        <td>{list.userName}</td>
                                        <td>{list.bonbu}</td>
                                        <td>{list.buseo}</td>
                                        <td>{list.team}</td>
                                        <td>{list.duty}</td>
                                        <td>
                                            <span data-toggle="tooltip" data-placement="top" title="권한1 권한2 권한3 권한4 권한5 권한6">팀장급</span>
                                        </td>
                                    </tr>
                                    </c:forEach>
                                    
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
                <script>
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    })
                </script>
                <!--승인자 목록 End -->
            </div>
            <!-- 승인자리스트.html -->

            <!-- End of Main Content -->
<%@include file="../sidebar/footer.jsp"%>
<script src="/resources/js/request.js"></script>
</body>
</html>