<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
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
	
	$("#accountpage").click(function(){
		$("#turn").css("transform", "rotateY(180deg)");
		$("#userback").css("z-index", 1);
		$("#loginfront").css("z-index", 0);
		$("#turnfooter").css("transition-delay", "0s");
		$("#turnfooter").css("margin-top", $(".container").height()+$("#accountheight").height()+200);
	});
	$(".returnlogin").click(function(){
		$("#turn").css("transform", "rotateY(360deg)");
		$("#userback").css("z-index", 0);
		$("#loginfront").css("z-index", 1);
		$("#turnfooter").css("transition-delay", "0.3s");
		$("#turnfooter").css("margin-top", $(".container").height()+$("#loginfront").height()+200);
	});
	$(".widthchange").click(function(){
		$("#userback").css("width", "100%");
	});
	$(".widthreset").click(function(){
		$("#userback").css("width", "500px");
	})
	
	function failbar(message){
		$("#loginfailbar").show().html(message);
		
	}
	
	$("#loginbtn").click(function(){
		$.ajax({
		url: "ulogin.do",
		type: "post",
		data: $("#loginform").serialize(),
		dataType: "text",
		success: function(response){
			$("#loginid").val("");
			$("#loginpwd").val("");
			if(response == "success"){
				var page = "realtymain.do";
				if('${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogout.do"&& '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogin.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uloginview.do"  ){
				page = '${param.pageuri}'.substring(1, '${param.pageuri}'.length);
				}
				location.href=page;
			}
			if(response == "idfail"){
				failbar("아이디가 틀렸습니다 다시 입력해주세요.");
			}
			if(response == "pwdfail"){
				failbar("패스워드가 틀렸습니다 다시 입력해주세요.");
			}
			if(response == "countfail"){
				console.log("로그인시도횟수 실패");
			}
		},
		error: function(){
			alert("로그인실패");
			$("#loginid").val("");
			$("#loginpwd").val("");
		}});
	});
	$("#emailbtn1").click(function(){
		$.ajax({
			url: "ucheckemail.do",
			type: "post",
			data: {email : $("#emailtext1").val()},
			dataType: "json",
			success: function(response){
				alert("성공");
			},
			error: function(){
				
			}
		});
	});
<c:forEach var="c" begin="1" end="3"> 
	$("#profile${c}").change(function(){
	    if(this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#divview${c}').show();
	        	$('#imgdel${c}').show();
	            $('#divview${c}').html("<img src="+ e.target.result +" style='width:100%; height:100%;'>"); 
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
		$.ajax({
			url: "ucheckid.do",
			type: "post",
			data: {userid : $("#uid${c}").val()},
			dataType: "text",
			success: function(response){
				if($('#uid${c}').val() !=""){
				if(response == "success"){
				$('#idfail${c}').hide();
				$('#idsuc${c}').show();
				}else{
				$('#idsuc${c}').hide();
				$('#idfail${c}').show().html("이미 사용중이거나 탈퇴한 아이디입니다.");
				}}else{
					$('#idfail${c}').show().html("아이디를 입력하세요");
					$('#idsuc${c}').hide();
				}
				
				
			},
			error: function(){
				
			}
		});
	});
	
	$('#repwd${c}').change(function(){
		if($('#repwd${c}').val() != ""){
		if($('#pwd${c}').val() == $('#repwd${c}').val()){
			$('#repwdsuc${c}').show();
			$('#repwdfail${c}').hide();
		}else{
			$('#repwdsuc${c}').hide();
			$('#repwdfail${c}').show().html("비밀번호가 일치하지않습니다.");
		}}else{
			$('#repwdsuc${c}').hide();
			$('#repwdfail${c}').show().html("입력해주세요.");
		}
	});
</c:forEach>


<c:if test="${!empty message}">
$(function(){$("#alertdiv").show();});
</c:if>



});

</script>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
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
	border-radius: 5px !important;
}

.btn-lgreen:hover {
	opacity: 0.9 !important;
	color: white !important;
}

.btn-bgray {
	background: #eee !important;
	color: #999 !important;
	font-size: 17px !important;
	font-weight: 600 !important;
	border-radius: 5px !important;
	height: 40px;
}

.btn-bgray:hover {
	opacity: 0.7 !important;
	color: #bbb !important;
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

.unav i {
	font-size: 18px !important;
}

.unav span {
	font-size: 16px !important;
}

.unav {
	color: #bbb !important;
}

.unav:hover {
	color: #888 !important;
}

.umt {
	font-weight: bold !important;
}

.alert-white {
	background: white !important;
	color: black !important;
	display: fixed !important;
	z-index: 5 !important;
	width: 300px !important;
	margin: 0 auto !important;
}

#userback {
	position: absolute !important;
	width: 100%;
	height: 100% !important;
	backface-visibility: hidden !important;
	z-index: 0 !important;
	transform: rotateY(180deg) !important;
}

#loginfront {
	width: 380px;
	background: white !important;
	z-index: 1 !important;
	position: absolute !important;
	backface-visibility: hidden !important;
}

.ubsc {
	background: #777 !important;
}

.ubsc:hover {
	background: #777 !important;
	opacity: 0.9 !important;
}

.maindiv:hover {
	color: white;
	text-decoration: none;
}

.imageview {
	width: 100px;
	height: 100px;
	display: none;
}

.ualert {
	position: absolute;
	z-index: 3;
	margin: auto auto;
	width: 300px;
	box-shadow: 1px 1px 4px 2px #ddd;
	display:none;
}
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<!-- 아이디 찾기 모달 -->
 <div class="modal fade" id="findId"><div class="modal-dialog" ><div class="modal-content">
        <div class="modal-header border-0"><h5 class="modal-title umt">아이디 찾기</h5><button type="button" class="close" data-dismiss="modal">&times;</button> </div>
        <div class="modal-body"><ul class="nav nav-tabs">
 		   <li class="nav-item"><a class="nav-link unav active" data-toggle="tab" href="#emailId"><i class="far fa-envelope"></i> <span>이메일</span></a></li>
 		   <li class="nav-item"><a class="nav-link unav" data-toggle="tab" href="#phoneId"><i class="fas fa-phone"></i> <span>전화번호</span></a></li></ul>
 		   <div class="tab-content">
    			<div id="emailId" class="container tab-pane active"><br>
    				<div class="form-group d-flex"><input type="text" class="form-control ucon" placeholder="이름" style="width: calc(100% - 80px);"></div>
    				<div class="form-group"><span class="d-flex"><input type="email" class="form-control ucon" placeholder="이메일"><button class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></span></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호" style="width: calc(100% - 80px);"></div></div>
    			<div id="phoneId" class="container tab-pane fade"><br>
    				<div class="form-group d-flex"><input type="text" class="form-control ucon" placeholder="이름"  style="width: calc(100% - 80px);"></div>
    				<div class="form-group d-flex" ><span class="d-flex" style="width: calc(100% - 80px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호"  style="width: calc(100% - 80px);"></div></div></div></div>
        <div class="modal-footer border-0"><button class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
</div></div>
<div class="alert alert-white fade show"><button type="button" class="close" data-dismiss="alert">&times;</button>아이디는 <b>abcd</b>입니다.</div>
</div>

<!-- 비밀번호 찾기 모달 -->
 <div class="modal fade" id="findPwd"><div class="modal-dialog"><div class="modal-content">
        <div class="modal-header border-0"><h5 class="modal-title umt">비밀번호 찾기</h5><button type="button" class="close" data-dismiss="modal">&times;</button> </div>
        <div class="modal-body"><ul class="nav nav-tabs">
 		   <li class="nav-item"><a class="nav-link unav active" data-toggle="tab" href="#emailPwd"><i class="far fa-envelope"></i> <span>이메일</span></a></li>
 		   <li class="nav-item"> <a class="nav-link unav" data-toggle="tab" href="#phonePwd"><i class="fas fa-phone"></i> <span>전화번호</span></a></li></ul>
 		   <div class="tab-content">
    			<div id="emailPwd" class="container tab-pane active"><br>
					<div class="form-group d-flex"><input type="text" class="form-control ucon" placeholder="아이디" style="width: calc(100% - 80px);"></div>
    				<div class="form-group"><span class="d-flex"><input type="email" class="form-control ucon" placeholder="이메일"><button class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></span></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호" style="width: calc(100% - 80px);"></div></div>
    			<div id="phonePwd" class="container tab-pane fade"><br>
					<div class="form-group d-flex"><input type="text" class="form-control ucon" placeholder="아이디"  style="width: calc(100% - 80px);"></div>
    				<div class="form-group d-flex" ><span class="d-flex" style="width: calc(100% - 80px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호"  style="width: calc(100% - 80px);"></div></div></div></div>
        <div class="modal-footer border-0"><button class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
</div></div></div>

<div class="container">
<div class="row">
	<div class="col-12" style="perspective: 2000px;">

<!-- 로그인 및 회원가입 -->
		<div class="d-flex justify-content-center" id="turn" style="margin-top:10%; transition: transform 1s; transform-style: preserve-3d;">
		<div class="col-12 back" id="userback" style="width:500px;">

<!-- 회원가입 -->

			 <div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-home" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 회원가입</span>
			 						<button class="btn btn-gray float-right mt-1 returnlogin"><i class="fas fa-exchange-alt"> 로그인</i></button></div><div><ul class="nav nav-tabs ml-auto">
   			<li class="nav-item"><a class="nav-link unav active widthreset" data-toggle="tab"  href="#user"><i class="fas fa-user"></i> <span>일반회원</span></a></li>
   			<li class="nav-item"><a class="nav-link unav widthreset" data-toggle="tab" href="#seller"><i class="fas fa-home"></i> <span>매도인</span></a></li>
    		<li class="nav-item"><a class="nav-link unav widthchange" data-toggle="tab" href="#realtor"><i class="fas fa-user-tie"></i> <span>공인중개사</span></a></li></ul></div>
        <div class="tab-content" id="accountheight">
    		<div id="user" class="container tab-pane active" style="padding-bottom:10%;"><br><form class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="일반회원">
    			<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview1"></div><span class="d-flex"><label for="profile1" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile1" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel1" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid1" class="form-control ucon" name="user_id" required><div id="idsuc1" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail1" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" name="nickname" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>성명</label><input type="text" class="form-control ucon" name="user_name" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext1" name="email" class="form-control ucon" required><div class="input-group-append"><button type="button" id="emailbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
					<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" name="phone2" class="form-control ucon mr-2" required><input type="number" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" id="pwd1" name="password" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd1" class="form-control ucon" required><div id="repwdsuc1" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail1" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="sbcheck1" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck1">선방서비스 이용약관동의(필수)</label></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="usecheck1" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck1">개인정보수집 및 이용에대한동의(필수)</label></div>
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></form></div>
				 
    		<div id="seller" class="container tab-pane fade" style="padding-bottom:10%;"><br><form class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="매도인">
    			<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview2"></div><span class="d-flex"><label for="profile2" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile2" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel2" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid2" name="user_id" class="form-control ucon" required><div id="idsuc2" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail2" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" name="nickname" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>성명</label><input type="text" name="user_name" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext2" name="email" class="form-control ucon" required><div class="input-group-append"><button type="button" id="emailbtn2" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" name="phone2" class="form-control ucon mr-2" required><input type="number" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" id="pwd2" name="password" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd2" class="form-control ucon" required><div id="repwdsuc2" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail2" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="sbcheck2" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck2">선방서비스 이용약관동의(필수)</label></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="usecheck2" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck2">개인정보수집 및 이용에대한동의(필수)</label></div>
				<div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></form></div>
				
    		<div id="realtor" class="container tab-pane fade" style="padding-bottom:10%;"><br><form class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="공인중개사"><div class="row"><div class="col-lg-6">
				<div class="form-group"><label>중개사무소명</label><select class="form-control ucon" name="office_name" required>
																						<option>어디</option>
					</select><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>중개등록번호</label><input type="text" name="office_regist_no" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>사업자 등록번호</label><div class="input-group"><input type="number" class="form-control ucon mr-2" required><input type="number" class="form-control ucon mr-2" required><input type="number" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>중개사무소 주소</label><input type="text" name="office_address"class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>중개사 대표자명</label><input type="text" name="user_name" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>대표 전화번호</label><div class="input-group"><select class="form-control ucon mr-2" required></select><input type="number" class="form-control ucon mr-2" required><input type="number" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div></div><div class="col-lg-6">
				<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview3"></div><span class="d-flex"><label for="profile3" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile3" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel3" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid3" class="form-control ucon" required><div id="idsuc3" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail3" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext3" name="email" class="form-control ucon" required><div class="input-group-append"><button type="button" id="emailbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
					<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" name="phone2" class="form-control ucon mr-2" required><input type="number" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></div><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" id="pwd3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd3" class="form-control ucon" required><div id="repwdsuc3" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail3" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div></div>
				<div class="col-lg-6 col-12 custom-control custom-checkbox mb-2" style="font-size:13px; padding-left: 40px;"><input id="sbcheck3" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck3">선방서비스 이용약관동의(필수)</label></div>
				<div class="col-lg-6 col-12 custom-control custom-checkbox mb-2" style="font-size:13px; padding-left: 40px;"><input id="usecheck3" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck3">개인정보수집 및 이용에대한동의(필수)</label></div><div class="col-lg-12">
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></div></div></form></div></div></div>
				 
<!-- 로그인 -->
		<div class="col-12" id="loginfront">
			<div class="mb-5 d-flex justify-content-around"><a class="maindiv" href="realtymain.do"><div style="width:100px; height:100px; border-radius:5px; background:#61C0BF; color:white; text-align:center;"><b style="line-height:100px;">부동산</b></div></a>
																			<a class="maindiv" href="interiormain.do"><div style="width:100px; height:100px; border-radius:5px; background:#FFB6B9; color:white; text-align:center;"><b style="line-height:100px;">인테리어</b></div></a></div>
			<div class="mb-3" align="center"><span class="font-weight-bold fa-2x"><i class="fas fa-home" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 선방</span></div>
			<form id="loginform"><div class="form-group"><input type="text" id="loginid" class="form-control ucon form-control ucon-lg" name="user_id" placeholder="아이디" style="border-bottom:0;"><input type="password" id="loginpwd" class="form-control ucon form-control ucon-lg" name="password" placeholder="비밀번호"></div>
			<div id="loginfailbar" class="form-group" style="display:none; font-size:14px; padding: 0 5%; color:red">아이디가 틀렸습니다</div>
			<div class="form-group"><input type="button" id="loginbtn" class="btn btn-block btn-lg btn-green" value="로그인"></div>
			<div style="font-size: 13px;"><input type="checkbox" name="logincheck"> 로그인 상태 유지</div></form>
			<div class="d-flex justify-content-between mb-3 mt-3" style="border-top:1px solid #ddd; padding-top:5%;">
				<div class="btn btn-lgreen" data-toggle="modal" data-target="#findId">아이디 찾기</div>
				<div class="btn btn-lgreen ml-2 mr-2"  data-toggle="modal" data-target="#findPwd">비밀번호 찾기</div>
				<div class="btn btn-lgreen"  id="accountpage" >회원가입</div></div></div>
		</div></div>
<div id="alertdiv" class="alert alert-success ualert"><button type="button" class="close" data-dismiss="alert">&times;</button><h4 class="alert-heading" style="font-weight:600;">회원가입 성공!</h4>${message}</div></div>
</div>
<div id="turnfooter" style="margin-top:700px;"><c:import url="../common/footer.jsp" /></div>
</body>
</html>