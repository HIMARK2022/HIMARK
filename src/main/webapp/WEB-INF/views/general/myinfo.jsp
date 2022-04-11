<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 - 승인자</title>
<link href="/resources/css/myinfo.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
       <page:applyDecorator name="generalSide" />
        <!-- End of Topbar 헤더 끝 -->
<!-- 메인 시작 -->
                <div class="container-fluid" >
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">나의정보</h1>
                    </div>
                    <p class="mb-4"><b>본인의 정보를 확인하고 비밀번호를 수정할 수 있습니다.</b></p>
                
                    <!-- 여기는 직원추가 -->
                    <div class="card shadow mb-4" >
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary" >나의 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="row">
                                
                                
                                <div class="col-lg-12" >
                                    <table  class="table table-bordered" id="table" cellspacing="0">
                                        <tr>
                                            <th class="col-lg-3  col-md-3">이름</th>
                                            <td>
                                                 ${member.user_name}   
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <th >직급</th>
                                            <td>
                                                ${member.pos_name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th >직책</th>
                                            <td>
                                                ${member.duty_name}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>부서(본부/부서/팀)</th>
                                            <td>
                                               ${member.head} ${member.depart} ${member.team}
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td >
                                               ${member.birth_date}
                                            </td>
                                          </tr>
                                          <tr>
                                            <th >성별</th>
                                            <td >
                                              ${member.sex}
                                            </td>
                                          </tr>
                                          <tr>
                                            <th >휴대폰 번호</th>
                                            <td >
                                             ${member.phone_number}
                                            </td>
                                          </tr>
                                    </table>
                                    
                                </div>
                                
                            </div>
                            
                        </div>
                        
                    </div>
                    <!-- 여기는 직원추가 -->
                </div>

                <!-- 메인 끝 -->
            </div>
            <!-- End of Main Content -->
	<page:applyDecorator name="footer" />
        <script src="/resources/js/member.js"></script>
</body>
</html>