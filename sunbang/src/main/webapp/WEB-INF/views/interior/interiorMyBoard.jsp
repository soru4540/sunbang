<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>내 게시물</title>
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
<link rel='stylesheet'
	href='https://use.fontawesome.com/releases/v5.7.0/css/all.css'
	integrity='sha384-lZN37f5QGtY3VHgisS14W3ExzMWZxybE1SJSEsQp9S+oqd12jhcu+A56Ebc1zFSJ'
	crossorigin='anonymous'>
<style type="text/css">
.fix_con {
	position: fixed;
	width: 14%;
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

.di {
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

#photoBox {
	background-color: #fafafa;
	width: 100%;
	height: 50%;
	text-align: center;
	position: relative;
}

#box {
	position: relative;
	top: 50%;
	left: 12%;
	transform: translate(-50%, -50%);
	border: 1px solid gray;
	background-color: white;
	padding: 2rem;
}
</style>

</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<br>
	<!-- 헤더 -->
	<br>
	<br>
	<br>
	<div class="container" style="height: 780px;">
		<!-- 사진 -->
		<div class="row">
			<div class="col-sm-3">
				<div class="fix_con" style="text-align:center;">
					<div class="myprofile">
						<img src="${pageContext.request.contextPath }/files/user/userImages/${photoList[0].user_profile }">
					</div>
					<br>
					<c:if test="${empty loginUser}">
						<a href="#" class="font-weight-bold"></a>
					</c:if>
					<c:if test="${!empty loginUser}">
						<a href="#" class="font-weight-bold">닉네임</a>
					</c:if>
					<br>
					<a href="#"><span style="font-family: a고딕14; opacity: 0.5;">팔로우
							: 78 팔로잉 : 17</span></a><br> <br>
					<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우!</p>
				</div>
			</div>
			<div class="col-sm-9" id="BoardAllList">
				<p style="font-family: a고딕17; font-size: 20px;">사진 (0)</p>
				<div class="row" id="photoBox">
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
				</div>
				<br>
				<p style="font-family: a고딕17; font-size: 20px;">집들이 (0)</p>
				<div class="row" id="photoBox">
					<div class="col" id="box">
					</div>
					&nbsp;&nbsp;
					<div class="col" id="box">
					</div>
					&nbsp;&nbsp;
					<div class="col" id="box">
					</div>
					&nbsp;&nbsp;
					<div class="col" id="box">
					</div>
				</div>
				<br>
				<p style="font-family: a고딕17; font-size: 20px;">노하우 (0)</p>
				<div class="row" id="photoBox">
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
					&nbsp;&nbsp;
					<div class="col" id="box"></div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>