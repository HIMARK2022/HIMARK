<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>전자결재 - 요청상세(승인자)</title>
<link href="/resources/css/payment.css" rel="stylesheet">
</head>
<body id="page-top">

	<!-- Page Wrapper -->
	<div id="wrapper">

		<!-- Sidebar 사이드바-->
		<%@include file="../sidebar/approver_side.jsp"%>
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
						<strong>${member.dept} / 개발팀1(팀명) / ${member.userName}</strong>
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
						<c:if test= '${detail.imp=="높음"}'>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio1" value="긴급"  disabled> <label
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
						<c:if test= '${detail.imp=="보통"}'>
						<div class="form-check form-check-inline">
							<input class="form-check-input" type="radio" name="imp"
								id="inlineRadio1" value="긴급"  disabled> <label
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
						<c:if test= '${detail.imp=="낮음"}'>
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
							rows="10" name="content" readonly >${detail.content}</textarea>
						</p>
						<a class="btn btn-outline-primary" type="submit" href="/approver/request?userId=${member.userId}"
							id="request_btn">목록</a>

					</div>

				</div>
			</div>
			<!-- 요청.html -->

		</div>
		<!-- End of Main Content -->
		<script>
			// $("input:checkbox[value="+values[i]+"]").prop("checked", true);
		</script>



		<%@include file="../sidebar/footer.jsp"%>
		<script src="/resources/js/request.js"></script>
</body>
</html>