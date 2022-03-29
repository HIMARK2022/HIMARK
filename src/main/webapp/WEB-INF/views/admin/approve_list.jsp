<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
      <%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>admie</title>
</head>
<body>
<%@include file="../sidebar/admin_side.jsp"%>
<link href="/resources/css/admin_manage_authority.css" rel="stylesheet">
<link href="/resources/css/admin_modal.css" rel="stylesheet">
      <div class="container-fluid ">
                    <h1 class="h3 mb-2 text-gray-800">안건 목록 관리</h1>
                    <p class="mb-4"><b>새로운 안건을 생성하고 수정할 수 있는 페이지입니다.</b></p>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">승인 안건 목록</h6>
                        </div>
                        <div class="card-body">
                           
                            <p class="mb-4"><b>※현재 존재하는 안건 목록입니다.</b></p>
                            <div class="page-wrapper btnM">
                                <a class="content-detail btn btn-outline-primary btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-plus"></i>
                                    </span>
                                    <span class="text">새로운 안건 생성</span>
                                </a>
                            </div>
                            
                            <form action="/admin/approve_list_del" method="post" name="forDel" id="forDel">
                               <input type="hidden" name="delList" value="" id="sendDel"/>
                            </form>
                            
                            <div class="table-responsive col-lg-12" >
                                <br>  
                                <table class="table table-bordered table-hover" id="dataTable1"  cellspacing="0" >
                                    <thead>
                                        <tr>
                                            
                                            <th>권한명</th>
                                            <th>승인기간</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <c:forEach var="all" items="${all}">
                                           <tr>
                                               <td class="name">${all.classify_name}</td>
                                               <td>${all.approval_period}</td>
                                               <td>
                                                   <a href="#" class="btn btn-outline-danger delbtn" onclick="if(alert('삭제가 완료되었습니다.')==false)return false;">
                                                       <span class="text">삭제</span>
                                                   </a> 
                                                   
                                                  <a href="#" class="content-detail2 btn btn-outline-warning modbtn">
                                                       <span class="text">수정</span>
                                                  </a>
                                                 
                                               </td>
                                           </tr>
                                        </c:forEach>
                                    </tbody> 
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
     <!-- 생성 모달 -->
        <form action="/admin/approve_list_add" method="post" name="forAdd" id="forAdd">  
         <div class="modal-wrapper">
              <div class="modal">
                  <div class="modal-header">
                      <h4 class="modal-title" id="myModalLabel">안건 생성</h4>
                      <button type="button" class="close content-detail" data-dismiss="modal" aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                          <label class="font-weight-bold">안건명</label>
                          <input class="form-control" name="classify_name" id="classify_name" value="" 
                             autocomplete="username" required oninput = "checkId()"
                             placeholder="생성할 안건 명을 입력하세요">
                            <span class="id_ok">사용 가능한 안건명입니다.</span>
                     <span class="id_already">이미 존재하는 안건명입니다.</span>
                      </div>
                      <div class="form-group">
                          <label class="font-weight-bold">승인 기간</label>
                          <input class="form-control" name="approval_period" value="" placeholder="승인기간을 입력하세요 ex) 4일">
                      </div>
                  </div>
                  <div class="modal-footer">
                      <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                          <div class="btn-group" role="group">
                              <button type="button" class="btn btn-default content-detail" data-dismiss="modal" role="button">취소</button>
                          </div>
                          <div class="btn-group" role="group">
                              <button type="submit" id="positive" class="btn btn-default btn-hover-green" role="button">생성</button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
       </form>
       
       <!-- 수정 모달 -->
       <form action="/admin/approve_list_mod" method="post" name="forMod" id="forMod">                   
          <div class="modal-wrapper2">
              <div class="modal">
                  <div class="modal-header">
                      <h4 class="modal-title" id="myModalLabel">수정 안건 내용</h4>
                      <button type="button" class="close content-detail2" data-dismiss="modal" aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body">
                      <div class="form-group">
                          <label class="font-weight-bold">안건 명</label>
                          <input class="form-control" name="mod_name" value="" readonly>
                          <input class="form-control" name="org_name" value="" type="hidden">
                      </div>
                      <div class="form-group">
                          <label class="font-weight-bold">승인 기간</label>
                          <input class="form-control" name="mod_period" value="" >
                          <input class="form-control" name="org_period" value="" type="hidden">
                      </div>
                      
                  </div>
                  <div class="modal-footer">
                      <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                          <div class="btn-group" role="group">
                              <button type="button" class="btn btn-default content-detail2" data-dismiss="modal" role="button">취소</button>
                          </div>
                          <div class="btn-group" role="group">
                              <button type="submit" id="positive" class="btn btn-default btn-hover-green" role="button">수정하기</button>
                          </div>
                      </div>
                  </div>
              </div>
          </div>
       </form>
    </div>
<%@include file="../sidebar/footer.jsp"%>
 <script>
        $('.content-detail').on('click', function () {
            $('.modal-wrapper').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
        });
     
        $('.content-detail2').on('click', function () {
           $('.modal-wrapper2').toggleClass('open');
                     $('.page-wrapper2').toggleClass('blur-it');
                     console.log('수정');
                     return false;
        });
        
    </script>
<script>
   function deleteConfirm(){

      var isDelete=comfirm("삭제하시겠습니까?");
   }
</script>

    <script>
        $('.delbtn').on('click',function(){
           
           var delbtn = $(this);
           var tr = delbtn.parent().parent();
           var td = tr.children();
           console.log("클릭 테이블 이름 값 : "+td.eq(0).text());
           $('input[name=delList]').attr('value',td.eq(0).text());
           $("#forDel").submit();
        });
       $('.modbtn').on('click',function(){
          var modbtn = $(this);
          var tr = modbtn.parent().parent();
          var td = tr.children();
          $('input[name=mod_name]').attr('value',td.eq(0).text());
          $('input[name=mod_period]').attr('value',td.eq(1).text());
          $('input[name=org_name]').attr('value',td.eq(0).text());
          $('input[name=org_period]').attr('value',td.eq(1).text());
          
       });
    </script>
    <script>
       function checkId(){
           var classify_name = $('#classify_name').val(); //id값이 "id"인 입력란의 값을 저장
           $.ajax({
               url:'/admin/approve_list_check', //Controller에서 인식할 주소
               type:'post', //POST 방식으로 전달
               data:{classify_name:classify_name},
               success:function(cnt){
                  if(cnt != 1){ //cnt가 1이 아니면(=0일 경우) -> 사용 가능한
                       $('.id_ok').css("display","inline-block"); 
                       $('.id_already').css("display", "none");
                   } else if(cnt == 1){ // cnt가 1일 경우 -> 이미 존재하는
                       $('.id_already').css("display","inline-block");
                       $('.id_ok').css("display", "none");
                   }
               },
               error:function(){
                   alert("에러입니다");
               }
           });
       };
    </script>
</body>
</html>