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
		$(function() {
			var ustatus = ${report.contents_status };
			var status_text = "";
			if(ustatus == 0){
				status_text ="전체이용가능";
			}else if(ustatus == 1){
				status_text ="부동산 블랙";
			}else if(ustatus == 2){
				status_text ="인테리어 블랙";
			}else if(ustatus == 3){
				status_text ="채팅 블랙";
			}else if(ustatus == 4){
				status_text ="부동산/인테리어 블랙";
			}else if(ustatus == 5){
				status_text ="인테리어/채팅 블랙";
			}else if(ustatus == 6){
				status_text ="부동산/채팅 블랙";
			}else if(ustatus == 7){
				status_text ="전체 블랙";
			}else if(ustatus == 8){
				status_text ="탈퇴";
			}else if(ustatus == 9){
				status_text ="경고(부동산블랙)";
			}
			$("#user_status").val(status_text);
		});
	});
	
	function openView(){
		var popupX = (window.screen.width/2) - (1000/2);
		var popupY= (window.screen.height/2) - (800/2);
		window.open('audetailselect.do?user_id=${report.reported_board }', 'View',
				'width=1000,height=800, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
	}
	
	function update(){
		var select = $("#selBox").val();
		console.log(select);
		var report_no = ${report.report_no };
		var reported_board= '${report.reported_board}';
		var contents_status =$("#contents_status").val();
		//console.log('artsupdate.do?report_no='+report_no+'&reported_board='+reported_board+'&status='+select);
		location.href='artsupdate.do?report_system=user&report_no='+report_no+'&reported_board='+reported_board+'&status=2&contents_status='+select;
	}
</script>

</head>
<body>
	<div class="container" style="height: 100%;">
		<div>
			<h4 align="center" id="js_rpdetail_h4">회원 신고글 상세</h4>
		</div>
		<div id="js_rpdetail_table">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">글번호</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="report_no" disabled
						style="background-color: white;" value="${report.report_no }">
				</div>
				<label class="col-sm-2 col-form-label">카테고리</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="category" disabled
						style="background-color: white;" value="${report.category }">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">신고회원</label>
				<div class="col-sm">
					<a class="form-control" id="reported_board" href="#"
						onclick="openView()" style="color: blue; font-weight: bold;">${report.reported_board }</a>
				</div>
				<label class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="userId" disabled
						style="background-color: white;" value="${report.user_id }">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">회원등급</label>
				<div class="col-sm">
				<input type="text" class="form-control" id="user_status" disabled
						style="background-color: white;" value="${report.contents_status}">
				</div>
				<label class="col-sm-2 col-form-label">상태</label>
				<div class="col-sm">
					<c:if test="${report.report_status == 0}">
						<input type="text" class="form-control" id="statusNo" value="미처리"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.report_status == 1}">
						<input type="text" class="form-control" id="statusNo" value="확인완료"
							disabled style="background-color: white;">
					</c:if>
					<c:if test="${report.report_status == 2}">
						<input type="text" class="form-control" id="statusNo" value="처리완료"
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
						style="background-color: white;" value="${report.report_date }">
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
					<c:if test="${report.report_status == 0}">
						<button class="btn btn-primary" onclick="update()">확인완료</button>&nbsp;&nbsp;
						<select class="custom-select" name="selBox" id="selBox"
							style="min-width: 200px; max-width: 200px;">
							<option value="">카테고리 선택</option>
							<option value="0">전체이용가능</option>
							<option value="1">부동산 블랙</option>
							<option value="2">인테리어 블랙</option>
							<option value="3">채팅 블랙</option>
							<option value="4">부동산/인테리어 블랙</option>
							<option value="5">인테리어/채팅 블랙</option>
							<option value="6">부동산/채팅 블랙</option>
							<option value="7">전체 블랙</option>
							<option value="8">탈퇴</option>
						</select>
						<button class="btn btn-danger" data-toggle="modal"
							onclick="modalOpen()">상태변경</button>
					</c:if>
					<script>
					function modalOpen(){
						var select = $("#selBox").val();
						var status = $("#selBox option:checked").text();
						$("#selectval").text(select);
						$("#modal").text("정말 이 회원의 상태를 [ "+status+" ] 로 변경시키겠습니까?");
						$('#delete').modal('show');
					}
					</script>
					<c:set var="value" value="${select }"></c:set>
					<!-- Modal -->
					<div class="modal fade" id="delete" tabindex="-1" role="dialog"
						aria-labelledby="exampleModalLabel" aria-hidden="true">
						<div class="modal-dialog modal-dialog-centered" role="document">
							<div class="modal-content">
								<div class="modal-header" style="text-align: center;">
									<h5 class="modal-title" id="exampleModalLabel">회원 상태변경
										안내메세지</h5>
									<a style="visibility: hidden;" id="selectval"></a>
								</div>
								<div class="modal-body" id="modal" style="text-align: left;"></div>
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary"
										data-dismiss="modal">취소</button>
									<button type="button" class="btn btn-primary"
										onclick="update()">변경</button>
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