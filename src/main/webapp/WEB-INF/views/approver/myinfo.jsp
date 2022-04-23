<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
<link href="/resources/css/myinfo.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
       <page:applyDecorator name="approverSide" />
        <!-- End of Topbar 헤더 끝 -->
<!-- 메인 시작 -->
                <div class="container-fluid" >
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">나의정보</h1>
                    </div>
                    <p class="mb-4"><b>사용자의 정보를 확인하고 비밀번호를 재설정할 수 있는 페이지입니다.</b></p>
                
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
                                            <th >이메일</th>
                                            <td >
                                              ${member.email}
                                            </td>
                                          </tr>
                                          <tr>
                                            <th >휴대폰 번호</th>
                                            <td >
                                             ${member.phone_number}
                                            </td>
                                          </tr>
                                          <tr>
                                            <th>비밀번호</th>
                                            <td>
                                                <div class="myPwd">
                                                    <label>현재 비밀번호</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" value="${member.user_password}" class="form-control" placeholder="현재 비밀번호"> 
                                                    </div> 
                                                    <label>새로운 비밀번호</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" id="new_pwd" class="form-control pwd" placeholder="새로운 비밀번호"> 
                                                    </div> 
                                                    <label>비밀번호 확인</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" id="confirm_pwd" class="form-control pwd" placeholder="비밀번호 확인"> 
                                                    </div>
                                                    <div class="form-group">
                                                    	<span id="alert-success">비밀번호가 일치합니다.</span>
    													<span id="alert-danger">비밀번호가 일치하지 않습니다.</span>
                                                    </div>
                                                    <div id="pwd_btn" onclick="changePwd()">
                                                        <a href="#" class="btn btn-outline-warning" >
                                                            <span class="text">비밀번호 수정하기</span>
                                                        </a>
                                                    </div> 
                                                </div>
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