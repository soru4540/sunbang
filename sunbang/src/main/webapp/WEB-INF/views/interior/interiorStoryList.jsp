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

#jb_story_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_story_container a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_story_container a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_story_container h6 {
	font-family: a고딕15;
}

#jb_story_container h5 {
	font-family: a고딕15;
}

.jb_story_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_story_container .col-md-4 {
	height: 360px;
}

.jb_story_profile img {
	width: 140px;
	height: 140px;
	border-radius: 70%;
}

#jb_story_container #fix_con {
	position: fixed;
	width: 240px;
    z-index:1;
    background-color: #fff;
}

@media screen and (max-width: 1400px) {

	#jb_story_container #fix_con {
		width: auto;
		min-height: 0;
		position: relative;
		top: 0px;	
	}
	
	#jb_story_container .col-md-9{
	padding: 20px;
	margin:20px;
	}
	
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<br>
	<br>
	<div class="container" id="jb_story_container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">					 				
						    <div id="fix_con">													
								<div class="jb_story_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">
								</div>
								<br>
								<a class="font-weight-bold">한서은천재짱짱뿡뿡</a> <br><a href="iflistselect.do"><span
									style="font-family: a고딕14; opacity: 0.5;">팔로우 : 78 팔로잉 :
									17</span></a><br>
								<br>
								<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우! 글씨가 넘쳐도 자동 줄바꿈이 됐으면 하는 작은 소원이
									있다...</p>
								<br>								
									<button type="button" class="btn btn-outline-info">팔로우</button>&nbsp;&nbsp;&nbsp;&nbsp;
									<button type="button" class="btn btn-outline-danger">신고</button>																	
							</div>						
					</div>
					<div class="col-md-9">
						<div class="row">
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best1.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best2.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best3.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best5.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best6.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best7.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best8.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
						</div>
						<div class="row">
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best5.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best6.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
							<div class="col-md-4">
								<h6 align="left">
									<i class="far fa-user-circle"></i>&nbsp;myId123
								</h6>
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best7.PNG"
									class="jb_story_img"><br>
									<h5 align="center">
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span
											style="font-size: large; opacity: 0.4;">조회 : 30</span>
									</h5>
									<h5 align="center">좋아하는 인테리어</h5>
								</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>