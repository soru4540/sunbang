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
.jb_main_btn {
	display: inline-block;
	font-weight: 400;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #ff9198;
	border: 1px solid transparent;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.jb_main_btn:hover {
	color: #74254d;
}

#jb_main_filter a {
	margin: auto;
	padding: auto;
	font-family: a고딕16;
	color: #343a40;
}

#jb_main_filter a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_main_filter a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_main_filter a:active {
	color: #000000;
	text-decoration: none;
}

#jb_main_filter a:hover {
	color: #ffb6b9;
	text-decoration: none;
}

#jb_main_new a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_main_new a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_main_new a:active {
	color: #000000;
	text-decoration: none;
}

#jb_main_new a:hover {
	color: #000000;
	text-decoration: none;
}

#jb_main_container .hovereffect {
	width: 100%;
	height: 100%;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
}

#jb_main_container #jb_main_new .hovereffect {
	width: 100%;
	height: 75%;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
}

#jb_main_container .hovereffect img {
	display: block;
	position: relative;
	-webkit-transition: all .3s linear;
	transition: all .3s linear;
}

#jb_main_container a:hover .hovereffect img {
	-ms-transform: scale(1.15);
	-webkit-transform: scale(1.15);
	transform: scale(1.15);
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<br>
	<br>
	<br>
	<div class="container" id="jb_main_container">

		<div class="row">
			<div class="col-md-8">
				<a href="#"><div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/sample1.PNG"
							style="width: 100%; height: 455px;">
					</div></a>
			</div>
			<div class="col-md-4">
				<div class="carousel slide" id="carousel-87480">
					<ol class="carousel-indicators">
						<li data-slide-to="0" data-target="#carousel-87480" class="active">
						</li>
						<li data-slide-to="1" data-target="#carousel-87480"></li>
						<li data-slide-to="2" data-target="#carousel-87480"></li>
						<li data-slide-to="3" data-target="#carousel-87480"></li>
					</ol>
					<div class="carousel-inner">
						<div class="carousel-item active">
							<img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/sample2.PNG"
								height="455px">
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/sample3.PNG"
								height="455px">
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/sample4.PNG"
								height="455px">
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
						<div class="carousel-item">
							<img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/sample4.PNG"
								height="455px">
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
						</div>
					</div>
					<a class="carousel-control-prev" href="#carousel-87480"
						data-slide="prev"><span class="carousel-control-prev-icon"></span>
						<span class="sr-only">Previous</span></a> <a
						class="carousel-control-next" href="#carousel-87480"
						data-slide="next"><span class="carousel-control-next-icon"></span>
						<span class="sr-only">Next</span></a>
				</div>
			</div>
		</div>
		<br>
		<hr color="#ff9198">
		<br>	
		<div class="row" id="jb_main_filter">
			<div class="col-md-3" align="center">
				<a href="iblistselect.do?board_type=photograph"> <i
					class="fas fa-camera-retro"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>사진</h6> <br></a>
			</div>
			<div class="col-md-3" align="center">
				<a href="iblistselect.do?board_type=housewarming"><i class="fas fa-door-open"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>집들이</h6> <br> </a>
			</div>
			<div class="col-md-3" align="center">
				<a href="iblistselect.do?board_type=knowhow"><i class="fas fa-tools"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>노하우</h6> <br> </a>
			</div>
			<div class="col-md-3" align="center">
				<a href="#"><i
					class="fas fa-book-reader" style="color: #ca9393; font-size: 65px;"></i><br>
					<br>
					<h6>가이드</h6> <br> </a>
			</div>

		</div>
		<hr color="#ff9198">
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>오늘의 NEW</h3>
			</div>
			<div class="col-md-6" align="right">
				<button type="button" class="jb_main_btn">more</button>
			</div>
		</div>
		<div class="row" id="jb_main_new">
			<div class="col-md-4">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
							style="width: 100%; height: 100%;">
					</div>
					<h5>좋아하는 사진</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
				</a>
			</div>
			<div class="col-md-4">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG"
							style="width: 100%; height: 100%;">
					</div>
					<h5>좋아하는 집들이</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
				</a>
			</div>
			<div class="col-md-4">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG"
							style="width: 100%; height: 100%;">
					</div>
					<h5>좋아하는 노하우</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6>
				</a>
			</div>
		</div>
		<br>
		<hr color="#ff9198">
		<br>
		<div class="row">
			<div class="col-md-6">
				<h3>오늘의 BEST</h3>
			</div>
			<div class="col-md-6" align="right">
				<button type="button" class="jb_main_btn">more</button>
			</div>
		</div>
		<div class="row">
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best1.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best2.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best3.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best5.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best6.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best7.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-md-3">
				<a href="#">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/best8.PNG"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
		</div>
		<br>
	</div>
	<c:import url="../common/footer.jsp" />

</body>
</html>