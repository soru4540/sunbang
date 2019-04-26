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

#jb_filter2_container .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_filter2_container .col-md-12 li {
	margin: 0 36px 0 36px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_filter2_container .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter2_container .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter2_container .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_filter2_container .col-md-4 h5 {
	font-family: a고딕15;
	padding-top: 5px;
}

#jb_filter2_container .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter2_img {
	width: 100%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_filter2_container .hovereffect {
	width: 100%;
	height: 70%;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
	border-radius: .75rem;
}

#jb_filter2_container .hovereffect img {
	display: block;
	position: relative;
	-webkit-transition: all .3s linear;
	transition: all .3s linear;
}

.jb_filter_a:hover img {
	-ms-transform: scale(1.15);
	-webkit-transform: scale(1.15);
	transform: scale(1.15);
}


#jb_filter2_items .jb_filter2_item {
	text-align: center;
	padding-top: 20px;
}

#jb_filter2_items .jb_filter2_item a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter2_items .jb_filter2_item a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter2_items .jb_filter2_item a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

.jb_filter2_filterBtn {
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
	<br>
	<br>

	<div class="container" id="jb_filter2_container">
		<div class="row">
			<div class="col-md-12">
				<ul>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter1">
							정렬 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter2">
							주거형태 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter3">
							평수 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter4">
							예산 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter5">
							스타일 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter6">
							색상 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
					<li class="nav-item dropdown">
						<button class="jb_filter2_filterBtn" id="jb_filter2_filter7">
							제품정보 <span style="color: #ff9198;">▼</span>
						</button>
					</li>
				</ul>
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
					<span style="color: #fff;">주거형태</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">평수</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">예산</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">스타일</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">색상</span>&nbsp;<span>ⓧ</span>
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
			<div class="col-md-12" align="center"></div>
		</div>
		<div class="row">
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
			</div>
			<div class="col-md-4" align="center">
				<a class="jb_filter_a" href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG" class="jb_filter2_img">
					</div>
					<br>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
					<h6 style="opacity: 0.35;">좋아요 : 20 조회수 : 100</h6> </a>
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