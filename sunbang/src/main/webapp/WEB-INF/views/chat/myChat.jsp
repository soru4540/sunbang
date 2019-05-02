<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>선방</title>
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
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
	integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr"
	crossorigin="anonymous">
<script>
$(function(){
		$("#everyroom").click(function(){
			$("#everyrooms").slideDown(200);
			$("#onerooms").slideUp(200);
		});
	$("#oneroom").click(function(){
		$("#onerooms").slideDown(200);
		$("#everyrooms").slideUp(200);
	});
});
</script>
<style>
/* div{
border: 1px solid black;
} */
.Lballon{
width:70%;
height: 30px;
padding:2%;
border-radius: 0 5px 5px 5px;
background: rgb(250, 250, 250);
border: 1px solid #ddd;
margin-left:10%;

}

</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<div class="container-fluid"><div class="row"><div class="col-lg-1"></div><div class="col-12 col-lg-10" style="padding-bottom:10%;">
	<div class="row" style="margin-top: 10%; background:rgb(253, 253, 253);"><div class="d-flex flex-wrap">
	<div class="col-xl-3 mt-5" style="height: 600px;"><div style="height:100%;">
		<div class="col-md-12 card bg-light text-dark" id="everyroom">단체 채팅방</div>
		<div class="col-md-12 card" id="everyrooms" style="height:90%;"></div>
		<div class="col-md-12 card bg-light text-dark" id="oneroom">개인 채팅방</div>
		<div class="col-md-12 card" id="onerooms" style="height:90%; display:none;"></div></div></div>
	<div class="col-xl-5 mt-5" style="height: 600px; overflow:hidden; padding-bottom:2%;">
		<div class="row" style="height:75%; overflow:auto;"><div class="col-md-12"><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><!--  --><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div><div style="width:100%; padding:2%; margin-top:3%; height:auto;">아이디<div class="Lballon">ㅇㅇ</div></div>
			</div></div>
		<div class="row" style="height:15%;"><div class="col-md-12"><textarea class="form-control" style="height:100%; width:100%; resize:none;"></textarea></div></div>
		<div class="row" style="height:10%;"><div class="col-md-12" style=" padding: 3%;">
			<label class="btn btn-outline-success" for="chatfile">파일</label><input type="file" id="chatfile"class="btn" value="파일" style="display:none;">
			<label class="btn btn-outline-success " for="chatimage">이미지</label><input type="file" id="chatimage" class="btn" value="사진" style="display:none;">
			<input type="submit" class="btn btn-success" value="등록" style="float:right;"></div></div></div>
	<div class="col-xl-4 mt-5" style="height: 600px;">
		<div class="row" style="width:96%; height:100%;"><div class="col-md-12 card" style="margin-left:7%;"><div class="card-img-top" style="height:60%;"><img src="bodyback.jpg" style="width:100%; height:100%;"></div><div class="card-body" style="height:40%;">내용</div></div></div></div>
	</div></div></div><div class="col-lg-1"></div>
</div></div>

<c:import url="../common/footer.jsp" />
</body>
</html>