<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<!-- chkModal -->
<div class="modal fade" id="chkModal" tabindex="-1" role="dialog" aria-labelledby="alertModalLabel" aria-hidden="true">
	<div class="modal-dialog">
		<div class="modal-content">
			<div class="modal-header">
				<h5 class="modal-title fs-5" id="exampleModalLabel">확인</h5>
				<button type="button" class="btn-close" data-bs-dismiss="modal" aria-label="Close"></button>
			</div>
			<div class="modal-body">게시물을 정말 수정하시겠습니까?</div>
			<div class="modal-footer">
				<button id="btnModalY" type="button" class="btn btn-primary" data-oper="modalY">예</button>
				<button id="btnModalN" type="button" class="btn btn-secondary" data-bs-dismiss="modal">아니오</button>
			</div>
		</div>
	</div>
</div>