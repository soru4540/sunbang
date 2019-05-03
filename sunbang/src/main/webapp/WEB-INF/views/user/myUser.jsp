<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선방</title>
<script type="text/javascript" src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<style>
/* div{
border:1px solid black;
} */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none !important;
    margin: 0 !important;
}
.ucon {
	font-size: 16px !important;
	border-radius: 0 !important;
}

.ucon:hover {
	font-size: 16px !important;
	border-radius: 0 !important;
	background: rgb(250, 250, 250) !important;
}

.btn-green {
	background: #61C0BF !important;
	color: white !important;
	font-size: 16px !important;
	font-weight: 600 !important;
}

.btn-green:hover {
	opacity: 0.9 !important;
	color: white !important;
}

.btn-lgreen {
	background: #61C0BF !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
}

.btn-lgreen:hover {
	opacity: 0.9 !important;
	color: white !important;
}
/* div{
border:1px solid black;
} */
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="userdel" style="padding-top:10%;"><div class="modal-dialog"><div class="modal-content">
     <div class="modal-header"><h4 class="modal-title">회원탈퇴</h4><button type="button" class="close" data-dismiss="modal">×</button></div>
     <div class="modal-body"><pre style="font-size:12px; white-space:pre-line">
회원탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요.
1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.
2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다.
3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.
4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는복구되지 않습니다.
5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.</pre>
		<div class="form-group" style="font-size:13px;"><select class="form-control ucon">
										<option>탈퇴사유를 선택해주세요</option>
										<option>더 이상 이용하지 않음</option>
										<option>탈퇴 후 재가입하려고</option>
										<option>원하는 정보가 없어서</option>
										<option>사용하기 불편해서</option></select></div>
		<div class="form-group"><textarea class="form-control ucon" rows="3" placeholder="다른 사유가 있으시면 적어주십시오" style="resize:none;"></textarea></div></div>
	<div class="modal-footer" style="border:0;"><input type="submit" class="btn btn-danger btn-block" value="회원탈퇴"></div>
</div></div></div>

<div class="container">
<div class="row" style="margin-top:7%;"></div>
<div class="row">
	<div class="col-12" ><div class="col-12" style="width:500px; margin:auto auto;">
		<div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 정보수정</span></div>
		<div class="form-group"><label>프로필</label><button class="btn btn-block btn-light"">이미지 업로드</button></div>
		<div class="form-group"><label>아이디</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>성명</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>이메일</label><span class="d-flex"><input type="email" class="form-control ucon" style="width:calc(100% - 90px);"><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>휴대폰번호</label><span class="d-flex"><span  class="d-flex" style="width:calc(100% - 90px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
		<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" class="form-control ucon"></div>
		<div class="form-group"><label>비밀번호 확인</label><input type="password" class="form-control ucon"></div>
		 <div class="form-group"><input type="submit" class="btn btn-block btn-green " value="수정"></div></div></div></div>
<!-- <div class="row">
<div class="row" style="width:800px; margin:auto auto;">
	<div class="col-md-12"><div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user-tie" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> 정보수정</span></div></div>
	<div class="col-md-6">
		<div class="form-group"><label>중개사무소명</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>중개등록번호</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>사업자 등록번호</label><span class="d-flex"><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span></div>
		<div class="form-group"><label>중개사무소 주소</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>중개사 대표자명</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>대표 전화번호</label><span class="d-flex"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span></div></div>
	<div class="col-md-6">
		<div class="form-group"><label>프로필</label><button class="btn btn-block btn-light"">이미지 업로드</button></div>
		<div class="form-group"><label>아이디</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>성명</label><input type="text" class="form-control ucon"></div>
		<div class="form-group"><label>이메일</label><span class="d-flex"><input type="email" class="form-control ucon" style="width:calc(100% - 90px);"><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
		<div class="form-group"><label>휴대폰번호</label><span class="d-flex"><span  class="d-flex" style="width:calc(100% - 90px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
		<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" class="form-control ucon"></div>
		<div class="form-group"><label>비밀번호 확인</label><input type="password" class="form-control ucon"></div></div>
	<div class="col-md-12" style="text-align:center;"><input type="submit" class="btn btn-green" value="수정" style="width: 100%;"></div></div></div> -->
<div class="row" style="margin:0 auto; text-align:center; margin-bottom:10%; margin-top:3%;"><div class="col-12"><b data-toggle="modal" data-target="#userdel" style="font-size:14px; cursor:pointer"><i class="fas fa-user-slash"></i>회원탈퇴</b></div></div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>