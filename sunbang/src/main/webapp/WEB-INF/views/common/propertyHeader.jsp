<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
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
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#js_pheader_body {
	font-family: a고딕11;
}

#js_pheader_tab1 a {
	margin-top: 2.5px;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

#js_pheader_tab2 a {
	margin-top: 2.5px;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

#js_pheader_tab1 a:hover {
	color: #4cb5b4;
}

#js_pheader_tab2 a:hover {
	color: #ffb6b9;
}

#js_pheader_logo a {
	margin-left: 10px;
	margin-right: 0px;
	color: #4cb5b4;
	font-family: a고딕18;
	font-size: 24px;
}

#js_pheader_logo span {
	color: #343a40;
}
@media (min-width: 992px){
.navbar-expand-lg .navbar-nav .dropdown-menu {
    position: absolute;
    top: 65px;

}}

#js_pheader_dropdown a{
	padding-top:12px;
	padding-bottom:12px;
}

#navbarSupportedContent a{
	color:#6c757d;
}

</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="min-height: 80px; border-bottom: 1px solid lightgray;">
		<div class="row">
			<div class="col" id="js_pheader_logo">
				<a class="navbar-brand" href="/sunbang/index.jsp"><i
					class="fas fa-home"></i>&nbsp;<span>선방</span></a>
			</div>
			<div class="col" style="min-width: 200px;">
				<div class="row">
					<div class="nav-item" id="js_pheader_tab1">
						<a class="nav-link" href="/sunbang/views/main/propertyMain.jsp">부동산
							<span class="sr-only">(current)</span>
						</a>
					</div>
					<div class="nav-item" id="js_pheader_tab2">
						<a class="nav-link" href="/sunbang/views/guide/interiorGuideList.jsp">인테리어</a>
					</div>
				</div>
			</div>
		</div>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarSupportedContent"
			aria-controls="navbarSupportedContent" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>

		<div class="collapse navbar-collapse" id="navbarSupportedContent">
			<hr class="clearfix w-100 d-md-none">
			<ul class="navbar-nav mr-auto"
				style="margin: 0 auto; margin-right: 0 !important;">
				<li class="nav-item"><a class="nav-link" href="#">집찾기</a></li>
				<li class="nav-item"><a class="nav-link" href="#">집내놓기</a></li>
				<li class="nav-item"><a class="nav-link" href="/sunbang/views/guide/propertyGuideList.jsp">부동산가이드</a></li>
				<li class="nav-item"><a class="nav-link" href="/sunbang/views/admin/premiumPayment.jsp">프리미엄&nbsp;&nbsp;</a></li>
				<li class="nav-item" id="js_pheader_user">
				<c:if test="true">
					<a class="nav-link dropdown-toggle" id="navbarDropdownMenuLink-333" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"> 
						<i class="fas fa-user"></i>&nbsp;관리자
					</a>
					<div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink-333" id="js_pheader_dropdown">
						<c:if test="false"> <!-- 일반회원 -->
							<a class="dropdown-item" href="#"><i class="fas fa-user-edit"></i> 내 정보 수정</a>
							<a class="dropdown-item" href="#"><i class="far fa-check-circle"></i> 찜보기</a> 
							<a class="dropdown-item" href="#"><i class="far fa-heart"></i> 좋아요</a>
							<a class="dropdown-item" href="#"><i class="far fa-comments"></i> 1:1 상담내역</a>
						</c:if>
						<c:if test="false"> <!-- 기업회원 -->
							<a class="dropdown-item" href="#"><i class="fas fa-user-edit"></i> 내 정보 수정</a> 
							<a class="dropdown-item" href="#"><i class="far fa-check-circle"></i> 찜보기</a> 
							<a class="dropdown-item" href="#"><i class="far fa-heart"></i> 좋아요</a>
							<a class="dropdown-item" href="#"><i class="far fa-comments"></i> 1:1 상담내역</a>
							<a class="dropdown-item" href="#"><i class="far fa-copy"></i> 등록 매물 관리</a>
							<a class="dropdown-item" href="#"><i class="fas fa-award"></i> 프리미엄 서비스</a>
						</c:if>
						<c:if test="true"> <!-- 관리자 -->
							<a class="dropdown-item" href="/sunbang/views/admin/adminPage.jsp"><i class="fas fa-user-edit"></i> 관리자 페이지</a>
						</c:if>
					</div>
					</c:if> <c:if test="loginUser == null">
						<a class="nav-link" href="#"> 회원가입 · 로그인&nbsp;</a>
					</c:if>
				</li>
			</ul>
		</div>
	</nav>
</body>
</html>