<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<!--  table  -->
	<div style="text-align: center;">
		<h4>테이블 목록</h4>
		<table class="table  table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="width: 10%">번호</th>
					<th scope="col" style="width: 10%">스키마</th>
					<th scope="col" style="width: 20%">테이블명</th>
					<th scope="col" style="width: 10%">ROW수</th>
					<th scope="col" style="width: 10%">생성일</th>
					<th scope="col" style="width: 10%">수정일</th>
					<th scope="col" style="width: 30%">설명</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${selTableList}">
					<tr>
						<th scope="row">${board.no}</th>
						<td>${board.table_schema}</td>
						<td ><a class="aMove" href="${board.table_name}">${board.table_name}</a></td>
						<td>${board.table_rows}</td>
						<td><fmt:formatDate value="${board.create_time}" pattern="MM-dd HH:mm"></fmt:formatDate></td>
						<td><fmt:formatDate value="${board.update_time}" pattern="MM-dd HH:mm"></fmt:formatDate></td>
						<td >${board.table_comment}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>
		<form id="actionForm" action="/dbm/tblList" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input id="inputTableName" type="hidden" name="table_name">
		</form>
	</div>
	<!--  /table  -->

	<!-- pagenation -->
	<div class="d-flex justify-content-between">
		<div></div>
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
		<div></div>
	</div>
	<!-- /pagenation -->
</div>
<%@ include file="../includes/modalInfo.jsp"%>

<script>
$(document).ready(function() {
	//pageNum active처리
	var pageNum = "<c:out value='${pageMaker.cri.pageNum}'/>";
	setPageNumActive(pageNum);
	
	//Modal처리
	var result = '<c:out value="${result}"/>';
	setInfoModal(result);
	
	//history관리
	history.replaceState({}, null, null);
	
	
	var actionForm = $("#actionForm");
	$("a.page-link").on("click",function(e) {
		e.preventDefault();		
		actionForm.find("input[name='pageNum']").val($(this).attr("href"));
		actionForm.submit();
	}); //페이징 번호 클릭

	$(".aMove").click(function(e) {
		e.preventDefault();
		$("#inputTableName").val($(this).attr("href"));
		//actionForm.append("<input type='hidden' name='table_name' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action","/dbm/columnList");
		actionForm.submit();		
	});

	$("#btnRegister").click(function(e) {
		self.replace = "/board/register";
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>