<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
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

#js_iguide_p2 {
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

#js_iguide_cardList .card {
	margin: 0 auto;
	max-width: 360px;
	margin-bottom:15px;
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

#js_iguide_cardimg{
	height:240px;
	max-width: 360px;
	overflow: hidden;
}

#js_iguide_cardimg img{

	height:auto;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp"></c:import>
	<div class="container" id="js_iguide_con">
		<div class="row" id="js_iguide_info">
			<div class="col">
				<p id="js_iguide_p1">인테리어 가이드</p>
				<p id="js_iguide_p2">내 집, 내 방 인테리어 쉽게 알려드립니다.</p>
				<c:if test="true">
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/sunbang/views/guide/interiorGuideInsert.jsp'">가이드
						작성</button>
				</c:if>
			</div>
		</div>
		<div class="row" id="js_iguide_iconList">
			<div class="col" id="js_iguide_icon">
				<a href="#">비용정리<a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#">셀프 인테리어</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#">리모델링</a>
			</div>
			<div class="col" id="js_iguide_icon">
				<a href="#">선방 이용 가이드</a>
			</div>
		</div>
		<div class="row" style="margin:5px;">
			<p id="js_iguide_p2">비용정리</p>
		</div>
		<div class="row" id="js_iguide_cardList">
			<div class="card">
				<!-- Card image -->
				<div id="js_iguide_cardimg">
					<img class="card-img-top"
					src="/sunbang/resources/images/ilist0.jpg"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">

					<!-- Title -->
					<h4 class="card-title">
						<a>20평대 아파트 리모델링 비용 정리</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a class="btn btn-primary" id="js_iguide_btn" href="/sunbang/views/guide/interiorGuideDetail.jsp">상세보기</a>
					</div>
				</div>
			</div>
			<div class="card">
				<!-- Card image -->
				<div id="js_iguide_cardimg">
				<img class="card-img-top"
					src="/sunbang/resources/images/ilist1.jpg"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">
					<!-- Title -->
					<h4 class="card-title">
						<a>30평대 아파트 리모델링 비용 정리</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a href="#" class="btn btn-primary" id="js_iguide_btn">상세보기</a>
					</div>
				</div>
			</div>
			<div class="card">
				<!-- Card image -->
				<div id="js_iguide_cardimg">
				<img class="card-img-top"
					src="/sunbang/resources/images/idetail1.jpg"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">

					<!-- Title -->
					<h4 class="card-title">
						<a>대표적 가구 브랜드와 가격 알아보기</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a href="#" class="btn btn-primary" id="js_iguide_btn">상세보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>