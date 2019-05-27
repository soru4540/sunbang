<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var cate = sessionStorage.getItem("category");
		if (cate != null) {
			$("#js_pguide_p3").text("");
			$("#js_pguide_p3").text(cate);
		} else {
			$("#js_pguide_p3").text("");
			$("#js_pguide_p3").text("전체보기");
		}
	})
	function ahref(data) {
		var category = data;
		sessionStorage.setItem("category", category);
		if (category == "전체보기") {
			location.href = 'aglistselect.do?guide_system=realty';
		} else {
			location.href = 'agclselect.do?guide_system=realty&category='
					+ category;
		}
	}
</script>
<style type="text/css">
#js_pguide_con {
	min-height: 960px;
}

#js_pguide_info {
	margin-top: 60px;
	min-height: 280px;
	border: 1px solid lightgray;
	border-bottom: 0px;
	margin-left: -14px;
	margin-right: -14px;
}

#js_pguide_info .col {
	text-align: center;
	height: 100%;
	margin: 0 auto;
	margin-top: 40px;
}

#js_pguide_p1 {
	color: #343a40;
	margin-top: 40px;
	font-family: a고딕16;
	font-size: 35px;
}

#js_pguide_p2, #js_pguide_p3 {
	color: #343a40;
	margin-top: 40px;
	font-family: a고딕15;
	font-size: 22px;
}

#js_pguide_icon {
	font-family: a고딕15;
	font-size: 16px;
	text-align: center;
	background: #bbded6;
	min-height: 50px;
	border: 1px solid white;
	white-space: nowrap;
	padding: 17px;
}

#js_pguide_icon a {
	color: #343a40;
	text-decoration: none;
}

#js_pguide_cardList {
	margin-bottom: 50px;
}

@media screen and (max-width:1200px) {
	#js_pguide_cardList .card {
		margin: 0 auto;
		max-width: 360px;
		margin-bottom: 15px;
	}
}

@media screen and (min-width:1201px) {
	#js_pguide_cardList .card {
		margin: 10px;
		max-width: 360px;
		margin-bottom: 15px;
	}
}

#js_pguide_cardList .card-body {
	max-height: 240px;
	font-family: a고딕15;
}

#js_pguide_cardList .card-img-top {
	min-height: 240px;
}

#js_pguide_cardList .card-title {
	font-size: 18px;
}

#js_pguide_iconList {
	min-height: 60px;
}

#js_pguide_btn {
	background-color: #bbded6;
	border: 0;
	color: #343a40;
	font-size: 13px;
}

.card-title {
	min-height: 50px;
}

#js_pguide_cardimg {
	height: 240px;
	min-width: 360px;
	overflow: hidden;
}

#js_pguide_cardimg img {
	height: auto;
}
</style>
</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<div class="container" id="js_pguide_con">
		<div class="row" id="js_pguide_info">
			<div class="col">
				<p id="js_pguide_p1">부동산 가이드</p>
				<p id="js_pguide_p2">집 구하기, 집 내놓기 쉽고 빠르게</p>
				<c:if test="${loginUser.user_no == 0 }">
					<!-- 관리자 -->
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='aginsertview.do?guide_system=realty'">가이드
						작성</button>
				</c:if>
			</div>
		</div>
		<div class="row" id="js_pguide_iconList">
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('전체보기')" id="js_pguide_alist">전체보기</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('부동산 상식')" id="js_pguide_alist">부동산
					상식</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('이사 가이드')" id="js_pguide_alist">이사
					가이드</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('분양 정보')" id="js_pguide_alist">분양 정보</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('법률 지식')" id="js_pguide_alist">법률 지식</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('선방에서 집 구하기')" id="js_pguide_alist">선방에서
					집 구하기</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#" onclick="ahref('선방에 집 내놓기')" id="js_pguide_alist">선방에
					집 내놓기</a>
			</div>
		</div>
		<div class="row" style="margin: 5px; height: 90px;">
			<p id="js_pguide_p3"></p>
		</div>
		<div class="row" id="js_pguide_cardList">
			<c:forEach items="${ galist }" var="guide" varStatus="status">
				<div class="card">
					<!-- Card image -->
					<div id="js_pguide_cardimg">
						<c:if test="${!empty guide.thumbnail }">
							<img class="card-img-top"
								src="${pageContext.request.contextPath}/files/admin/guide/${guide.thumbnail }"
								alt="Card image cap">
						</c:if>
						<c:if test="${empty guide.thumbnail }">
							<img class="card-img-top"
								src="https://mdbootstrap.com/img/Photos/Others/images/11.jpg"
								alt="Card image cap">
						</c:if>
					</div>
					<!-- Card content -->
					<div class="card-body">

						<!-- Title -->
						<h4 class="card-title">
							<a>${guide.title }</a>
						</h4>
						<!-- Button -->
						<div style="text-align: right;">
							<a class="btn btn-primary" id="js_pguide_btn"
								href="agdlselect.do?guide_system=${guide.guide_system }&guide_no=${guide.guide_no}">상세보기</a>
						</div>
					</div>
				</div>
			</c:forEach>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>