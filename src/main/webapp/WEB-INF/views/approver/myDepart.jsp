<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%@include file="../sidebar/approver_side.jsp"%>
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
                                    <p id="info_text"><b>※관리중인 부서정보를 확인할 수 있습니다 .</b></p>
                                    <div class="container" id="tree_people">
                                        <div class="row">
                                            <div >
                                                <!-- <ul id="tree1"> 부서장일경우
                                                    <li class="pointer"> <i class="fas fa-fw fa-cog"></i>비트학원
                                                        <ul id="tree1">
                                                            <li class="pointer"><i class="fas fa-fw fa-bell"></i><a href="#">마크애니</a>
                                                                <ul>
                                                                    <li class="personal">고현욱</li>
                                                                    <li class="personal">김수진</li>
                                                                    <li class="personal">김찬호</li>
                                                                    <li class="personal">최수현</li>
                                                                </ul>
                                                            </li>
                                                            <li><i class="fas fa-fw fa-bell"></i>드림시큐리티
                                                                <ul>
                                                                    <li>권희수</li>
                                                                    <li>김종백</li>
                                                                    <li>박현주</li>
                                                                    <li>박현민</li>
                                                                    <li>박준호</li>
                                                                </ul>
                                                            </li>
                                                            <li><i class="fas fa-fw fa-bell"></i>비트컴퓨터
                                                                <ul>
                                                                    <li>최인우</li>
                                                                    <li>유채현</li>
                                                                    <li>조장훈</li>
                                                                </ul>
                                                            </li>
                                                        </ul>
                                                    </li>
                                                </ul> -->
                                                <!-- 팀장일경우 -->
                                                <ul id="tree1">
                                                    <li class="pointer"><i class="fas fa-fw fa-bell"></i><a href="#">마크애니</a>
                                                        <ul>
                                                            <li class="personal">고현욱</li>
                                                            <li class="personal">김수진</li>
                                                            <li class="personal">김찬호</li>
                                                            <li class="personal">최수현</li>
                                                        </ul>
                                                    </li>
                                                </ul>
                                                 <!-- 팀장일경우 -->
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
                                            <h3>팀장 최수현의 OOO부서원</h3>
                                            <p class="mb-4"><b>※대상의 이름을 클릭하면 임시승인자 권한을 부여할 수 있습니다.</b></p>
                                            <br>
                                            <table class="table table-bordered table-hover" id="dataTable1"  cellspacing="0" >
                                                <thead>
                                                    <tr>
                                                        <th >이름</th>
                                                        <th >직책</th>
                                                        <th >직급</th>
                                                        <th >이메일</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>최수현</td>
                                                        <td>팀장</td>
                                                        <td>과장</td>
                                                        <td>chltngus129@gmail.com</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="page-wrapper">
                                                                <a class="content-detail">
                                                                    <span class="text">고현욱</span>
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>일반</td>
                                                        <td>대리</td>
                                                        <td>superrookie@gmail.com</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="page-wrapper">
                                                                <a class="content-detail">
                                                                    <span class="text">김수진</span>
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>일반</td>
                                                        <td>사원</td>
                                                        <td>rlatnwls0606@gmail.com</td>
                                                    </tr>
                                                    <tr>
                                                        <td>
                                                            <div class="page-wrapper">
                                                                <a class="content-detail">
                                                                    <span class="text">김찬호</span>
                                                                </a>
                                                            </div>
                                                        </td>
                                                        <td>일반</td>
                                                        <td>인턴</td>
                                                        <td>chanho470@naver.com</td>
                                                    </tr>
                                                    
                                                </tbody> 
                                            </table>
                                        </div>
                                    </div>
                                     <!-- Card Body 좌측 페이지 -->
                            </div>
                            
                        </div>             
                    </div>
                    
                </div>
                 <!-- Modal -->
    <div class="modal-wrapper">
        <div class="modal">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">임시 승인자 지정</h4>
                <button type="button" class="close content-detail" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="font-weight-bold">대상</label>
                    <input class="form-control" name="" value="김찬호" readonly>
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">임시 승인 기간</label>
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
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default content-detail" data-dismiss="modal" role="button">취소</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="positive" class="btn btn-default btn-hover-green" role="button">권한부여</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../sidebar/footer.jsp"%>
 <script src="/resources/js/tree.js"></script>
<script>
$('.content-detail').on('click', function () {
    $('.modal-wrapper').toggleClass('open');
     $('.page-wrapper').toggleClass('blur-it');
     return false;
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
</body>
</html>