<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<h4 class="mb-3" style="text-align: center;">조회 / 수정</h4>
	<form id="actionForm" class="needs-validation" action="/board/list" method="get" novalidate>
		<div class="form-group">
			<div class="mb-3 row"> 				
				<label for="txtNo" class="col-sm-1 col-form-label">글번호</label>
				<div class="col-sm-10">
					<input id="txtNo" name="no" type="text"  class="form-control-plaintext" value="${selPostByNo.no}" readonly>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="txtInsDate" class="col-sm-1 col-form-label">등록일</label>
				<div class="col-sm-10">
					<input id="txtInsDate" readonly name="ins_time" type="text" class="form-control-plaintext"  value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${selPostByNo.ins_time}"/>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="txtUdtDate" class="col-sm-1 col-form-label">수정일</label>
				<div class="col-sm-10">
					<input id="txtUdtDate" readonly  name="udt_time" type="text" class="form-control-plaintext"  value='<fmt:formatDate pattern = "yyyy/MM/dd HH:mm" value="${selPostByNo.udt_time}"/>'>
				</div>
			</div>
			<div class="mb-3 row">
				<label for="txtTit" class="col-sm-1 col-form-label">제목</label>
				<div class="col-sm-10">
					<input id="txtTit" name="title" type="text" class="form-control" required pattern=".{2,}" value="${selPostByNo.title}">
					<div class="invalid-feedback">제목을 두글자 이상 입력하세요</div>
				</div>				
			</div>
			
			<div class="mb-3">
				<label for="txtAreaContent" class="form-label">내용</label>
				<div class="col-sm-11">
					<textarea id="txtAreaContent" name="content" class="form-control" required rows="5">${selPostByNo.content}</textarea>
					<div class="invalid-feedback">내용을 입력하세요</div>
				</div>
			</div>
			<div class="d-flex col-sm-11">
				<button id="btnList" data-oper="list" class="btn btn-outline-info me-auto me-1">뒤로가기</button>
				<button id="btnDel" type="button" data-oper="delete" class="btn btn-outline-info me-1" data-bs-target="#chkModal">삭제하기</button>
				<button id="btnModify" type="button" data-oper="modify" class="btn btn-outline-info" data-bs-target="#chkModal">수정하기</button>
			</div>
			<input type="hidden" name="pageNum" value='<c:out value="${cri.pageNum}" />' />
			<input type="hidden" name="amount" value='<c:out value="${cri.amount}" />' />
		</div>
	</form>
</div>
<%@ include file="../includes/modalChk.jsp"%>

<script>
$(document).ready(function() {
	var formObj = $("#actionForm");
	setInfoModal();
	history.replaceState({}, null, null);

	$("button[data-oper='list']").click(function(e) {
		e.preventDefault();
		formObj.attr("action", "/board/list");
		formObj.attr("method", "get");

		var pageNumHtml = $("input[name='pageNum']").clone();
		var amountHtml = $("input[name='amount']").clone();

		formObj.empty();
		formObj.append(pageNumHtml);
		formObj.append(amountHtml);
		formObj.submit();
	}); // 목록으로

	$("#btnDel, #btnModify").click(function(e) {
		e.preventDefault();
		setChkModal($(this).data('oper'));
	}); // 모달창이벤트

	$("#btnModalY").click(function(e) {
		switch ($(".modal-body").data("oper")) {
			case "delete":
				formObj.attr("action", "/board/delete");
				formObj.attr("method", "post");
				formObj.submit();
				break;
			case "modify":
				formObj.attr("action", "/board/modify");
				formObj.attr("method", "post");
				break;
		}
		
		//validation
		if (!formObj[0].checkValidity()) {
			e.preventDefault();
			e.stopPropagation();
			$("#chkModal").modal("hide");
		} else 
			formObj.submit();

		formObj.addClass('was-validated');	
	}); // 모달창 Y
});
</script>
<%@ include file="../includes/footer.jsp"%>