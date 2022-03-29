<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>add employee </title>
  	<link href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/vendor/datatables/dataTables.bootstrap4.min.css" rel="stylesheet">
    <link type="text/css" href="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/themes/base/jquery-ui.css"
        rel="stylesheet" />

    
    <script src="https://kit.fontawesome.com/e8c5575acc.js" crossorigin="anonymous"></script>
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script type="text/javascript" src="https://ajax.googleapis.com/ajax/libs/jqueryui/1.12.1/jquery-ui.min.js"></script>

    <link href="/resources/css/admin_add_employee.css" rel="stylesheet">
</head>
<body>
<%@include file="../sidebar/admin_side.jsp"%>
<div class="container-fluid" >
                    <h1 class="h3 mb-2 text-gray-800">직원 추가하기</h1>
                    <p class="mb-4"><b>직원의 기본정보와 사내정보를 입력하여 생성하는 페이지입니다.</b></p>
                  
                    <!-- 여기는 직원추가 -->
                    <div class="card-body">
                        <ul class="nav nav-tabs">
                            <li class="nav-item">
                                <a class="nav-link py-3 shadow active" data-toggle="tab" href="#tab1">
                                    <h6 class="m-0 font-weight-bold text-primary">기본 정보 입력</h6>
                                </a>
                            </li>
                            
                            <li class="nav-item">
                                <a class="nav-link py-3 shadow" data-toggle="tab" href="#tab2">
                                    <h6 class="m-0 font-weight-bold text-primary">사내 정보 입력</h6>
                                </a>
                            </li>
                        </ul>
                        <div class="card shadow mb-4">
                            <div class="tab-content">
                                <div class="tab-pane fade show active" id="tab1">
                                    
                                    <div style="padding: 3%;" >
                                        <div class="row">
                                            <br>
                                            <div class="col-lg-12" >
                                    <form action="/admin/add_employee_All" method="post" name="AddAll" id="AddAll">
                                                <table class="table table-bordered" id="dataTable" cellspacing="0" >
                                                    <tr>
                                                        <th >이름</th>
                                                        <td>
                                                            <div class="col-lg-4">
                                                                <input type="text" class="form-control bg-light border-0 small" placeholder="이름을 입력하시오"
                                                                    aria-label="Search" aria-describedby="basic-addon2" name="user_name" required>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                    
                                                    <tr>
                                                      <th >생년월일</th>
                                                      <td >
                                                        <div class="form-inline col-lg-8">
                                                            <select required name="year" id="year" title="년도" class="form-control" ></select><span id="birthlast"> 년 </span>
                                                            <select required name="month" id="month" title="월" class="form-control"></select><span id="birthlast"> 월 </span>
                                                            <select required name="day" id="day" title="일" class="form-control"></select><span id="birthlast"> 일 </span>
                                                        </div>
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                      <th >성별</th>
                                                      <td >
                                                        <div class="col-lg-4">
                                                            <div class="form-check-inline">
                                                                
                                                                <label class="form-check-label" for="inlineRadiosex1">
                                                                	<input class="form-check-input" type="radio"id="inlineRadiosex1" value="남" name="sex" required>
                                                                	남자
                                                                </label>
                                                            </div>
                                                            <div class="form-check-inline">
                                                                
                                                                <label class="form-check-label" for="inlineRadiosex2">
                                                                	<input class="form-check-input" type="radio" id="inlineRadiosex2" value="여" name="sex" >
                                                                	여자
                                                                </label>
                                                            </div>
                                                        </div>
                                                        
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                      <th >휴대폰 번호</th>
                                                      <td >
                                                        <div class="col-lg-4" >
                                                            <input type="text" class="form-control bg-light border-0 small" placeholder="전화번호를 입력하시오"
                                                                aria-label="Search" aria-describedby="basic-addon2" name="phone" required>
                                                        </div>
                                                      </td>
                                                    </tr>
                                                    <tr>
                                                        <th >이메일</th>
                                                        <td >
                                                            <div class="col-lg-4" style="float: left;" >
                                                                <input type="text" class="form-control bg-light border-0 small" placeholder="이메일을 입력하세요"
                                                                    aria-label="Search" aria-describedby="basic-addon2" name="email" required>
                                                            </div>
                                                        </td>
                                                    </tr>
                                                </table>
                                                
                                            </div>
                                           
                                        </div>
                                        
                                    </div>
                                    
                                    
                                </div>
                                <div class="tab-pane fade show" id="tab2">
                                    <div style="padding: 3%;">
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            
                                            <tr>
                                                <th >직책</th>
                                                <td>
                                                    <div class="col-lg-4">
                                                    	<select class="form-select form-control col-lg-5" name="duty" required>
                                                        	<c:forEach  var="duty" items="${duty}">
                                                           		<option value="${duty.duty_id}" >${duty.duty_name}</option>                                                    
                                                        	</c:forEach>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >직급</th>
                                                <td>
                                                    <div class="col-lg-4">
                                                        <select class="form-select form-control col-lg-5"  name="pos" required>
                                                        <c:forEach  var="pos" items="${pos}">
                                                            <option value="${pos.pos_id}" >${pos.pos_name}</option>  
                                                        </c:forEach>
                                                        </select>
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>소속</th>
                                                <td>
                                                    <div class="input-group col-lg-4">
                                                       <select class="form-select form-control col-lg-5"  name="dept" required>
	                                                        <c:forEach  var="dept" items="${dept}">
	                                                            <option value="${dept.dept_id}" >${dept.dept_name}</option>  
	                                                        </c:forEach>
                                                        </select>
                                                    </div>	
                                                </td>
                                            </tr>
                                        </table>
                                        
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            <tr>
                                                <th >아이디</th>
                                                <td>
                                                    <div class="input-group col-lg-4">
                                                        <input type="text" class="form-control bg-light border-0 small" value="아이디는 규칙에 입각해 자동생성 됩니다" readonly 
                                                            aria-label="Search" aria-describedby="basic-addon2" name="user_id" >
                                                    </div>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >비밀번호</th>
                                                <td>
                                                    <div class="input-group col-lg-4">
                                                        <input type="text" class="form-control bg-light border-0 small" value="비밀번호는 규칙에 입각해 자동생성 됩니다" readonly
                                                            aria-label="Search" aria-describedby="basic-addon2" name="user_pwd">
                                                    </div>
                                                </td>
                                            </tr>
                                           
                                        </table>

                                        <div class="twobuttons" >
                                            <a href="/admin/home" class="btn btn-outline-success btn-lg btn-icon-split">
                                                <span class="icon text-gray-600">
                                                    <i class="fas fa-arrow-right"></i>
                                                </span>    
                                                <span class="text">홈화면 이동</span>
                                            </a>
                                            
                                           <!--  <a href="#" class="btn btn-outline-primary btn-lg btn-icon-split" id="saveAll">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">저장하기</span>
                                            </a> -->
                                            <button type="submit" class="btn btn-outline-primary btn-lg btn-icon-split"><span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">저장하기</span>
                                            </button>
                                        </div> 
                                    </div>
                                </form>
                                </div>
                            </div>
                        </div>
                    
                    </div>   
                        
                    </div>
                    <!-- 여기는 직원추가 -->
              </div>   
 <%@include file="../sidebar/footer.jsp"%>

<script src="/resources/js/birth.js"></script>
<script>
/* $("#saveAll").click(function(){
    $("#AddAll").submit();
}); */
</script>
	
</body>
</html>