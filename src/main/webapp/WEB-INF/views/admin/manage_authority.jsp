<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@include file="../sidebar/admin_side.jsp"%>
<link href="/resources/css/admin_manage_authority.css" rel="stylesheet">
<link href="/resources/css/admin_modal.css" rel="stylesheet">
		<div class="container-fluid ">
                    <h1 class="h3 mb-2 text-gray-800">권한관리</h1>
                    <p class="mb-4"><b>새로운 권한을 생성하고 승인자에게 권한을 부여할 수 있는 페이지입니다.</b></p>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">권한목록</h6>
                        </div>
                        <div class="card-body">
                            <h3>권한 목록</h3>
                            <p class="mb-4"><b>※현재 존재하는 권한 목록입니다.</b></p>
                            <div id="addbtn">
                                <a class="content-detail btn btn-outline-primary btn-icon-split">
                                    <span class="icon text-white-50">
                                        <i class="fas fa-plus"></i>
                                    </span>
                                    <span class="text">권한 생성</span>
                                </a>
                            </div>
                            
                            <div class="table-responsive col-lg-12" >
                                <br>  
                                <table class="table table-bordered" id="dataTable1"  cellspacing="0" >
                                    <thead>
                                        <tr>
                                            <th>구분(사업부/부서)</th>
                                            <th>권한 소유 직급</th>
                                            <th>권한명</th>
                                            <th>승인기간</th>
                                            <th>관리</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>공통</td>
                                            <td>팀장</td>
                                            <td>휴가</td>
                                            <td>3일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>공통</td>
                                            <td>팀장</td>
                                            <td>팀업무A</td>
                                            <td>4일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>공통</td>
                                            <td>부서장</td>
                                            <td>팀업무B</td>
                                            <td>5일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>공통</td>
                                            <td>본부장</td>
                                            <td>팀업무C</td>
                                            <td>5일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>공통</td>
                                            <td>대표</td>
                                            <td>비용처리</td>
                                            <td>7일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        <tr>
                                            <td>비트학원/마크애니</td>
                                            <td>팀장</td>
                                            <td>문서보안</td>
                                            <td>7일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        
                                        <tr>
                                            <td>비트학원/드림시큐리티</td>
                                            <td>부서장</td>
                                            <td>보안설계</td>
                                            <td>7일</td>
                                            <td>
                                                <a href="#" class="btn btn-danger">
                                                    <span class="text">삭제</span>
                                                </a> 
                                                <a href="#" class="btn btn-warning">
                                                    <span class="text">수정</span>
                                                </a>
                                            </td>
                                        </tr>
                                        
                                    </tbody> 
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                
<div class="modal-wrapper">
        <div class="modal">
            <div class="modal-header">
                <h4 class="modal-title" id="myModalLabel">권한 내용</h4>
                <button type="button" class="close content-detail" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body">
                <div class="form-group">
                    <label class="font-weight-bold">구분 (사업부/부서/팀)</label>
                    <p class="mb-4 textcom">※공통을 선택시 선택한 모든 권한대상에게 권한이 부여됩니다.</p>
                    <div class="row form-group">
                        <select class="form-control col-md-3 selbox"  id="selectBox" name="selectBox" >
                            <option value="1" selected>선택하시오</option>
                            <option value="2">공통</option>
                            <option value="3">비트학원1</option>
                            <option value="4">비트학원2</option>
                        </select>
                        <select class="form-control col-md-3 selbox2"  id="selectBox2" name="selectBox2" style="display: none;">
                            <option value="1">마크애니1</option>
                            <option value="2">드림시큐리티1</option>
                            <option value="3">비트컴퓨터1</option>
                        </select>
                        <select class="form-control col-md-3 selbox3"  id="selectBox3" name="selectBox3" style="display: none;">
                            <option value="1">마크애니2</option>
                            <option value="2">드림시큐리티2</option>
                            <option value="3">비트컴퓨터2</option>
                        </select>
                        <select class="form-control col-md-3 selbox5"  id="selectBox5" name="selectBox5" style="display: none; margin-left: 2%;">
                            <option value="1">선택안함</option>
                            <option value="2">팀1</option>
                            <option value="3">팀2</option>
                            <option value="4">팀3</option>
                        </select>
                        
                    </div>
                </div>
                
                <div class="form-group">
                    <label class="font-weight-bold">권한 대상</label>
                    <select class="form-control col-md-5 selbox4"  id="selectBox4" name="selectBox4">
                        <option value="111">선택하시오</option>
                        <option value="11">팀장</option>
                        <option value="22">부서장</option>
                        <option value="33">본부장</option>
                        <option value="44">대표</option>
                    </select>
                </div>
                <div class="form-group ">
                    <label class="font-weight-bold">승인기간</label>
                    <input class="form-control col-md-5" name="" value="" placeholder="숫자만 입력하세요">
                </div>
                <div class="form-group">
                    <label class="font-weight-bold">권한명</label>
                    <input class="form-control" name="" value="" placeholder="권한명을 입력하세요">
                </div>
            </div>
            <div class="modal-footer">
                <div class="btn-group btn-group-justified" role="group" aria-label="group button">
                    <div class="btn-group" role="group">
                        <button type="button" class="btn btn-default content-detail" data-dismiss="modal" role="button">취소</button>
                    </div>
                    <div class="btn-group" role="group">
                        <button type="button" id="positive" class="btn btn-default btn-hover-green" role="button">생성</button>
                    </div>
                </div>
            </div>
        </div>
    </div>
<%@include file="../sidebar/footer.jsp"%>
 <script>
        $('.content-detail').on('click', function () {
            $('.modal-wrapper').toggleClass('open');
                    $('.page-wrapper').toggleClass('blur-it');
                    return false;
        });
    </script>

    <script>
        $(document).ready(function() {
            $('#selectBox').change(function() {
            var result = $('#selectBox option:selected').val();
            if (result == '3') {
                $('.selbox2').show();
                
            }else if(result == '4'){
                $('.selbox2').hide();
                $('.selbox3').show();
            }else {
                $('.selbox2').hide();
                $('.selbox3').hide();
            }

            if(result == '2'){
                $('.textcom').show();
            }else{
                $('.textcom').hide();
            }
            });

            $('#selectBox2').change(function() {
            var result = $('#selectBox5 option:selected').val();
            if (result == '1') {
                $('.selbox5').show();
            }else{
                $('.selbox5').hide();
            }

            });
            
        }); 
    </script>
</body>
</html>