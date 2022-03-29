/**
 * 임시 승인자 지정에 사용되는 달력 
 */

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