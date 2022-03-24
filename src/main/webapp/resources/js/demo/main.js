$(document).ready(function () {

    // $.fn.dataTable.ext.search.push(
    //     function(settings, data, dataIndex){
    //         var min = Date.parse($('#fromDate').val());
    //         var max = Date.parse($('#toDate').val());
    //         var targetDate = Date.parse(data[5]);

    //         if( (isNaN(min) && isNaN(max) ) || 
    //             (isNaN(min) && targetDate <= max )|| 
    //             ( min <= targetDate && isNaN(max) ) ||
    //             ( targetDate >= min && targetDate <= max) ){ 
    //                 return true;
    //         }
    //         return false;
    //     }
    // )
    $("#searchBtn").click(function () {
        var numCols = table.columns().nodes().length;
        for(var i=0; i<numCols; i++) { table.column(i).search(''); }
    
        var searchType = $("#searchType").val();
        var searchValue = $("#searchValue").val();
    
        table.column(searchType).search(searchValue).draw();
    })
    

    var table = $('#myTable').DataTable({
        ajax: {
            'url':'MOCK_DATA.json', 
            //'type': 'POST',
            'dataSrc':''
        },
        responsive: true,
        orderMulti: true,
        order : [[1, 'desc']],
        columns: [
            {"data": "이름"},
            {"data": "부서"},
            {"data": "직급"}, 
            {"data": "직책"}, 
            {"data": "권한"},
            
        ],
        "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "_MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "에서 검색 : ",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
        // columnDefs: [
        //     // 2번째 항목 넓이를 100px로 설정
        //     { targets: [0,1,2,3]}
        // ],
        
        dom : 'Blfrtip', //다운로드 버튼 위치 B
        buttons:[{
			extend:'csvHtml5',
			text: '다운로드',
			footer: true,
			bom: true,
			className: 'exportCSV'
		}]
    });
    $("#myTable_filter").attr("hidden", "hidden");

    $('.searchEmp').prepend('<select id="searchType"></select>');
    $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
        $('#searchType').append('<option>'+valueOfElement.innerHTML+'</option>');
    });
    $('.exportCSV').prepend('<span class="icon text-gray-600" style="padding-right:7px"><i class="fas fa-download"></i></span>');


    // /* Column별 검색기능 추가 */
    // $('#myTable_filter').prepend('<select id="select"></select>');
    // $('#myTable > thead > tr').children().each(function (indexInArray, valueOfElement) { 
    //     $('#select').append('<option>'+valueOfElement.innerHTML+'</option>');
    // });
    
    // $('.dataTables_filter input').unbind().bind('keyup', function () {
    //     var colIndex = document.querySelector('#select').selectedIndex;
    //     table.column(colIndex).search(this.value).draw();
    // });

    
    $('#myTable_filter').prepend('<button class="btn" type="button" onclick="reloadDivArea();"><img class="img-btn" src="/img/refresh_icon2.png"></button>');
    


    /* 날짜검색 이벤트 리바인딩 */
    // $('#myTable_filter').prepend('<input type="text" id="toDate" placeholder="yyyy-MM-dd"> ');
    // $('#myTable_filter').prepend('<input type="text" id="fromDate" placeholder="yyyy-MM-dd">~');
    // $('#toDate, #fromDate').unbind().bind('keyup',function(){
    //     table.draw();
    // })


    var table2 = $('#managerTable').DataTable({
        ajax: {
            'url':'MANAGER_MOCK_DATA.json', 
            //'type': 'POST',
            'dataSrc':''
        },
        responsive: true,
        orderMulti: true,
        order : [[1, 'desc']],
        columns: [
            {"data": "No."},
            {"data": "이름"},
            {"data": "부서"},
            {"data": "직급"}, 
            {"data": "권한"}   
        ],
        "language": {
            "emptyTable": "데이터가 없어요.",
            "lengthMenu": "_MENU_ 개씩 보기",
            "info": "현재 _START_ - _END_ / _TOTAL_건",
            "infoEmpty": "데이터 없음",
            "infoFiltered": "( _MAX_건의 데이터에서 필터링됨 )",
            "search": "에서 검색 : ",
            "zeroRecords": "일치하는 데이터가 없어요.",
            "loadingRecords": "로딩중...",
            "processing":     "잠시만 기다려 주세요...",
            "paginate": {
                "next": "다음",
                "previous": "이전"
            }
        },
        // columnDefs: [
        //     // 2번째 항목 넓이를 100px로 설정
        //     { targets: [0,1,2,3]}
        // ],
        
        dom : 'lfrBtip', //다운로드 버튼 위치 B
        buttons:[{
			extend:'csvHtml5',
			text: '다운로드',
			footer: true,
			bom: true,
			className: 'exportCSV'
		}]
    });
    $('#managerTable tr td').each(function(){
        alert('aaaa');
        this.append('<a class="btn btn-sm btn-primary ">허가');
    });
    

});