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
<script type="text/javascript"
	src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#js_budetail_page h3 {
	margin-bottom: 30px;
	margin-top: 60px;
	font-family: a고딕15;
}

#js_budetail_row .col-form-label {
	text-align: center;
	background-color: #f8f9fa;
}

#js_budetail_tb {
	margin: 0 auto;
	width: 90%;
}

#js_budetail_row .col-sm-10 {
	padding-right: 15px;
	padding-left: 15px;
}

#js_budetail_title {
	width: 100%;
	margin-top: 30px;
	margin-bottom: 20px;
	font-family: a고딕14;
}
</style>
<script type="text/javascript">
	$(function() {
		var ustatus = ${pref.user_status };
		$("#user_status").val("");
		var url=document.referrer;
		if(url.substring(30, 32) == "ap" ){
			$("#statusM").css("visibility", "hidden");
		}
		else if(url.substring(30, 32) == "au"){
			$(document.getElementById("statusM")).html("");
			var str = "<select class='custom-select' name='statusBox' id='statusBox' style='width: 200px;'>"
			+"<option value='0'>전체이용가능</option>"
			+"<option value='1'>부동산 블랙</option>"
			+"<option value='2'>인테리어 블랙</option>"
			+"<option value='3'>채팅 블랙</option>"
			+"<option value='4'>부동산/인테리어 블랙</option>"
			+"<option value='5'>인테리어/채팅 블랙</option>"
			+"<option value='6'>부동산/채팅 블랙</option>"
			+"<option value='7'>전체 블랙</option>"
			+"<option value='8'>탈퇴</option>"
			+"<option value='9'>경고(부동산블랙)</option></select>"
			+"<button type='button' class='btn btn-info' onclick='nomalUserM()'>처리</button>";
			$(document.getElementById("statusM")).html(str);
			$("#statusBox").val(ustatus).attr("selected", "selected");
		}
		var statusagreement= '${pref.status_agreement}';
		if(statusagreement == 'N'){
			console.log(statusagreement);
			$("#status_agreement").val("미승인");
		}else if(statusagreement == 'Y'){
			$("#status_agreement").val("승인");
		}else{
			$("#status_agreement").val("경고")
		}
		
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
	
	function management(){
		var ustatus = ${pref.user_status };
		var status = $("#statusBox").val();
		var buserno =${pref.business_user_no};
		var userno = ${pref.user_no};
		var userstatus = 0;
		if(status == 'Y'){
			if(ustatus == 1){
				userstatus = 0;
			}else if(ustatus == 4){
				userstatus = 2;
			}else if(ustatus == 6){
				userstatus = 3;
			}else if(ustatus == 7){
				userstatus = ustatus;
			}
		}else if(status == 'W'){
			userstatus = 9;
		}else{
			if(ustatus == 4 || ustatus == 6){
				userstatus = ustatus;
			}else{
				userstatus = 1;
			}
		}
		
		if(status == ""){
			alert("변경할 상태를 선택하세요.");
		}else{
			location.href="absupdate.do?status="+status+"&buserno="+buserno+"&user_no="+userno+"&user_status="+userstatus;
		}
	}
	
	function nomalUserM(){
		var status = $("#statusBox").val();
		var user_no = ${pref.user_no};
		if(status == ""){
			alert("변경할 상태를 선택하세요.");
		}else{
			location.href="ausupdate.do?user_no="+user_no+"&status="+status;
		}
	}
</script>

</head>
<body>
	<div class="container" style="height: 100%;">
		<div id="js_budetail_page">
			<h3 align="center">회원 정보</h3>
		</div>
		<div id="js_budetail_tb">
			<div id="js_budetail_title">
				<h5>회원정보</h5>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">회원번호 </label>
				<div class="col-sm">
					<input type="text" class="form-control" id="user_no"
						value="${pref.user_no }">
				</div>
				<label class="col-sm-2 col-form-label">회원분류</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="user_type"
						value="${pref.user_type }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">회원ID</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="user_id"
						value="${pref.user_id }">
				</div>
				<label class="col-sm-2 col-form-label">회원이름</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="user_name"
						value="${pref.user_name }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">이메일</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="email"
						value="${pref.email }">
				</div>
				<label class="col-sm-2 col-form-label">연락처</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="phone"
						value="${pref.phone }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">가입일</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="join_date"
						value="${pref.join_date }">
				</div>
				<label class="col-sm-2 col-form-label">회원등급</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="user_status" value="${pref.user_status }">
					
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label" style="padding-top: 18px;">수정/탈퇴사유</label>
				<div class="col-sm">
					<textarea class="form-control" id="reason_leave" rows="2">${pref.reason_leave }</textarea>
				</div>
			</div>
			<div id="js_budetail_title">
				<h5>기업 정보</h5>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">기업회원 번호</label>
				<div class="col-sm">
					<c:if test="${pref.business_user_no > 0}">
						<input type="text" class="form-control" id="business_user_no"
							value="${pref.business_user_no }">
					</c:if>
					<c:if test="${pref.business_user_no == 0}">
						<input type="text" class="form-control" id="business_user_no">
					</c:if>
				</div>
				<label class="col-sm-2 col-form-label">중개등록번호</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="office_regist_no"
						value="${pref.office_regist_no }">
				</div>

			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">대표전화번호</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="office_phone"
						value="${pref.office_phone }">
				</div>
				<label class="col-sm-2 col-form-label">사업자등록번호</label>
				<div class="col-sm">
					<c:if test="${pref.business_license_no > 0}">
						<input type="text" class="form-control" id="business_license_no"
							value="${pref.business_license_no }">
					</c:if>
					<c:if test="${pref.business_license_no == 0}">
						<input type="text" class="form-control" id="business_license_no">
					</c:if>
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">중개사무소명</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="office_name"
						value="${pref.office_name }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">중개사무소주소</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="office_address"
						value="${pref.office_address }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row">
				<label class="col-sm-2 col-form-label">가입승인상태</label>
				<div class="col-sm">
				<input type="text" class="form-control" id="status_agreement" value="${pref.status_agreement}">
				</div>
				<label class="col-sm-2 col-form-label">프리미엄여부</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="premium_status"
						value="${pref.premium_status }">
				</div>
			</div>
			<div class="form-group row" id="js_budetail_row" style=" margin-top:30px;">
				<c:if test="${pref.user_status != 8}">
				<div align="right" style="width: 60%;" id="statusM">
				<select class="custom-select" name="statusBox"
					id="statusBox" style="width: 100px;">
					<option value="">선택</option>
					<option value="Y">승인</option>
					<option value="W">경고</option>
					<option value="N">미승인</option>
				</select>
				<button type="button" class="btn btn-info"
					onclick="management()">처리</button>
				</div>
				</c:if>
				<div align="right" style="width: 40%;">
					<button type="reset" class="btn btn-secondary"
						onclick="window.close();">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>