<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 결재(승인자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
<link href="/resources/css/modal.css" rel="stylesheet">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<%@include file="../sidebar/approver_side.jsp"%>
		<!-- End of Topbar 헤더 끝 -->
		<!-- 요청.html -->
		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">상세보기</h1>
			<p class="mb-4">결재 내용을 자세히 확인 할 수 있습니다. 승인 권한이 있는 경우, 결재 수락 및 거부를
				할 수 있습니다</p>

			<ul class="nav nav-tabs">
				<li class="nav-item"><a class="nav-link py-3 shadow active"
					data-toggle="tab" href="#tab1">
						<h6 class="m-0 font-weight-bold text-primary">결재 내용</h6>
				</a></li>
			</ul>

			<div class="card shadow mb-4">
				<div class="tab-content">
					<!-- 요청 내역 Start -->
					<div class="tab-pane fade show active" id="tab1">
						<div class="card-body">
							<div class="tab-pane fade show" id="tab1">
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
										<strong>${member.bonbu} / ${member.dept} / ${member.team} / ${member.userName}</strong>
										</p>
										<p>
										<h6>중요도</h6>
										<c:if test='${detail.imp=="긴급"}'>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio1" value="긴급" checked readonly> <label
													class="form-check-label" for="inlineRadio1">긴급</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio2" value="높음" disabled> <label
													class="form-check-label" for="inlineRadio2">높음</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio3" value="보통" disabled> <label
													class="form-check-label" for="inlineRadio3">보통</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio4" value="낮음" disabled> <label
													class="form-check-label" for="inlineRadio3">낮음</label>
											</div>
										</c:if>
										<c:if test='${detail.imp=="높음"}'>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio1" value="긴급" disabled> <label
													class="form-check-label" for="inlineRadio1">긴급</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio2" value="높음" checked readonly> <label
													class="form-check-label" for="inlineRadio2">높음</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio3" value="보통" disabled> <label
													class="form-check-label" for="inlineRadio3">보통</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio4" value="낮음" readonly> <label
													class="form-check-label" for="inlineRadio3">낮음</label>
											</div>
										</c:if>
										<c:if test='${detail.imp=="보통"}'>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio1" value="긴급" disabled> <label
													class="form-check-label" for="inlineRadio1">긴급</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio2" value="높음" disabled> <label
													class="form-check-label" for="inlineRadio2">높음</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio3" value="보통" checked readonly> <label
													class="form-check-label" for="inlineRadio3">보통</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio4" value="낮음" disabled> <label
													class="form-check-label" for="inlineRadio3">낮음</label>
											</div>
										</c:if>
										<c:if test='${detail.imp=="낮음"}'>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio1" value="긴급" disabled> <label
													class="form-check-label" for="inlineRadio1">긴급</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio2" value="높음" disabled> <label
													class="form-check-label" for="inlineRadio2">높음</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio3" value="보통" disabled> <label
													class="form-check-label" for="inlineRadio3">보통</label>
											</div>
											<div class="form-check form-check-inline">
												<input class="form-check-input" type="radio" name="imp"
													id="inlineRadio4" value="낮음" checked readonly> <label
													class="form-check-label" for="inlineRadio3">낮음</label>
											</div>
										</c:if>
										</p>
										<p>
										<h6>첨부파일</h6>
										<div class="custom-file col-xl-4">
											<input type="file" class="custom-file-input" id="Files"
												name="file"> <label class="custom-file-label"
												for="Files">파일선택</label>
										</div>
										</p>
										<p>
										<h6>내용</h6>
										<textarea class="form-control" placeholder="내용을 입력해 주세요."
											rows="10" name="content" readonly>${detail.content}</textarea>
										</p>
										<c:if test='${detail.state eq "반려" }'>
										<p>
										<h6>반려 사유</h6>
										<textarea class="form-control"
											rows="10" name="rejectReason" readonly>${detail.rejectReason}</textarea>
										
										</p>
										<div class="page-wrapper">
									<a class="btn btn-outline-success" type="submit" href="/approver/payment?userId=${member.userId}" id="request_btn">목록</a>
								</div>
										</c:if>
										


								<c:if test='${detail.state eq "승인" }'>
								<div class="page-wrapper">
									<a class="btn btn-outline-success" type="submit" href="/approver/payment?userId=${member.userId}" id="request_btn">목록</a>
								</div>
								</c:if>

								<c:if test='${detail.state eq "대기" }'>

										<!-- 승인자의 경우, 이미 완료된 결재내역 제외 -->
										<div class="page-wrapper">
											<a class="btn btn-outline-success" type="submit" href="/approver/payment?userId=${member.userId}"
							id="request_btn">목록</a>
										
											<a class="btn btn-outline-primary" id="yes">요청 수락</a>
											<a class="content-detail">
												<button class="btn btn-outline-danger" type="submit" id="no">요청
													거부</button>
											</a>
										</div>
										<form id='actionForm' action="/approver/payment" method='post'>
											<input type='hidden' name='userId' value='${member.userId}'>
											<input type='hidden' name='requestNo' value='${detail.requestNo}'>
										</form>
										<!-- <button class="btn btn-outline-danger" type="submit" id="no">요청 거부</button> -->
										<input type="hidden" id="deny_reason" value="">

										<!-- Modal Start-->
										<div class="modal-wrapper">
											<form id='actionForm2' action="/approver/payment" method='post'>
											<input type='hidden' name='userId' value='${member.userId}'>
											<input type='hidden' name='requestNo' value='${detail.requestNo}'>
											<div class="modal">
												<div class="modal-header">
													<h4 class="modal-title" id="myModalLabel">요청 거부을
														하시겠습니까?</h4>
													<button type="button" class="close content-detail"
														data-dismiss="modal" aria-hidden="true">&times;</button>
												</div>
												<div class="modal-body">
													<div class="form-group">
														<div class="table-responsive">
															<div class="card-body">
																<div class="table-responsive">
																	<div class="content">
																		<p class="text-dark" class="strong">요청거부 사유를 입력하세요</p>
																		<p>
																			<textarea cols="50" rows="10" name="rejectReason"
																				placeholder=" 내용을 입력하세요"></textarea>
																		</p>
																	</div>
																</div>
															</div>
														</div>
													</div>
												</div>
												<div class="modal-footer">
													<div class="btn-group btn-group-justified" role="group"
														aria-label="group button">
														<div class="btn-group" role="group">
															<button type="button"
																class="refuse btn btn-default" role="button">거부하기</button>
														</div>
														<div class="btn-group" role="group">
															<button id="positive" class="close content-detail btn btn-default btn-hover-green"
														data-dismiss="modal" aria-hidden="true">취소</button>
														</div>
													</div>
												</div>
											</div>
											</form>
										</div>
										</c:if>
										
										<!-- Modal End -->

										<!-- Swal.fire JS 요청거부 사유 Start -->
										<!-- <script  src="http://code.jquery.com/jquery-latest.min.js"></script>
                                                <script src="https://cdn.jsdelivr.net/npm/sweetalert2@10"></script>
                                                <script>
                                                    function alert(){
                                                        (async () => {
                                                            const { value: getName } = await Swal.fire({
                                                                title: '요청거부 사유를 입력하세요',
                                                                text: '내용을 입력해주세요',
                                                                input: 'textarea',
                                                                inputPlaceholder: '내용을 입력..',
                                                                showCancelButton: true,
                                                                confirmButtonText: '요청을 거부합니다',
                                                                cancelButtonText: '취소'
                                                            })
                                                            if (getName) {
                                                                Swal.fire(`거부 되었습니다`)
                                                                document.getElementById('deny_reason').value = getName;
                                                            }
                                                        })()
                                                    }
                                                </script> -->
										<!-- Swal.fire JS 요청거부 사유 End -->

										<!-- 승인자의 경우, 이미 완료된 결재내역 제외 -->

									</div>

								</div>

							</div>
						</div>
					</div>
					<!-- 상세보기 End -->


				</div>
			</div>
		</div>
		<!-- 요청.html -->

	</div>
	<!-- End of Main Content -->
<script>
	var actionForm = $("#actionForm");

	$("#yes").on("click", function(e) {
						console.log("요청 수락 click");
						var id = '<c:out value="${member.userId}"/>';
						e.preventDefault();
						actionForm.find('#state').remove();
						actionForm
								.append("<input id='state' type='hidden' name='state' value='승인'>")

						actionForm.attr("action", "/approver/payment");
						actionForm.submit();
					});
	var actionForm2 = $("#actionForm2");
	
	$('.refuse').on('click', function() {
					console.log("요청 거절 click");
					actionForm2.find('#state').remove();
					actionForm2.append("<input id='state' type='hidden' name='state' value='반려'>")

					actionForm2.attr("action", "/approver/payment");
					actionForm2.submit();
						
					});
	
	$('.content-detail').on('click', function() {
		
			$('.modal-wrapper').toggleClass('open');
			$('.page-wrapper').toggleClass('blur-it');
			return false;
		});
	
</script>
	


	<%@include file="../sidebar/footer.jsp"%>
	<script src="/resources/js/request.js"></script>
</body>
</html>