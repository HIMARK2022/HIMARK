<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 요청(일반 사용자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

<c:if test = '${member.authorityCode.equals("A2")}'>

<c:redirect url="/approver/request?userId=${member.userId}"/>
</c:if>

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<%@include file="../sidebar/general_side.jsp"%>
		<!-- End of Topbar 헤더 끝 -->

		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">요청</h1>
			<p class="mb-4">요청 내역을 확인하고 신규 기안 요청할 수 있습니다</p>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link py-3 shadow active"
					data-toggle="tab" href="#tab1">
						<h6 class="m-0 font-weight-bold text-primary">요청 내역</h6>
				</a></li>
				<li class="nav-item"><a class="nav-link py-3 shadow"
					data-toggle="tab" href="#tab2">
						<h6 class="m-0 font-weight-bold text-primary">신규 기안</h6>
				</a></li>
			</ul>

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
													<label><input type="checkbox" value="휴가" name="filter" />휴가</label>
													<label><input type="checkbox" value="비용" name="filter" <c:if test="${flist eq '비용'}">checked</c:if> />비용</label>
													<label><input type="checkbox" value="팀업무A" name="filter" <c:if test="${flist eq '팀업무A'}">checked</c:if>/>팀업무A</label>
													<label><input type="checkbox" value="팀업무B" name="filter"  <c:if test="${flist eq '팀업무B'}">checked</c:if>/>팀업무B</label> 
													<label><input type="checkbox" value="팀업무C" name="filter" <c:if test="${flist eq '팀업무C'}">checked</c:if> />팀업무C</label> 
													<label><input type="checkbox" value="팀업무D" name="filter" <c:if test="${flist eq '팀업무D'}">checked</c:if> />팀업무D</label> 
													<label><input type="checkbox" value="팀업무E" name="filter" <c:if test="${flist eq '팀업무E'}">checked</c:if>/>팀업무E</label>
													
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
								<table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
									<thead>
										<tr>
											<th id="No" width="5%">No</th>
											<th id="classification" width="15%">분류</th>
											<th id="title" width="30%">제목</th>
											<th id="requestdate" width="15%">요청일</th>
											<th id="finishdate" width="15%">마감일</th>
											<th id="state" width="15%">상태</th>
										</tr>
									</thead>
									<tbody>
									 <c:if test = '${filterList == null}'>  
										<c:forEach var="list" items="${list}">
											<tr>
												<td>${list.requestNo}</td>
												<td>${list.category}</td>
												<td><a class="move" href='<c:out value="${list.requestNo}"/>'>${list.title}</a></td>
												<td><fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd" /></td>
												<td><fmt:formatDate value="${list.fdate}" pattern="yyyy/MM/dd" /></td>
												<td>${list.state}</td>
											</tr>
												
<!-- <script>
	function finishDate(i){
	
		var rdate = "<fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd"/>";
		console.log("요청일 : "+rdate);
		console.log(typeof(rdate.toString()));
		var ardate = rdate.toString().split('/');
		var date = new Date(ardate[0],ardate[1]-1,ardate[2]);
		
		console.log(typeof(date));
		var period = "${list.period }";
		console.log("date : "+ date.getDate());
		console.log("period : "+ period);
				
		var iperiod = parseInt(period.substring(0, period.indexOf("일")));
		var fdate= new Date(date);
		fdate.setDate(date.getDate()+iperiod);
		console.log("마감일 : "+fdate);
		var year = fdate.getFullYear();
		var month = fdate.getMonth()+1;
		var day = fdate.getDate();
		var str = year +"/"+month+"/"+day;
		console.log("마감일 : "+str);
		document.getElementById(i).innerHTML=str;
		
		
		//console.log(fdate));
	}
	finishDate(${i})</script> -->
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
												<td>${list.state}</td>
											</tr>
							
												
<!-- <script>
	function finishDate(i){
		
		var rdate = "<fmt:formatDate value="${list.rdate}" pattern="yyyy/MM/dd"/>";
		console.log("요청일 : "+rdate);
		console.log(typeof(rdate.toString()));
		var ardate = rdate.toString().split('/');
		var date = new Date(ardate[0],ardate[1]-1,ardate[2]);
		
		console.log(typeof(date));
		var period = "${list.period }";
		console.log("date : "+ date.getDate());
		console.log("period : "+ period);
				
		var iperiod = parseInt(period.substring(0, period.indexOf("일")));
		var fdate= new Date(date);
		fdate.setDate(date.getDate()+iperiod);
		console.log("마감일 : "+fdate);
		var year = fdate.getFullYear();
		var month = fdate.getMonth()+1;
		var day = fdate.getDate();
		
		var str = year +"/"+month+"/"+day;
		console.log("마감일 : "+str);
		document.getElementById(i).innerHTML=str;
		
	
	}
	finishDate(${i})</script> -->
	
										</c:forEach>
										</c:if>
									</tbody>
								</table>
							</div>
						</div>
					</div>
					<form id='actionForm2' action="/general/request" method='get'>
						<input type='hidden' name='userId' value='${member.userId}'>
						</form>
						
					
					<!-- 요청 내역 End -->

					<!-- 신규 기안 Start -->
					<div class="tab-pane fade show" id="tab2">
						<div class="table-responsive">
							<div class="card-body">
								<form id="actionForm" action="/general/register" method="post" role="form">
									<p>
									<h6>제목</h6>
									<input type="text" class="form-control col-xl-4" required
										name="title">
									</p>
									<p>
									<h6>양식명</h6>
									<select class="form-control col-xl-4" name="category">
										<option value='' disabled selected>-- 결재 분류 --</option>
									 	<c:forEach var="list" items="${category}"> 
											<option value='${list}'>${list}</option>
										</c:forEach>
									</select>
									</p>
									<p>
									<h6>기안자</h6>
									<strong>${member.bonbu} / ${member.buseo} / ${member.team} / ${member.userName}</strong>
									</p>
									<p>
									<h6>중요도</h6>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio1" value="긴급"> <label
											class="form-check-label" for="inlineRadio1">긴급</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio2" value="높음"> <label
											class="form-check-label" for="inlineRadio2">높음</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio3" value="보통"> <label
											class="form-check-label" for="inlineRadio3">보통</label>
									</div>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio4" value="낮음"> <label
											class="form-check-label" for="inlineRadio3">낮음</label>
									</div>
									</p>
									<p>
									<h6>첨부파일</h6>
									<div class="custom-file col-xl-4">
										<input type="file" class="custom-file-input" id="Files"
											name="uploadFile"> <label class="custom-file-label"
											for="Files">파일선택</label>
									</div>
									<div class = 'uploadResult'>
									</p>
									<p>
									<h6>내용</h6>
									<textarea class="form-control" placeholder="내용을 입력해 주세요."
										rows="10" name="content"></textarea>
									</p>
									<button class="btn btn-outline-primary" type="submit"
										id="request_btn">요청하기</button>
								</form>
							</div>

						</div>

					</div>
					<!-- 신규 기안 End -->
				</div>
			</div>
		</div>
		<!-- 요청.html -->

	</div>
	<!-- End of Main Content -->
	<script>
	
		var actionForm = $("#actionForm");

		$("#request_btn")
				.on(
						"click",
						function(e) {
							e.preventDefault();
							actionForm.find('#noborder').remove();
							actionForm
									.append("<input id='noborder' type='hidden' name='userId' value='<c:out value="${member.userId}"/>'>")

							actionForm.attr("action", "/general/register");
							actionForm.submit();
						});

		var searchForm = $("#searchForm");

		$("#search_btn").on("click", function(e) {
			var id = '<c:out value="${member.userId}"/>';
			console.log("click");
			console.log("userId " + id);
			searchForm.attr("action", "/general/request?userId=" + id);
			searchForm.submit();
		});
		
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
		
		
		  // $("input:checkbox[value="+values[i]+"]").prop("checked", true);
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('filter');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

		 
	
	</script>

	<%@include file="../sidebar/footer.jsp"%>
	<script src="/resources/js/request.js"></script>

</body>
</html>