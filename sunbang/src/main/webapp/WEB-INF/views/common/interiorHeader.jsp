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
	color: #ff9198;
}

#js_pheader_logo a {
	margin-left: 10px;
	margin-right: 0px;
	color: #ffb6b9;
	font-family: a고딕18;
	font-size: 24px;
}

#js_pheader_logo span {
	color: #343a40;
}

@media ( min-width : 992px) {
	.navbar-expand-lg .navbar-nav .dropdown-menu {
		position: absolute;
		top: 65px;
	}
}

#js_pheader_dropdown a {
	padding-top: 12px;
	padding-bottom: 12px;
}

#navbarSupportedContent a {
	color: #6c757d;
}

#jb_iheader_search .searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 45px;
	background-color: #ffb6b9;
	border-radius: 30px;
	padding: 10px;
}

#jb_iheader_search .search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 25px;
	transition: width 0.4s linear;
}

#jb_iheader_search .searchbar:hover>.search_input {
	padding: 0 10px;
	width: 180px;
	transition: width 0.4s linear;
}

#jb_iheader_search .searchbar:hover>.search_icon {
	background: white;
	color: #ffb6b9;
}

#jb_iheader_search .search_icon {
	height: 25px;
	width: 25px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
}
</style>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light"
		style="min-height: 80px; border-bottom: 1px solid lightgray;">
		<div class="row">
			<div class="col" id="js_pheader_logo">
				<a class="navbar-brand" href="${pageContext.request.contextPath}/index.jsp"><i
					class="fas fa-paint-roller" style="transform: rotate(-30deg);"></i>&nbsp;<span>선방</span></a>
			</div>
			<div class="col" style="min-width: 200px;">
				<div class="row">
					<div class="nav-item" id="js_pheader_tab1">
						<a class="nav-link" href="propertymain.do">부동산 <span
							class="sr-only">(current)</span>
						</a>
					</div>
					<div class="nav-item" id="js_pheader_tab2">
						<a class="nav-link" href="interiorMain.do">인테리어</a>
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
				<li class="nav-item" id="jb_iheader_search">
					<div class="d-flex h-100" align="left">
						<div class="searchbar">
							<input class="search_input" type="text" name=""
								placeholder="Search..."> <a href="#" class="search_icon"><i
								class="fas fa-search"></i></a>
						</div>
					</div>
				</li>
				<li class="nav-item"><a class="nav-link"
					href="istoryview.do">뉴스피드</a></li>
				<li class="nav-item"><a class="nav-link"
					href="#">글쓰기</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iboardlist.do?board_type=photograph">사진</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iboardlist.do?board_type=housewarming">집들이</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iboardlist.do?board_type=knowhow">노하우</a></li>
				<li class="nav-item"><a class="nav-link" href="#">가이드&nbsp;&nbsp;</a></li>
				<li class="nav-item" id="js_pheader_user"><c:if test="true">
						<a class="nav-link dropdown-toggle"
							id="navbarDropdownMenuLink-333" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false"> <i
							class="fas fa-user"></i>&nbsp;USER
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-default"
							aria-labelledby="navbarDropdownMenuLink-333"
							id="js_pheader_dropdown">
							<a class="dropdown-item" href="#"><i class="fas fa-user-edit"></i>
								내 정보 수정</a> <a class="dropdown-item" href="#"><i
								class="far fa-check-circle"></i> 찜보기</a> <a class="dropdown-item"
								href="#"><i class="far fa-heart"></i> 좋아요</a> <a
								class="dropdown-item" href="#"><i class="far fa-comments"></i>
								1:1 상담내역</a> <a class="dropdown-item" href="#"><i
								class="far fa-copy"></i> 등록 매물 관리</a> <a class="dropdown-item"
								href="#"><i class="fas fa-award"></i> 프리미엄 서비스</a>
						</div>
					</c:if> <c:if test="loginUser == null">
						<a class="nav-link" href="#"> 회원가입 · 로그인&nbsp;</a>
					</c:if></li>

			</ul>
		</div>
	</nav>
</body>
</html>