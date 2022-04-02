var lang_kor = {
  "decimal" : "",
  "emptyTable" : "데이터가 없습니다.",
  "info" : "_START_ - _END_ (총 _TOTAL_ 건)",
  "infoEmpty" : "0건",
  "infoFiltered" : "(전체 _MAX_ 명 중 검색결과)",
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
  var table =$('#dataTable1').DataTable({
	language:lang_kor,
    ordering: false,
 	paging: true
  });
});
$(document).ready(function() {
  var table =$('#dataTable2').DataTable({
    
    language:lang_kor, 
    
    searching: true,    //검색란 표시 설정
    paging: true,  
    ordering: false
  });
});