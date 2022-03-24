<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
                        <h1 class="h3 mb-0 text-gray-800">직원정보/임시승인자 편집</h1>
                        
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
                                        <form>
                                            <div class="input-group">
                                                <input type="text" class="form-control bg-light border-0 "
                                                    placeholder="검색하시오" aria-label="Search"
                                                    aria-describedby="basic-addon2">
                                            </div>
                                        </form>
                                    </div>
                                    <div id="search_result" >
                                        <br>
                                        <span class="personal">비트학원/마크애니/김찬호</span><br><br>
                                        <span>비트학원/비트컴퓨터/김찬호</span><br><br>
                                        <span>비트학원/비트컴퓨터/김찬호</span><br><br>
                                        <span>비트학원/드림시큐리티/김찬호</span><br><br>
                                    </div>
                                    <div class="container" id="tree_people">
                                        <div class="row">
                                            <div >
                                                <ul id="tree1">
                                                    <li class="pointer"> <i class="fas fa-fw fa-cog"></i>사업부1 <a href="#">김찬호 상무</a>
                                                        <ul>
                                                            <li><i class="fas fa-fw fa-bell"></i><a href="#">부서1</a> <a href="#">김찬호 부장</a>
                                                                <ul>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1 김찬호 과장</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1 김찬호1 과장</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1 김찬호2 과장</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </li>
                                                            <li><i class="fas fa-fw fa-bell"></i><a href="#">부서2</a>
                                                                <ul>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                   
                                        
                                                </ul>
                                                <ul id="tree2">
                                                    <li class="pointer"> <i class="fas fa-fw fa-cog"></i>사업부2
                                                        <ul>
                                                            <li><i class="fas fa-fw fa-bell"></i><a href="#">부서1</a>
                                                                <ul>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀1</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </li>
                                                            <li><i class="fas fa-fw fa-bell"></i><a href="#">부서2</a>
                                                                <ul>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    <li><i class="fas fa-fw fa-file"></i><a href="#">팀2</a>
                                                                        <ul>
                                                                            <li class="personal">고현욱</li>
                                                                            <li class="personal">김수진</li>
                                                                            <li class="personal">김찬호</li>
                                                                            <li class="personal">최수현</li>
                                                                        </ul>
                                                                    </li>
                                                                    
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                   
                                        
                                                </ul>
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
                                        <div>
                                            <form>
                                                <figure>
                                                    <img class="img-circle img-responsive " alt="" src="/resources/img/undraw_profile.svg" id="perimg">
                                                </figure>
                                               
                                            </form>
                                        
                                        </div>
                                        <br>
                                        <table class="table table-bordered " id="dataTable" cellspacing="0">
                                            <tr>
                                                <th class="col-lg-3">이름</th>
                                                <td>
                                                    <span>김찬호</span>
                                                </td>
                                            </tr>
                                            
                                            <tr>
                                              <th >생년월일</th>
                                              <td >
                                                <span>1995년 9월 13일</span>
                                              </td>
                                            </tr>
                                            <tr>
                                              <th >성별</th>
                                              <td >
                                                <span>남자</span>
                                                
                                              </td>
                                            </tr>
                                            <tr>
                                              <th >휴대폰 번호</th>
                                              <td >
                                                <span>010-4401-9611</span>
                                              </td>
                                            </tr>
                                            <tr>
                                                <th >이메일</th>
                                                <td >
                                                    <span>chanho470@naver.com</span>
                                                </td>
                                            </tr>
                                        </table>
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            
                                            <tr>
                                                <th class="col-lg-3">직급</th>
                                                <td>
                                                    <span>사원</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >직책</th>
                                                <td>
                                                    <span></span>
                                                    
                                                </td>
                                            </tr>
                                            <tr>
                                                <th>부서</th>
                                                <td>
                                                    <span>비트학원/마크애니</span>
                                                </td>
                                            </tr>
                                        </table>
                                        <table  class="table table-bordered" id="dataTable1" cellspacing="0" >
                                            <tr>
                                                <th class="col-lg-3">아이디</th>
                                                <td>
                                                    <span>chanho470</span>
                                                </td>
                                            </tr>
                                            <tr>
                                                <th >비밀번호</th>
                                                <td >
                                                    <span>*******</span>
                                                </td>
                                            </tr>
                                            
                                        </table>
                                        <div class="twobuttons" >
                                            <a href="../직원관리/상세보기.html" class="btn btn-outline-warning btn-lg btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-plus"></i>
                                                </span>
                                                <span class="text">수정하기</span>
                                            </a>
                                            <a class="content-detail btn btn-outline-primary btn-lg btn-icon-split">
                                                <span class="icon text-white-50">
                                                    <i class="fas fa-check"></i>
                                                </span>
                                                <span class="text">임시승인자 지정</span>
                                            </a>
                                        </div>  
                                    </div>
                                    
                                </div>
                            </div>
                            
                        </div>

                        

                       
                    </div>
                    
                </div>


<!-- 모달 -->
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
                                    <th><label class="font-weight-bold">권한부서정보</label></th>
                                    
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><div class="form-group">
                                        <select class="form-control col-md-8 selbox"  id="selectBox" name="selectBox" >
                                            <option value="1" selected>선택하시오</option>
                                            <option value="2">대표</option>
                                            <option value="3">본부장</option>
                                            <option value="4">부서장</option>
                                            <option value="4">팀장</option>
                                        </select>
                                    
                                    <td>
                                        <div class="form-group">
                                            <input class="form-control col-md-8" name="" value="" placeholder="사업부/부서">
                                        </div>
                                    </td>
                                    
                                </tr>
                            </tbody>
                    </table>
                    
                </div>
                
                <div class="form-group">
                    <label class="font-weight-bold">권한 대상</label>
                    <input class="form-control col-md-4" name="" value="" placeholder="김찬호" readonly>
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
                            <span class="demi">~</span>
                            <!-- 종료일 -->
                            <span class="input-date">
                                <input type="text" name="end-date2" value="" class="datepicker inp form-control" id="end-date2"
                                    placeholder="종료일" readonly />
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
                        <button type="button" id="positive" class="btn btn-default btn-hover-green" role="button">지정</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
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
        $(".personal").click(function(e){
            console.log($(this).text());
            if($('#som').css("display")=="none"){
                $('#som').show();
            }else{
                $('#som').hide();
            }
        
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