<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
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

#js_pguide_p2 {
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

#js_pguide_cardList .card {
	margin: 0 auto;
	max-width: 360px;
	margin-bottom:15px;
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

#js_pguide_cardimg{
	height:240px;
	max-width: 360px;
	overflow: hidden;
}

#js_pguide_cardimg img{

	height:auto;
}
</style>
</head>
<body>
	<c:import url="../common/propertyHeader.jsp"></c:import>
	<div class="container" id="js_pguide_con">
		<div class="row" id="js_pguide_info">
			<div class="col">
				<p id="js_pguide_p1">부동산 가이드</p>
				<p id="js_pguide_p2">집 구하기, 집 내놓기 쉽고 빠르게</p>
				<c:if test="true">
					<button type="button" class="btn btn-outline-dark"
						onclick="location.href='/sunbang/views/guide/propertyGuideInsert.jsp'">가이드
						작성</button>
				</c:if>
			</div>
		</div>
		<div class="row" id="js_pguide_iconList">
			<div class="col" id="js_pguide_icon">
				<a href="#">부동산 상식</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#">이사 가이드</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#">분양 정보</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#">법률 지식</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#">선방에서 집 구하기</a>
			</div>
			<div class="col" id="js_pguide_icon">
				<a href="#">선방에 집 내놓기</a>
			</div>
		</div>
		<div class="row" style="margin:5px;">
			<p id="js_pguide_p2">부동산 상식</p>
		</div>
		<div class="row" id="js_pguide_cardList">
			<div class="card">
				<!-- Card image -->
				<div id="js_pguide_cardimg">
					<img class="card-img-top"
					src="/sunbang/resources/images/pgdetail1.jpg"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">

					<!-- Title -->
					<h4 class="card-title">
						<a>부동산 등기부등본 어떻게 봐야하나요?</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a class="btn btn-primary" id="js_pguide_btn" href="/sunbang/views/guide/propertyGuideDetail.jsp">상세보기</a>
					</div>
				</div>
			</div>
			<div class="card">
				<!-- Card image -->
				<div id="js_pguide_cardimg">
				<img class="card-img-top"
					src="/sunbang/resources/images/pglist1.jpg"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">
					<!-- Title -->
					<h4 class="card-title">
						<a>이사 갈 때 공과금 정산 어떻게 하나요?</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a href="#" class="btn btn-primary" id="js_pguide_btn">상세보기</a>
					</div>
				</div>
			</div>
			<div class="card">
				<!-- Card image -->
				<div id="js_pguide_cardimg">
				<img class="card-img-top"
					src="/sunbang/resources/images/pglist2.png"
					alt="Card image cap">
				</div>
				<!-- Card content -->
				<div class="card-body">

					<!-- Title -->
					<h4 class="card-title">
						<a>방 보러 갔을 때 꼭 필요한 매물 체크리스트</a>
					</h4>
					<!-- Button -->
					<div style="text-align: right;">
						<a href="#" class="btn btn-primary" id="js_pguide_btn">상세보기</a>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>