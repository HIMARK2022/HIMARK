<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>H!MARK</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<page:applyDecorator name="generalSide" />
		<!-- End of Topbar 헤더 끝 -->

		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">요청 상세</h1>
			<p class="mb-4">요청 상세 내역을 확인할 수 있습니다.</p>


			<div class="card shadow mb-4">
				<div class="table-responsive">
					<div class="card-body">

						<p>
						<h6>제목</h6>
						<input type="text" class="form-control col-xl-4" readonly
							name="title" value='<c:out value="${detail.title}"/>'>
						</p>
						<p>
						<h6>양식명</h6>
						<input type="text" class="form-control col-xl-4" readonly
							name="category" value='<c:out value="${detail.category}"/>'>
						</p>
						<p>
						<h6>기안자</h6>
						<strong>${member.head} / ${member.depart} / ${member.team} / ${member.user_name}</strong>
						</p>
						<p>
						<h6>승인자</h6>
						<input type="text" class="form-control col-xl-4" readonly
							name="manager" value='<c:out value="${manager[0]}"/>(${detail.managerId})'>
						</p>
						<p>
						<h6>중요도</h6>
						<c:if test= '${detail.imp=="긴급"}'>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio1" value="긴급" checked readonly> <label
								class="form-check-label" for="inlineRadio1">긴급</label>
						</div>
						
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio3" value="보통" disabled> <label
								class="form-check-label" for="inlineRadio3">보통</label>
						</div>
						
						</c:if>
						
						<c:if test= '${detail.imp=="보통"}'>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio1" value="긴급"  disabled> <label
								class="form-check-label" for="inlineRadio1">긴급</label>
						</div>
						
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio3" value="보통" checked readonly> <label
								class="form-check-label" for="inlineRadio3">보통</label>
						</div>
						
						</c:if>
						
						</p>
						<p>
						<h6>첨부파일</h6>
						<div class="custom-file col-xl-4">
						
							<div class = 'uploadResult' style="height:70px">
									<ul>
									</ul>
							</div>
						</div>
						
						<div class = 'bigPictureWrapper'>
							<div class = 'bigPicture'>
							</div>
						</div>
						
						
						<p>
						<h6>내용</h6>
						<textarea class="form-control" placeholder="내용을 입력해 주세요."
							rows="10" name="content" readonly style="width: 534px;">${detail.content}</textarea>
						</p>
						
						<c:if test='${detail.state eq "반려" || detail.state eq "승인" }'>
										<p>
										<h6>결재 사유</h6>
										<textarea class="form-control"
											rows="10" name="reason" readonly style="width: 534px;">${detail.reason}</textarea>
										
										</p>
										
										</c:if>
										
						
						<a class="btn btn-outline-primary" type="submit" href="/general/request_list?user_id=${member.user_id}"
							id="request_btn">목록</a>

					</div>

				</div>
			</div>
			<!-- 요청.html -->

		</div>
		<!-- End of Main Content -->
	<script>
			// $("input:checkbox[value="+values[i]+"]").prop("checked", true);
			$(document).ready(function() {
	
				var rno = '<c:out value = "${detail.requestNo}"/>';
				$.getJSON("/general/getAttachList", {rno:rno}, function(arr){
					console.log(arr);
					var str = "";
		            $(arr).each(function(i, obj) {
		               if(!obj.fileType) { // 이미지가 아닌 경우
		                  
		                  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);
		                  str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
		                  str += "<img src='/resources/img/attach.png'>";
		                  str += "<span> "+ obj.fileName+"</span></br>";
		                  str += "</div></li>";
		               } else {
		                  
		                  // 썸네일 나오게 처리
		                  var fileCallPath = encodeURIComponent(obj.uploadPath +  "/s_" + obj.uuid + "_" + obj.fileName);
		                  var originPath = obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName;
		                  console.log("originPath1 : " + originPath);
		                  originPath = originPath.replace(new RegExp(/\\/g), "/"); // \를 /로 통일
		                  console.log("originPath2 : " + originPath);
		                  str += "<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.fileType+"'><div>";
		                  str += "<a href=\"javascript:showImage(\'" + originPath + "\')\"><img src='/display?fileName=" + fileCallPath + "'></a>";
		                  str += "</div></li>";
		               }
		            });
		            $(".uploadResult ul").html(str);
		         }); // getJSON
			 $(".uploadResult").on("click","li", function(e){
			      
				    console.log("view image");
				    
				    var liObj = $(this);
						    
				    var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
				    
				    if (liObj.data("type")) {
						//showImage(path.replace(new RegExp(/\\/g),"/"));
						
						window.open("/display?fileName="+path);
					} else {
						//download 
						//self.location = "/download?fileName="+ path;
						
						window.open("/display?fileName="+path)
						}

				});
			//이미지 크게 보여주기
			  function showImage(fileCallPath){
			    //alert(fileCallPath);
			    
			    $(".bigPictureWrapper").css("display","flex").show();
			    
			    $(".bigPicture")
			    .html("<img src='/display?fileName="+fileCallPath+"' >")
			    .animate({width:'100%', height: '100%'}, 1000);
			    
			  }

			  $(".bigPictureWrapper").on("click", function(e){
			    $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
			    setTimeout(function(){
			      $('.bigPictureWrapper').hide();
			    }, 1000);
			  });
				  
			});
		</script>


	<page:applyDecorator name="footer" />
		<script src="/resources/js/request.js"></script>
</body>
</html>