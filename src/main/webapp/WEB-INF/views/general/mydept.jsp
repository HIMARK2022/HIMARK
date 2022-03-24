<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>나의 부서</title>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">
    <%@include file="../sidebar/general_side.jsp"%>
        <!-- 메인 시작 -->
                <div class="container-fluid ">
                    <h1 class="h3 mb-2 text-gray-800">나의 부서</h1>
                    <p class="mb-4"><b>사용자가 속한 부서원의 정보를 볼 수 있는 페이지입니다.</b></p>
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">나의 부서 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="table-responsive col-lg-12" >  
                                <h3>OOO 부서원</h3>
                                <br>
                                <table class="table table-bordered table-hover" id="dataTable1"  cellspacing="0" >
                                    <thead>
                                        <tr>
                                            <th style="width: 25%;">이름</th>
                                            <th style="width: 25%;">직책</th>
                                            <th style="width: 25%;">직급</th>
                                            <th style="width: 25%;">이메일</th>
                                        </tr>
                                    </thead>
                                    <tbody>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        <tr>
                                            <td>김찬호</td>
                                            <td>일반</td>
                                            <td>사원</td>
                                            <td>chanho470@naver.com</td>
                                        </tr>
                                        
                                        
                                    </tbody> 
                                </table>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- 메인 끝 -->
            </div>
            <!-- End of Main Content -->
            <%@include file="../sidebar/footer.jsp"%>
</body>
</html>