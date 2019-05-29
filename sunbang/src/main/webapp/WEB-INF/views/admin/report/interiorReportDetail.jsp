<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style type="text/css">
#js_rpdetail_h4 {
	font-weight: bold;
	margin-bottom: 40px;
	margin-top: 40px;
}

#js_rpdetail_table .col-form-label {
	text-align: center;
	background-color: #f8f9fa;
}

#js_rpdetail_table {
	margin: 0 auto;
	width: 90%;
}

#js_rpdetail_contents {
	height: 300px;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	overflow-x: hidden;
	word-wrap: break-word;
}
</style>
<script type="text/javascript">
	$(function() {
		$(window).bind("beforeunload", function() {
			opener.parent.location.reload();
			window.close();
		});
	});
	
	function openView(){
		var popupX = (window.screen.width/2) - (200/2);
		var popupY= (window.screen.height/2) - (700/2);
		window.open('rdetail.do?realty_no='+${report.report_no }, 'View',
				'left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
	}
	
	function update(data){
		var report_no = ${report.report_no };
		var contents_no = ${report.contents_no};
		var contents_status =$("#contents_status").val();
		//console.log('artsupdate.do?report_no='+report_no+'&contents_no='+contents_no+'&status='+data+"&contents_status="+contents_status);
		location.href='artsupdate.do?report_system=interior&report_no='+report_no+'&contents_no='+contents_no+'&status='+data+"&contents_status="+contents_status;
	}
</script>

</head>
<body>
	<div class="container" style="height: 100%;">
		<div>
			<h4 align="center" id="js_rpdetail_h4">인테리어 신고글 상세</h4>
		</div>
		<div id="js_rpdetail_table">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">신고번호</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="report_no" disabled
						style="background-color: white;" value="${report.report_no }">
				</div>
				<label class="col-sm-2 col-form-label">시스템</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="report_system" disabled
						style="background-color: white;" value="${report.report_system }">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">카테고리</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="category" disabled
						style="background-color: white;" value="${report.category }">
				</div>
				<label class="col-sm-2 col-form-label">게시판</label>
				<div class="col-sm">
					<c:if test="${report.reported_board == 'photograph'}">
					<input type="text" class="form-control" id="report_no" disabled
						style="background-color: white;" value="사진">
					</c:if>
					<c:if test="${report.reported_board == 'housewarming'}">
					<input type="text" class="form-control" id="report_no" disabled
						style="background-color: white;" value="집들이">
					</c:if>
					<c:if test="${report.reported_board == 'knowhow'}">
					<input type="text" class="form-control" id="report_no" disabled
						style="background-color: white;" value="노하우">
					</c:if>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">글번호</label>
				<div class="col-sm">
					<a class="form-control" id="reported_board" href="#"
						onclick="openView()" style="color: blue; font-weight: bold;">${report.contents_no }</a>
				</div>
				<label class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="userId" disabled
						style="background-color: white;" value="${report.user_id }">
				</div>

			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">처리상태</label>
				<div class="col-sm">
					<c:if test="${report.report_status == 0}">
						<input type="text" class="form-control" id="statusNo" value="미처리"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.report_status == 1}">
						<input type="text" class="form-control" id="statusNo" value="검수중"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.report_status == 2}">
						<input type="text" class="form-control" id="statusNo" value="처리완료"
							disabled style="background-color: white;">
					</c:if>
				</div>
				<label class="col-sm-2 col-form-label">게시상태</label>
				<div class="col-sm">
					<c:if test="${report.contents_status == 0}">
						<input type="text" class="form-control" id="contents_status" value="게시중"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.contents_status == 1}">
						<input type="text" class="form-control" id="contents_status" value="검수중"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.contents_status == 2}">
						<input type="text" class="form-control" id="contents_status" value="처리완료"
							disabled style="background-color: white;">
					</c:if>
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">신고일자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="report_date" disabled
						style="background-color: white;" value="${report.report_date }">
				</div>
				<label class="col-sm-2 col-form-label">처리일자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="report_date" disabled
						style="background-color: white;" value="${report.handle_date }">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputcontents" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10"
					style="padding-right: 15px; padding-left: 15px;">
					<div class="form-control" id="js_rpdetail_contents">
						${report.contents }</div>
				</div>
			</div>
			<div class="form-group row">
				<div align="right" style="width: 70%;">
					<c:if test="${report.report_status != 2}">
						<button class="btn btn-primary" onclick="update(2)">확인완료</button>&nbsp;&nbsp;
						<button class="btn btn-danger" data-toggle="modal"
							data-target="#delete">검수</button>
					</c:if>
					<!-- Modal -->
					<div class="modal fade" id="delete" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<h5 class="modal-title" id="exampleModalLabel">인테리어 게시글 검수
										안내 메세지</h5>
								</div>
								<div class="modal-body" style="text-align:center;">정말 이 게시글의 상태를 검수중으로 바꾸시겠습니까?</div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										onclick="update(1)">확인</button>
								</div>
							</div>
						</div>
					</div>
				</div>
				<div align="right" style="width: 28%;">

					<button type="reset" class="btn btn-secondary"
						onclick="window.close();">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>