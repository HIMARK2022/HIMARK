<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
	<link href="/resources/vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">
    <link
        href="https://fonts.googleapis.com/css?family=Nunito:200,200i,300,300i,400,400i,600,600i,700,700i,800,800i,900,900i"
        rel="stylesheet">

    <!-- Custom styles for this template-->
    <link href="/resources/css/sb-admin-2.min.css" rel="stylesheet">
    <link href="/resources/css/login.css" rel="stylesheet">
</head>
<body>
<body class="bg-gradient-general">

    <div class="container">

        <!-- Outer Row -->
        <div class="row justify-content-center">

            <div class="col-xl-8 col-lg-12 col-md-9">

                <div class="card o-hidden border-0 shadow-lg">
                    
                    <div class="card-body">
                        <a class="logo d-flex align-items-center justify-content-center p-4" href="manager_request.html">
                            <div class="rotate-n-15">
                                <i class="fas fa-laugh-wink"></i>
                            </div>
                            <div class="mx-3">Hi Mark!</div>
                        </a>
                        <div class="general">general/approver</div>
                        <div class="admin">admin</div>

                        <!-- Nested Row within Card Body -->
                        <div class="row justify-content-center">
                            <div class="col-lg-8">
                                <div class="p-5">
                                    <form class="user" id="login">
                                        <div class="form-group">
                                            <input type="text" class="form-control form-control-user"
                                                name="userId" placeholder="아이디">
                                        </div>
                                        <div class="form-group">
                                            <input type="password" class="form-control form-control-user"
                                                name="userPwd" placeholder="비밀번호">
                                        </div>
                                        <!-- <div class="form-group">
                                            <div class="custom-control custom-checkbox small">
                                                <input type="checkbox" class="custom-control-input" id="customCheck">
                                                <label class="custom-control-label" for="customCheck">Remember
                                                    Me</label>
                                            </div>
                                        </div> -->
                                        <input type="hidden" name="authority" value="일반 사용자/승인자">
                                        <hr>
                                        <button type="button" class="btn btn-primary btn-user btn-block" onclick="checkForm()">
                                            Login
                                        </button>
                                    </form>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>

    <!-- Bootstrap core JavaScript-->
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
    <script src="/resources/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

    <!-- Core plugin JavaScript-->
    <script src="/resources/vendor/jquery-easing/jquery.easing.min.js"></script>

    <!-- Custom scripts for all pages-->
    <script src="/resources/js/sb-admin-2.min.js"></script>

    <script>
	    function checkForm() {
	    	var userId = $("input[name=userId]").val();
	    	var userPwd = $("input[name=userPwd]").val();
	    	var authority = $("input[name=authority]").val();
	    	
			if(!userId) {
				alert('아이디를 입력하세요');
				$("input[name=userId]").focus();
				return false;
			}
			
			if(!userPwd) {
				alert('비밀번호를 입력하세요');
				$("input[name=userPwd]").focus();
				return false;
			}
			
			$.ajax({
				url : '/login',
				type : 'POST',
				data: { userId: userId, 
						userPwd: userPwd,
						authority: authority },
				dataType : 'json',
				success: function(result) {
					console.log(result);
					console.log('로그인!!!!!!!!');
					
					if("none" == result.authorityCode) {
						alert('잘못된 아이디이거나, 비밀번호가 틀렸습니다.');
					} else if ("wrong" == result.authorityCode){
						alert('접근 불가능한 권한입니다!');
					} else if ("general" == result.authorityCode) {
						location.href = '/general/home';
					} else if ("approver" == result.authorityCode) {
						location.href = '/approver/home';
					} else {
						location.href = '/admin/home';
					}
				}, error: function(xhr, status, error) {
					alert('오류가 발생했습니다.');		
				}
			});
		}
    
        $(document).ready(function() {
        	// 로그인 엔터
        	$("#login").keypress(function (e) {
        		if(e.keyCode === 13) {
        			checkForm();
        		}
        	});
        	
            // 창 위치
            var element_height = $(".card").height();
            $(".card").css("margin-top", "calc((100vh - " + element_height + "px)/2)");
            $(".card").css("margin-bottom", "calc((100vh - " + element_height + "px)/2)");

            // 탭
            $(".admin").css("color", "gray");
            $(".admin").css("border-bottom", "none");
            
            $(".admin").click(function() {
                $(".general").css("color", "gray");
                $(".general").css("border-bottom", "none");
                
                $(".admin").css("color", "black");
                $(".admin").css("border-bottom", "solid 3px black");
                $(".user a").addClass("btn-dark");
                
                $('body').addClass('bg-gradient-admin');
                $("input[name=authority]").val("관리자");
            });

            $(".general").click(function() {
                $(".general").css("color", "#051367");
                $(".general").css("border-bottom", "solid 3px #051367");
                
                $(".admin").css("color", "gray");
                $(".admin").css("border-bottom", "none");
                $(".user a").removeClass("btn-dark");

                $('body').removeClass('bg-gradient-admin');
                $("input[name=authority]").val("일반 사용자/승인자");
            });
        });
    </script>

</body>

</html>