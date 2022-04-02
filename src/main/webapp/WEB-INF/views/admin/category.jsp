<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>결재 분류</title>
</head>

<body>
	<%@include file="../sidebar/admin_side.jsp"%>
	<link href="/resources/css/category.css" rel="stylesheet">
	<link href="/resources/css/admin_manage_authority.css" rel="stylesheet">
<!-- 	<link href="/resources/css/admin_modal.css" rel="stylesheet"> -->
	<link href="/resources/css/calendar.css" rel="stylesheet">
	<script type="text/javascript">
		$(document).ready(function(e) {

			var htmlText = "";
			$.ajax({
				type : "get",
				url : "/admin/uppercategory",
				success : function(data) {
					for (var i = 0; i < data.length; i++) {
						console.log("상위분류 :" + data);
						htmlText += "<li class='upper'>" + data[i] + "</li>"

					}
					$('ul.uppercategory').html(htmlText);
				}

			});
			
			
		});
	</script>


	<div class="container-fluid">
		<div class="d-sm-flex align-items-center justify-content-between mb-4">
			<h1 class="h3 mb-0 text-gray-800">안건 목록 관리</h1>

		</div>
		<p class="mb-4">
			<b>새로운 안건을 생성하고 수정할 수 있는 페이지입니다.</b>
		</p>
		<div class="row">

			<!-- Pie Chart -->
			<div class="col-xl-3 col-lg-3">
				<div class="card shadow mb-4">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">상위 분류</h6>

					</div>
					<!-- Card Body 부서트리-->
					<div class="card-body">
						<div class="upperpage-wrapper "
							style="display: block; padding-left: 85%; padding-bottom: -30px;">
							<a
								class="upper-content-detail btn btn-outline-primary btn-icon-split">
								<span class="icon text-white-50"> <i class="fas fa-plus"></i>
							</span>
							</a>
						</div>
						<div class="container" id="tree_people">
							<div class="row">
								<div>
									<ul class="uppercategory">

									</ul>
								</div>

							</div>
						</div>
					</div>
					<!-- Card Body 부서트리-->
				</div>
			</div>
			<!-- Area Chart -->
			<div class="col-xl-9 col-lg-9">
				<div class="card shadow mb-4 right_info">
					<!-- Card Header - Dropdown -->
					<div
						class="card-header py-3 d-flex flex-row align-items-center justify-content-between">
						<h6 class="m-0 font-weight-bold text-primary">하위 분류</h6>
					</div>
					<!-- Card Body -->
					<div class="card-body">
						<div id="detail">

							<div class="page-wrapper btnM">
								<a class="content-detail btn btn-outline-primary btn-icon-split">
									<span class="icon text-white-50"> <i class="fas fa-plus"></i>
								</span> <span class="text">새로운 안건 생성</span>
								</a>
							</div>
							<div class="table-responsive col-lg-12">
								<br>
								<table class="table table-bordered table-hover" id="dataTable1"
									cellspacing="0">
									<thead>
										<tr>

											<th>권한명</th>
											<th>승인기간</th>
											<th>관리</th>
										</tr>
									</thead>
									<tbody class="category">
										<!-- <tr>
											<td class="name">휴가</td>
											<td>3일</td>
											<td><a href="#" class="btn btn-outline-danger delbtn"
												onclick="if(alert('삭제가 완료되었습니다.')==false)return false;">
													<span class="text">삭제</span>
											</a> <a href="#"
												class="content-detail2 btn btn-outline-warning modbtn">
													<span class="text">수정</span>
											</a></td>
										</tr> -->

									</tbody>
								</table>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>

			<!-- <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">상위 분류 생성</h4>
							</div>
							<div class="modal-body">
								<div class="form-group">
									<label class="font-weight-bold">상위 분류명</label>
									<input class="form-control" name="upper_classify_name" id="category"value="" autocomplete="username" required
							oninput="uppercheckId()" placeholder="생성할 상위 분류명을 입력하세요">
						<span class="id_ok">사용 가능한 상위 분류명입니다.</span> <span
							class="id_already">이미 존재하는 상위 분류명입니다.</span>
					</div>
				</div>
							<div class="modal-footer">
								<button type="button" id="modalRegisterBtn"
									class="btn btn-primary">생성</button>
								<button type="button" id="modalCloseBtn" class="btn btn-default"
									data-dismiss="modal">취소</button>
							</div>
						</div> -->
						<!-- /.modal-content -->
					<!-- </div>
					/.modal-dialog
				</div> -->


	<!-- 상위 카테고리 생성 모달 -->
	<form name="addUpperForm" id="addUpperForm">
		<div class="uppermodal-wrapper">
			<div class="uppermodal" id="uppermodal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">상위 분류 생성</h4>
					<button type="button" class="close upper-content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="font-weight-bold">상위 분류명</label> <input
							class="form-control" name="upper_classify_name" id="category"
							value="" autocomplete="username" required
							oninput="uppercheckId()" placeholder="생성할 상위 분류명을 입력하세요">
						<span class="id_ok">사용 가능한 상위 분류명입니다.</span> <span
							class="id_already">이미 존재하는 상위 분류명입니다.</span>
					</div>
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button"
								class="btn btn-default upper-content-detail"
								data-dismiss="modal" role="button">취소</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="addUpperList"
								class="btn btn-default btn-hover-green" role="button">생성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<!-- 생성 모달 -->
	<form name="addForm" id="addForm">
		<div class="addmodal-wrapper">
			<div class="addmodal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">안건 생성</h4>
					<button type="button" class="close content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="font-weight-bold">안건명</label> <input
							class="form-control" name="classify_name" id="category" value=""
							autocomplete="username" required oninput="checkId()"
							placeholder="생성할 안건 명을 입력하세요"> <span class="id_ok">사용
							가능한 안건명입니다.</span> <span class="id_already">이미 존재하는 안건명입니다.</span>
					</div>
					<div class="form-group">
						<label class="font-weight-bold">승인 기간</label> <input
							class="form-control" name="approval_period" id="approval_period"
							value="" placeholder="승인기간을 입력하세요 ex) 4일">
					</div>
				</div>
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default content-detail"
								data-dismiss="modal" role="button">취소</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="addList"
								class="btn btn-default btn-hover-green" role="button">생성</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>

	<!-- 수정 모달 -->
	<form  name="forMod" id="forMod">
		<div class="modmodal-wrapper">
			<div class="modmodal">
				<div class="modal-header">
					<h4 class="modal-title" id="myModalLabel">수정 안건 내용</h4>
					<button type="button" class="close mod-content-detail"
						data-dismiss="modal" aria-hidden="true">&times;</button>
				</div>
				<div class="modal-body">
					<div class="form-group">
						<label class="font-weight-bold">안건 명</label> <input type="text"
							class="form-control" name="mod_name" value="" autocomplete="username" required oninput="checkId()"
							placeholder="생성할 안건 명을 입력하세요"> <span class="id_ok">사용
							가능한 안건명입니다.</span> <span class="id_already">이미 존재하는 안건명입니다.</span>>
							 <input
							class="form-control" name="org_name" value="" type="hidden"> 
					</div>
					<div class="form-group">
						<label class="font-weight-bold">승인 기간</label> <input type="text"
							class="form-control" name="mod_period" value=""> 
							 <input
							class="form-control" name="org_period" value="" type="hidden"> 
							<input type = 'hidden' name = 'mod_upper_classify_name' id='mod_upper_classify_name' value = ''>
					</div>

				</div>
			
				<div class="modal-footer">
					<div class="btn-group btn-group-justified" role="group"
						aria-label="group button">
						<div class="btn-group" role="group">
							<button type="button" class="btn btn-default mod-content-detail"
								data-dismiss="modal" role="button">취소</button>
						</div>
						<div class="btn-group" role="group">
							<button type="button" id="modList"
								class="btn btn-default btn-hover-green" role="button">수정</button>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>


	<%@include file="../sidebar/footer.jsp"%>
	<script type="text/javascript" src="/resources/js/category.js"></script>
	<script>
		$('.content-detail').on('click', function() {
			console.log('modal toggle');
			//debugger;
			//$('.modal-wrapper').modal('show');
			$('.addmodal-wrapper').toggleClass('open');
					return false;
		});

		$('.upper-content-detail').on('click', function() {
			$('.uppermodal-wrapper').toggleClass('open');
			
			return false;
		});
		$('.mod-content-detail').on('click', function() {
			$('.modmodal-wrapper').removeClass('open');
			return false;
		});
		/* 	$('.content-detail2').on('click',"span", function() {
				$('.modal-wrapper2').toggleClass('open');
				$('.page-wrapper2').toggleClass('blur-it');
				console.log('수정');
				return false;
			}); */

		var addForm = $("#addForm");

		$('.uppercategory')
				.on(
						'click',
						"li",
						function(e) {
							var category = $(this).text();
							console.log(category);

							if ($('#detail').css("display") == "none") {
								$('#detail').show();
								$('#detail').prepend(
										"<h2 class='upper'>" + $(this).text() + "</h2><button onclick='uppermodbtn()' class='uppermodbtn btn btn-outline-primary btn-icon-split'>"
										+ "<span class='icon text-white-100'> <i class='fas fa-pen'></i></span>"
										+"</button><a class='upperdelbtn btn btn-outline-primary btn-icon-split'>"
										+ "<span class='icon text-white-100'> <i class='fas fa-circle-xmark'></i></span>");
								addForm
										.append("<input type = 'hidden' name = 'upper_classify_name' id='upper_classify_name' value = '" + category+"'>");

								var sendData = "upper_classify_name="
										+ category;
								$.ajax({
									type : "get",
									url : "/admin/category",
									data : sendData,

									dataType : 'json',
									success : output

								});

							} else {
								$('#detail h2').empty();
								$('#detail').prepend(
										"<h2>" + $(this).text() + "</h2>");
								$("#addForm ").find("input").val("");
								addForm
										.append("<input type = 'hidden' name = 'upper_classify_name' id='upper_classify_name' value = '" + category+"'>");

								var sendData = "upper_classify_name="
										+ category;
								$.ajax({
									type : "get",
									url : "/admin/category",
									data : sendData,

									dataType : 'json',
									success : output

								});
							}
						})

	
		$('#addUpperList').on('click', function(e) {
			var classify_name = $('input[name=upper_classify_name]').val();
			console.log(classify_name);
			categoryService.addUpper(classify_name, function(result) {
				
				$(".uppermodal").find("input").val("");
				$('.uppermodal-wrapper').removeClass('open');
				// $('.uppermodal-wrapper').modal("hide");
				alert(result);
				// $(".modal").modal("hide");

				showUpperList();
			})
		});
		/* function create() {
			console.log("하위분류생성");
			var classify_name = $('input[name=classify_name]').val();
			var approval_period = $('#approval_period').val();
			var upper_classify_name = $('#upper_classify_name').val();
			
			$.ajax({
				type : "post",
				url : "/admin/approve_list_add",
				data : {
					classify_name : classify_name,
					approval_period : approval_period,
					upper_classify_name : upper_classify_name
				},

				dataType : 'json',
				success :output
					
			});
		}

		 */

		function output(data) {
			var str = "";
			console.log("하위분류aa" + JSON.stringify(data));
			$
					.each(
							data,
							function(idx, val) {
							var deltext ="deletecategory(\'"+val.classify_name+"\',\'"+val.upper_classify_name+"\')";
							var modtext ="modifycategory(\'"+val.classify_name+"\',\'"+val.upper_classify_name+"\',\'"+val.approval_period+"\')";
								//console.log(idx + " " + val.classify_name);
							 	str += "<tr>"
										+ "<td>"
										+ val.classify_name
										+ "</td>"
										+ "<td>"
										+ val.approval_period
										+ "</td>"
										+ "<td><a class='btn btn-outline-danger delbtn'"
										//+ "onclick='deletecategory("+\''val.classify_name"\+","+\val.upper_classify_name\')'>"
										//+ "onclick='deletecategory('"+val.classify_name+"','"+val.upper_classify_name+"')'>"
										//+ "onclick=\'deletecategory(\'"+val.classify_name+"\',\'"+val.upper_classify_name+"\')\'>"
										+"onclick = "+ deltext +">"
										+ "<span class='text'>삭제</span>"
										+ "</a><a href='#' class='content-detail2 btn btn-outline-warning modbtn'"
										//+ "onclick='modifycategory()'>"
										+"onclick = "+ modtext +">"
										+ "<span class='text'>수정</span>"
										+ "</a></td>" + "</tr>" 
										
										
										//console.log(str);	
								console.log("sum : "+ typeof(val.classify_name)+val.upper_classify_name);

							});
			$('table > tbody.category').html(str);
		}

		$('#addList').on('click', function(e) {
			console.log("하위분류생성");
			var category = {
				classify_name : $('input[name=classify_name]').val(),
				approval_period : $('#approval_period').val(),
				upper_classify_name : $('#upper_classify_name').val()
			}
			console.log(category);
			categoryService.add(category, function(result) {

				$(".addmodal").find("input").val("");
				//$('.modal-wrapper').toggleClass('close');
				// $('.uppermodal-wrapper').modal("hide");
				alert("하위분류 생성");
				$('.addmodal-wrapper').removeClass('open');

				showList(category.upper_classify_name);
			})
		});

		function showList(upper_classify_name) {
			categoryService
					.getList(
							upper_classify_name,
							function(list) {
								//console.log("하위분류 : " + list);
								var str = "";
								for (var i = 0; i < list.length; i++) {
								var deltext ="deletecategory(\'"+list[i].classify_name+"\',\'"+list[i].upper_classify_name+"\')";
								var modtext ="modifycategory(\'"+list[i].classify_name+"\',\'"+list[i].upper_classify_name+"\',\'"+list[i].approval_period+"\')";
								 	str += "<tr>"
											+ "<td>"
											+ list[i].classify_name
											+ "</td>"
											+ "<td>"
											+ list[i].approval_period
											+ "</td>"
											+ "<td><a class='btn btn-outline-danger delbtn'"
											//+ "onclick='deletecategory(\'' + list[i].classify_name + '\'+","+\'' + list[i].upper_classify_name + '\')'>"
											//+ "onclick='deletecategory("+list[i].classify_name+","+list[i].upper_classify_name+")'>"
											+ "onclick = "+ deltext +">"
											+ "<span class='text'>삭제</span>"
											+ "</a><a href='#' class='content-detail2 btn btn-outline-warning modbtn'"
											//+ "onclick='modifycategory()'>"
											+ "onclick = "+ modtext +">"
											+ "<span class='text'>수정</span>"
											+ "</a></td>" + "</tr>" 
											
										//console.log(str);	
										console.log("sum : "+ typeof(list[i].classify_name)+list[i].upper_classify_name);
								};
								$('table > tbody.category').html(str);
							});
		}

		function showUpperList() {
			categoryService.getUpperList(function(list) {
				console.log(list);
				var str = "";
				for (var i = 0; i < list.length; i++) {
					console.log("상위분류 :" + list);
					str += "<li class='upper'>" + list[i] + "</li>"

				}
				$('ul.uppercategory').html(str);
			})
		}

		/* function uppercreate() {
			return new Promise(function(resolve,reject){
				
				var classify_name = $('#category').val();
				console.log("상위분류생성");
				$.ajax({
					type : "post",
					url : "/admin/approve_upperlist_add",
					data : {
						classify_name : classify_name,
					},
					dataType : 'json',
					success : function(data){
						resolve(data);
					}
				});
			});
		}
		function uppercreate2(){
			return new Promise(function(resolve,reject){
				var str = "";
				console.log("추가된 후" + JSON.stringify(data));
				$.ajax({
					type : "get",
					url : "/admin/uppercategory",
					success : function(data) {
						for (var i = 0; i < data.length; i++) {
							console.log("aaa" + data);
							str += "<li class='upper'>" + data[i] + "</li>"
		
						}
						$('ul.uppercategory').html(str);
					}
				});
			});
		}

		uppercreate().then(uppercreate2); */

		/* 	function uppercreate() {
				console.log("상위분류생성");
				var classify_name = $('#category').val();
				
				$.ajax({
					type : "post",
					url : "/admin/approve_upperlist_add",
					data : {
						classify_name : classify_name,
					},
					dataType : 'json',
					success : alert("생성"),
						function (data) {
						var str = "";
						console.log("추가된 후" + JSON.stringify(data));
						$.ajax({
							type : "get",
							url : "/admin/uppercategory",
							success : function(data) {
								for (var i = 0; i < data.length; i++) {
									console.log("aaa" + data);
									str += "<li class='upper'>" + data[i] + "</li>"

								}
								$('ul.uppercategory').html(str);
							}

						});
					}	
				});
			} */

/* 		$('#please').on("click",function(e){
			alert("aaa");
		})	
			 */
			 
		function uppermodbtn(){
				var upper_classify_name = $('#detail').find("h2").val();
				alert(upper_classify_name);
				$('#detail').find("h2").remove();
				
				$('#detail').prepend("<h2><input type = 'text' readonly name = 'upper_classify_name' id='upper_classify_name' value = '" + upper_classify_name+"'></h2>");
			}
				
					
		function deleteConfirm() {

			var isDelete = comfirm("삭제하시겠습니까?");
		}

		function deletecategory(classify_name,upper_classify_name) {
		
			console.log(classify_name);	
			console.log(upper_classify_name);
			categoryService.remove(classify_name, function(result) {
				alert('삭제가 완료되었습니다.')

				//$(".modal").find("input").val("");
				
				//$(".modal").modal("hide");
	
				showList(upper_classify_name);
			});
		}

		function modifycategory(classify_name,upper_classify_name,approval_period) {
		
			console.log('수정수정수정');
			$('.modmodal-wrapper').toggleClass('open');
					
	          $('input[name=org_name]').attr('value',classify_name);
	          $('input[name=org_period]').attr('value',approval_period);
	          $('input[name=mod_name]').attr('value',classify_name);
	          $('input[name=mod_period]').attr('value',approval_period);
	         $('input[name=mod_upper_classify_name]').attr('value',upper_classify_name);
	         
	         return false;
			/* categoryService.modify(category, function(result){
				alert('수정되었습니다.')

				$(".modal").find("input").val("");
				
				$(".modal").modal("hide");
				
				showList(upper_classify_name);
			}); */
			
		}
		
		$('#modList').on("click",function(e){
			 var classify_name =  $('input[name=org_name]').val();
			 var approval_period =  $('input[name=org_period]').val();
			 var mod_name =  $('input[name=mod_name]').val();
			 var mod_period =  $('input[name=mod_period]').val();
			 var upper_classify_name = $('input[name=mod_upper_classify_name]').val();
			 var category = {
						classify_name:classify_name,
						mod_name:mod_name,
						upper_classify_name:upper_classify_name,
						approval_period:approval_period,
						mod_period:mod_period
						}
		
			console.log(category)
			categoryService.modify(category, function(result){
				alert('수정되었습니다.')

				//$(".modmodal").find("input").val("");
				$('.modmodal-wrapper').removeClass('open');
				//$(".modal-wrapper2").modal("hide");
				
				showList(upper_classify_name);
			});
		})	

	/* 	$("#detail").on("click","h2",function(e){
			alert("click");
			var upper_classify_name = $(this).text();
			$('#detail').find("h2").remove();
			
			$('#detail').prepend("<h2><input type = 'text' readonly name = 'upper_classify_name' id='upper_classify_name' value = '" + upper_classify_name+"'></h2>");
					
			}) */
		
			
		function checkId() {
			var classify_name = $('input[name=classify_name]').val(); //id값이 "id"인 입력란의 값을 저장
			$.ajax({
				url : '/admin/approve_list_check', //Controller에서 인식할 주소
				type : 'post', //POST 방식으로 전달
				data : {
					classify_name : classify_name
				},
				success : function(cnt) {
					if (cnt != 1) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else if (cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
		function uppercheckId() {

			var upper_classify_name = $('input[name=upper_classify_name]')
					.val();
			$.ajax({
				url : '/admin/approve_upperlist_check', //Controller에서 인식할 주소
				type : 'post', //POST 방식으로 전달
				data : {
					upper_classify_name : upper_classify_name
				},
				success : function(cnt) {
					if (cnt != 1) { //cnt가 1이 아니면(=0일 경우) -> 사용 가능한
						$('.id_ok').css("display", "inline-block");
						$('.id_already').css("display", "none");
					} else if (cnt == 1) { // cnt가 1일 경우 -> 이미 존재하는
						$('.id_already').css("display", "inline-block");
						$('.id_ok').css("display", "none");
					}
				},
				error : function() {
					alert("에러입니다");
				}
			});
		};
	</script>
</html>