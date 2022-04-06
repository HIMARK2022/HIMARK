/**
 * 
 */
//요청 내역
//테이블

var lang_kor = {
    "decimal" : "",
    "emptyTable" : "데이터가 없습니다.",
    "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
    "infoEmpty" : "0건",
    "infoFiltered" : "(전체 _MAX_ 건 중 검색결과)",
    "infoPostFix" : "",
    "thousands" : ",",
    "lengthMenu" : "_MENU_ 개씩 보기",
    "loadingRecords" : "로딩중...",
    "processing" : "처리중...",
    "search" : "검색 : ",
    "zeroRecords" : "검색된 데이터가 없습니다.",
    "paginate" : {
        "first" : "첫 페이지",
        "last" : "마지막 페이지",
        "next" : "다음",
        "previous" : "이전"
    }
};

$(document).ready(function() {
    $('#dataTable').DataTable({
        "pageLength":10, 
        responsive: false,  //반응형 설정
        pageLength: 10,     //페이지 당 글 개수 설정
        order:[[1,"desc"]],
        destroy: true,
        processing: true,
        serverSide: false,
        searching: true,    //검색란 표시 설정
		ordering: false,
        paging: true,  
        language:lang_kor,
		"autoWidth": false,
		columnDefs:[{targets: 0, width: '100px' },
				{targets: 1, width: '100px' },
				{targets: 2, width: '200px' },
				{targets: 3, width: '100px' },
				{targets: 4, width: '100px' },
				{targets: 5, width: '100px' },
				{targets: 6, width: '100px' },
				],
        
        lengthChange: true
    });

	$('#dataTable1').DataTable({
        "pageLength":10, 
        responsive: false,  //반응형 설정
        pageLength: 10,     //페이지 당 글 개수 설정
        order:[[1,"desc"]],
        destroy: true,
        processing: true,
        serverSide: false,
        searching: true,    //검색란 표시 설정
		ordering: false,
        paging: true,  
        language:lang_kor,
		/*columns:[{"data":"문서번호","width":"10%"},
				{"data":"분류","width":"13%"},
				{"data":"제목","width":"25%"},
				{"data":"요청일","width":"13%"},
				{"data":"반려일","width":"13%"},
				{"data":"요청자","width":"13%"},
				{"data":"상태","width":"13%"},
				],*/
		"autoWidth": false,
		columnDefs:[{targets: 0, width: '100px' },
				{targets: 1, width: '100px' },
				{targets: 2, width: '200px' },
				{targets: 3, width: '100px' },
				{targets: 4, width: '100px' },
				{targets: 5, width: '100px' },
				{targets: 6, width: '100px' },
				],
        
        lengthChange: true
    });

  $('#dataTable2').DataTable({
       "pageLength":10, 
        responsive: false,  //반응형 설정
        pageLength: 10,     //페이지 당 글 개수 설정
        order:[[1,"desc"]],
        destroy: true,
        processing: true,
        serverSide: false,
        searching: true,    //검색란 표시 설정
		ordering: false,
        paging: true,  
        language:lang_kor,
		/*columns:[{"data":"문서번호","width":"10%"},
				{"data":"분류","width":"13%"},
				{"data":"제목","width":"25%"},
				{"data":"요청일","width":"13%"},
				{"data":"승인일","width":"13%"},
				{"data":"요청자","width":"13%"},
				{"data":"상태","width":"13%"},
				],*/
		"autoWidth": false,
		columnDefs:[{targets: 0, width: '100px' },
				{targets: 1, width: '100px' },
				{targets: 2, width: '200px' },
				{targets: 3, width: '100px' },
				{targets: 4, width: '100px' },
				{targets: 5, width: '100px' },
				{targets: 6, width: '100px' },
				],
        
        lengthChange: true
    });
    $('#dataTable3').DataTable({
      "pageLength":10, 
        responsive: false,  //반응형 설정
        pageLength: 10,     //페이지 당 글 개수 설정
        order:[[1,"desc"]],
        destroy: true,
        processing: true,
        serverSide: false,
        searching: true,    //검색란 표시 설정
		ordering: false,
        paging: true,  
        language:lang_kor,
        
        lengthChange: true
    });
});
 //첨부파일명 보이기
        $( document ).ready(function() {
            $(".custom-file-input").on('change', function () {
                var fileName = $(this).val()
                console.log(fileName)
                $(this).next('.custom-file-label').html(fileName.substr(12));
            })
        });


console.log("Payment Module............");
var paymentService={};

var paymentService = (function() {
	function getManager(requestNo,callback, error) {
				console.log(requestNo);
		$.getJSON("/general/getManager?requestNo=" +requestNo,
			function(data) {
			console.log(data);
			});
	}//getManager
	
	return{
		getManager:getManager
		
	};
})();