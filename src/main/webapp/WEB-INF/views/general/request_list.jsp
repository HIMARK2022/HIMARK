<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
<link href="/resources/css/payment.css" rel="stylesheet">

</head>
<script src="http://code.jquery.com/jquery-latest.js"></script>
<body id="page-top">


	
	<script>
	function getManager(requestNo){
		var m;
		$.ajax({
			url:"/general/getManager",
			type:"get",
			dataType : 'json',
			async:false,
			data :{requestNo:requestNo},
			success : function(result){
				m = result[0];
			}
		})
				console.log(m);
		
		 document.getElementById(requestNo).innerHTML = m;
	}
	</script>
	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<page:applyDecorator name="generalSide" />
		<!-- End of Topbar 헤더 끝 -->
		<!-- 목록.html -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">목록</h1>
			<p class="mb-4">결재 완료와 결재 반려를 확인 할 수 있습니다</p>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link py-3 shadow active"
					data-toggle="tab" href="#tab1">
						<h6 class="m-0 font-weight-bold text-primary">대기함</h6>
				</a></li>
				<li class="nav-item"><a class="nav-link py-3 shadow "
					data-toggle="tab" href="#tab2">
						<h6 class="m-0 font-weight-bold text-primary">승인함</h6>
				</a></li>
				<li class="nav-item"><a class="nav-link py-3 shadow "
					data-toggle="tab" href="#tab3">
						<h6 class="m-0 font-weight-bold text-primary">반려함</h6>
				</a></li>
			</ul>
			<form id='actionForm2' action="/approver/request" method='get'>
				<input type='hidden' name='user_id' value='${member.user_id}'>
				<input type='hidden' name='user_name' value='${member.user_name}'>
			</form>


<div class="card shadow mb-4">
				<div class="tab-content">
					<!-- 요청 내역 Start -->
					<div class="tab-pane fade show active" id="tab1">
						<div class="card-body">

							<!-- 필터 카드 Start -->
							<p>
							<div class="card border-left-primary shadow h-100 py-2">
								<div class="card-body">

									<div class="row no-gutters align-items-center">
										<div class="col mr-2">
											<div
												class="font-weight-bold text-primary text-uppercase mb-1">
												결재 분류</div>
											<p>
											<form action="/general/request" method="post" id="searchForm">
												<div class="h5 mb-0 font-weight-bold text-gray-800"
													id="filter">
													<script>
												 function check(){
			  
						  						/* 	var filterList ="${flist}";
						  							var size = filterList.length;
						  							console.log(size);
						  							filterList = filterList.substring(1,size-1);
						  							console.log(filterList);
						  							filterList= filterList.split(', '); */
						  					
					  								
						  					 <c:forEach var="flist" items="${flist}">
						  								
						  								
						  								  $("input:checkbox[name='filter']:checkbox[value='${flist}']").prop("checked", true); 
						  							</c:forEach>
						  													  							
						 							 }
												
												 check()
												 </script>
											<label><input type="checkbox" value="전체" name="filter" onclick='selectAll(this)' />전체</label>
									 			<c:forEach var="list" items="${uppercategory}"> 
											<label><input type="checkbox" value="${list}" name="filter"/>${list}</label>
												</c:forEach>
													
													
													<button id="search_btn" class="btn btn-outline-primary"
														type="button" style="margin-left: 10px; margin-top: -5px">검색</button>
												</div>
											
											
												
											</form>
												<form id='actionForm3' action="/general/request" method='post'>
													<c:forEach var="list" items="${filterList}">
													<input type="hidden" id="filtering" name=${filterList } value="${filterList }"> 
												    </c:forEach>
												</form>  
												
											</p>
</div>
</div>
								</div>
							</div>
							</p>
															
							<!-- 필터 카드 End -->

							<div class="table-responsive">
								<table class="table table-bordered" id="dataTable"  cellspacing="0">
									<thead>
										<tr>
											<th id="No" >문서번호</th>
											<th id="classification">분류</th>
											<th id="title" >제목</th>
											<th id="requestdate" >요청일</th>
											<th id="finishdate">마감일</th>
											<th id="manager" >승인자</th>
											<th id="state" >상태</th>
										</tr>
									</thead>
									<tbody id="requestList">
									 <c:if test = '${filterList == null}'>  
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.requestNo}</td>
												<td>${list.category}</td>
												<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
												<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /></td>
												<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
												<td id='${list.requestNo}'>
														<script type="text/javascript">
														
															getManager('${list.requestNo}')</script></td>
												<td>${list.state}</td>
											</tr>
										</c:forEach>
										 </c:if> 
										<c:if test = '${filterList != null}'>
										<c:forEach var="list" items="${filterList}">
										<%-- 	<c:set var="i" value="${i+1}"/> --%>
											<tr>
												<td>${list.requestNo}</td>
												<td>${list.category}</td>
												<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
												<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /></td>
												<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
												<td id='${list.requestNo}'>
														<script type="text/javascript">
														
															getManager('${list.requestNo}')</script></td>
												<td>${list.state}</td>
											</tr>
							
										</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					
					
					<!-- 요청 내역 End -->

							<!-- 결재 완료 Start -->
							 <div class="tab-pane fade show" id="tab2">
                                <div class="card-body">
                                    <div class="table-responsive">
                                        <table class="table table-bordered" id="dataTable1" width="100%" cellspacing="0">
                                        	<thead>
												<tr>
													<th id="No">문서번호</th>
													<th id="classification" >분류</th>
													<th id="title" >제목</th>
													<th id="requestdate" >요청일</th>
													<th id="finishdate" >승인일</th>
													<th id="manager" >승인자</th>
													<th id="state" >상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${clist}">
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
														
															getManager('${list.requestNo}')</script></td>
																
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
													<th id="classification">분류</th>
													<th id="title">제목</th>
													<th id="requestdate" >요청일</th>
													<th id="finishdate">반려일</th>
													<th id="manager">승인자</th>
													<th id="state" >상태</th>
												</tr>
											</thead>
											<tbody>
												<c:forEach var="list" items="${blist}">
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
														
															getManager('${list.requestNo}')</script></td>
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
				<!-- 목록.html -->
</div>

			
			<!-- End of Main Content -->

			<script>
var actionForm2 = $("#actionForm2");

$(".move").on("click",function(e) {
	console.log("click");
	e.preventDefault();
	actionForm2.find('#requestNo').remove();
	actionForm2.append("<input id='requestNo' type='hidden' name='requestNo' value='"
			+ $(this).attr("href") + "'>");
	
	actionForm2.attr("action", "/general/request_detail");
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
		$('.nav-tabs').find('a').eq(0).addClass('nav-link py-3 shadow');  
		$('.nav-tabs').find('a').eq(1).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab2').addClass('active show').siblings().removeClass('active show');    
		} 
	else if(location.hash == "#tab3"){    
		$('.nav-tabs').find('a').eq(1).addClass('active').removeClass();  
		$('.nav-tabs').find('a').eq(1).addClass('nav-link py-3 shadow');  
		$('.nav-tabs').find('a').eq(0).addClass('active').removeClass();  
		$('.nav-tabs').find('a').eq(0).addClass('nav-link py-3 shadow'); 
		$('.nav-tabs').find('a').eq(2).addClass('active').siblings().removeClass();      
		$('.tab-content').find('#tab3').addClass('active show').siblings().removeClass('active show');    
		} 
	 	})
	 	
	 	

	
		var searchForm = $("#searchForm");

		$("#search_btn").on("click", function(e) {
			var id = '<c:out value="${member.user_id}"/>';
			console.log("click");
			console.log("userId " + id);
			searchForm.attr("action", "/general/request_list");
			searchForm.submit();
		});
		
		
		
		
		  // $("input:checkbox[value="+values[i]+"]").prop("checked", true);
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('filter');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}



</script>
	<page:applyDecorator name="footer" />
			<script type="text/javascript"  src="/resources/js/request.js"></script>
			
</body>
</html>