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

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
         <page:applyDecorator name="approverSide" />
        <!-- End of Topbar 헤더 끝 -->
 <!-- 승인자리스트.html -->
      <div class="container-fluid">
         <!-- Page Heading -->
         <h1 class="h3 mb-2 text-gray-800">승인자 목록</h1>
         <p class="mb-4">승인자 목록을 볼 수 있는 페이지입니다.</p>

         <!--승인자 목록 Start-->
         <div class="card shadow mb-4">
            <div class="card-header py-3">
               <h6 class="m-0 font-weight-bold text-primary">승인자 목록</h6>
            </div>
            <div class="card-body">
               <div class="table-responsive col-lg-12">
                  <h4>승인자 목록</h4>
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
                     <tbody>
                         
							 <c:forEach var="list" items="${alist}" >
                  
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
									<th>승인자</th>
									<th>임시승인자</th>
									<th>승인 부여일</th>
									<th>승인 만료일</th>
								</tr>
							</thead>
							<tbody>
								 <c:forEach var="tlist" items="${tlist}">
									<tr>
										<td>${tlist.manager_name}/${tlist.manager_id}</td>
										<td>${tlist.user_name}/${tlist.temp_manager}</td>
										<td><fmt:formatDate value="${tlist.approval_start}" pattern="yyyy-MM-dd" /></td>
										<td><fmt:formatDate value="${tlist.approval_finish}" pattern="yyyy-MM-dd" /></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>

					</div>
				</div>
			</div></div>
         <script>
         
         $("#temp").css("display","none")
         var t=1;
          <c:if test="${Tempteam[0].user_id eq null}">
             t=0;
          </c:if>
          var d=1;
          <c:if test="${Tempdepart[0].user_id eq null}">
             d=0;
          </c:if>
          var u=1;
          <c:if test="${Tempupper[0].user_id eq null}">
             d=0;
          </c:if>
         
         if(  t|| d || u){
            $("#temp").show();
         }
      </script>

       
         <!--승인자 목록 End -->
      </div>
      <!-- 승인자리스트.html -->


            <!-- End of Main Content -->
	<page:applyDecorator name="footer" />
<script src="/resources/js/request.js"></script>
</body>
</html>