<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>     
 <%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>홈 - 관리자</title>
<link href="/resources/css/admin_home.css" rel="stylesheet">
  <script src="/resources/vendor/chart.js/Chart.min.js"></script>
</head>
<body id="page-top">
        <page:applyDecorator name="adminSide" />
                <div class="container-fluid">
                    <!-- Page Heading -->
                   
                       <div class="row">
                        <!-- 나의 정보 Start -->
                        <div class="col-xl-7 col-lg-7">
                            <div class="card shadow mb-4" style="height: 189px;">
                                <!-- Card Header - Dropdown -->
                                
                                <!-- Card Body -->
                                <div class="card-body" id="profile">
                                    
                                    <div class="pic">
                                        <svg xmlns="http://www.w3.org/2000/svg" width="100" height="100"
                                            fill="currentColor" class="bi bi-person-circle" viewBox="0 0 16 16">
                                            <path d="M11 6a3 3 0 1 1-6 0 3 3 0 0 1 6 0z" />
                                            <path fill-rule="evenodd"
                                                d="M0 8a8 8 0 1 1 16 0A8 8 0 0 1 0 8zm8-7a7 7 0 0 0-5.468 11.37C3.242 11.226 4.805 10 8 10s4.757 1.225 5.468 2.37A7 7 0 0 0 8 1z" />
                                        </svg>
                                    </div>
                                     <div class="profile">
                                   <b>관리자님</b><br>
                                    <b>새로운 하루가 시작됐어요! 오늘도 힘내세요 :)</b>
                                    </div>
                                </div>
                            </div>
                        </div>
                        <!-- 나의 정보 End -->

                         <div class="col-xl-5 col-lg-5">
                            <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">직원 현황 </h6>
                                </div>
                                <div class="card-body" id="request" style="padding: 1em;">
                                    <div class="row">
                                        <div class="col-lg-4 mb-2">
                                            <div class="card border shadow h-100">
                                                <div class="card-body state">
                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div id="progress" 
                                                                class="text-sm font-weight-bold text-primary text-uppercase mb-1">
                                                                추가</div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${sysinfo.adduser}'/>명</div>
                                                        </div>
                                                        <div class="col-auto ing">
                                             
                                                            <i class="fa-solid fa-user-plus fa-2x text-primary"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>

                                            <div class="col-lg-4 mb-2">
                                                <div class="card border shadow h-100 ">
                                                    <div class="card-body state" >
                                                        <div class="row no-gutters align-items-center">
                                                            <div class="col mr-2">
                                                                <div
                                                                    class="text-sm font-weight-bold text-success text-uppercase mb-1">
                                                                    재직</div>
                                                                <div class="h5 mb-0 font-weight-bold text-gray-800"><c:out value='${work}'/>명
                                                                </div>
                                                            </div>
                                                            <div class="col-auto complete">
                                                                             <i class="fa-solid fa-user-tie fa-2x text-success"></i>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                           </div>

                                                <div class="col-lg-4 mb-2">
                                                    <div class="card border shadow h-100">
                                                        <div class="card-body state" >
                                                            <div class="row no-gutters align-items-center">
                                                                <div class="col mr-2">
                                                                    <div
                                                                        class="text-sm font-weight-bold text-secondary text-uppercase mb-1">
                                                                        퇴직</div>
                                                                    <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                        <c:out value='${retire}'/>명</div>
                                                                </div>
                                                                <div class="col-auto back">
                                                                   
                                                                   <i class="fa-solid fa-user-slash fa-2x text-secondary"></i>
                                                                </div>
                                                            </div>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                        </div>
                                        </div>
                                        
                        <!-- 승인자 목록 Start -->
                       
					<div class="col-lg-12">

                           <div class="card shadow mb-4">
                                <div class="card-header py-3">
                                    <h6 class="m-0 font-weight-bold text-primary">인사연동결과</h6>
                                </div>
                                <div class="card-body">
                              <div class="row">
                                <div class="col-lg-6">
                                    <div class="text-center">
                                        <img class="img-fluid px-3 px-sm-4 mt-3 mb-4" style="width: 25rem;" src="/resources/img/undraw_completing_re_i7ap.svg" alt="...">
                                    </div>
                                    </div>
                              <div class="col-md-5 col-lg-5">
					         <c:set var="stime" value="${sysinfo.starttime}"/>
					         <c:set var="ftime" value="${sysinfo.endtime}"/>
					              <ul class="timeline">
									<li>
										<a href="#">인사연동 시작</a>
										
										<p><fmt:formatDate value="${stime}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/>  인사연동이 시작되었습니다. </p>
									</li>
									<li>
										<a target="_blank" href="#">직원</a>
										
										<p>직원 ${sysinfo.adduser }명이 추가되었습니다.<br>직원 ${sysinfo.moduser }명이 수정되었습니다.<br>직원 ${sysinfo.deluser }명이 삭제되었습니다.</p>
									</li>
									<li>
										<a href="#">부서</a>
										
										<p>부서 ${sysinfo.adddept }개가 추가되었습니다.<br>부서  ${sysinfo.moddept }개가 수정되었습니다.<br>부서  ${sysinfo.deldept }개가 삭제되었습니다.</p>
									</li>
								
									<li>
										<a href="#">인사연동 완료</a>
										
										<p>  <fmt:formatDate value="${ftime}" pattern="yyyy년 MM월 dd일 hh시 mm분 ss초"/> 인사연동이 완료되었습니다. </p>
									</li>
								</ul>
					               
					         
      
                                   </div>
                                   
                                    </div>
                                   
                                </div>
                            </div>
                            </div>
                            </div>
                            </div>
                            
                    <!-- 승인자 목록 End -->
         
                    <!-- /.container-fluid -->


                <!-- End of Main Content -->
            <script>
            var button1 = document.getElementById("ad_icon1");
            var button2 = document.getElementById("ad_icon2");
            var button3 = document.getElementById("ad_icon3");
            var button4 = document.getElementById("ad_icon4");
            /* button1.onclick = function(event) {
            	location.href = "add_employee"
            }
            button2.onclick = function(event) {
            	location.href = "modify_team"
              }
            button3.onclick = function(event) {
            	location.href = ""
              }
            button4.onclick = function(event) {
            	location.href = "manage_authority"
              } */
            
            </script>
         

            <page:applyDecorator name="footer" />
             

</body>
</html>