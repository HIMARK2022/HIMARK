<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
       <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
       <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
	<page:applyDecorator name="approverSide" />
	<link href="/resources/css/calendar.css" rel="stylesheet">
	<link href="/resources/css/approver_myDepart.css" rel="stylesheet">
	<link href="/resources/css/approver_modal.css" rel="stylesheet">
	<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">나의 부서</h1>
                    </div>
                    <p class="mb-4"><b>관리중인 부서 정보를 확인하고 임시 승인자를 지정할 수 있는 페이지입니다.</b></p>
                    <div class="row">

                        <!-- Pie Chart -->
                        <div class="col-xl-3 col-lg-3">
                            <div class="card shadow mb-4"   >
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">부서 정보</h6>

                                </div>
                               
                                <!-- Card Body 부서트리-->
                                <div class="card-body">
                                    <p id="info_text"><b>※팀을 선택하시면 자세한 정보를 보실 수 있습니다.</b></p>
                                    <div class="container" id="tree_people">
                                        <div class="row">
                                            <div >
                                               <!-- 팀장일경우 -->
                                               <c:if test="${team ne null}">
	                                                <ul class="tree">
	                                                    <li class="pointer"><i class="fas fa-fw fa-file"></i>${team[0].team}
	                                                        <ul>
	                                                            <c:forEach var="team" items="${team}">
	                                                            	<li>${team.user_name}/${team.user_id}</li>
	                                                            </c:forEach>
	                                                        </ul>
	                                                    </li>
	                                                </ul>
                                                </c:if>
                                                <!-- 팀장일경우 -->
                                                
                                                <!-- 부서장일경우 -->
                                                <c:if test="${depart ne null}">
													<ul class="tree">
	                                                	<li class="pointer"><i class="fa-solid fa-folder"></i> <a class="personalD" >${depart[0].depart}</a> 
	                                                    	<ul>
	                                                    		<c:forEach var="departT" items="${departT}"><!-- 팀 영역 -->
	                                                    			<c:if test="${departT.team ne null}">
		                                                    			<li class="pointer"><i class="fas fa-fw fa-file"></i><a class="personal">${departT.team}</a>
		                                                    				<ul>
		                                                    					<c:forEach var="All" items="${All}">	
				                                                    				<c:if test="${All.team eq departT.team}">
		                                                    							<li>${All.user_name}/${All.user_id}</li>
		    		                                                				</c:if>
		                                                    					</c:forEach>
			                                                                </ul>
			                                                           	</li> <!-- 팀 영역 -->
		                                                           	</c:if>
		                                                    	</c:forEach> 
		                                                	</ul>
	                                                	</li>
	                                             	</ul>
	                                             </c:if>
                                                <!-- 부서장일경우 -->
                                                
                                                <!-- 본부장의 경우 -->
                                               	<c:if test="${head ne null}">
													<ul class="tree">
	                                                	<li><i class="fa-solid fa-folder-open"></i></i><a class="personalH">${head[0].head}</a> 
	                                                        <ul>
	                                                       	<!-- 본부 영역 -->
	                                                        	<c:forEach var="headD" items="${headD}"><!-- 팀 영역 -->
	                                                    			<c:if test="${headD.depart ne null}">
		                                                            	<li><i class="fas fa-fw fa-folder"></i><a class="personalD" >${headD.depart}</a>
		                                                                	<ul>
		                                                                    	<c:forEach var="headDT" items="${headDT}"><!-- 팀 영역 -->
		                                                    						<c:if test="${headDT.depart eq headD.depart}">
			  																			<li><i class="fas fa-fw fa-file"></i><a class="personal" >${headDT.team}</a>
					                                                                        <ul>
					                                                                        	<c:forEach var="All" items="${All}">	
				                                                    								<c:if test="${All.team eq headDT.team}">
					                                                                        			<li>${All.user_name}/${All.user_id}</li>
					                                                                        		</c:if>
		                                                    									</c:forEach>
						                                                                     </ul>
					                                                                    </li>
				                                                                	</c:if>
		                                                           				</c:forEach>
		                                                                	</ul>
		                                                           		</li>
		                                                        	</c:if>
		                                                    	</c:forEach>
	                                                        <!-- 본부 영역 -->   
	                                                    	</ul>
	                                                	</li>
	                                            	</ul>
	                                           	</c:if>
                                                <!-- 본부장의 경우  -->
                                                
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body 부서트리-->
                            </div>
                        </div>
                        <!-- Area Chart -->
                        <!-- 사이드 새로운부서 생성 -->
                        <div class="col-xl-9 col-lg-9" >
                            <div class="card shadow mb-4 " >
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">부서정보</h6>
                                </div>
                                    <!-- Card Body 좌측 페이지 -->
                                    <div class="card-body">
                                        <div class="table-responsive col-lg-12" >  
                                        <c:if test="${team ne null}">
                                            <h3>${team[0].team}의 구성원</h3>
                                        </c:if>
                                        <c:if test="${depart ne null}">
                                            <h3 id="dtname">${depart[0].depart}</h3>
                                            
                                        </c:if>
                                        <c:if test="${head ne null}">
                                            <h3 id="htname">${head[0].head}</h3>
                                        </c:if>
                                        <p class="mb-4"><b>※대상의 이름을 클릭하면 임시승인자 권한을 부여할 수 있습니다.</b></p>
                                            <br>
                                            <div>
                                            <!-- 팀장일경우 -->
		                                    <c:if test="${team ne null}">
                                            	<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
	                                                <thead>
	                                                    <tr>
	                                                        <th >이름</th>
	                                                        <th >직책</th>
	                                                        <th >직급</th>
	                                                        <th >이메일</th>
	                                                    </tr>
	                                                </thead>
	                                                <tbody>
	                                                	<c:forEach var="team" items="${team}">
		                                                     <c:if test="${team.duty_id eq 'd02'}">
				                                             	<tr>
				                                             		<td>${team.user_name}/${team.user_id}</td>
				                                             		<td>${team.duty_name}</td>
				                                             		<td>${team.pos_name}</td>
				                                             		<td></td>
				                                               </tr>
			                                                </c:if>
		                                                    <c:if test="${team.duty_id ne 'd02'}">
				                                            	<tr>
				                                                        <td>
				                                                            <div class="page-wrapper">
				                                                                <a class="content-detail">
				                                                                    <span class="text">${team.user_name}/${team.user_id}</span>
				                                                                </a>
				                                                            </div>
				                                                        </td>
				                                                        <td>${team.duty_name}</td>
				                                                        <td>${team.pos_name}</td>
				                                                        <td></td>
				                                            	</tr>
			                                            	</c:if>
		                                            	</c:forEach>
	                                                </tbody> 
                                            </table>
                                            </c:if>
		                                    <!-- 팀장일경우 -->
                                             <!-- 부서장일경우 -->
                                             <c:if test="${depart ne null}">
                                             	<div >
                                             		<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
		                                                <thead>
		                                                    <tr>
		                                                        <th >이름</th>
		                                                        <th >직책</th>
		                                                        <th >직급</th>
		                                                        <th >이메일</th>
		                                                    </tr>
		                                                </thead>
		                                                <tbody>
		                                                	<c:forEach var="depart" items="${depart}">
		                                                     <c:if test="${depart.duty_id eq 'd03'}">
				                                             	<tr>
				                                             		<td>${depart.user_name}/${depart.user_id}</td>
				                                             		<td>${depart.duty_name}</td>
				                                             		<td>${depart.pos_name}</td>
				                                             		<td></td>
				                                               </tr>
			                                                </c:if>
		                                                    <c:if test="${depart.duty_id ne 'd03'}">
				                                            	<tr>
				                                            		<td>
				                                            			<div class="page-wrapper">
				                                                        	<a class="content-detail">
				                                                        		<span class="text">${depart.user_name}/${depart.user_id}</span>
				                                                        	</a>
				                                                        </div>
				                                                    </td>
				                                                    <td>${depart.team} ${depart.duty_name}</td>
				                                                    <td>${depart.pos_name}</td>
				                                                    <td></td>
				                                            	</tr>
			                                            	</c:if>
		                                            	</c:forEach>
		                                                	
		                                               	</tbody>
	                                               	</table>
                                             	</div>
                                             </c:if>
		                                     <!-- 부서장일경우 -->
		                                     <!-- 본부장일경우 -->
		                                     <div class="table-responsive col-lg-12" >
		                                     <c:if test="${head ne null}">
		                                     	<div >
                                             		<table class="table table-bordered table-hover" id="dataTable"  cellspacing="0" >
		                                                <thead>
		                                                    <tr>
		                                                        <th >이름/아이디</th>
		                                                        <th >직책</th>
		                                                        <th >직급</th>
		                                                        <th >이메일</th>
		                                                    </tr>
		                                                </thead>
		                                                <tbody>
			                                              	<c:forEach var="head" items="${head}">
			                                                     <c:if test="${head.duty_id eq 'd04'}">
					                                             	<tr>
					                                             		<td>${head.user_name}/${head.user_id}</td>
					                                             		<td>${head.duty_name}</td>
					                                             		<td>${head.pos_name}</td>
					                                             		<td>chanho470@naver.com</td>
					                                               </tr>
				                                                </c:if>
			                                                    <c:if test="${head.duty_id ne 'd04'}">
					                                            	<tr>
					                                                    <td>
					                                                        <div class="page-wrapper">
					                                                        	<a class="content-detail">
					                                                        		<span class="text">${head.user_name}/${head.user_id}</span>
					                                                        	</a>
					                                                        </div>
					                                                   </td>
					                                                   <td>${head.depart} ${head.team} ${head.duty_name}</td>
					                                                   	<td>${head.pos_name}</td>
					                                                    <td>chanho470@naver.com</td>
					                                            	</tr>
				                                            	</c:if>
			                                            	</c:forEach>
		                                               	</tbody>
	                                               	</table>
                                             	</div>
		                                     </c:if>
		                                     </div>
		                                     <!-- 본부장일경우 -->
                                            </div>
                                        </div>
                                    </div>
                                     <!-- Card Body 좌측 페이지 -->
                            </div>
                            
                        </div>             
                    </div>
                    
                </div>
                 <!-- Modal -->
                
                 <form action="/approver/myDepart_team_temp?managerId=${param.userId}" method="post" id="tempModal">
                 	<input type="hidden" value="" name="user_id_team"/>
                 	<%-- <input type="hidden" value="${param.userId}" name="user_id_my" oninput = "checkId()" id="user_id_my"/> --%>
 				    <div class="modal-wrapper">
				        <div class="modal">
				            <div class="modal-header">
				                <h4 class="modal-title" id="myModalLabel">임시 승인자 지정</h4>
				                <button type="button" class="close content-detail" data-dismiss="modal" aria-hidden="true">&times;</button>
				            </div>
				            <div class="modal-body">
				                <div class="form-group">
				                    <label class="font-weight-bold">대상</label>
				                    <input class="form-control" name="USER" value="" readonly>
				                </div>
				                <div class="form-group">
				                    <label class="font-weight-bold">임시 승인 기간</label>
				                    <div class="clearfix row">
				                        <!-- 시작일 -->
				                        <span class="input-date">
				                            <input type="text" name="start-date2" value="" class="datepicker inp form-control" id="start-date2" style="width:270px"
				                            placeholder="시작일" readonly required  oninput = "checkId()" />
				                            <!-- <i class="fa-regular fa-calendar dateclick"></i> -->
				                        </span>
				                        <span class="demi">~</span>
				                        <!-- 종료일 -->
				                        <span class="input-date">
				                            <input type="text" name="end-date2" value="" class="datepicker inp form-control" id="end-date2" style="width:270px"
				                                placeholder="종료일" readonly required/>
				                            <!-- <i class="fa-regular fa-calendar dateclick"></i> -->
				                        </span>
				                    </div>
				                </div>
				                
				            </div>
				            <div class="modal-footer">
				                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
				                    <div class="btn-group" role="group">
				                        <button type="button" class="btn btn-default content-detail" data-dismiss="modal" role="button">취소</button>
				                    </div>
				                    <div class="btn-group" role="group">
				                        <button type="submit" id="positive" class="btn btn-default btn-hover-green" role="button" onclick="if(alert('임시승인자 지정되었습니다.')==false)return false;">권한부여</button>
				                    </div>
				                </div>
				            </div>
				        </div>
				        </div>
				    </div>
				 </form>
	<page:applyDecorator name="footer" />
 <script src="/resources/js/tree.js"></script>
  <script src="/resources/js/cal.js"></script>
	  
	<script>
		$('.content-detail').on('click', function () {
			
		    $('.modal-wrapper').toggleClass('open');
		     $('.page-wrapper').toggleClass('blur-it');
		     return false;
		});
		$('.text').on('click', function () {
			var user = $(this).text();
			console.log($(this).text());
			userId = user.split('/');
			console.log("선택한 사람의 아이디"+userId[1]);
		
			userId[1];
			 $('input[name=USER]').attr('value',userId[0]); // 유저 이름 
			 $('input[name=user_id_team]').attr('value',userId[1]); // 유저 아이디
			 
			 
		});
	</script>
	<script>
		var list = new Array();
		<c:forEach var="All" items="${All}">
			list.push({
				user_id :"${All.user_id}"
				,user_name : "${All.user_name}"
				,duty_name :"${All.duty_name}"
				,duty_id :"${All.duty_id}"
				,pos_name :"${All.pos_name}"
				,team :"${All.team}"
				,depart : "${All.depart}"
				,head : "${All.head}"
			});
		</c:forEach>
	</script>
	
	<script type="text/javascript">
		$(".personalD").click(function(e){
			$("#htname span").remove();
			$("#dtname span").remove();
			$("#dataTable>tbody tr").remove();
			console.log($(this).text());
			var depart = $(this).text();
			for(var i=0 ;i<list.length;i++){
				  if(list[i].depart == depart && list[i].duty_id !="d03"){
					   str4 = "<tr ><td><div class="+'page-wrapper'+"><a class="+'content-detail'+"><span class="+'text'+">"+list[i].user_name+"/"+list[i].user_id+"</span></a></div></td>";
					   str4 += "<td>"+list[i].team +" "+list[i].duty_name+"</td>"
					   str4 += "<td>"+list[i].pos_name+"</td><td>chanho470@naver.com</td></tr>"
					   $("#dataTable>tbody").append(str4);
				   }else if(list[i].depart == depart && list[i].duty_id =="d03"){
					   str4 = "<tr ><td>"+list[i].user_name+"</td>";
					   str4 += "<td>"+list[i].team +" "+list[i].duty_name+"</td>"
					   str4 += "<td>"+list[i].pos_name+"</td><td>chanho470@naver.com</td></tr>"
					   $("#dataTable>tbody").append(str4);
				   }
			   }
			 $('.content-detail').on('click', function () {
				 	
				    $('.modal-wrapper').toggleClass('open');
				     $('.page-wrapper').toggleClass('blur-it');
				     return false;
				});
			str5 = "<span>"+ ">" + depart+"</span>";$("#htname").append(str5);
			$('.text').on('click', function () {
				var user = $(this).text();
				
				userId = user.split('/');
				
				userId[1];
				 $('input[name=USER]').attr('value',userId[0]); // 유저 이름 
				 $('input[name=user_id_team]').attr('value',userId[1]); // 유저 아이디
				 
			});
			
		});
		$(".personalH").click(function(e){
			$("#htname span").remove();
			$("#dtname span").remove();
			$("#dataTable>tbody tr").remove();
			console.log($(this).text());
			var head = $(this).text();
			for(var i=0 ;i<list.length;i++){
				  if(list[i].head == head && list[i].duty_id !="d04"){
					   str4 = "<tr ><td><div class="+'page-wrapper'+"><a class="+'content-detail'+"><span class="+'text'+">"+list[i].user_name+"/"+list[i].user_id+"</span></a></div></td>";
					   str4 += "<td>"+list[i].depart +" "+list[i].team +" "+list[i].duty_name+"</td>"
					   str4 += "<td>"+list[i].pos_name+"</td><td>chanho470@naver.com</td></tr>"
					   $("#dataTable>tbody").append(str4);
				   }else if(list[i].head == head && list[i].duty_id =="d04"){
					   str4 = "<tr ><td>"+list[i].user_name+"</td>";
					   str4 += "<td>"+list[i].depart +" "+list[i].team +" "+list[i].duty_name+"</td>"
					   str4 += "<td>"+list[i].pos_name+"</td><td>chanho470@naver.com</td></tr>"
					   $("#dataTable>tbody").append(str4);
				   }
			   }
			 $('.content-detail').on('click', function () {
				 
				    $('.modal-wrapper').toggleClass('open');
				     $('.page-wrapper').toggleClass('blur-it');
				     return false;
				});
			str5 = "<span>"+ ">" + head+"</span>";$("#htname").append(str5);
		});
	
		$(".personal").click(function(e){
			$("#Lname span").remove();$("#Lpos span").remove(); 
			$("#htname span").remove();$("#dtname span").remove(); 
			$("#dataTable>tbody tr").remove();
		    
		    if($('#som').css("display")=="none"){
                $('#som').show();
            }
		   var team = $(this).text();
		   
		   var Lname; var Lduty; var Lpos;
		   
		   
		   for(var i=0 ;i<list.length;i++){
			  if(list[i].team == team){
				   str3 = "<tr ><td><div class="+'page-wrapper'+"><a class="+'content-detail'+"><span class="+'text'+">"+list[i].user_name+"/"+list[i].user_id+"</span></a></div></td>";
				   str3 += "<td>"+list[i].duty_name+"</td>"
				   str3 += "<td>"+list[i].pos_name+"</td><td>chanho470@naver.com</td></tr>"
				   $("#dataTable>tbody").append(str3);
			   }
		   }

		   $('.content-detail').on('click', function () {
			    $('.modal-wrapper').toggleClass('open');
			     $('.page-wrapper').toggleClass('blur-it');
			     
			     return false;
			});
		   str1 = "<span>" +Lname+ "</span>" ; $("#Lname").append(str1);
           str2 = "<span>" +Lpos+ "</span>";$("#Lpos").append(str2);
		   
           str4 = "<span>"+ " > " + team+"</span>";
           $("#dtname").append(str4);
           $("#htname").append(str4);
           $('.text').on('click', function () {
				var user = $(this).text();
				
				userId = user.split('/');
				
				userId[1];
				 $('input[name=USER]').attr('value',userId[0]); // 유저 이름 
				 $('input[name=user_id_team]').attr('value',userId[1]); // 유저 아이디
				 
			});
		});
	</script>


</body>
</html>