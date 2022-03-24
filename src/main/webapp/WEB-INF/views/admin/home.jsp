<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 - 관리자</title>
<link href="/resources/css/admin_home.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/admin_side.jsp"%>
        <!-- End of Topbar 헤더 끝 -->
<!-- 메인 시작 -->
                <div class="container-fluid">
                    <!-- Page Heading -->
                    <div class="d-sm-flex align-items-center justify-content-between mb-0">
                        <h1 class="h3 mb-0 text-gray-800">Home | 관리자</h1>
                    </div>
                    <section class="services py-3 bg-light1 text-center">
                        <div class="container">
                            <div class="row">
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <a href="#" class="text-body">
                                        <div class="card bg-light mb-3">
                                            <div class="card-body">
                                                <i class="fa fa-id-card-o fa-4x" id="ad_icon" aria-hidden="true"></i></br>
                                                <h5>직원 관리</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <a href="#" class="text-body">
                                        <div class="card bg-light mb-3">
                                            <div class="card-body">
                                                <i class="fa fa-list-alt fa-4x " id="ad_icon2" aria-hidden="true"></i></br>
                                                <h5>팀 관리</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <a href="#" class="text-body">
                                        <div class="card bg-light mb-3">
                                            <div class="card-body">
                                                <img src="/resources/img/manager.png" id="ad_icon" style="width: 74px; height: 64px; opacity: 0.5;"></img></br>
                                                <h5>임시승인자 관리</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                                
                                <div class="col-xs-12 col-sm-6 col-md-3">
                                    <a href="#" class="text-body">
                                        <div class="card bg-light mb-3">
                                            <div class="card-body">
                                                <img src="/resources/img/authority.png" id="ad_icon" style="width: 74px; height: 64px; opacity: 0.8;"></img></br>
                                                <h5>권한 관리</h5>
                                            </div>
                                        </div>
                                    </a>
                                </div>
                            </div>
                        </div>
                    </section>
                <div class="row">
                    <!-- 나의 정보 Start -->
                    <div class="col-xl-12 col-lg-12">
                        <div class="card shadow mb-4">
                            <div class="card-body" id="admin_card" style="height: 700px;">


                                <div class="tree">
                                    <ul>
                                        <li>
                                            <a href="#">대표이사</a>
                                            <ul>
                                                <li>
                                                    <a href="#">경영지원실</a>

                                                </li>

                                                <li>

                                                    <ul>
                                                        <li><a href="#">개발본부</a>
                                                            <ul>
                                                                <li>
                                                                    <a href="#">연구개발팀</a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">기술팀</a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">솔루션팀</a>
                                                                </li>
                                                            </ul>
                                                        </li>
                                                        <li>
                                                            <a href="#">사업본부</a>
                                                            <ul>
                                                                <li>
                                                                    <a href="#">사업기획팀</a>
                                                                </li>
                                                                <li>
                                                                    <a href="#">영업팀</a>
                                                                </li>

                                                            </ul>
                                                        </li>
                                                        <!-- <li><a href="#">마케팅본부</a></li> -->
                                                    </ul>
                                                </li>
                                            </ul>
                                        </li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- /.container-fluid -->

                </div>
                <!-- 메인 끝 -->
            </div>
            <!-- End of Main Content -->
                        <%@include file="../sidebar/footer.jsp"%>
</body>
</html>