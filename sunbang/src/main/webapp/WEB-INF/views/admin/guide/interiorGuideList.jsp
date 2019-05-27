<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var cate = sessionStorage.getItem("category");
		if (cate != null) {
			$("#js_iguide_p3").text("");
			$("#js_iguide_p3").text(cate);
		} else {
			$("#js_iguide_p3").text("");
			$("#js_iguide_p3").text("전체보기");
		}
	})
	function ahref(data) {
		var category = data;
		sessionStorage.setItem("category", category);
		if (category == "전체보기") {
			location.href = 'aglistselect.do?guide_system=interior';
		} else {
			location.href = 'agclselect.do?guide_system=interior&category='+ category;
		}
	}
</script>
<style type="text/css">
#js_iguide_con {
	min-height: 960px;
}

#js_iguide_info {
	margin-top: 60px;
	min-height: 280px;
	border: 1px solid lightgray;
	border-bottom: 0px;
	margin-left: -14px;
	margin-right: -14px;
}

#js_iguide_info .col {
	text-align: center;
	height: 100%;
	margin: 0 auto;
	margin-top: 40px;
}

#js_iguide_p1 {
	color: #343a40;
	margin-top: 40px;
	font-family: a고딕16;
	font-size: 35px;
}

#js_iguide_p2, #js_iguide_p3 {
	color: #343a40;
	margin-top: 40px;
	font-family: a고딕15;
	font-size: 22px;
}

#js_iguide_icon {
	font-family: a고딕15;
	font-size: 16px;
	text-align: center;
	background: #fae3d9;
	min-height: 50px;
	border: 1px solid white;
	white-space: nowrap;
	padding: 17px;
}

#js_iguide_icon a {
	color: #343a40;
	text-decoration: none;
}

#js_iguide_cardList {
	margin-bottom: 50px;
}

@media screen and (max-width:1200px) {
	#js_iguide_cardList .card {
		margin: 0 auto;
		max-width: 360px;
		margin-bottom: 15px;
	}
}

@media screen and (min-width:1201px) {
	#js_iguide_cardList .card {
		margin: 10px;
		max-width: 360px;
		margin-bottom: 15px;
	}
}
#js_iguide_cardList .card-body {
	max-height: 240px;
	font-family: a고딕15;
}

#js_iguide_cardList .card-img-top {
	min-height: 240px;
}

#js_iguide_cardList .card-title {
	font-size: 18px;
}

#js_iguide_iconList {
	min-height: 60px;
}

#js_iguide_btn {
	background-color: #fae3d9;
	border: 0;
	color: #343a40;
	font-size: 13px;
}

.card-title {
	min-height: 50px;
}

#js_iguide_cardimg {
	height: 240px;
	min-width: 360px;
	overflow: hidden;
}

#js_iguide_cardimg img {
	height: auto;
	width: 99.5%;
}
</style>
</head>
<body>
	<c:import url="../../common/interiorHeader.jsp"></c:import>
	<div class="container" id="js_iguide_con">
		<div class="row" id="js_iguide_info">
			<div class="col">
				<p id="js_iguide_p1">인테리어 가이드</p>
				<p id="js_iguide_p2">내 집, 내 방 인테리어 쉽게 알려드립니다.</p>
				<c:if test="${loginUser.user_no == 0 }">
					<!-- 관리자 -->
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='aginsertview.do?guide_system=interior'">가이드
						작성</button>
				</c:if>
			</div>
		</div>
		<div class="row" id="js_iguide_iconList">
			<div class="col" id="js_iguide_icon">
				<a href="#" onclick="ahref('전체보기')">전체보기</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#" onclick="ahref('비용정리')">비용정리</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#" onclick="ahref('셀프 인테리어')">셀프 인테리어</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#" onclick="ahref('리모델링')">리모델링</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#" onclick="ahref('선방 이용 가이드')">선방 이용 가이드</a>
			</div>
		</div>
		<div class="row" style="margin: 5px;">
			<p id="js_iguide_p3"></p>
		</div>
		<div class="row" id="js_iguide_cardList">
			<c:forEach items="${ galist }" var="guide" varStatus="status">
				<div class="card">
					<!-- Card image -->
					<div id="js_iguide_cardimg">
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
							<a class="btn btn-primary" id="js_iguide_btn"
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