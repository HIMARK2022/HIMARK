<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인자 리스트(승인자)</title>
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
                                        <th id="date">승인 기간</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>고현욱</td>
                                        <td>마케팅본부</td>
                                        <td>영업부</td>
                                        <td>마케팅팀 1</td>
                                        <td>팀장</td>
                                        <td>
                                            <span data-toggle="tooltip" data-placement="top" title="권한1 권한2 권한3 권한4 권한5 권한6">팀장급</span>
                                        </td>

                                        <td>-</td>
                                    </tr>
                                    <tr>
                                        <td>김수진</td>
                                        <td>마케팅본부</td>
                                        <td>영업부</td>
                                        <td>마케팅팀 1</td>
                                        <td>팀장</td>
                                        <td>
                                            <span data-toggle="tooltip" data-placement="top" title="권한1 권한2 권한3">팀장급</span>
                                        </td>

                                        <td>2022/03/11~2022/03/14</td>
                                    </tr>
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
<script src="resources/js/request.js"></script>
</body>
</html>