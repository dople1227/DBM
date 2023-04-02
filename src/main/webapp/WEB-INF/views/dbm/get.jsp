<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<h4 class="mb-3" style="text-align: center;">조회 / 수정</h4>
	<form id="actionForm" action="/dbm/list" method="get">
		<div class="form-group row">
			<div class="mb-3">
				<label for="txtNo" class="form-label">테이블명</label>
				<input id="txtNo" name="table_name" type="text" class="form-control-plaintext" value="${selColumnInfo.table_name}" readonly>
			</div>
			<div class="mb-3">
				<label for="txtTit" class="form-label">컬럼명</label>
				<input id="txtTit" name="title" type="text" class="form-control" minlength="2" value="${selColumnInfo.column_name}">
			</div>
			<div class="mb-3">
				<label for="txtAreaContent" class="form-label">컬럼설명</label>
				<textarea id="txtAreaContent" name="content" class="form-control" minlength="2" rows="10">${selColumnInfo.column_comment}</textarea>
			</div>
			<div class="d-flex">
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
			break;
		case "modify":
			formObj.attr("action", "/board/modify");
			formObj.attr("method", "post");
			break;
		}
		formObj.submit();
	}); // 모달창 Y
});
</script>
<%@ include file="../includes/footer.jsp"%>