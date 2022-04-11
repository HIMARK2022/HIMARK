<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/functions" prefix = "fn" %>
<%@ taglib uri="http://www.opensymphony.com/sitemesh/page" prefix="page"%>
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
		<page:applyDecorator name="generalSide" />
		<!-- End of Topbar 헤더 끝 -->

		<div class="container-fluid">

			<!-- Page Heading -->
			<h1 class="h3 mb-2 text-gray-800">요청</h1>
			<p class="mb-4">요청 내역을 확인하고 신규 기안 요청할 수 있습니다</p>

					<!-- 신규 기안 Start -->
					
						<div class="table-responsive">
							<div class="card-body">
								<form id="actionForm" action="/general/register" method="post" role="form">
									<p>
									<h6>제목</h6>
									<input type="text" class="form-control col-xl-4" required
										name="title">
									</p>
									<p>
									<h6>양식명</h6>
									<select class="form-control col-xl-4" name="category">
										<option value='' disabled selected>-- 결재 분류 --</option>
										
									 	<c:forEach var="upperlist" items="${category}"> 
									 	<c:if test="${upperlist.upper_classify_name == null }">
									 	<optgroup label="${upperlist.classify_name }">
									 	
									 		<c:forEach var="list" items="${category}"> 
									 		<c:if test = "${list.upper_classify_name eq upperlist.classify_name}">
									 		<option value='${list.classify_name}' >${list.classify_name}</option>
									 		</c:if>
									 		</c:forEach>
									 		
									 	</optgroup>
									 	</c:if>
											
										</c:forEach>
									</select>
									</p>
									<p>
										<h6>기안자</h6>
										<strong>${member.head} / ${member.depart} / ${member.team} / ${member.user_name}</strong>
									</p>
									<p>
									<h6>승인자</h6>
									<select class="form-control col-xl-4" name="managerId">
										<option value='' disabled selected>-- 승인자 --</option>
									
										<c:forEach var="list" items="${alist}">
										<option value="${list.userId}">${list.userName}</option>
										</c:forEach>
									 	<option value='${ceo.user_id}'>${ceo.user_name}</option>
									</select>
									</p>
									<p>
									<h6>중요도</h6>
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio1" value="긴급"> <label
											class="form-check-label" for="inlineRadio1">긴급</label>
									</div>
									
									<div class="form-check form-check-inline">
										<input class="form-check-input" type="radio" name="imp"
											id="inlineRadio3" value="보통"> <label
											class="form-check-label" for="inlineRadio3">보통</label>
									</div>
									
									</p>
									<p>
									<h6>첨부파일</h6>
									<div class="custom-file col-xl-4">
										<input type="file" class="custom-file-input" id="Files"
											name="uploadFile" multiple> <label class="custom-file-label"
											for="Files">파일선택</label>
									</div>
											<div class="uploadResult">
											<ul></ul>
										</div>
									</p>
									<p>
									<h6>내용</h6>
									<textarea class="form-control" placeholder="내용을 입력해 주세요."
										rows="10" name="content"></textarea>
									</p>
									<button class="btn btn-outline-primary" type="submit"
										id="request_btn">요청하기</button>
								</form>
							</div>

						</div>

					</div>
					<!-- 신규 기안 End -->
				</div>
		

	<!-- End of Main Content -->
	<script>
	
		var searchForm = $("#searchForm");

		$("#search_btn").on("click", function(e) {
			var id = '<c:out value="${member.user_id}"/>';
			console.log("click");
			console.log("userId " + id);
			searchForm.attr("action", "/general/request");
			searchForm.submit();
		});
		
		var actionForm2 = $("#actionForm2");
		
		$(".move").on("click",function(e) {
			console.log("click");
			e.preventDefault();
			actionForm2.find('#requestNo').remove();
			actionForm2.append("<input id='requestNo' type='hidden' name='requestNo' value='"
					+ $(this).attr("href") + "'>");
		
	
			actionForm2.attr("action", "/general/request_detail");
			actionForm2.submit();
		});
		
		
		  // $("input:checkbox[value="+values[i]+"]").prop("checked", true);
function selectAll(selectAll)  {
  const checkboxes 
       = document.getElementsByName('filter');
  
  checkboxes.forEach((checkbox) => {
    checkbox.checked = selectAll.checked;
  })
}

$(document).ready(function(e){
	
	var actionForm = $("#actionForm");

	$("#request_btn")
			.on("click",function(e) {
				e.preventDefault();
				console.log("submit clicked");
				//actionForm.attr("action", "/general/register");
				//actionForm.submit();
				var str = "";
				
				$(".uploadResult ul li").each(function(i, obj){
					var jobj = $(obj);
					console.dir("jobj : "+jobj);
					
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileName' value = '" + jobj.data("filename")+"'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uuid' value = '" + jobj.data("uuid") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].uploadPath' value = '" + jobj.data("path") + "'>";
					str += "<input type = 'hidden' name = 'attachList["+i+"].fileType' value = '" + jobj.data("type") + "'>";
			
				});
				actionForm.append(str);
				actionForm.submit();
			});


	
	var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
	var maxSize = 5242880; // 5MB
	
	function checkExtension(fileName, fileSize){
		if(fileSize >= maxSize){
			alert("파일 사이즈 초과");
			return false;
		}
		
		if(regex.test(fileName)){
			alert("해당 종류의 파일은 업로드할 수 없습니다.");
			return false;
		}
		return true;
	}
	
	function showUploadFile(uploadResultArr){
		  if(!uploadResultArr || uploadResultArr.length == 0){return ;}
		  var uploadUL = $(".uploadResult ul");
		  var str = "";
		  
		  $(uploadResultArr).each(function(i, obj){
			  
			  if(!obj.fileType){//이미지 아닌경우
				  var fileCallPath = encodeURIComponent(obj.uploadPath + "/" + obj.uuid + "_" + obj.fileName);           
		          
				  str += "<li data-path = '" + obj.uploadPath + "' data-uuid = '" + obj.uuid + "'data-filename = '"
					+ obj.fileName + "'data-type = '" + obj.fileType + "'><div>";
					
		          str += "<span> "+ obj.fileName+"</span></br>";
		          //첨부파일이 업로드된 후에 생기는 이미지 파일 옆에 'x' 표시를 추가
			      /*  str += "<li><a href='/download?fileName="+fileCallPath+"'><img src='/resources/img/attach.png'>"
			    		   +obj.fileName+"</a>" + "<span data-file=\ '"+ fileCallPath+"\' data-type='file'> x </span>"
			    		   + "<div></li>" */
		          str+= "<button type = 'button' data-file = \'" + fileCallPath + "\' data-type = 'file'";
					str+= " class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
					str += "<img src = '/resources/img/attach.png'></a>";
					str += "</div>";
					str + "</li>"
		          
		        }else{//이미지인 경우
		        	  var fileCallPath = encodeURIComponent(obj.uploadPath + "/s_" + obj.uuid + "_" + obj.fileName);
			          str+= "<li data-path = '" + obj.uploadPath + "' data-uuid = '" + obj.uuid + "'data-filename='"
						+ obj.fileName + "' data-type = '" + obj.fileType + "'><div>";
			          str += "<span> "+ obj.fileName+"</span>";
			          //첨부파일이 업로드된 후에 생기는 이미지 파일 옆에 'x' 표시를 추가
				       /* str += "<li><a href=\"javascript:showImage(\'"
			    		   +originPath+"\')\"><img src='/display?fileName="+fileCallPath+"'></a>" 
			    				   + "<span data-file=\'" + fileCallPath + "\' data-type='image'> x </span></li>";*/
			          str+= "<button type = 'button' data-file=\'" + fileCallPath + "\' data-type='image'";
						str+= "class = 'btn btn-warning btn-circle'><i class = 'fa fa-times'></i></button><br>";
						str+= "<img src = '/display?fileName=" + fileCallPath + "'>";
						str+= "</div>";
						str+ "</li>";
			         
		        } 
		  });
			uploadUL.append(str);
	  }
	
	$(".uploadResult").on("click", "button", function(e){
		  console.log("delete file");
		  
		  var targetFile = $(this).data("file");
		  var type = $(this).data("type");
		  var targetLi = $(this).closest("li");
		  
		  $.ajax({
		  	url : 'deleteFile',
		  	data : {fileName : targetFile, type : type},
		  	dataType : 'text',
		  	type : 'POST',
		  		success : function(result) {
		  			alert(result);
		  			targetLi.remove();
		  		}
		  });//$.ajax
	  });//uploadResult
	  
	  
	
	
	$("input[type = 'file']").change(function(e){
		var formData = new FormData();
		var inputFile = $("input[name='uploadFile']");
		var files = inputFile[0].files;
		
		for(var i=0; i<files.length; i++){
			if(!checkExtension(files[i].name, files[i].size)){
				return false;
			}
			formData.append("uploadFile", files[i]);
		}
		
		$.ajax({
			url : '/uploadAjaxAction',
			processData : false,
			contentType : false, 
			data : formData,
			type : 'POST',
			dataType : 'json',
				success:function(result){
					console.log(result);
					showUploadFile(result);
				}
		});
	});
});


		 
	
	</script>

	<page:applyDecorator name="footer" />
	<script src="/resources/js/request.js"></script>

</body>
</html>