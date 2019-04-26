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

#jb_filter3_container .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_filter3_container .col-md-12 li {
	margin: 0 45px 0 70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_filter3_container .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter3_container .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter3_container .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_filter3_container .col-md-4 h5 {
	font-family: a고딕15;
}

#jb_filter3_container .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter3_img {
	width: 100%;
	margin-top: 15px;
	margin-bottom: 5px;
}

#jb_filter3_container .col-md-4:hover {
	border: 1px solid #ff9198;
	transition-delay: 0.08s;
}

#jb_filter3_container .col-md-2 img{
margin:5px;
padding:5px;
border: 1px solid #ffb6b9;
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

	<<div class="container" id="jb_filter3_container">
		<div class="row" align="center">		
				<div class="col-md-1"></div>
				<div class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh1.PNG"></a></div>								
				<div class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh2.PNG"></a></div>
				<div class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh3.PNG"></a></div>
				<div class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh4.PNG"></a></div>	
				<div class="col-md-2"><a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh5.PNG"></a></div>				
			<div class="col-md-1"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">리모델링</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">꾸미기팁</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">지식백과</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">이거어때</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<button type="button" class="jb_filter_btn">
					<span style="color: #fff;">생활정보</span>&nbsp;<span>ⓧ</span>
				</button>
			</div>
		</div>
		<hr color="#ff9198">
		<br>
		<div class="row">
			<div class="col-md-12" align="center"></div>
		</div>
		<div class="row">
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
			</div>
			<div class="col-md-4">
				<a href="#"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG"
					class="jb_filter3_img"><br>
					<h6 style="padding-top: 5px;">리모델링</h6>
					<h5>좋아하는 인테리어</h5>
					<h6>
						<i class="far fa-user-circle"></i>&nbsp;myId123
					</h6> </a>
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