<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../sidebar/admin_side.jsp"%>
<link href="/resources/css/admin_modify.css" rel="stylesheet">

                <!-- 메인 시작 -->
                <div class="container-fluid" >
                    <h1 class="h3 mb-2 text-gray-800">직원 정보 수정하기</h1>
                    <p class="mb-4"><b>직원의 기본정보와 사내정보를 수정하는 페이지입니다.</b></p>
                  
                    <!-- 여기는 직원추가 -->
                    <div class="card-body">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link py-3 shadow active" data-toggle="tab" href="#tab1">
                                    <h6 class="m-0 font-weight-bold text-primary">기본 정보 수정</h6>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link py-3 shadow" data-toggle="tab" href="#tab2">
                                    <h6 class="m-0 font-weight-bold text-primary">사내 정보 수정</h6>
                                </a>
                            </li>
                        </ul>
                        <div class="card shadow mb-4">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="tab1">
                                    
                                    <div style="padding: 3%;" >
                                        <div class="row">
                                            <div  style="text-align: center" class="col-lg-3 col-md-8" >
                                                <form>
                                                    <figure >
                                                        <img class="img-circle img-responsive " alt="" src="/resources/img/undraw_profile.svg">
                                                    </figure>
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
                                                    
                                                </form>
                                            
                                            </div>
                                            <br>
                                            <div class="col-lg-9" >
                                                <table class="table table-bordered" id="dataTable" cellspacing="0" >
                                                    <tr>
                                                        <th >이름</th>
                                                        <td>
                                                            <div class="col-lg-4">
                                                                <input type="text" class="form-control bg-light border-0 small" placeholder="김찬호"
                                                                    aria-label="Search" aria-describedby="basic-addon2">
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                      <th >생년월일</th>
                                                      <td >
                                                        <div class="form-inline col-lg-8">
                                                            <select name="year" id="year" title="년도" class="form-control" ></select><span id="birthlast"> 년 </span>
                                                            <select name="month" id="month" title="월" class="form-control"></select><span id="birthlast"> 월 </span>
                                                            <select name="day" id="day" title="일" class="form-control"></select><span id="birthlast"> 일 </span>
                                                        </div>
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                      <th >성별</th>
                                                      <td >
                                                        <div class="col-lg-4">
                                                            <div class="form-check-inline">
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptionSex" id="inlineRadiosex1" value="male">
                                                                <label class="form-check-label" for="inlineRadiosex1">남자</label>
                                                            </div>
                                                            <div class="form-check-inline">
                                                                <input class="form-check-input" type="radio" name="inlineRadioOptionSex" id="inlineRadiosex2" value="female">
                                                                <label class="form-check-label" for="inlineRadiosex2">여자</label>
                                                            </div>
                                                        </div>
                                                        
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                      <th >휴대폰 번호</th>
                                                      <td >
                                                        <div class="col-lg-4" >
                                                            <input type="text" class="form-control bg-light border-0 small" placeholder="010-4401-9611"
                                                                aria-label="Search" aria-describedby="basic-addon2">
                                                        </div>
                                                      </td>
                                                    </tr>
                                                </table>
                                            </div>
                                           
                                        </div>
                                        <br>
                                        <div class="twobuttons" >
                                            <a href="../직원관리/직원정보관리.html" class="btn btn-outline-success btn-lg btn-icon-split">
                                                <span class="icon text-gray-600">
                                                    <i class="fas fa-arrow-right"></i>
                                                </span>    
                                                <span class="text">홈화면 이동</span>
                                            </a>
                                            
                                            <a href="#" class="btn btn-outline-primary btn-lg btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">저장하기</span>
                                            </a>
                                        </div>      
                                        
                                    </div>
                                    
                                    
                                </div>
                                <div class="tab-pane fade show" id="tab2">
                                    <div style="padding: 3%;">
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            
                                            <tr>
                                                <th>직급</th>
                                                <td>
                                                    <div class="col-lg-4">
                                                        <input type="text" class="form-control bg-light border-0 small" placeholder="사원"
                                                            aria-label="Search" aria-describedby="basic-addon2">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >직책</th>
                                                <td>
                                                    <div class="col-lg-4">
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="option1">
                                                            <label class="form-check-label" for="inlineRadio1">일반사용자</label>
                                                        </div>
                                                        <div class="form-check form-check-inline">
                                                            <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="option2">
                                                            <label class="form-check-label" for="inlineRadio2">승인자(팀장)</label>
                                                        </div>
                                                        
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >이메일</th>
                                                <td >
                                                    <div class="col-lg-4" style="float: left;" >
                                                        <input type="text" class="form-control bg-light border-0 small" placeholder="chanho470@naver.com"
                                                            aria-label="Search" aria-describedby="basic-addon2">
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >비밀번호</th>
                                                <td>
                                                    <div class="input-group col-lg-4">
                                                        <input type="text" class="form-control bg-light border-0 small" placeholder="비밀번호를 입력하시오"
                                                            aria-label="Search" aria-describedby="basic-addon2">
                                                    </div>
                                                </td>
                                            </tr>
                                            <!-- <tr>
                                                <th>부서</th>
                                                <td>
                                                    <div class="form-inline col-lg-8">
                                                        <select class="form-select form-control col-lg-2" >
                                                            <option value="1" selected>사업부</option>
                                                            <option value="2">개발2</option>
                                                            <option value="3">개발3</option>
                                                            <option value="4">인사</option>
                                                            <option value="5">마케팅</option>
                                                        </select>
                                                        <select class="form-select form-control col-lg-2" >
                                                            <option value="1" selected>부서</option>
                                                            <option value="2">개발2</option>
                                                            <option value="3">개발3</option>
                                                            <option value="4">인사</option>
                                                            <option value="5">마케팅</option>
                                                        </select>
                                                    </div>
                                                    
                                                </td>
                                            </tr> -->
                                        </table>
                                        

                                        <div class="twobuttons" >
                                            <a href="../직원관리/직원정보관리.html" class="btn btn-outline-success btn-lg btn-icon-split">
                                                <span class="icon text-gray-600">
                                                    <i class="fas fa-arrow-right"></i>
                                                </span>    
                                                <span class="text">홈화면 이동</span>
                                            </a>
                                            
                                            <a href="#" class="btn btn-outline-primary btn-lg btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">저장하기</span>
                                            </a>
                                        </div> 
                                    </div>
                                
                                </div>
                            </div>
                        </div>
                    
                    </div>   
                        
                    <!-- 여기는 직원추가 -->
                </div>
                    
                <!-- 메인 끝 -->
	<%@include file="../sidebar/footer.jsp"%>
            </div>
	</div>
	<script src="/resources/js/birth.js"></script>
</body>
</html>