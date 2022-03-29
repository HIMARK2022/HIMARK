<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body >
<%@include file="../sidebar/admin_side.jsp"%>
<link href="/resources/css/admin_tree.css" rel="stylesheet">
<link href="/resources/css/admin_modal.css" rel="stylesheet">
<link href="/resources/css/calendar.css" rel="stylesheet">
		<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">조직도/직원정보 수정</h1>
                        
                    </div>
                    <p class="mb-4"><b>사내 부서 및 부서원 정보를 조회 및 수정, 임시승인자를 지정할 수 있는 페이지입니다.</b></p>
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
                                    <div>
                                        <form action="/admin/tree_employee" method="post" id="SearchFrom">
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 "
                                                    placeholder="검색하시오" aria-label="Search"
                                                    aria-describedby="basic-addon2" name="username" autocomplete="off">
                                            </div>
                                        </form>
                                    </div>
                                    <div id="search_result" >
                                    <br>
	                                    <c:forEach var="userinfo" items="${userinfo}">
	                                      
	                                        <span class="personal" id="searchUser">${userinfo.pos_name}/${userinfo.user_id}/${userinfo.user_name}</span><br><br>
	                                    </c:forEach>
	                                    
                                    </div>
                                    <div class="container" id="tree_people">
                                        <div class="row">
                                            <div >
                                            <!-- 상업부 영역 -->
                                            <c:forEach var="head" items="${head}">
                                                <ul class="tree">
                                                    <li class="pointer"><i class="fa-solid fa-folder-open"></i>${head.head }
                                                        <ul>
                                                        <!-- 부서 영역 -->
                                                        <c:forEach var="depart" items="${depart}">
	                                                        <c:if test="${depart.head eq head.head}">
	                                                            <li><i class="fa-solid fa-folder"></i></i><a href="#">${depart.depart }</a> 
	                                                                <ul>
	                                                                <!-- 팀 영역 -->
	                                                                <c:forEach var="part" items="${part}">
		                                                        		<c:if test="${part.depart eq depart.depart}">
		                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">${part.team}</a>
		                                                                        <ul>
		                                                                        <c:forEach var="team" items="${team}">
			                                                        				<c:if test="${team.team eq part.team}">
			                                                                            <li class="personal">${team.name}/${team.user_id}</li>
			                                                                        </c:if>
		                                                         				</c:forEach>
		                                                                        </ul>
		                                                                    </li>
		                                                                </c:if>
	                                                         		</c:forEach>
	                                                                 <!-- 팀 영역 -->   
	                                                                </ul>
	                                                            </li>
	                                                         </c:if>
                                                         </c:forEach>
                                                        <!-- 부서 영역 -->
                                                        </ul>
                                                        
                                                    </li>
                                                </ul>
                                            </c:forEach>
                                            </div>
                                            
                                        </div>
                                    </div>
                                </div>
                                <!-- Card Body 부서트리-->
                            </div>
                        </div>
                        <!-- Area Chart -->
                        <div class="col-xl-9 col-lg-9" >
                            <div class="card shadow mb-4 right_info" >
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">상세 정보</h6>
                                </div>
                                <!-- Card Body -->
                                <div class="card-body">
                                   
                                    <div id="som">
                                        
                                        <br>
                                        <form action="/admin/modify" method = "get">
                                        <table class="table table-bordered " id="dataTable" cellspacing="0">
                                            <tr>
                                                <th class="col-lg-3 col-md-3">이름</th>
                                                <td>
                                                    <span id="Tname"></span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                              <th >생년월일</th>
                                              <td >
                                                <span id="Tbirth"></span>
                                              </td>
                                            </tr>
                                            <tr>
                                              <th >성별 (남자/여자)</th>
                                              <td >
                                                <span id="Tsex"></span>
                                                
                                              </td>
                                            </tr>
                                            <tr>
                                              <th >휴대폰 번호</th>
                                              <td >
                                                <span id="Tphone"></span>
                                              </td>
                                            </tr>
                                            <tr>
                                                <th >이메일</th>
                                                <td >
                                                    <span id="Temail"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th class="col-lg-3">직급</th>
                                                <td>
                                                    <span id="Tpos"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >직책</th>
                                                <td>
                                                    <span id="Tduty"></span>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>부서</th>
                                                <td>
                                                    <span id="Tpart"></span>
                                                </td>
                                            </tr>
                                        </table>
                                       
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            <tr>
                                                <th class="col-lg-3 col-md-3">임시 승인권한</th>
                                                <td>
                                                    <span id="TempA"></span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >승인 기간</th>
                                                <td >
                                                    <span id="TempP"></span>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                        	<input type="hidden" value="" name="mod_id"/>
                                        	<button type="submit" class="btn btn-outline-warning btn-lg btn-icon-split" id="modbtn">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-plus"></i>
                                                </span>
                                                <span class="text">수정하기</span>
                                            </button>
                                            <a class="content-detail btn btn-outline-primary btn-lg btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">임시승인자 지정</span>
                                            </a>
                                       </form>
                                        
                                        <br>
                                        <div class="twobuttons" >
	                                        <form action="/admin/modify" method="get" name="modalform" id="modalform">
	                                        	<input type="hidden" value="" name="mod_id"/>
	                                        </form>	
                                        </div>  
                                    </div>
                                    
                                </div>
                            </div>
                            
                        </div>

                        

                       
                    </div>
                    
                </div>

<!-- 모달 --><form action="/admin/tree_employee_modal" method="post" id="ModalForm">
				<input type="hidden" value="" name="user_id"/>
				<input type="hidden" value="" name="team_modal"/>
				<input type="hidden" value="" name="depart_modal"/>
				<input type="hidden" value="" name="head_modal"/>
				<input type="hidden" value="" name="authority"/>
				<div class="modal-wrapper">
			        <div class="modal">
			            <div class="modal-header">
			                <h4 class="modal-title" id="myModalLabel">임시승인자 지정</h4>
			                <button type="button" class="close content-detail" data-dismiss="modal" aria-hidden="true">&times;</button>
			            </div>
			            <div class="modal-body">
			                <div class="form-group">
			                    <table class="tempU">
			                            <thead>
			                                <tr>
			                                    <th><label class="font-weight-bold">승인권한</label></th>
			                                    <th><label class="font-weight-bold">권한대상이름</label></th>
			                                    
			                                </tr>
			                            </thead>
			                            <tbody>
			                                <tr>
			                                    <td>
			                                        <select class="form-control col-md-8 selbox"  id="selectBox" name="selectBox" >
			                                            <option  selected>선택하시오</option>
			                                            <option value="d05">대표</option>
			                                            <option value="d04">본부장</option>
			                                            <option value="d03">부서장</option>
			                                            <option value="d02">팀장</option>
			                                        </select>
			                                    
			                                    <td>
			                                        <input class="form-control col-md-4 col-lg-8" name="formName" value="" placeholder="" readonly>
			                                    </td>
			                                    
			                                </tr>
			                            </tbody>
			                    </table>
			                    
			                </div>
			                
			             
			                <div class="form-group ">
			                    <label class="font-weight-bold">승인기간</label>
			                    <div class="h5 mb-0 font-weight-bold text-gray-800 ">
			                        <div class="clearfix row">
			                            <!-- 시작일 -->
			                            <span class="input-date">
			                                <input type="text" name="start-date2" value="" class="datepicker inp form-control" id="start-date2"
			                                placeholder="시작일" readonly />
			                                <!-- <i class="fa-regular fa-calendar dateclick"></i> -->
			                            </span>
			                            <span class="demi" style="margin-left: 30px">~</span>
			                            <!-- 종료일 -->
			                            <span class="input-date">
			                                <input type="text" name="end-date2" value="" class="datepicker inp form-control" id="end-date2"
			                                    placeholder="종료일" readonly  style="margin-left: 27px"/>
			                                <!-- <i class="fa-regular fa-calendar dateclick"></i> -->
			                            </span>
			                        </div>
			                    </div> 
			                </div>
			                
			            </div>
			            <div class="modal-footer">
			                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
			                    <div class="btn-group" role="group">
			                        <button type="button" class="btn btn-default content-detail" data-dismiss="modal" role="button">취소</button>
			                    </div>
			                    <div class="btn-group" role="group">
			                        <button type="submit" id="positive" class="btn btn-default btn-hover-green" role="button">지정</button>
			                    </div>
			                </div>
			            </div>
			        </div>
			    </div>
		</form>
<%@include file="../sidebar/footer.jsp"%>
</body>
<script src="/resources/js/tree.js"></script>
    <script>
        $('.content-detail').on('click', function () {
            $('.modal-wrapper').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
        });
    </script>
    <script>
    	var list = new Array();
    	<c:forEach var="team" items="${team}"> //팀 인원 정보
    		list.push({
    			user_id :"${team.user_id}"
    			,birth : "${team.birth_date}"
    			,phone_number :"${team.phone_number}"
    			,email : "${team.email}"
    			,sex : "${team.sex}"
    			,name : "${team.name}"
    			,pos : "${team.pos}"
    			,duty : "${team.duty}"
    			,part : "${team.part}"
    			,head : "${team.head}"
    			,depart : "${team.depart}"
    			,team : "${team.team}"
    		});
    	</c:forEach> 
    	
    	var list1 = new Array();
    	<c:forEach var="userinfo" items="${userinfo}"> //모든 인원 정보 검색했을때 
    		list1.push({
    			user_id :"${userinfo.user_id}"
    			,user_name : "${userinfo.user_name}"
    			,birth_date : "${userinfo.birth_date}"
    			,phone_number : "${userinfo.phone_number}"
    			,sex : "${userinfo.sex}"
    			,email : "${userinfo.email}"
    			,pos_name : "${userinfo.pos_name}"
    			,duty_name : "${userinfo.duty_name}"
    			,dept_name : "${userinfo.dept_name}"
    			,upper_dept : "${userinfo.upper_dept}"
    			,upper_dept2 : "${userinfo.upper_dept2}"
    		});
    	</c:forEach>
    	
    	var list2 = new Array();
    	<c:forEach var="temp" items="${temp}">
    		list2.push({
    			user_id :"${temp.user_id}",
    			manager_id :"${temp.manager_id}",
    			start_date2 :"${temp.approval_start}",
    			end_date2 :"${temp.approval_finish}"
    		});
    		
    	</c:forEach>
    	
    	
        $(".personal").click(function(e){
            console.log($(this).text());
            if($('#som').css("display")=="none"){
                $('#som').show();
            }
        });
        $(".personal").click(function(e){
        	
        	$("#Tname span").remove();$("#Tbirth span").remove();$("#Temail span").remove();
            $("#Tphone span").remove();$("#Tsex span").remove();$("#Tpos span").remove();
            $("#Tduty span").remove();$("#Tpart span").remove();  
            
            $("#TempA span").remove();$("#TempP span").remove();
            
        	
            var user = $(this).text();
            userId = user.split('/');
            console.log(userId[1]); // 클릭한 사용자의 아이디
        	var id ; var birth  ; var phone_number ;
        	var email  ; var sex  ; var name ;
        	var pos  ; var duty  ; var part ;
        	var head   ; var depart   ; var team;
            for(var i=0 ;i<list.length;i++){
            	if(list[i].user_id == userId[1]){
            		id = list[i].user_id;
            		birth  = list[i].birth;
            		phone_number  = list[i].phone_number;
            	
            		email  = list[i].email;
            		sex  = list[i].sex;
            		name  = list[i].name;
            		pos  = list[i].pos;
            		duty  = list[i].duty;
            		part  = list[i].part;
            		head  = list[i].head;
            		depart  = list[i].depart;
            		team  = list[i].team;
            		if(sex == "S1"){
                		sex= "남자";
                	}else{
                		sex = "여자";
                	}
            	}
            }
            for(var i=0 ;i<list1.length;i++){
            	if(list1[i].user_id == userId[1]){
            		name = list1[i].user_name ;
            		birth  = list1[i].birth_date ;
            		phone_number  = list1[i].phone_number ;
            		email  = list1[i].email;
            		sex  = list1[i].sex;
            		pos   = list1[i].pos_name ;
            		duty   = list1[i].duty_name ;
            		team   = list1[i].dept_name ;
            		part   = list1[i].upper_dept ;
            		head   = list1[i].upper_dept2 ;
            		if(sex == "S1"){
                		sex= "남자";
                	}else{
                		sex = "여자";
                	}
            	}
            }
           
            var Thire ; var Tstart  ; var Tfinish ;
            for(var i=0 ;i<list2.length;i++){
            	if(list2[i].user_id == userId[1]){
            		Thire = list2[i].manager_id
            		Tstart = list2[i].start_date2
            		Tfinish = list2[i].end_date2
            	}
            }
            if( Thire != null){
            	str9 = "<span>" + Thire +"</span>" ; $("#TempA").append(str9);
                str10 = "<span>" + Tstart +" ~ "+ Tfinish+"</span>" ;$("#TempP").append(str10);	
            }
            
            // 상세 정보 card-body 안 table
            str1 = "<span><input name='name' value="+name+ "> </input></span>"; $("#Tname").append(str1);
            str2 = "<span>"+birth+"</span>";$("#Tbirth").append(str2);
            str3 = "<span><input name='phone_number' value="+phone_number+ "> </input></span>";$("#Tphone").append(str3);
            str4 = "<span><input name='email' value="+email+ "> </input></span>";$("#Temail").append(str4);
            str5 = "<span><input name='sex' value="+sex+ "> </input></span>"; $("#Tsex").append(str5);
            
            str6 = "<span>" +pos+ "</span>";$("#Tpos").append(str6);
            str7 = "<span>" +duty+ "</span>";$("#Tduty").append(str7);
            str8 = "<span>" +team+ "</span>";$("#Tpart").append(str8);
            
/*             str6 = "<span><input value="+pos+ "> </input></span>";$("#Tpos").append(str6);
            str7 = "<span><input value="+duty+ "> </input></span>";$("#Tduty").append(str7);
            str8 = "<span><input value="+team+ "> </input></span>";$("#Tpart").append(str8); */
            
            $('input[name=formName]').attr('value',name);
            
            $('input[name=user_id]').attr('value',userId[1]);
            $('input[name=team_modal]').attr('value',team);
            $('input[name=depart_modal]').attr('value',part);
            $('input[name=head_modal]').attr('value',head);
            $('input[name=authority]').attr('value',duty);
            
            
            $("#modbtn").click(function(){
            	$('input[name=mod_id]').attr('value',userId[1]);
            	$("#modalform").submit();
            });
            
        });        
    </script>
    <script>
        // Search Date
        jQuery.fn.schDate = function () {
            var $obj = $(this);
            var $chk = $obj.find("input[type=radio]");
            $chk.click(function () {
                $('input:not(:checked)').parent(".chkbox").removeClass("on");
                $('input:checked').parent(".chkbox").addClass("on");
            });
        };

        // DateClick
        jQuery.fn.dateclick = function () {
            var $obj = $(this);
            $obj.click(function () {
                $(this).parent().find("input").focus();
            });
        }

        function setSearchDate(start, n){

            var num = start.substring(0,1);
            var str = start.substring(1,2);

            var today = new Date();

            //var year = today.getFullYear();
            //var month = today.getMonth() + 1;
            //var day = today.getDate();

            var endDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#end-date'+n).val(endDate);

            if(str == 'd'){
                today.setDate(today.getDate() - num);
            }else if (str == 'w'){
                today.setDate(today.getDate() - (num*7));
            }else if (str == 'm'){
                today.setMonth(today.getMonth() - num);
                today.setDate(today.getDate() + 1);
            }

            var startDate = $.datepicker.formatDate('yy-mm-dd', today);
            $('#start-date'+n).val(startDate);
                    
            // 종료일은 시작일 이전 날짜 선택하지 못하도록 비활성화
            $("#end-date"+n).datepicker( "option", "minDate", startDate );

            // 시작일은 종료일 이후 날짜 선택하지 못하도록 비활성화
            $("#start-date"+n).datepicker( "option", "maxDate", endDate );

        }

        $(document).ready(function () {
            

            $.datepicker.setDefaults($.datepicker.regional['ko']);
            
            $(".datepicker").datepicker({
                showButtonPanel: true,
                dateFormat: "yy-mm-dd",
                onClose: function (selectedDate) {

                    var eleId = $(this).attr("id");
                    var optionName = "";

                    if (eleId.indexOf("StartDate") > 0) {
                        eleId = eleId.replace("StartDate", "EndDate");
                        optionName = "minDate";
                    } else {
                        eleId = eleId.replace("EndDate", "StartDate");
                        optionName = "maxDate";
                    }

                    $("#" + eleId).datepicker("option", optionName, selectedDate);
                    $(".searchDate").find(".chkbox").removeClass("on");
                }
            });

            $(".dateclick").dateclick();    // DateClick
            $(".searchDate").schDate();        // searchDate

            $('#start-date1').datepicker("option", "maxDate", $('#end-date1').val());
            $('#start-date1').datepicker("option", "onClose", function (selectedDate) {
                $('#end-date1').datepicker("option", "minDate", selectedDate);
            });

            $('#end-date1').datepicker("option", "minDate", $('#start-date1').val());
            $('#end-date1').datepicker("option", "onClose", function (selectedDate) {
                $('#start-date1').datepicker("option", "maxDate", selectedDate);
            });

            $('#start-date2').datepicker("option", "maxDate", $('#end-date2').val());
            $('#start-date2').datepicker("option", "onClose", function (selectedDate) {
                $('#end-date2').datepicker("option", "minDate", selectedDate);
            });

            $('#end-date2').datepicker("option", "minDate", $('#start-date2').val());
            $('#end-date2').datepicker("option", "onClose", function (selectedDate) {
                $('#start-date2').datepicker("option", "maxDate", selectedDate);
            });
            
        });
    </script>
</html>