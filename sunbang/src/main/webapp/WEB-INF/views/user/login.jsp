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
#userback{
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
.ubsc{
	background: #777 !important;
}
.ubsc:hover{
	background: #777 !important;
	opacity:0.9 !important;
}
.maindiv:hover{
	color:white;
	text-decoration:none;
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
    		<div id="user" class="container tab-pane active" style="padding-bottom:10%;"><br>
    			<div class="form-group"><label>프로필</label><button class="btn btn-block btn-light">이미지 업로드</button></div>
				<div class="form-group"><label>아이디</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>성명</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>이메일</label><span class="d-flex"><input type="email" class="form-control ucon" style="width:calc(100% - 90px);"><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>휴대폰번호</label><span class="d-flex"><span  class="d-flex" style="width:calc(100% - 90px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div>
				<div class="form-group" style="font-size:13px"><input type="checkbox"> 선방서비스 이용약관동의(필수)</div>
				<div class="form-group" style="font-size:13px"><input type="checkbox"> 개인정보수집 및 이용에대한동의(필수)</div>
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></div>
    		<div id="seller" class="container tab-pane fade" style="padding-bottom:10%;"><br>
    			<div class="form-group"><label>프로필</label><button class="btn btn-block btn-light">이미지 업로드</button></div>
				<div class="form-group"><label>아이디</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>성명</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>이메일</label><span class="d-flex"><input type="email" class="form-control ucon" style="width:calc(100% - 90px);"><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>휴대폰번호</label><span class="d-flex"><span  class="d-flex" style="width:calc(100% - 90px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div>
				<div class="form-group" style="font-size:13px"><input type="checkbox"> 선방서비스 이용약관동의(필수)</div>
				<div class="form-group" style="font-size:13px"><input type="checkbox"> 개인정보수집 및 이용에대한동의(필수)</div>
				<div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></div>
    		<div id="realtor" class="container tab-pane fade" style="padding-bottom:10%;"><br><div class="row"><div class="col-lg-6">
				<div class="form-group"><label>중개사무소명</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>중개등록번호</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>사업자 등록번호</label><span class="d-flex"><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span></div>
				<div class="form-group"><label>중개사무소 주소</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>중개사 대표자명</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>대표 전화번호</label><span class="d-flex"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span></div></div><div class="col-lg-6">
				<div class="form-group"><label>프로필</label><button class="btn btn-block btn-light">이미지 업로드</button></div>
				<div class="form-group"><label>아이디</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>성명</label><input type="text" class="form-control ucon"></div>
				<div class="form-group"><label>이메일</label><span class="d-flex"><input type="email" class="form-control ucon" style="width:calc(100% - 90px);"><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>휴대폰번호</label><span class="d-flex"><span  class="d-flex" style="width:calc(100% - 90px);"><select class="form-control ucon mr-2"></select><input type="number" class="form-control ucon mr-2"><input type="number" class="form-control ucon"></span><button class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button></span></div>
				<div class="form-group"><label>비밀번호<small>(보안등급: 높음)</small></label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" class="form-control ucon"></div>
				<div class="form-group"><div class="card"><div class="card-body">자동가입방지</div></div></div></div>
				<div class="col-lg-6 col-12 mb-2" style="font-size:13px"><input type="checkbox"> 선방서비스 이용약관동의(필수)</div>
				<div class="col-lg-6 col-12 mb-2" style="font-size:13px"><input type="checkbox"> 개인정보수집 및 이용에대한동의(필수)</div><div class="col-lg-12">
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></div></div></div></div></div>
				 
<!-- 로그인 -->
		<div class="col-12" id="loginfront">
			<div class="mb-5 d-flex justify-content-around"><a class="maindiv" href="realtymain.do"><div style="width:100px; height:100px; border-radius:5px; background:#61C0BF; color:white; text-align:center;"><b style="line-height:100px;">부동산</b></div></a>
																			<a class="maindiv" href="interiorMain.do"><div style="width:100px; height:100px; border-radius:5px; background:#FFB6B9; color:white; text-align:center;"><b style="line-height:100px;">인테리어</b></div></a></div>
			<div class="mb-3" align="center"><span class="font-weight-bold fa-2x"><i class="fas fa-home" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 선방</span></div>
			<form action="ulogin.do" method="post"><div class="form-group"><input type="text" class="form-control ucon form-control ucon-lg" name="user_id" placeholder="아이디" style="border-bottom:0;"><input type="password" class="form-control ucon form-control ucon-lg" name="password" placeholder="비밀번호"></div>
			<div class="form-group"><input type="submit" class="btn btn-block btn-lg btn-green" value="로그인"></div>
			<div style="font-size: 13px;"><input type="checkbox" > 로그인 상태 유지</div></form>
			<div class="d-flex justify-content-between mb-3 mt-3" style="border-top:1px solid #ddd; padding-top:5%;">
				<div class="btn btn-lgreen" data-toggle="modal" data-target="#findId">아이디 찾기</div>
				<div class="btn btn-lgreen ml-2 mr-2"  data-toggle="modal" data-target="#findPwd">비밀번호 찾기</div>
				<div class="btn btn-lgreen"  id="accountpage" >회원가입</div></div></div>
		</div></div>
</div>
</div>
<div id="turnfooter" style="margin-top:700px;"><c:import url="../common/footer.jsp" /></div>
</body>
</html>