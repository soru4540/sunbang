<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>

<style type="text/css">
.jb_filter_btn {
	display: inline-block;
	font-family: a고딕15;
	font-weight: 400;
	height: 25px;
	color: white;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #ff9198;
	border: 1px solid transparent;
	padding: 3px 3px 3px 3px;
	font-size: 1rem;
	line-height: 1;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	margin-bottom: 5px;
}

.jb_filter_btn:hover {
	color: #f74265;
}

#jb_filter1_filter ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_filter1_filter li {
	margin: 0 60px 0 70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_filter1_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter1_container a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter1_container a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_filter1_container h6 {
	font-family: a고딕15;
}

#jb_filter1_container h5 {
	font-family: a고딕15;
}

.jb_filter1_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_filter1_container .col-md-3 {
	height: 360px;
}

#jb_filter1_items .jb_filter1_item {
	text-align: center;
	padding-top: 20px;
}

#jb_filter1_items .jb_filter1_item a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter1_items .jb_filter1_item a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter1_items .jb_filter1_item a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

.jb_filter1_filterBtn {
	display: inline-block;
	font-weight: 400;
	font-family: a고딕14;
	color: #212529;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid #ff9198;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
			});
		});
	</script>

	<script type="text/javascript">
		$(function() {

			$("#jb_filter1_items1").css("display", "none");
			$("#jb_filter1_items2").css("display", "none");
			$("#jb_filter1_items3").css("display", "none");
			$("#jb_filter1_items4").css("display", "none");
			$("#jb_filter1_items5").css("display", "none");

			$("#jb_filter1_filter1").click(function() {
				$(".jb_filter1_item").css("display", "none");
				$("#jb_filter1_items1").css("display", "");
			});

			$("#jb_filter1_filter2").click(function() {
				$(".jb_filter1_item").css("display", "none");
				$("#jb_filter1_items2").css("display", "");
			});

			$("#jb_filter1_filter3").click(function() {
				$(".jb_filter1_item").css("display", "none");
				$("#jb_filter1_items3").css("display", "");
			});

			$("#jb_filter1_filter4").click(function() {
				$(".jb_filter1_item").css("display", "none");
				$("#jb_filter1_items4").css("display", "");
			});

			$("#jb_filter1_filter5").click(function() {
				$(".jb_filter1_item").css("display", "none");
				$("#jb_filter1_items5").css("display", "");
			});

		});
	</script>
	<br>
	<br>
	<div class="container" id="jb_filter1_container">
		<div class="row">
			<div class="col-md-12" id="jb_filter1_filter">
				<ul>
					<li class="nav-item dropdown">
						<button class="jb_filter1_filterBtn" id="jb_filter1_filter1">
							정렬 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter1_filterBtn" id="jb_filter1_filter2">
							공간 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter1_filterBtn" id="jb_filter1_filter3">
							평수 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter1_filterBtn" id="jb_filter1_filter4">
							컬러 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter1_filterBtn" id="jb_filter1_filter5">
							제품정보 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
				</ul>
			</div>
		</div>
		<div class="row">
			<div class="col-md-12" id="jb_filter1_items">
				<div class="jb_filter1_item" id="jb_filter1_items1">
					<a href="#">인기순</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">최신순</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">팔로잉</a>
				</div>
				<div class="jb_filter1_item" id="jb_filter1_items2">
					<a href="#">모든 공간</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">원룸</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">거실</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">침실</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">키친</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">욕실</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">드레스룸</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">서재 & 작업실</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">베란다</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">현관</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">사무공간</a>
				</div>
				<div class="jb_filter1_item" id="jb_filter1_items3">
					<a href="#">모든 평수</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">10평
						미만</a> &nbsp;&nbsp;&nbsp;&nbsp; <a href="#">10평대</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">20평대</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">30평대</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">40평대 이상</a>
				</div>
				<div class="jb_filter1_item" id="jb_filter1_items4">
					<a href="#">모든 컬러</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">그레이</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">화이트</a>&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">블랙</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">블루</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">그린</a>
					&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">레드</a>&nbsp;&nbsp;&nbsp;&nbsp;
					<a href="#">핑크</a>
				</div>
				<div class="jb_filter1_item" id="jb_filter1_items5">
					<a href="#">모두</a>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <a href="#">제품정보
						있는 게시물만</a>
				</div>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">정렬</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">공간</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">평수</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">컬러</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">제품정보</span>&nbsp;<span>ⓧ</span>
				</button>
			</div>
		</div>
		<hr color="#ff9198">
		<br>
		<div class="row">
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best1.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best2.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best3.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best5.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best6.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best7.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best8.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best1.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best2.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best3.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best5.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best6.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best7.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
			<div class="col-md-3">
				<h6 align="left">
					<i class="far fa-user-circle"></i>&nbsp;myId123
				</h6>
				<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best8.PNG"
					class="jb_filter1_img"><br>
					<h5 align="center">
						<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
							href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
							style="font-size: large; opacity: 0.4;">조회 : 30</span>
					</h5>
					<h5 align="center">좋아하는 인테리어</h5>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<a id="MOVE_TOP_BTN" href="#" style="color: #000;">TOP</a>
			</div>
		</div>
		<c:import url="../common/footer.jsp" />
</body>
</html>