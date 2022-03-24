<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 요청(일반 사용자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
        <%@include file="../sidebar/general_side.jsp"%>
        <!-- End of Topbar 헤더 끝 -->
        
        <div class="container-fluid">

                    <!-- Page Heading -->
                    <h1 class="h3 mb-2 text-gray-800">요청</h1>
                    <p class="mb-4">
                        요청 내역을 확인하고 신규 기안 요청할 수 있습니다
                    </p>

                    <ul class="nav nav-tabs">
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow active" data-toggle="tab" href="#tab1">
                                <h6 class="m-0 font-weight-bold text-primary">요청 내역</h6>
                            </a>
                        </li>
                        <li class="nav-item">
                            <a class="nav-link py-3 shadow" data-toggle="tab" href="#tab2">
                                <h6 class="m-0 font-weight-bold text-primary">신규 기안</h6>
                            </a>
                        </li>
                    </ul>

                    <div class="card shadow mb-4">
                        <div class="tab-content">
                            <!-- 요청 내역 Start -->
                                <div class="tab-pane fade show active" id="tab1">
                                    <div class="card-body">

                                        <!-- 필터 카드 Start -->
                                        <p>
                                            <div class="card border-left-primary shadow h-100 py-2">
                                                <div class="card-body">

                                                    <div class="row no-gutters align-items-center">
                                                        <div class="col mr-2">
                                                            <div class="font-weight-bold text-primary text-uppercase mb-1">
                                                                키워드 필터
                                                            </div>
                                                            <p>
                                                               <div class="h5 mb-0 font-weight-bold text-gray-800" id="filter">
                                                                    분류1
                                                                    <label><input type="checkbox" value="1"/>Aaaaa</label>
                                                                    <label><input type="checkbox" value="2"/>Baaaa</label>
                                                                    <label><input type="checkbox" value="3"/>Caaaa</label>
                                                                    <label><input type="checkbox" value="4"/>Daaaa</label>
                                                                    <label><input type="checkbox" value="5"/>Eaaaa</label>
                                                                    <label><input type="checkbox" value="6"/>Faaaa</label>
                                                                    <label><input type="checkbox" value="7"/>Gaaaa</label>
                                                                </div> 
                                                            </p>
                                                            <p>
                                                               <div class="h5 mb-0 font-weight-bold text-gray-800" id="filter">
                                                                    분류2
                                                                    <label><input type="checkbox" value="1"/>Aaaaa</label>
                                                                    <label><input type="checkbox" value="2"/>Baaaa</label>
                                                                    <label><input type="checkbox" value="3"/>Caaaa</label>
                                                                    <label><input type="checkbox" value="4"/>Daaaa</label>
                                                                    <label><input type="checkbox" value="5"/>Eaaaa</label>
                                                                    <label><input type="checkbox" value="6"/>Faaaa</label>
                                                                    <label><input type="checkbox" value="7"/>Gaaaa</label>
                                                                </div> 
                                                            </p>
                                                            <p>
                                                               <div class="h5 mb-0 font-weight-bold text-gray-800" id="filter">
                                                                    분류3
                                                                    <label><input type="checkbox" value="1"/>Aaaaa</label>
                                                                    <label><input type="checkbox" value="2"/>Baaaa</label>
                                                                    <label><input type="checkbox" value="3"/>Caaaa</label>
                                                                    <label><input type="checkbox" value="4"/>Daaaa</label>
                                                                    <label><input type="checkbox" value="5"/>Eaaaa</label>
                                                                    <label><input type="checkbox" value="6"/>Faaaa</label>
                                                                    <label><input type="checkbox" value="7"/>Gaaaa</label>
                                                                </div> 
                                                            </p>
                                                            <div class="h5 mb-0 mb-3">
                                                                <ul class="searchDate">
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="today1" class="btn btn-sm btn-info" onclick="setSearchDate('0d', '1')" />
                                                                            <label for="today1">당일</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="3days1" onclick="setSearchDate('3d', '1')" />
                                                                            <label for="3days1">3일</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="1week1" onclick="setSearchDate('1w', '1')" />
                                                                            <label for="1week1">1주</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="2week1" onclick="setSearchDate('2w', '1')" />
                                                                            <label for="2week1">2주</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="1month1" onclick="setSearchDate('1m', '1')" />
                                                                            <label for="1month1">1개월</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="3month1" onclick="setSearchDate('3m', '1')" />
                                                                            <label for="3month1">3개월</label>
                                                                        </span>
                                                                    </li>
                                                                    <li>
                                                                        <span class="chkbox">
                                                                            <input type="radio" name="dateType" id="6month1" onclick="setSearchDate('6m', '1')" />
                                                                            <label for="6month1">6개월</label>
                                                                        </span>
                                                                    </li>
                                                                </ul>
                                                            </div>
                                                            <div class="h5 mb-0 font-weight-bold text-gray-800">
                                                                <div class="clearfix">
                                                                    <!-- 시작일 -->
                                                                    <span class="dset">
                                                                        <input type="text" name="start-date1" value="" class="datepicker inp" id="start-date1"
                                                                            placeholder="시작일" readonly />
                                                                        <i class="fa-regular fa-calendar-days dateclick"></i>
                                                                    </span>
                                                                    <span class="demi">~</span>
                                                                    <!-- 종료일 -->
                                                                    <span class="dset">
                                                                        <input type="text" name="end-date1" value="" class="datepicker inp" id="end-date1"
                                                                            placeholder="종료일" readonly />
                                                                        <i class="fa-regular fa-calendar-days dateclick"></i>
                                                                    </span>
                                                                </div>
                                                            </div> 
                                                        </div>
                                                        <div class="col-auto">
                                                            <i class="fas fa-clipboard-list fa-2x text-gray-300"></i>
                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </p>
                                        <!-- 필터 카드 End -->

                                        <div class="table-responsive">
                                            <table class="table table-bordered" id="dataTable" width="100%" cellspacing="0">
                                                <thead>
                                                    <tr>
                                                        <th id="No">No</th>
                                                        <th id="classification">분류</th>
                                                        <th id="title">제목</th>
                                                        <th id="requestdate">요청일</th>
                                                        <th id="state">상태</th>
                                                    </tr>
                                                </thead>
                                                <tbody>
                                                    <tr>
                                                        <td>1</td>
                                                        <td>휴가</td>
                                                        <td><a class="collapse-item" href="상세보기.html">휴가 요청</a></td>
                                                        <td>2022/03/10</td>
                                                        <td>결재 진행중..</td>
                                                    </tr>
                                                    <tr>
                                                        <td>2</td>
                                                        <td>비용</td>
                                                        <td><a class="collapse-item" href="상세보기.html">아이폰 사줘</a></td>
                                                        <td>2022/03/10</td>
                                                        <td>결재 대기</td>
                                                    </tr>
                                                    <tr>
                                                        <td>3</td>
                                                        <td>긴글aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</td>
                                                        <td><a class="collapse-item" href="상세보기.html">긴글aaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaaa</a></td>
                                                        <td>2022/03/10</td>
                                                        <td>결재 대기</td>
                                                    </tr>
                                                    <tr>
                                                        <td>4</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>5</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>6</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>7</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>8</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>9</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>10</td>
                                                        <td></td>
                                                        <td><a class="collapse-item" href="상세보기.html"></a></td>
                                                        <td></td>
                                                        <td></td>
                                                    </tr>
                                                    <tr>
                                                        <td>11</td>
                                                        <td>휴가</td>
                                                        <td><a class="collapse-item" href="상세보기.html">휴가 요청</a></td>
                                                        <td>2022/03/10</td>
                                                        <td>결재 진행중..</td>
                                                    </tr>
                                                </tbody>
                                            </table>
                                        </div>
                                    </div>
                                </div>
                            <!-- 요청 내역 End -->

                            <!-- 신규 기안 Start -->
                                <div class="tab-pane fade show" id="tab2">
                                    <div class="table-responsive">
                                        <div class="card-body">
                                            <p>
                                                <h6>제목</h6>
                                                <input type="text" class="form-control col-xl-4" required>
                                            </p>
                                            <p>
                                                <h6>양식명</h6>
                                                <select class="form-control col-xl-4">
                                                    <option value='' disabled selected>-- 결재 분류 --</option>
                                                    <optgroup label="Common">
                                                        
                                                        <option value='a'>휴가</option>
                                                        <option value='b'>비용</option>
                                                    </optgroup>
                                                    <optgroup label="Department ">
                                                        <option value='c'>팀업무 A</option>
                                                        <option value='c'>팀업무 B</option>
                                                        <option value='c'>팀업무 C</option>
                                                        <option value='c'>팀업무 D</option>
                                                        <option value='c'>팀업무 E</option>
                                                    </optgroup>
                                                  </select>
                                            </p>
                                            <p>
                                                <h6>기안자</h6>
                                                <strong id="strong"> 엔터프라이즈부(부서명) / 개발팀1(팀명) / 고현욱(이름) </strong>
                                             </p>
                                            <p>
                                                <h6>중요도</h6>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio1" value="긴급">
                                                    <label class="form-check-label" for="inlineRadio1">긴급</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio2" value="높음">
                                                    <label class="form-check-label" for="inlineRadio2">높음</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio3" value="보통">
                                                    <label class="form-check-label" for="inlineRadio3">보통</label>
                                                </div>
                                                <div class="form-check form-check-inline">
                                                    <input class="form-check-input" type="radio" name="inlineRadioOptions" id="inlineRadio4" value="낮음">
                                                    <label class="form-check-label" for="inlineRadio3">낮음</label>
                                                </div>
                                            </p>
                                            <p>
                                                <h6>첨부파일</h6>
                                                <div class="custom-file col-xl-4">
                                                    <input type="file" class="custom-file-input" id="Files">
                                                    <label class="custom-file-label" for="Files">파일선택</label>
                                                </div>
                                            </p>
                                            <p>
                                                <h6>내용</h6>
                                                <textarea class="form-control" placeholder="내용을 입력해 주세요." rows="10"></textarea>
                                            </p>
                                            <button class="btn btn-outline-primary" type="submit">요청하기</button>
                                        </div>
                                        
                                    </div>
                                    
                                </div>
                            <!-- 신규 기안 End -->
                        </div>
                    </div>
                </div>
                <!-- 요청.html -->

            </div>
            <!-- End of Main Content -->
        <%@include file="../sidebar/footer.jsp"%>
        <script src="resources/js/request.js"></script>
        
</body>
</html>