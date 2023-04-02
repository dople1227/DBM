<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<h4 class="mb-3" style="text-align: center;">글 등록</h4>
	<form id="actionForm" class="needs-validation" action="/board/list" method="get" novalidate>
		<div>
			<div class="form-outline">
				<label for="txtTit" class="form-label">제목</label>
				<input id="txtTit" name="title" type="text" class="form-control" value="" required pattern=".{2,}" placeholder="제목을 입력하세요">
				<div class="invalid-feedback">제목을 두글자 이상 입력하세요</div>
			</div>
			<div class="mb-3 ">
				<label for="txtAreaContent" class="form-label">내용</label>
				<textarea id="txtAreaContent" name="content" class="form-control" rows="20" required placeholder="내용을 입력하세요"></textarea>
				<div class="invalid-feedback">내용을 입력하세요</div>
			</div>
			<div class="d-flex">
				<button id="btnList" data-oper="list" class="btn btn-outline-info me-auto me-1">뒤로가기</button>
				<button id="btnRegister" data-oper="register" class="btn btn-outline-info">등록하기</button>
			</div>
		</div>
	</form>
</div>
<script>
$(document).ready(function(){	
	var formObj = $("#actionForm");
	$("button").click(function(e){
		var operation = $(this).data("oper");
		switch(operation){
			case 'list':				
				formObj.attr("action", "/board/list");
				formObj.attr("method", "get");
				formObj.empty();
				formObj.submit();
				break;
			case 'register':
				formObj.attr("action", "/board/register");
				formObj.attr("method", "post");
				break;			
		}
	
		//validation
		if (!formObj[0].checkValidity()) {
			e.preventDefault();
			e.stopPropagation();
		}
		formObj.addClass('was-validated');
		//formObj.submit();
	});

});
</script>
<%@ include file="../includes/footer.jsp"%>