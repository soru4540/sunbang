<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>SUNBANG</title>
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
#js_index_row {
	margin: 0 auto;
	text-align: center;
	margin-top: 50px;
}

#js_index_icon {
	margin: 25%;
	white-space: nowrap;
}

#js_index_icon1 {
	margin: 0 auto;
	background: linear-gradient(to right, #bbded6, #61c0bf);
	width: 70%;
	border-radius: 2rem !important;
	box-shadow: .3rem .3rem .4rem rgba(0, 0, 0, .075) !important;
}

#js_index_icon2 {
	margin: 0 auto;
	background: linear-gradient(to right, #ffb6b9, #fae3d9);
	width: 70%;
	border-radius: 2rem !important;
	box-shadow: .3rem .3rem .4rem rgba(0, 0, 0, .075) !important;
}

#js_index_p {
	margin: 0 auto;
	font-size: 26px;
}

@media screen and (min-width: 494px) and (max-width: 798px) {
	#js_index_p {
		text-align: center;
		font-size: 16px;
	}
}

@media screen and (min-width: 1px) and (max-width: 767px) {
	#js_index_p {
		text-align: center;
		font-size: 20px;
		white-space: normal !important;
	}
}

#js_index_row a:link {
	color: white;
	text-decoration: none;
	font-weight: bold;
}

#js_index_row a:visited {
	color: white;
	text-decoration: none;
}

#js_index_row a:hover {
	color: white;
	text-decoration: none;
}

#js_index_text {
	margin: 0 auto;
	font-size: 40px;
	font-family: a고딕11;
	margin-top: 80px;
	margin-bottom: 30px;
}

#js_index_span {
	color: #33b7b6;
	font-family: a고딕14;
}

#js_index_hr {
	margin-top: 120px;
	margin-bottom: 30px;
}

#js_index_title {
	margin: 0 auto;
	font-size: 24px;
	font-family: a고딕15;
}

#js_index_content {
	margin: 0 auto;
	font-size: 16px;
	font-family: a고딕12;
	color: gray;
}

#js_index_card {
	width: 205px;
	margin: 0 auto;
	margin-top: 20px;
}

#js_index_card a {
	color: black;
	text-decoration: none;
}

#js_index_card .card-body {
	max-height: 200px;
}

#js_index_card .card-img-top {
	min-height: 140px;
}

#pcate {
	font-size: 15px;
	margin-bottom: 0.5rem;
}

#js_index_ititle {
	font-weight: bold;
	font-size: 20px;
}

#js_index_cardList {
	margin: 0 auto;
}
</style>
</head>


<body>
	<div class="container">
		<div class="row" id="js_index_row">
			<div id="js_index_text">
					<p>
						<span id="js_index_span">선방</span>에 오신 것을 환영합니다!
					</p>
					<p>어떤 일로 오시게 되었나요?</p>
				</h2>
			</div>
		</div>
		<div class="row" id="js_index_row">
			<div class="col">
				<a href="propertymain.do" id="#js_index_a">
					<div class="shadow-sm p-3 rounded" id="js_index_icon1">
						<div id="js_index_icon">
							<p id="js_index_p">
								<i class="fas fa-home fa-2x"></i><br>부동산
							</p>
						</div>
					</div>
				</a>
			</div>
			<div class="col">
				<a href="interiormain.do"
					id="#js_index_a">
					<div class="shadow-sm p-3 rounded" id="js_index_icon2">
						<div id="js_index_icon">
							<p id="js_index_p">
								<i class="fas fa-paint-roller fa-2x"></i><br>인테리어
							</p>
						</div>
					</div>
				</a>
			</div>
		</div>
		<hr id="js_index_hr">
		<!-- 인기 부동산 -->
		<div id="js_index_row">
			<p id="js_index_title">부동산</p>
			<span id="js_index_content">현재 인기 매물 Best5</span>
		</div>
		<div class="row" id="js_index_cardList">
			<!-- card -->
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/1.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<p class="card-text" id="pcate">쓰리룸</p>
						<h5 class="card-title">전세 2억9000</h5>
						<!-- Text -->
						<p class="card-text">2층, 46.2m², 관리비 5만 로얄고층 채광+뷰 제일좋은집♣</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/2.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<p class="card-text" id="pcate">투룸</p>
						<h5 class="card-title">전세 2억4000</h5>
						<!-- Text -->
						<p class="card-text">5층, 42.9m², 관리비 5만
							💚영등포구청역3분거리#대출,주차가능#풀옵션</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/3.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<p class="card-text" id="pcate">오피스텔 · 당산계룡리슈빌2단지(도시형)</p>
						<h5 class="card-title">전세 4억</h5>
						<!-- Text -->
						<p class="card-text">12층, 47.25m², 관리비 10만
							대로변♣고층+남향♣채광최고인집♣주...</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/4.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<p class="card-text" id="pcate">투룸</p>
						<h5 class="card-title">전세 2억5000</h5>
						<!-- Text -->
						<p class="card-text">4층, 42.9m², 관리비 5만 ♣전대출가능,당산역2분 완전 역세권♣</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/15.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<p class="card-text" id="pcate">투룸</p>
						<h5 class="card-title">전세 1억5000</h5>
						<!-- Text -->
						<p class="card-text">3층, 49.5m², 관리비 8만 ❤️청년대출가능❤️100% 남향~</p>
					</div>
				</a>
			</div>
		</div>
		<!-- 부동산 보러가기 버튼 -->
		<div id="js_index_row">
			<button type="button" class="btn btn-success"
				style="background-color: #61c0bf; border-color: #61c0bf;">인기매물
				보러가기</button>
		</div>
		<hr id="js_index_hr">
		<!-- 인기 인테리어 -->
		<div id="js_index_row">
			<p id="js_index_title">인테리어</p>
			<span id="js_index_content">현재 인기 인테리어 Best5</span>
		</div>
		<div class="row" id="js_index_cardList">
			<!-- card -->
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/16.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<h5 class="card-title" id="js_index_ititle">은은한 핑크빛이 드리운 두 번째
							신혼집</h5>
						<!-- Text -->
						<p class="card-text">
							<i class="fas fa-user-circle"></i> 집이젛앙
						</p>
						<p class="card-text" id="pcate">좋아요 164 · 조회 340</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/27.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<h5 class="card-title" id="js_index_ititle">온전한 휴식처 나의 집 _
							평범한 일상속의 행복</h5>
						<!-- Text -->
						<p class="card-text">
							<i class="fas fa-user-circle"></i> interior오월
						</p>
						<p class="card-text" id="pcate">좋아요 124 · 조회 356</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/18.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<h5 class="card-title" id="js_index_ititle">밝고 편안한 분위기로 꾸민
							25평아트 인테리어</h5>
						<!-- Text -->
						<p class="card-text">
							<i class="fas fa-user-circle"></i> 누보디자인
						</p>
						<p class="card-text" id="pcate">좋아요 134 · 조회 180</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/29.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<h5 class="card-title" id="js_index_ititle">'햇살 가득한 여유로움'
							37PY 아파트 인테리어</h5>
						<!-- Text -->
						<p class="card-text">
							<i class="fas fa-user-circle"></i> 일상을디자인하다
						</p>
						<p class="card-text" id="pcate">좋아요 124 · 조회 460</p>
					</div>
				</a>
			</div>
			<div class="card" id="js_index_card">
				<a href="#"> <img class="card-img-top"
					src="https://mdbootstrap.com/img/Photos/Others/images/11.jpg"
					alt="Card image cap"> <!-- Card content -->
					<div class="card-body">
						<!-- Title -->
						<h5 class="card-title" id="js_index_ititle">곡면 복도가 돋보이는, 차분한
							48평 아파트 인테리어</h5>
						<!-- Text -->
						<p class="card-text">
							<i class="fas fa-user-circle"></i> 허스크디자인
						</p>
						<p class="card-text" id="pcate">좋아요 114 · 조회 345</p>
					</div>
				</a>
			</div>
		</div>
		<!-- 인테리어 보러가기 버튼 -->
		<div id="js_index_row">
			<button type="button" class="btn btn-danger"
				style="background-color: #ffb6b9; border-color: #ffb6b9;">인기
				인테리어 보러가기</button>
		</div>
		<br> <br> <br> <br> <br> <br> <br>
	</div>
</body>
</html>