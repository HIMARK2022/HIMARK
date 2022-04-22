<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
</head>
<body id="page-top">

    <!-- Page Wrapper -->
    <div id="wrapper">

        <!-- Sidebar 사이드바-->
		<page:applyDecorator name="generalSide" />
        <!-- End of Topbar 헤더 끝 -->
        <!-- 메인 시작 -->
                <div class="container-fluid ">
                    <div class="card shadow mb-4">
                        <div class="card-header py-3">
                            <h6 class="m-0 font-weight-bold text-primary">나의 정보</h6>
                        </div>
                        <div class="card-body">
                            <div class="panel-body">
                                    <h3 class="card-title text-left mb-0 mt-1">비밀번호 입력</h3>
                                    <p class="text-danger text-left">*정보 확인을 위해 비밀번호를 입력해주세요.</p>
                                    <form>
                                        <div class="form-group col-lg-3">
                                            <div class="input-group">
                                                <div class="input-group-prepend">
                                                    <span class="input-group-text"> <i class="fa fa-lock"></i> </span>
                                                </div>
                                                <input class="form-control" placeholder="******" type="password">
                                                <div class="col-4">
                                           <button class="btn btn-primary" type="submit">확인</button>
                                       </div>
                                            </div> <!-- input-group.// -->
                                        </div> <!-- form-group// -->
                                    </form>
                
                              </div>
                            </div>       
                                        
                            
                        </div>
                    </div>
                <!-- 메인 끝 -->
            </div>
            <!-- End of Main Content -->
	<page:applyDecorator name="footer" />
</body>
</html>