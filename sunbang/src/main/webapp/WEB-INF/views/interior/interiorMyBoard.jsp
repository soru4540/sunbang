<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>  
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<script type="text/javascript">
	$(function(){
		$("#photograph_box").hide();
		$("#housewarming_box").hide();
		$("#knowhow_Box").hide();
		
		$("#photograph_title").click(function(){
			$("#photograph_box").toggle();
		});
		
		$("#housewarming_title").click(function(){
			$("#housewarming_box").toggle();
		});
		
		$("#knowhow_title").click(function(){
			$("#knowhow_Box").toggle();
		});
	});
</script>

<style type="text/css">

#photograph_title,
#housewarming_title,
#knowhow_title {
	cursor:pointer;
}

.fix_con {
	position: fixed;
	width: 14%;
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

.di {
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

#photograph_box,
#housewarming_box,
#knowhow_Box {
	background-color: #fafafa;
	width: 100%;
	text-align: center;
	position: relative;
}

#box {
	position: relative;
	top: 50%;
	left: 12%;
	transform: translate(-50%, -50%);
	border: 1px solid gray;
	background-color: white;
	padding: 2rem;
}
</style>

</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<br>
	<!-- 헤더 -->
	<br>
	<br>
	<br>
	<div class="container">
		<!-- 사진 -->
		<div class="row">
		
			<!-- sidebar -->
			<div class="col-sm-3">
				<div class="fix_con" style="text-align:center;">
					<div class="myprofile">
						<img src="${pageContext.request.contextPath }/files/user/userImages/${photoList[0].user_profile }">
					</div>
					<br>
					<c:if test="${empty loginUser}">
						<a href="#" class="font-weight-bold"></a>
					</c:if>
					<c:if test="${!empty loginUser}">
						<a href="#" class="font-weight-bold">닉네임</a>
					</c:if>
					<br>
					<a href="#"><span style="font-family: a고딕14; opacity: 0.5;">팔로우
							: 78 팔로잉 : 17</span></a><br> <br>
					<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우!</p>
				</div>
			</div>
			
			<div class="col-sm-9" id="BoardAllList">
				<p style="font-family: a고딕17; font-size: 20px;">내 글 목록</p><hr>
				
				<!-- 사진 -->
				<p id="photograph_title" style="font-family: a고딕17; font-size: 20px;">사진_photograph (${fn:length(photograph)})</p>
				<div class="row" id="photograph_box">
				<c:forEach items="${photograph }" var="photograph" varStatus="status">
					<div class="col-6 col-md-4 col-lg-3 mt-5">
						${photograph.board_no}<!-- 여기에다가 사진이랑 넣고 싶은 정보 넣으시면 됩니다. 부트스트랩으로다가 -->
					</div>
				</c:forEach>
				</div><hr>
				
				<!-- 집들이 -->	
				<p id="housewarming_title" style="font-family: a고딕17; font-size: 20px;">집들이_housewarming (${fn:length(housewarming)})</p>
				<div class="row" id="housewarming_box">
				<c:forEach items="${housewarming }" var="housewarming" varStatus="status">
					<div class="col-6 col-md-4 col-lg-3 mt-5">
						${housewarming.board_no}
					</div>
				</c:forEach>
				</div><hr>
				
				<!-- 노하우 -->	
				<p id="knowhow_title" style="font-family: a고딕17; font-size: 20px;">노하우_knowhow (${fn:length(knowhow)})</p>
				<div class="row" id="knowhow_Box">
				<c:forEach items="${knowhow }" var="knowhow" varStatus="status">
					<div class="col-6 col-md-4 col-lg-3 mt-5">
						${knowhow.board_no}
					</div>
				</c:forEach>
				</div><hr>
				
			</div>
		</div>
	</div>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>