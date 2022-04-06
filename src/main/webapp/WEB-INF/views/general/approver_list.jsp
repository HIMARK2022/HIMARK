<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인자 리스트(일반사용자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<%@include file="../sidebar/general_side.jsp"%>
		<!-- End of Topbar 헤더 끝 -->
		<!-- 승인자리스트.html -->
		<div class="container-fluid">
			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">승인자 리스트</h1>
			<p class="mb-4">승인자 목록과 임시 승인자 목록을 확인할 수 있습니다.</p>

			<!--승인자 목록 Start-->
			<div class="card shadow mb-4">
				<div class="card-header py-3">
					<h6 class="m-0 font-weight-bold text-primary">승인자 라스트</h6>
				</div>
				<div class="card-body">
					<div class="table-responsive col-lg-12">
						<h4>승인자 리스트</h4>
						<br>
						<table class="table table-bordered table-hover" id="dataTable11"
							width="100%" cellspacing="0">
							<thead>
								<tr>
									<th>이름</th>
									<th>본부</th>
									<th>부서</th>
									<th>팀</th>
									<th>직책</th>
									
								</tr>
							</thead>
							 <c:forEach var="list" items="${alist}">
                  
                        <tr>
                           <td>${list.userName}</td>
                           <td><c:choose>
                           <c:when test="${empty list.bonbu}">--</c:when>
                           <c:otherwise>${list.bonbu}</c:otherwise>
                           </c:choose>
                           </td>
                           <td><c:choose>
                           <c:when test="${empty list.buseo}">--</c:when>
                           <c:otherwise>${list.buseo}</c:otherwise>
                           </c:choose></td>
                           <td><c:choose>
                           <c:when test="${empty list.team }">--</c:when>
                           <c:otherwise>${list.team}</c:otherwise>
                           </c:choose></td>
                           <td>${list.duty}</td>
                        </tr>
                         </c:forEach>
                         <tr>
                           <td>${ceo.userName}</td>
                           <td>--</td>
                           <td>--</td>
                           <td>--</td>
                           <td>${ceo.duty}</td>
                        </tr>
                       
							</tbody>
						</table>
					</div>
					<br>
					<div class="table-responsive col-lg-12" id="temp">
						<h4>임시 승인자 리스트</h4>
						<br>
						<table class="table table-bordered" id="dataTable11" width="100%"
							cellspacing="0">
							<thead>
								<tr>
									<th>임시 승인자/직급</th>
									<th>승인 대상</th>
									<th>승인 부여일</th>
									<th>승인 만료일</th>
									<th>임시 권한</th>
								</tr>
							</thead>
							<tbody>
								<c:if test="${teamPer[0].manager_id ne null}">
									<tr>
										<td>${teamA[0].user_name}/${ teamA[0].pos_name} </td>
										<td>${teamA[0].team}</td>
										<td><fmt:formatDate value="${teamPer[0].approval_start}" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${teamPer[0].approval_finish}" pattern="yyyy-MM-dd" /></td>
										<td>팀장</td>
									</tr>
								</c:if>
								<c:if test="${departPer[0].manager_id ne null}">
									<tr>
										<td>${departA[0].user_name}/${ departA[0].pos_name}</td>
										<td>${departA[0].head}</td>
										<td>${departA[0].depart}</td>
										<td><fmt:formatDate value="${departPer[0].approval_start}" pattern="yyyy-MM-dd" /> </td>

										<td><fmt:formatDate value="${departPer[0].approval_finish}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:if>
								<c:if test="${headPer[0].manager_id ne null}">
									<tr>
										<td>${headA[0].user_name}/${ headA[0].pos_name}</td>
										<td>${headA[0].head}</td>
										<td><fmt:formatDate value="${headPer[0].approval_start}" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${headPer[0].approval_finish}" pattern="yyyy-MM-dd" /></td>
										<td>본부장</td>
									</tr>
								</c:if> 
							</tbody>
						</table>

					</div>
				</div>
			</div>
			<script>
                    $(function () {
                        $('[data-toggle="tooltip"]').tooltip()
                    })
                </script>
			<!--승인자 목록 End -->
		</div>
		<!-- 승인자리스트.html -->

	</div>
	<!-- End of Main Content -->
	<!-- End of Main Content -->
	<%@include file="../sidebar/footer.jsp"%>
	<script src="/resources/js/demo/datatables-emp.js"></script>
	<script src="/resources/js/request.js"></script>
	<script>
		$("#temp").css("display","none")
		var t=1;
		<c:if test="${teamPer[0].manager_id ne null}">
		 	t=0;
		 </c:if>
		 var d=1;
		 <c:if test="${departPer[0].manager_id ne null}">
		 	d=0;
		 </c:if>
		 var u=1;
		 <c:if test="${headPer[0].manager_id ne null}">
		 	d=0;
		 </c:if>
		
		if(  t|| d || u){
			$("#temp").show();
		}
	</script>
	<script src="resources/js/request.js"></script>
</body>
</html>
