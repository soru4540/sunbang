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
<script>
$(function(){
	window.addEventListener('load', function() {
	    var forms = $('.needs-validation');
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	
	$("#uppbtn").click(function(){
		$("#userpage").hide();
		$("#uppage").fadeIn();
	});
	
	$("#userpbtn").click(function(){
		$("#uppage").hide();
		$("#userpage").fadeIn();
	});
	
	<c:forEach var="c" begin="1" end="3"> 
	
	$("#phonebtn${c}").click(function(){
		$.ajax({
			url: "ucheckphone.do",
			type: "post",
			data: {phone : $("#phone${c}a").val()+"-"+$("#phone${c}b").val()+"-"+$("#phone${c}c").val()},
			dataType: "text",
			success: function(response){
				alert(response);
			},
			error: function(){
				alert("실패");
			}
		});
	});
	
	$("#profile${c}").change(function(){
	    if(this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#divview${c}').show();
	        	$('#imgdel${c}').show();
	            $('#divview${c}').html("<img src="+ e.target.result +" class='img-thumbnail' style='width:100%; height:100%; border-radius:3px;'>"); 
	        }
	        reader.readAsDataURL(this.files[0]);
	    }
	});
	$('#imgdel${c}').click(function(){
		$("#profile${c}").val("");
		$('#divview${c}').hide();
    	$('#imgdel${c}').hide();
	});
	
	$('#uid${c}').change(function(){
		if($('#uid${c}').val() !=""){
		if(/^(?=.*[a-z])[a-z\d]{5,15}$/.test($('#uid${c}').val())){
			$.ajax({
				url: "ucheckid.do",
				type: "post",
				data: {userid : $("#uid${c}").val()},
				dataType: "text",
				success: function(response){
					if(response == "success"){
					$('#idfail${c}').hide();
					$('#idsuc${c}').show();
					return true;
					}else{
					$('#idsuc${c}').hide();
					$('#idfail${c}').show().html("이미 사용중이거나 탈퇴한 아이디입니다.");
					return false;
					}
				},
				error: function(){
				}
			});
		}else{
			$('#idsuc${c}').hide();
			$('#idfail${c}').show().html("5~15자의 영문 소문자, 숫자(혼용)만 사용가능합니다");
			return false;
		}}else{
			$('#idfail${c}').show().html("아이디를 입력하세요");
			$('#idsuc${c}').hide();
			return false;
		}
		return false;});
	
	$("#nick${c}").change(function(){
		if($('#nick${c}').val() != ""){
		if(/^(?=.*[a-zA-z가-힣])[a-zA-z\d가-힣]{3,10}$/.test($('#nick${c}').val())){
			$.ajax({
				url: "uchecknick.do",
				type: "post",
				data: {nickname : $("#nick${c}").val()},
				dataType: "text",
				success: function(response){
					if(response == "success"){
						$('#nicksuc${c}').show();
						$('#nickfail${c}').hide();
						return true;
					}else{
						$('#nicksuc${c}').hide();
						$('#nickfail${c}').show().html("이미 사용중인 닉네임입니다");
						return false;
					}
				},
				error: function(){
					console.warn("닉네임일치 X");
				}
			});
		}else{
			$('#nicksuc${c}').hide();
			$('#nickfail${c}').show().html("3~10자의 영문 소문자, 한글, 숫자(혼용)만 사용가능합니다");
			return false;
		}
		}else{
			$('#nickfail${c}').show().html("닉네임을 입력하세요");
			$("#nicksuc${c}").hide();
			return false;
		}
	});
	
	</c:forEach>
});
</script>
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
	cursor: pointer;
}

.btn-lgreen:hover {
	opacity: 0.9 !important;
	color: white !important;
}
.btn-gray {
	background: #777 !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
}

.btn-gray:hover {
	opacity: 0.9 !important;
	color: white !important;
}
.imageview {
	width: 100px;
	height: 100px;
	display: none;
}
.btn-bgray {
	background: rgba(75, 188, 244, 0.8) !important;
	color: white !important;
	font-size: 15px !important;
	font-weight: 600 !important;
	border-radius: 5px !important;
	height: 35px;
	cursor:pointer;
}

.btn-bgray:hover {
	opacity: 0.8 !important;
}
.card{
font-weight:600;
}
/* div{
border:1px solid black;
} */
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="userdel" style="padding-top:10%;"><div class="modal-dialog"><form action="uuserout.do" method="post"><div class="modal-content">
     <div class="modal-header"><h4 class="modal-title">회원탈퇴</h4><button type="button" class="close" data-dismiss="modal">×</button></div>
     <div class="modal-body"><pre style="font-size:12px; white-space:pre-line">
회원탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요.
1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.
2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다.
3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.
4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는복구되지 않습니다.
5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.</pre>
		<div class="form-group" style="font-size:13px;"><select class="form-control ucon" name="reason1">
										<option value="사유없음">탈퇴사유를 선택해주세요</option>
										<option value="더 이상 이용하지 않음">더 이상 이용하지 않음</option>
										<option value="탈퇴 후 재가입하려고">탈퇴 후 재가입하려고</option>
										<option value="원하는 정보가 없어서">원하는 정보가 없어서</option>
										<option value="사용하기 불편해서">사용하기 불편해서</option></select></div>
		<div class="form-group"><textarea class="form-control ucon" rows="3" name="reason2" placeholder="다른 사유가 있으시면 적어주십시오" style="resize:none;"></textarea><input type="hidden" name="user_no" value="${loginUser.user_no }"><input type="hidden" name="nickname" value="${loginUser.nickname }"></div></div>
	<div class="modal-footer" style="border:0;"><input type="submit" class="btn btn-danger btn-block" value="회원탈퇴"></div>
</div></form></div></div>

<div class="container">
<div class="row" style="margin-top:7%;"></div>
<div class="row" id="userpage">
	<div class="col-12 mb-3"><div class="col-12 mx-auto" style="width:700px;"><span class="font-weight-bold fa-2x"><i class="fas fa-user" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> </span><span style="font-size:28px; font-weight:600;">${loginUser.nickname} <small style="font-weight:600;">의 회원정보</small></span><span id="uppbtn"class="btn btn-lgreen mt-1" style="float:right;">정보수정</span><span class="btn btn-lgreen mr-2 mt-1" style="float:right;">비밀번호수정</span></div></div>
	<div class="col-12"><div class="col-12 mx-auto" style="width:700px;">
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">프로필</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">회원분류</div><div class="card bg-light" style="padding: 8px 30px; width:33%;">회원등급</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;"><c:if test="${!empty loginUser.user_profile}" ><img class="img-thumbnail" src="files/user/userImages/${loginUser.user_profile}" style="width:120px; height: 100px;"></c:if></div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_type }</div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_status }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">아이디</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">닉네임</div><div class="card bg-light" style="padding: 8px 30px; width:33%;">성명</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_id}</div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.nickname }</div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_name }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">전화번호</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">이메일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.phone}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.email }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">가입일</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">최근 수정일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.join_date}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.update_date }</div></div>
		</div></div>
	<div class="col-12 mt-3" style="margin-bottom: 10%;"><div class="col-12 mx-auto" style="width:900px;">
		<div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-money-check-alt" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> <small><b>최근 프리미엄결제 내역</b></small></span></div>
		<div class="d-flex"><div class="card mr-2" style="padding: 8px 30px; width:33%;">프리미엄 결제일</div><div class="card mr-2" style="padding: 8px 30px; width:33%;">결제 금액</div><div class="card mr-2" style="padding: 8px 30px; width:24%;">결제 상태</div><div class="btn btn-lgreen" style="width:10%; padding-top:10px; font-size:16px;">환불신청</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;"></div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;"></div><div style="padding:15px 15px; width:33%; word-wrap:break-word;"></div></div></div></div>
</div>
<div id="uppage" style="display:none;">
<c:if test="${loginUser.user_type eq '일반회원' || loginUser.user_type eq '매도인'}">
<div class="row">
	<div class="col-12" ><div class="col-12" style="width:500px; margin:auto auto;">
		<div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 정보수정</span><span id="userpbtn"class="btn btn-gray mt-1" style="float:right;">회원정보</span></div><form class="needs-validation" action="" method="post" enctype="multipart/form-data" novalidate>
		<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview1"></div><span class="d-flex"><label for="profile1" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile1" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel1" style="display:none;">취소</button></span></span></div>
		<div class="form-group"><label>아이디</label><input type="text" id="uid1" class="form-control ucon" name="user_id" value="" required><div id="idsuc1" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail1" class="invalid-feedback"></div></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="nick1" name="nickname" required><div id="nicksuc1" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="nickfail1" class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>성명</label><input type="text" class="form-control ucon" name="user_name" required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext1" name="email" class="form-control ucon" required><div class="input-group-append"><button type="button" id="emailbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
		<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="phone1a" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
			</select><input type="number" id="phone1b" name="phone2" class="form-control ucon mr-2" required><input type="number" id="phone1c" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" id="phonebtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
		 <div class="form-group mt-4"><input type="submit" class="btn btn-block btn-green " value="수정"></div></form></div></div></div>
</c:if>
<c:if test="${loginUser.user_type eq '공인중개사' }">
<form class="needs-validation" action="" method="post" enctype="multipart/form-data" novalidate><div class="row">
	<div class="col-md-12"><div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user-tie" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> 정보수정</span><span id="userpbtn"class="btn btn-gray mt-1" style="float:right;">회원정보</span></div></div>
	<div class="col-md-6">
		<div class="form-group"><label>중개사무소명</label><select class="form-control ucon" name="office_name" required>
																					<option>어디</option>
		</select><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>중개등록번호</label><input type="text" name="office_regist_no" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>사업자 등록번호</label><div class="input-group"><input type="number" name="license1" class="form-control ucon mr-2" required><input type="number" name="license2" class="form-control ucon mr-2" required><input type="number" name="license3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div>
		<div class="form-group"><label>중개사무소 주소</label><input type="text" name="office_address"class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>중개사 대표자명</label><input type="text" name="user_name" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>대표 전화번호</label><div class="input-group"><input type="number" name="ophone1" class="form-control ucon mr-2" required><input type="number" name="ophone2" class="form-control ucon mr-2" required><input type="number" name="ophone3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div></div>
	<div class="col-md-6">
		<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview3"></div><span class="d-flex"><label for="profile3" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile3" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel3" style="display:none;">취소</button></span></span></div>
		<div class="form-group"><label>아이디</label><input type="text" id="uid3" name="user_id" class="form-control ucon" required><div id="idsuc3" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail3" class="invalid-feedback"></div></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="nick3" name="nickname" required><div id="nicksuc3" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="nickfail3" class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext3" name="email" class="form-control ucon" required><div class="input-group-append"><button type="button" id="emailbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
		<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="phone3a" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
			</select><input type="number" id="phone3b" name="phone2" class="form-control ucon mr-2" required><input type="number" id="phone3c" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" id="phonebtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div></div></form>
	<div class="col-md-12 mt-4" style="text-align:center;"><input type="submit" class="btn btn-green" value="수정" style="width: 100%;"></div></div></form>
</c:if>
<div class="row" style="margin:0 auto; text-align:center; margin-bottom:10%; margin-top:3%;"><div class="col-12"><b data-toggle="modal" data-target="#userdel" style="font-size:14px; cursor:pointer"><i class="fas fa-user-slash"></i>회원탈퇴</b></div></div></div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>