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
<link href="/resources/css/admin_modify_team.css" rel="stylesheet">
<link href="/resources/css/admin_tree.css" rel="stylesheet">

<div class="container-fluid">
                    <div class="d-sm-flex align-items-center justify-content-between mb-4">
                        <h1 class="h3 mb-0 text-gray-800">팀 관리 > 팀 수정</h1>
                    </div>
                    <p class="mb-4"><b>팀의 정보를 편집할 수 있는 페이지입니다.</b></p>
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
                                        <span class="personal pointer">비트학원/마크애니/김찬호</span><br><br>
                                        <span class="personal pointer">비트학원/비트컴퓨터/김찬호</span><br><br>
                                        <span class="personal pointer">비트학원/비트컴퓨터/김찬호</span><br><br>
                                        <span class="personal pointer">비트학원/드림시큐리티/김찬호</span><br><br>
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
                        <!-- 사이드 새로운부서 생성 -->
                        <div class="col-xl-9 col-lg-9" >
                            <div class="card shadow mb-4 " >
                                <!-- Card Header - Dropdown -->
                                <div
                                    class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
                                    <h6 class="m-0 font-weight-bold text-primary">새로운 팀 정보 작성</h6>
                                </div>
                                <div id="som1">
                                    <h5 id="info_click"><b>※수정할 팀을 좌측 부서정보에서 선택하시오</b></h5>
                                    <img src="../img/HM.png">
                                </div>

                                <!-- Card Body -->
                                    <div class="card-body">
                                        <div id="som">
                                            
                                            <div>
                                                <br>
                                                <h4>수정할 팀 이름</h4>
                                                <p class="mb-4"><b>※편집하지 않을시 팀명은 현재 팀명으로 유지됩니다.</b></p>
                                                <div >
                                                    <input type="text" class="form-control form-control-user col-md-3 " id="exampleLastName"
                                                        placeholder="개발1팀">
                                                </div>
                                            </div>
                                            
                                            <br>
                                            <div class="table-responsive" >
                                                <br>
                                                <h4>팀원 목록</h4>
                                                <p class="mb-4"><b>※부서정보의 팀원을 클릭시 팀원에 추가됩니다.</b></p>
                                                <table class="table table-bordered table-borderless" id="dataTable1"  cellspacing="0" >
                                                    <thead>
                                                        <tr>
                                                            <th style="width: 25%;">이름</th>
                                                            <th style="width: 25%;">직책</th>
                                                            <th style="width: 25%;">직급</th>
                                                            <th style="width: 25%;">삭제</th>
                                                        </tr>
                                                    </thead>
                                                    <tbody>
                                                        <tr>
                                                            <td>김찬호</td>
                                                            <td>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex" id="inlineRadiosex1" value="male">
                                                                    <label class="form-check-label" for="inlineRadiosex1">팀원</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex" id="inlineRadiosex2" value="female">
                                                                    <label class="form-check-label" for="inlineRadiosex2">팀장</label>
                                                                </div>
                                                            </td>
                                                            <td>사원</td>
                                                            
                                                            <td>
                                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                                    <span class="text">삭제</span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>고현욱</td>
                                                            <td>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex3" value="male">
                                                                    <label class="form-check-label" for="inlineRadiosex3">팀원</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex4" value="female">
                                                                    <label class="form-check-label" for="inlineRadiosex4">팀장</label>
                                                                </div>
                                                            </td>
                                                            <td>사원</td>
                                                            
                                                            <td>
                                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                                    <span class="text">삭제</span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>김수진</td>
                                                            <td>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex3" value="male">
                                                                    <label class="form-check-label" for="inlineRadiosex3">팀원</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex4" value="female">
                                                                    <label class="form-check-label" for="inlineRadiosex4">팀장</label>
                                                                </div>
                                                            </td>
                                                            <td>사원</td>
                                                            
                                                            <td>
                                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                                    <span class="text">삭제</span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        <tr>
                                                            <td>최수현</td>
                                                            <td>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex3" value="male">
                                                                    <label class="form-check-label" for="inlineRadiosex3">팀원</label>
                                                                </div>
                                                                <div class="form-check form-check-inline">
                                                                    <input class="form-check-input" type="radio" name="inlineRadioOptionSex1" id="inlineRadiosex4" value="female">
                                                                    <label class="form-check-label" for="inlineRadiosex4">팀장</label>
                                                                </div>
                                                            </td>
                                                            <td>사원</td>
                                                            
                                                            <td>
                                                                <a href="#" class="btn btn-danger btn-icon-split">
                                                                    <span class="text">삭제</span>
                                                                </a>
                                                            </td>
                                                        </tr>
                                                        
                                                        
                                                    </tbody> 
                                                </table>
                                               
                                                <div id="createbtn">
                                                    <a href="#" class="btn btn-outline-success btn-lg btn-icon-split">
                                                        <span class="icon text-gray-600">
                                                            <i class="fas fa-arrow-right"></i>
                                                        </span>    
                                                        <span class="text">홈화면 이동</span>
                                                    </a>
                                                    
                                                    <a href="#" class="btn btn-outline-warning btn-lg btn-icon-split">
                                                        <span class="icon text-white-50">
                                                            <i class="fas fa-plus"></i>
                                                        </span>
                                                        <span class="text">수정하기</span>
                                                    </a>
                                                </div>     
                                            </div>
                                        </div>
                                                                                
                                    </div>
                            </div>
                            
                        </div>             
                    </div>
                    
                </div>


<%@include file="../sidebar/footer.jsp"%>
<script src="/resources/js/tree.js"></script>
<script>
        $(".personal").click(function(e){
            console.log($(this).text());
            if($('#som').css("display")=="none"){
                $('#som').show();
                $('#som1').hide();
            }else{
                $('#som').hide();
                $('#som1').show();
            }
        
        });
    </script>
</body>
</html>