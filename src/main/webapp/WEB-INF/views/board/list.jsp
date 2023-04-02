<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ include file="../includes/header.jsp"%>

<div class="soron-container">
	<!--  table  -->
	<div style="text-align: center;">
		<h4>게시판 목록</h4>
		<table class="table  table-hover">
			<thead class="thead-dark">
				<tr>
					<th scope="col" style="width: 10%">번호</th>
					<th scope="col" style="width: 50%">제목</th>
					<th scope="col" style="width: 10%">작성자</th>
					<th scope="col" style="width: 10%">등록일</th>
					<th scope="col" style="width: 10%">수정일</th>
					<th scope="col" style="width: 10%">조회수</th>
				</tr>
			</thead>
			<tbody>
				<c:forEach var="board" items="${selList}">
					<tr>
						<th scope="row">${board.no}</th>
						<td style="text-align: left"><a class="aMove" href="${board.no}">${board.title}</a></td>
						<td>${board.writer}</td>
						<td><fmt:formatDate value="${board.ins_time}" pattern="MM-dd HH:mm"></fmt:formatDate></td>
						<td><fmt:formatDate value="${board.udt_time}" pattern="MM-dd HH:mm"></fmt:formatDate></td>
						<td>${board.hits}</td>
					</tr>
				</c:forEach>
			</tbody>
		</table>

		<form id="actionForm" action="/board/list" method="get">
			<input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
			<input type="hidden" name="amount" value="${pageMaker.cri.amount}">
			<input id="inputNo" type="hidden" name="no">
		</form>
	</div>
	<!--  /table  -->


	<div class="d-flex justify-content-between">
		<div></div>
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
		<div class="">
			<a id="btnRegister" class="btn btn-outline-info">글쓰기</a>
		</div>
	</div>
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
	});

	$(".aMove").click(function(e) {
		e.preventDefault();

		$("#inputTableName").val($(this).attr("href"));
		$("#inputNo").val($(this).attr("href"));
		//actionForm.append("<input type='hidden' name='no' value='"+ $(this).attr("href")+"'>");
		actionForm.attr("action","/board/get");
		actionForm.submit();		
	});

	$("#btnRegister").click(function(e) {
		self.location = "/board/register";
	});
});
</script>
<%@ include file="../includes/footer.jsp"%>