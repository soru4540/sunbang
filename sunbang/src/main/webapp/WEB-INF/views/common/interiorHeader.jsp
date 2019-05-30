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
<script type="text/javascript">
 function searchInterior(){	
	 if($("#searchkeyword").val()!=""){
	 location.href="isearch.do?keyword="+$("#searchkeyword").val();
	 }else{
		 alert("검색 키워드를 입력해주세요!");
	 }
 }
</script>
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
						<a class="nav-link" href="realtymain.do">부동산 <span
							class="sr-only">(current)</span>
						</a>
					</div>
					<div class="nav-item" id="js_pheader_tab2">
						<a class="nav-link" href="interiormain.do">인테리어</a>
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
							<input class="search_input" type="text" id="searchkeyword"
								placeholder="Search..."> <a class="search_icon" onclick="searchInterior();"><i
								class="fas fa-search"></i></a>
						</div>
					</div>
				</li>&nbsp;&nbsp;
				<c:if test="${!empty loginUser}">
				<li class="nav-item"><a class="nav-link"
					href="inewsfeed.do?user_no=${loginUser.user_no}">뉴스피드</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iwritepage.do">글쓰기</a></li>
				</c:if>
				<li class="nav-item"><a class="nav-link"
					href="iblistselect.do?board_type=photograph">사진</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iblistselect.do?board_type=housewarming">집들이</a></li>
				<li class="nav-item"><a class="nav-link"
					href="iblistselect.do?board_type=knowhow">노하우</a></li>
				<li class="nav-item"><a class="nav-link" href="aglistselect.do?guide_system=interior">가이드&nbsp;&nbsp;</a></li>
				<li class="nav-item" id="js_pheader_user"><c:if test="${!empty loginUser}">
						<a class="nav-link dropdown-toggle"
							id="navbarDropdownMenuLink-333" data-toggle="dropdown"
							aria-haspopup="true" aria-expanded="false" style="cursor:pointer;">
							<c:if test="${loginUser.premium_status == 'Y' }"><span style="font-weight:600; background: #61C0BF; color:white; border-radius:50%; padding: 0 6px;">P</span></c:if>
							<c:if test="${!empty loginUser.user_profile }"><img src="files/user/userImages/${loginUser.user_profile }" class="rounded-circle"  style="width:30px; height:30px; border:1px solid #eee;"></c:if> 
							<c:if test="${empty loginUser.user_profile }"><i class="fas fa-user"></i></c:if>
							&nbsp;${loginUser.nickname }
						</a>
						<div class="dropdown-menu dropdown-menu-right dropdown-default" aria-labelledby="navbarDropdownMenuLink-333" id="js_pheader_dropdown">
						<c:if test="${loginUser.user_type eq '일반회원' }"> <!-- 일반회원 -->
							<a class="dropdown-item" href="umyuserview.do?business_user_no=${loginUser.business_user_no }"><i class="fas fa-user-edit"></i> 내 정보 수정</a>
							<a class="dropdown-item" href="imyboard.do?user_no=${loginUser.user_no }"><i class="fas fa-book"></i> 나의 게시글</a>
							<a class="dropdown-item" href="umydibs.do?user_no=${loginUser.user_no }"><i class="far fa-check-circle"></i> 찜보기</a> 
							<a class="dropdown-item" href="umylike.do?user_no=${loginUser.user_no }"><i class="far fa-heart"></i> 좋아요</a>
							<a class="dropdown-item" href="cmyview.do"><i class="far fa-comments"></i> 채팅</a>
							<a class="dropdown-item" href="ulogout.do?uri=2"> 로그아웃</a>
						</c:if>
						<c:if test="${loginUser.user_type eq '매도인' or loginUser.user_type eq '공인중개사' }"> <!-- 기업회원 -->
							<a class="dropdown-item" href="umyuserview.do?business_user_no=${loginUser.business_user_no }"><i class="fas fa-user-edit"></i> 내 정보 수정</a>
							<a class="dropdown-item" href="imyboard.do?user_no=${loginUser.user_no }"><i class="fas fa-book"></i> 나의 게시글</a> 
							<a class="dropdown-item" href="umydibs.do?user_no=${loginUser.user_no }"><i class="far fa-check-circle"></i> 찜보기</a> 
							<a class="dropdown-item" href="umylike.do?user_no=${loginUser.user_no }"><i class="far fa-heart"></i> 좋아요</a>
							<a class="dropdown-item" href="cmyview.do"><i class="far fa-comments"></i> 채팅</a>
							<a class="dropdown-item" href="rmylist.do?user_no=${loginUser.user_no }"><i class="far fa-copy"></i> 등록 매물 관리</a>							
							<a class="dropdown-item" href="ulogout.do?uri=2"> 로그아웃</a>
						</c:if>
						<c:if test="${loginUser.user_no == 0 }"> <!-- 관리자 -->
							<a class="dropdown-item" href="auhlistselect.do"><i class="fas fa-user-edit"></i> 관리자 페이지</a>
							<a class="dropdown-item" href="ulogout.do?uri=2"> 로그아웃</a>
						</c:if>
					</div>
					</c:if> <c:if test="${empty loginUser}">
						<c:url var="loginview" value="uloginview.do"><c:param name="pageuri" value="${requestScope['javax.servlet.forward.servlet_path']}?${requestScope['javax.servlet.forward.query_string']}" /></c:url>
						<a class="nav-link" href="${loginview }"> 회원가입 · 로그인&nbsp;</a>
					</c:if></li>

			</ul>
		</div>
	</nav>
</body>
</html>