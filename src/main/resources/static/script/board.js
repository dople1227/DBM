/*	1버튼 모달창 생성	*/
function setInfoModal(result) {	
	if (result === '' || history.state){
		return;
	}
	
	/*switch(result) {
		case 'modified':
			$(".modal-body").html("게시글이 수정되었습니다.");
			break;
		case 'deleted':
			$(".modal-body").html("게시글이 삭제되었습니다.");
				break;
	}
	$("#infoModal").modal("show");*/
}

/*	2버튼 모달창 생성 및 data-oper 세팅	*/
function setChkModal(operation){	
	switch(operation){
		case 'delete':
			$(".modal-body").html("게시글을 정말 삭제하시겠습니까?").data("oper",operation);
			break;
		case 'modify' :
			$(".modal-body").html("게시글을 정말 수정하시겠습니까?").data("oper",operation);
			break;
	}
	$("#chkModal").modal("show");
}

/*	pagination 선택된페이지 active처리*/
function setPageNumActive(pageNum){		
	$("a.page-link").removeClass("active");
	$("a[href$="+pageNum+"]").addClass("active");
}