<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">	
<title>SUNBANG</title>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />		
	<br>	<br><br><br><br>
	<h4 align="center" style="font-weight: bold;">글쓰기</h4>	
	<br><br><br><br>
	<div class="container" style="text-align: center; height: 480px;">
		<div class="row" style="text-align: center;">
			<div class="col">			
				<a href="ibinsertview.do?board_type=photograph"  style="color: #888;" >
				<h5 style="font-weight:bold;">사진</h5>
				<img src="${pageContext.request.contextPath}/resources/images/camera.png" style="width: 40%;">
				<br>
				<br>				
				<div class="text" style="width: 70%; margin: 0 auto;">예쁜 집 사진을 공유해서 많은<br>사람들에게 영감을 주세요.</div>
				</a>
			</div>

			<div class="col">
				<a href="ibinsertview.do?board_type=housewarming"  style="color: #888;">
				<h5 style="font-weight:bold;">집들이</h5>
					<img src="${pageContext.request.contextPath}/resources/images/home.png" style="width: 40%;">
				<br>
				<br>				
					<div class="text" style="width: 70%; margin: 0 auto;">여러분의 집 인테리어를 사진과<br>함께 소개해주세요.</div>
				</a>
			</div>
			
			<div class="col">
				<a href="ibinsertview.do?board_type=knowhow"  style="color: #888;">
				<h5 style="font-weight:bold; color: #888;">노하우</h5>
					<img src="${pageContext.request.contextPath}/resources/images/tip.png" style="width: 40%;">
				<br>
				<br>			
				<div class="text" style="width: 70%; margin: 0 auto;">여러분이 알고 있는 인테리어<br> 노하우를 공유해주세요.</div>
				</a>
			</div>
		</div>
	</div>
<c:import url="../common/footer.jsp" />	
</body>
</html>