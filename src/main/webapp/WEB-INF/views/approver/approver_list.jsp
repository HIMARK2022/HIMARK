<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
        <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
        <%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>승인자 리스트(승인자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">

</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/approver_side.jsp"%>
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
                           
                        </tr>
                       
                     </thead>
                     <tbody>
                        <fmt:parseNumber value="${fn:length(alist)}" var="num"/>
                 
                     <c:forEach var="list" items="${alist}" end= "${num-2}">
                  
                        <tr>
                           <td>${list.userName}</td>
                           <td>${list.bonbu}</td>
                           <td>${list.buseo}</td>
                           <td>${list.team}</td>
                        </tr>
                         </c:forEach>
                       
                        
                     </tbody>
                  </table>
               </div>
               <br>
               <div class="table-responsive col-lg-12" id="temp">
                  <h4>임시 승인자 목록</h4>
                  <br>
                 <%--  <table class="table table-bordered" id="dataTable11" width="100%"
                     cellspacing="0">
                     <thead>
                        <tr>
                           <th>임시 승인자</th>
                           <th>본부(승인대상)</th>
                           <th>부서(승인대상)</th>
                           <th>팀(승인대상)</th>
                           <th>임시 권한</th>
                        </tr>
                     </thead>
                     <tbody>
                        <c:if test="${Tempteam[0].user_id ne null}">
                           <tr>
                              <td><span data-toggle="tooltip" data-placement="top"
                                 title="${ user_team[0].dept_name} / ${ user_team[0].pos_name}">
                                    ${user_team[0].user_name} </span></td>
                              <td>${Tempteam[0].upper_dept2}</td>
                              <td>${Tempteam[0].upper_dept}</td>
                              <td>${Tempteam[0].dept_name}</td>

                              <td><span data-toggle="tooltip" data-placement="top"
                                 title="<fmt:formatDate value="${Tempteam[0].approval_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${Tempteam[0].approval_finish}" pattern="yyyy-MM-dd" />">
                                    ${Tempteam[0].duty_name} </span></td>
                           </tr>
                        </c:if>
                        <c:if test="${Tempdepart[0].user_id ne null}">
                           <tr>
                              <td><span data-toggle="tooltip" data-placement="top"
                                 title="${ user_dept[0].dept_name} / ${ user_dept[0].pos_name}">
                                    ${user_dept[0].user_name} </span></td>
                              <td>${Tempdepart[0].upper_dept}</td>
                              <td>${Tempdepart[0].dept_name}</td>
                              <td>--</td>

                              <td><span data-toggle="tooltip" data-placement="top"
                                 title="<fmt:formatDate value="${Tempdepart[0].approval_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${Tempdepart[0].approval_finish}" pattern="yyyy-MM-dd" />">${Tempdepart[0].duty_name}</span></td>
                           </tr>
                        </c:if>
                        <c:if test="${Tempupper[0].user_id ne null}">
                           <tr>
                              <td><span data-toggle="tooltip" data-placement="top"
                                 title=" ${ user_upper[0].dept_name} / ${ user_upper[0].pos_name}">
                                    ${user_upper[0].user_name} </span></td>
                              <td>${Tempupper[0].dept_name}</td>
                              <td>--</td>
                              <td>--</td>

                              <td><span data-toggle="tooltip" data-placement="top"
                                 title="<fmt:formatDate value="${Tempupper[0].approval_start}" pattern="yyyy-MM-dd" /> ~ <fmt:formatDate value="${Tempupper[0].approval_finish}" pattern="yyyy-MM-dd" />">${Tempupper[0].duty_name}</span></td>
                           </tr>
                        </c:if>
                     </tbody>
                  </table> --%>

               </div>
            </div>
         </div>
         </div>
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
<%@include file="../sidebar/footer.jsp"%>
<script src="/resources/js/request.js"></script>
</body>
</html>