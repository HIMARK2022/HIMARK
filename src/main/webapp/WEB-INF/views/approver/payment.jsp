<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

<script>
	function getUser(requestNo){
		var user;
		$.ajax({
			url:"/general/getUser",
			type:"get",
			dataType : 'json',
			async:false,
			data :{requestNo:requestNo},
			success : function(result){
				user = result[0];
			}
		})
				console.log(user);
		
		 document.getElementById(requestNo).innerHTML = user;
	}
	</script>

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <page:applyDecorator name="approverSide" />
        <!-- End of Topbar 헤더 끝 -->
 <!-- 결재.html -->
                <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">결재 수신</h1>
                    <p class="mb-4">
                        <b>사용자가 결재 요청받은 문서들이 관리되는 페이지입니다</b>
                        <br>※대기함: 사용자가 결재하기 전 문서
                        <br>※승인함: 사용자가 승인한 문서
                        <br>※반려함: 사용자가 반려한 문서
                    </p>

                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow active" data-toggle="tab" href="#tab1">
                                <h6 class="m-0 font-weight-bold text-primary">대기함</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow" data-toggle="tab" href="#tab2">
                                <h6 class="m-0 font-weight-bold text-primary">승인함</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow" data-toggle="tab" href="#tab3">
                                <h6 class="m-0 font-weight-bold text-primary">반려함</h6>
                            </a>
                        </li>
                    </ul>

                    <div class="card shadow mb-4">
                        <div class="tab-content">
                            <!-- 결재 문서 Start -->
                            <div class="tab-pane fade show active" id="tab1">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th id="No">문서번호</th>
											<th id="classification" >분류</th>
											<th id="title" >제목</th>
											<th id="requestdate" >요청일</th>
											<th id="finishdate" >마감일</th>
											<th id="manager">요청자</th>
											<th id="state" >상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                            <c:forEach var="list" items="${rpayment}">
                                                <tr>
                                                   	<td>${list.requestNo}</td>
												<td>${list.category}</td>
												<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
												<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /></td>
												<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
												<td id='${list.requestNo}'>
														<script type="text/javascript">
														
															getUser('${list.requestNo}')</script></td>
												<td>${list.state}</td>
                                                </tr>
                                                </c:forEach>
                                               
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            
                            <form id='actionForm2' action="/approver/request" method='get'>
								<input type='hidden' name='user_id' value='${member.user_id}'>
								<input type='hidden' name='user_name' value='${member.user_name}'>
							</form>
                            <!-- 결재 문서 End -->

                            <!-- 결재 완료 Start -->
                            <div class="tab-pane fade show" id="tab2">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                    <th id="No" >문서번호</th>
													<th id="classification">분류</th>
													<th id="title">제목</th>
													<th id="requestdate">요청일</th>
													<th id="finishdate" >승인일</th>
													<th id="manager" >요청자</th>
													<th id="state" >상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                 <c:forEach var="list" items="${cpayment}">
                                                <tr>
                                                   <td>${list.requestNo}</td>
												<td>${list.category}</td>
												<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
												<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /></td>
												<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
												<td id='${list.requestNo}'>
														<script type="text/javascript">
														
															getUser('${list.requestNo}')</script></td>
												<td>${list.state}</td>
                                                </tr>
                                                </c:forEach>
                                                
                                            </tbody>
                                        </table>
                                    </div>
                                </div>
                            </div>
                            <!-- 결재 완료 End -->
                            
                            <!-- 결재 반려 Start -->
                            <div class="tab-pane fade show" id="tab3">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable2" width="100%" cellspacing="0">
                                            <thead>
                                                <tr>
                                                 <th id="No" >문서번호</th>
											<th id="classification" >분류</th>
											<th id="title" >제목</th>
											<th id="requestdate">요청일</th>
											<th id="finishdate">반려일</th>
											<th id="manager" >요청자</th>
											<th id="state" >상태</th>
                                                </tr>
                                            </thead>
                                            <tbody>
                                                <c:forEach var="list" items="${bpayment}">
                                                <tr>
														<td>${list.requestNo}</td>
														<td>${list.category}</td>
														<td><a class="move"
															href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
														<td><fmt:formatDate value="${list.rdate}"
																pattern="yyyy/MM/dd" /></td>
														<td><fmt:formatDate value="${list.cdate}"
																pattern="yyyy/MM/dd" /></td>
														<td id='${list.requestNo}'>
														<script type="text/javascript">
														
															getUser('${list.requestNo}')</script></td>
													<td>${list.state}</td>
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
                <!-- 결재.html -->
                </div>
                
<script>
var actionForm2 = $("#actionForm2");

$(".move").on("click",function(e) {
	console.log("click");
	e.preventDefault();
	actionForm2.find('#requestNo').remove();
	actionForm2.append("<input id='requestNo' type='hidden' name='requestNo' value='"
			+ $(this).attr("href") + "'>");
	
	actionForm2.attr("action", "/approver/payment_detail");
	actionForm2.submit();
});

$(function(){  
	console.log(location.hash);
	if (location.hash == "#tab1"){      
		$('.nav-tabs').find('a').eq(0).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab1').addClass('active show').siblings().removeClass('active show');   
		} 
	else if(location.hash == "#tab2"){    
		$('.nav-tabs').find('a').eq(0).addClass('active').removeClass();  
		$('.nav-tabs').find('li').eq(0).addClass('nav-link py-3 shadow');  
		$('.nav-tabs').find('a').eq(1).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab2').addClass('active show').siblings().removeClass('active show');    
		} 
	else if(location.hash == "#tab3"){    
		$('.nav-tabs').find('a').eq(1).addClass('active').removeClass();  
		$('.nav-tabs').find('li').eq(1).addClass('nav-link py-3 shadow');  
		$('.nav-tabs').find('a').eq(0).addClass('active').removeClass();  
		$('.nav-tabs').find('li').eq(0).addClass('nav-link py-3 shadow'); 
		$('.nav-tabs').find('a').eq(2).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab3').addClass('active show').siblings().removeClass('active show');    
		} 
	 })

		

</script>
                	<page:applyDecorator name="footer" />
                <script type="text/javascript"  src="/resources/js/request.js"></script>

</body>
</html>