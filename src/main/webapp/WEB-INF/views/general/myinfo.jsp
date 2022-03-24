<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>나의 정보 - 일반 사용자</title>
<link href="resources/css/myinfo.css" rel="stylesheet">

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/general_side.jsp"%>
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
                                <div class="col-lg-4" style="text-align: center;padding: 2%;">
                                    <img class="img-circle img-responsive" alt="" src="resources/img/undraw_profile.svg" width="70%">
                                    <div style="margin-top: 10%;">
                                        <a href="#" class="btn btn-outline-danger btn-icon-split" >
                                            <span class="icon text-white-50">
                                                <i class="fas fa-trash"></i>
                                            </span>
                                            <span class="text">초기화</span>
                                        </a>
                                        <a href="#" class="btn btn-outline-primary btn-icon-split" >
                                            <span class="icon text-white-50">
                                                <i class="fas fa-upload"></i>
                                            </span>
                                            <span class="text">업로드</span>
                                        </a>
                                    </div>
                                </div>
                                
                                <div class="col-lg-8" >
                                    <table  class="table table-bordered" id="table" cellspacing="0">
                                        <tr>
                                            <th class="col-lg-3  col-md-3">이름</th>
                                            <td>
                                                김찬호
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <th >직급</th>
                                            <td>
                                                사원
                                            </td>
                                        </tr>
                                        <tr>
                                            <th >직책</th>
                                            <td>
                                                일반사용자
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>부서(사업부/부서/팀)</th>
                                            <td>
                                                비트학원/마크애니/개발1팀
                                            </td>
                                        </tr>
                                        <tr>
                                            <th>생년월일</th>
                                            <td >
                                              1995년 9월 13일
                                            </td>
                                          </tr>
                                          <tr>
                                            <th >성별</th>
                                            <td >
                                              남
                                            </td>
                                          </tr>
                                          <tr>
                                            <th >휴대폰 번호</th>
                                            <td >
                                              010-4401-9611
                                            </td>
                                          </tr>
                                    </table>
                                    
                                </div>
                                <div class="col-lg-12" >
                                    <table  class="table table-bordered"  cellspacing="0" id="table1">
                                        <tr>
                                            <th class="col-lg-3  col-md-3">아이디</th>
                                            <td>
                                                chanho470
                                            </td>
                                        </tr>
                                       
                                        <tr>
                                            <th>비밀번호</th>
                                            <td>
                                                <div class="myPwd">
                                                    <label>현재 비밀번호</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" value="12345678" class="form-control" placeholder="Current Password"> 
                                                    </div> 
                                                    <label>새로운 비밀번호</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" value="" class="form-control" placeholder="New Password"> 
                                                    </div> 
                                                    <label>비밀번호 확인</label>
                                                    <div class="form-group pass_show"> 
                                                        <input type="password" value="" class="form-control" placeholder="Confirm Password"> 
                                                    </div>
                                                    <div id="pwd_btn">
                                                        <a href="#" class="btn btn-outline-warning" >
                                                            <span class="text">비밀번호 수정하기</span>
                                                        </a>
                                                    </div> 
                                                </div>
                                            </td>
                                        </tr>
                                        
                                    </table>
                                    <div id="tohomebtn">
                                        <a href="#" class="btn btn-outline-success btn-lg btn-icon-split">
                                            <span class="icon text-gray-600">
                                                <i class="fas fa-arrow-right"></i>
                                            </span>    
                                            <span class="text">홈화면 이동</span>
                                        </a>
                                    </div>
                                </div>
                            </div>
                            
                        </div>
                        
                    </div>
                    <!-- 여기는 직원추가 -->
                </div>

                <!-- 메인 끝 -->
            </div>
            <!-- End of Main Content -->
        <%@include file="../sidebar/footer.jsp"%>
  
        <script src="resources/js/member.js"></script>
</body>
</html>