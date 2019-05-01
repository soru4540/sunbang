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

#jb_newsfeed_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_newsfeed_container a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_newsfeed_container a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_newsfeed_container h6 {
	font-family: a고딕15;
}

#jb_newsfeed_container h5 {
	font-family: a고딕15;
}

.jb_newsfeed_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}


.jb_newsfeed_myprofile img {
	width: 140px;
	height: 140px;
	border-radius: 70%;
}

#jb_newsfeed_container #fix_con {
	position: fixed;
	width: 240px;
    z-index:1;
    background-color: #fff;
}

.jb_newsfeed_profile img {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}

@media screen and (max-width: 1400px) {

	#jb_newsfeed_container #fix_con {
		width: auto;
		min-height: 0;
		position: relative;
		top: 0px;	
	}
	
	#jb_newsfeed_container .col-md-9{
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
	<div class="container" id="jb_newsfeed_container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">					
					<div class="col-md-9">					
						<div class="row">
						<div class="col-md-2"></div>	
						<div class="col-md-8">
					<div class="jb_newsfeed_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">jsol123</span>
								</div>	
							</div>	
							<div class="col-md-2"></div>							
							</div>
						<div class="row">							
						  <div class="col-md-2"></div>		
							<div class="col-md-8">
							<hr color="#ffb6b9">						
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_newsfeed_img"><br>									
									<h5>
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>								
									</h5>
									<h6 style="opacity: 0.4;">30명이 봤고 100명이 좋아합니다</h6>									
									<h5>첨으로 올려보는 내방 사진</h5>
								</a>
									<hr color="#ffb6b9">								
									<input type="text" class="" id="" name="" size="64" placeholder="댓글달기">&nbsp;&nbsp;							
									<input type="button" value="게시">								
									</div>							
							<div class="col-md-2"></div>																				
						</div>		
						
							<div class="row">
						<div class="col-md-2"></div>	
						<div class="col-md-8">
					<div class="jb_newsfeed_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">jsol123</span>
								</div>	
							</div>	
							<div class="col-md-2"></div>							
							</div>
						<div class="row">							
						  <div class="col-md-2"></div>		
							<div class="col-md-8">
							<hr color="#ffb6b9">						
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_newsfeed_img"><br>									
									<h5>
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>								
									</h5>
									<h6 style="opacity: 0.4;">30명이 봤고 100명이 좋아합니다</h6>									
									<h5>첨으로 올려보는 내방 사진</h5>
								</a>
									<hr color="#ffb6b9">								
									<input type="text" class="" id="" name="" size="64" placeholder="댓글달기">&nbsp;&nbsp;							
									<input type="button" value="게시">								
									</div>							
							<div class="col-md-2"></div>																				
						</div>
						
							<div class="row">
						<div class="col-md-2"></div>	
						<div class="col-md-8">
					<div class="jb_newsfeed_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">jsol123</span>
								</div>	
							</div>	
							<div class="col-md-2"></div>							
							</div>
						<div class="row">							
						  <div class="col-md-2"></div>		
							<div class="col-md-8">
							<hr color="#ffb6b9">						
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_newsfeed_img"><br>									
									<h5>
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>								
									</h5>
									<h6 style="opacity: 0.4;">30명이 봤고 100명이 좋아합니다</h6>									
									<h5>첨으로 올려보는 내방 사진</h5>
								</a>
									<hr color="#ffb6b9">								
									<input type="text" class="" id="" name="" size="64" placeholder="댓글달기">&nbsp;&nbsp;							
									<input type="button" value="게시">								
									</div>							
							<div class="col-md-2"></div>																				
						</div>
						
							<div class="row">
						<div class="col-md-2"></div>	
						<div class="col-md-8">
					<div class="jb_newsfeed_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">jsol123</span>
								</div>	
							</div>	
							<div class="col-md-2"></div>							
							</div>
						<div class="row">							
						  <div class="col-md-2"></div>		
							<div class="col-md-8">
							<hr color="#ffb6b9">						
								<a href="#"> <img src="${pageContext.request.contextPath }/files/interior/interiorMain/best4.PNG"
									class="jb_newsfeed_img"><br>									
									<h5>
										<a href="#"><i class="far fa-heart"></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<a
											href="#"><i class="far fa-comment"></i></a>								
									</h5>
									<h6 style="opacity: 0.4;">30명이 봤고 100명이 좋아합니다</h6>									
									<h5>첨으로 올려보는 내방 사진</h5>
								</a>
									<hr color="#ffb6b9">								
									<input type="text" class="" id="" name="" size="64" placeholder="댓글달기">&nbsp;&nbsp;							
									<input type="button" value="게시">								
									</div>							
							<div class="col-md-2"></div>																				
						</div>
									
					</div>			
					<div class="col-md-3">					 				
						    <div id="fix_con">													
								<div class="jb_newsfeed_myprofile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">
								</div>
								<br>
								<a href="islistselect.do" class="font-weight-bold" >한서은천재짱짱뿡뿡</a> <br><a href="iflistselect.do"><span
									style="font-family: a고딕14; opacity: 0.5;">팔로우 : 78 팔로잉 :
									17</span></a><br>
								<br>
								<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우! 글씨가 넘쳐도 자동 줄바꿈이 됐으면 하는 작은 소원이
									있다...</p>																																			
							</div>						
					</div>
				</div>
			</div>
		</div>
		
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>