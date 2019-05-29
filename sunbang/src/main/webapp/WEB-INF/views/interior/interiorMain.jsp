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
	<script type="text/javascript">
	function goHousewarming(){
		location.href="iblistselect.do?board_type=housewarming";	
	}
	function goPhotograph(){
		location.href="iblistselect.do?board_type=photograph";		
	}	
	</script>
	<br>
	
	<div class="container" id="jb_main_container">

		<div class="row">
			<div class="col-md-8 mt-5">
				<a href="ibselect.do?board_no=${hbtop1.board_no}&board_type=${hbtop1.board_type}"><div class="hovereffect">
					 	<img id="js_htop1" src="${pageContext.request.contextPath }/files/interior/interiorMain/${hbtop1.post_data}"
							style="width: 100%; height: 455px;"> 
					</div></a>
			</div>
			<div class="col-md-4 mt-5">
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
							<a href="ibselect.do?board_no=${kbtop4.get(0).board_no}&board_type=${kbtop4.get(0).board_type}"><img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/${kbtop4.get(0).post_data}"
								height="455px">
							<div class="carousel-caption">
								<h4>First Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
							</a>
						</div>
						<div class="carousel-item">
							<a href="ibselect.do?board_no=${kbtop4.get(1).board_no}&board_type=${kbtop4.get(1).board_type}"><img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/${kbtop4.get(1).post_data}"
								height="455px">
							<div class="carousel-caption">
								<h4>Second Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
							</a>
						</div>
						<div class="carousel-item">
							<a href="ibselect.do?board_no=${kbtop4.get(2).board_no}&board_type=${kbtop4.get(2).board_type}"><img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/${kbtop4.get(2).post_data}"
								height="455px">
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
							</a>
						</div>
						<div class="carousel-item">
							<a href="ibselect.do?board_no=${kbtop4.get(3).board_no}&board_type=${kbtop4.get(3).board_type}"><img class="d-block w-100" src="${pageContext.request.contextPath }/files/interior/interiorMain/${kbtop4.get(3).post_data}"
								height="455px">
							<div class="carousel-caption">
								<h4>Third Thumbnail label</h4>
								<p>Cras justo odio, dapibus ac facilisis in, egestas eget
									quam. Donec id elit non mi porta gravida at eget metus. Nullam
									id dolor id nibh ultricies vehicula ut id elit.</p>
							</div>
							</a>
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
			<div class="col" align="center">
				<a href="iblistselect.do?board_type=photograph"> <i
					class="fas fa-camera-retro"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>사진</h6> <br></a>
			</div>
			<div class="col" align="center">
				<a href="iblistselect.do?board_type=housewarming"><i class="fas fa-door-open"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>집들이</h6> <br> </a>
			</div>
			<div class="col" align="center">
				<a href="iblistselect.do?board_type=knowhow"><i class="fas fa-tools"
					style="color: #ca9393; font-size: 65px;"></i><br> <br>
					<h6>노하우</h6> <br> </a>
			</div>
			<div class="col" align="center">
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
				<input type="button" class="jb_main_btn" value="more" onclick="goHousewarming();">
			</div>
		</div>
		<div class="row" id="jb_main_new">
			<div class="col-6 col-md-4 col-lg-4 mt-5">
				<a href="ibselect.do?board_no=${hbtop3.get(0).board_no}&board_type=${hbtop3.get(0).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${hbtop3.get(0).post_data}"
							style="width: 100%; height: 100%;">
					</div>
					<h5>${hbtop3.get(0).board_title}</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;${hbtop3.get(0).nickname}
					</h6>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-4 mt-5">
				<a href="ibselect.do?board_no=${hbtop3.get(1).board_no}&board_type=${hbtop3.get(1).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${hbtop3.get(1).post_data}"
							style="width: 100%; height: 100%;">
					</div>
					<h5>${hbtop3.get(1).board_title}</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;${hbtop3.get(1).nickname}
					</h6>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-4 mt-5">
				<a href="ibselect.do?board_no=${hbtop3.get(2).board_no}&board_type=${hbtop3.get(2).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${hbtop3.get(2).post_data}"
							style="width: 100%; height: 100%;">
					</div>
					<h5>${hbtop3.get(2).board_title}</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;${hbtop3.get(2).nickname}
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
				<input type="button" class="jb_main_btn" value="more" onclick="goPhotograph();">
			</div>
		</div>
		<div class="row">
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(0).board_no}&board_type=${pbtop8.get(0).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(0).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(1).board_no}&board_type=${pbtop8.get(1).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(1).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(2).board_no}&board_type=${pbtop8.get(2).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(2).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(3).board_no}&board_type=${pbtop8.get(3).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(3).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(4).board_no}&board_type=${pbtop8.get(4).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(4).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(5).board_no}&board_type=${pbtop8.get(5).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(5).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(6).board_no}&board_type=${pbtop8.get(6).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(6).post_data}"
							style="width: 100%; height: 100%;">
					</div>
				</a>
			</div>
			<div class="col-6 col-md-4 col-lg-3 mt-5">
				<a href="ibselect.do?board_no=${pbtop8.get(7).board_no}&board_type=${pbtop8.get(7).board_type}">
					<div class="hovereffect">
						<img src="${pageContext.request.contextPath }/files/interior/interiorMain/${pbtop8.get(7).post_data}"
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