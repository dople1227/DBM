<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<!--  table  -->
	<div style="text-align: center;">
		<h4>${tableName}</h4>
		<table class="table  table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="width: 5%">순서</th>
					<th scope="col" style="width: 10%">컬럼명</th>
					<th scope="col" style="width: 10%">컬럼타입</th>
					<th scope="col" style="width: 5%">컬럼키</th>
					<th scope="col" style="width: 10%">ISNULL</th>
					<th scope="col" style="width: 10%">기본값</th>
					<th scope="col" style="width: 10%">기타</th>
					<th scope="col" style="width: 30%">설명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${selColumnList}">
					<tr>
						<th scope="row">${board.ordinal_position}</th>
						<td><a class="aMove" href="${board.ordinal_position}">${board.column_name}</a></td>
						<td>${board.column_type}</td>
						<td>${board.column_key}</td>
						<td>${board.is_nullable}</td>
						<td>${board.column_default}</td>
						<td>${board.extra}</td>
						<td>${board.column_comment}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form id="actionForm" action="/dbm/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		</form>
	</div>
	<!--  /table  -->


	<div class="d-flex justify-content-between">
		<div>
			<button id="btnList" data-oper="list" class="btn btn-outline-info me-1">뒤로가기</button>
		</div>
		<!-- pagenation -->
		<nav aria-label="">
			<ul class="pagination mb-0">
				<c:if test="${pageMaker.prev}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.startPage -1}" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
							<span class="sr-only">Previous</span>
						</a>
					</li>
				</c:if>
				<c:forEach var="num" begin="${pageMaker.startPage }" end="${pageMaker.endPage }">
					<li class="page-item">
						<a class="page-link" href="${num}">${num}</a>
					</li>
				</c:forEach>
				<c:if test="${pageMaker.next}">
					<li class="page-item">
						<a class="page-link" href="${pageMaker.endPage +1}" aria-label="Next">
							<span aria-hidden="true">&raquo;</span>
							<span class="sr-only">Next</span>
						</a>
					</li>
				</c:if>
			</ul>
		</nav>
		<!-- /pagenation -->
		<div class="d-flex"></div>
	</div>
</div>

<!-- Column Modify Modal -->
<div class="modal fade" id="modifyColumnModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog  modal-dialog-scrollable">
		<div class="modal-content">
			<div class="modal-header">
				<h1 class="modal-title fs-5" id="exampleModalCenteredScrollableTitle">수정하기</h1>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<form id="actionForm">
				<div class="modal-body row g-3">
					<div class="col-md-6">
						<label for="txtColumnName" class="col-form-label" data-oldColName="">컬럼명</label>
						<input type="text" class="form-control" name="newColName" id="txtColumnName">
					</div>
					<div class="col-md-6">
						<label for="txtColumnType" class="col-form-label">컬럼타입</label>
						<input type="text" readonly class="form-control" id="txtColumnType" disabled>
					</div>
					<div class="col-md-6">
						<label for="txtColumnKey" class="col-form-label">컬럼키</label>
						<input type="text" readonly class="form-control" id="txtColumnKey" disabled>
					</div>
					<div class="col-md-6">
						<label for="selIsNull" class="col-form-label">ISNULL</label> 
						<select id="selIsNull" class="form-select" aria-label="Default select example">							
							<option value="NOT NULL">NOT NULL</option>
							<option value="NULL">NULL</option>							
						</select>						
					</div>
					<div class="col-md-6">
						<label for="txtDefaultVal" class="col-form-label">컬럼기본값</label>
						<input type="text"  class="form-control" id="txtDefaultVal">
					</div>
					<div class="col-md-6">
						<label for="txtExtra" class="col-form-label">추가정보</label>
						<input type="text" readonly disabled class="form-control" id="txtExtra">
					</div>
					<div class="">
						<label for="txtColumnDesc" class="col-form-label">컬럼설명</label>
						<textarea id="txtColumnDesc" name="content" class="form-control" rows="2"></textarea>
					</div>
				</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary" data-bs-dismiss="modal">취소하기</button>
					<button id="btnModalY" type="button" class="btn btn-primary">수정하기</button>
				</div>
			</form>
		</div>
	</div>
</div>
<script>
$(document).ready(function() {
	var formObj = $("#actionForm");
	$("#btnList").click(function(e) {
		e.preventDefault();
		formObj.attr("action", "/dbm/tblList");
		formObj.attr("method", "get");
		formObj.empty();
		formObj.submit();
	});
	
	$("#btnModalY").click(function(e) {
		e.preventDefault();
		let param = {};
		param.tableName = "${tableName}";
		param.oldColName = $("#txtColumnName").data("oldColName");
		param.newColName = $("#txtColumnName").val();
		param.colType = $("#txtColumnType").val();
		param.isNull = $("#selIsNull").val();
		
		if($("#txtDefaultVal").val() != ""){
			if($("#txtDefaultVal").val()  != "CURRENT_TIMESTAMP")
				param.defaultVal = "DEFAULT '" + $("#txtDefaultVal").val() +"'";
			else
				param.defaultVal = "DEFAULT " + $("#txtDefaultVal").val();
		}			
		else
			param.defaultVal =""
				
		param.extra = $("#txtExtra").val();
		param.colComment = $("#txtColumnDesc").val();
		
		$.ajax({
			url: "/dbm/columnModify",
			type: "POST",
			data: JSON.stringify(param),
			contentType: "application/json",			
		}).done(function(data){			
			location.replace("/dbm/columnList?table_name=${tableName}");
		}).fail(function(data){
		});

		$("#modifyColumnModal").modal("hide");	
		
	});

	$(".aMove").click(function(e) {
		e.preventDefault();
		$("#modifyColumnModal").modal("show");		
		//SET Modal
		$("#txtColumnName").val($(this).text());
		$("#txtColumnName").data("oldColName",$(this).text());
		$("#txtColumnType").val($(this).parent().siblings("td:eq(0)").text());		
		$("#txtColumnKey").val($(this).parent().siblings("td:eq(1)").text());	
		$("#selIsNull").val($(this).parent().siblings("td:eq(2)").text()).prop("selected",true);
		$("#txtDefaultVal").val($(this).parent().siblings("td:eq(3)").text());
		$("#txtExtra").val($(this).parent().siblings("td:eq(4)").text());
		$("#txtColumnDesc").text($(this).parent().siblings("td:eq(5)").text());		
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>