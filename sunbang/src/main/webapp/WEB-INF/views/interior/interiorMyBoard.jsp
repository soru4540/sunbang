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
#photograph_title, #housewarming_title, #knowhow_title {
	cursor: pointer;
}

#photograph_box, #housewarming_box, #knowhow_Box {
	padding-top: 15px;
	background-color: #fafafa;
	width: 100%;
	text-align: center;
	position: relative;
}

.thumb-crop {
  display:inline-block;  
  position: relative;
  width: 160px;
  height: 160px;
  overflow: hidden;
  text-align: center;
  margin : 0 !important;
  border : 1px solid black;
}
.row {
	margin:0 auto;
}


.thumb-crop img {
  position: absolute;
  left: 50%;
  top: 50%;
  height: 100%;
  width: auto;
  -webkit-transform: translate(-50%,-50%);
      -ms-transform: translate(-50%,-50%);
          transform: translate(-50%,-50%);
}

.thumb-crop .portrait {
  width: 100%;
  height: auto;
}

.thumb-crop .auto {
  width: auto;
  height: auto;
}

.thumb-crop:hover {
	cursor: pointer;
	
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
					<div class="myprofile" >
						<div class="thumb-crop">					
						<img class="auto" id="profile" src="${pageContext.request.contextPath }/files/user/userImages/${loginUser.user_profile}"
						style="width: 100%; ">
						</div>
					</div>
					<br>
					<c:if test="${empty loginUser}">
						<a href="#" class="font-weight-bold"></a>
					</c:if>
					<c:if test="${!empty loginUser}">
						<a href="#" class="font-weight-bold">${user.nickname}</a>
					</c:if>
					<br>
					<a href="#"><span style="font-family: a고딕14; opacity: 0.5;">팔로우: 78 팔로잉 : 17</span></a><br> <br>
					<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우!</p>
				</div>
			</div>
			
			<div class="col-sm-9" id="BoardAllList">
				<p style="font-family: a고딕17; font-size: 20px;">내 글 목록</p><hr>
				
				<!-- 사진 -->
				<p id="photograph_title" style="font-family: a고딕15; font-size: 18px;">사진(${fn:length(photograph)})</p>
				<div class="row" id="photograph_box">
				<c:forEach items="${photograph }" var="photograph" varStatus="status">
					<div class="col-3" style="margin: 0 !important;">						
						<div class="thumb-crop">
						<img class="auto" src="${pageContext.request.contextPath }/files/interior/interiorBoard/${photograph.post_data }" 
						style="width:160%;" onclick="location.href='ibselect.do?board_no=${photograph.board_no}&board_type=${photograph.board_type}'">
						</div>
						<p style="font-family:a고딕14; font-size: 15px;">${photograph.board_no}. ${photograph.board_title}</p>	
					</div>
				</c:forEach>
				</div>
				<hr>
				
				<!-- 집들이 -->	
				<p id="housewarming_title" style="font-family: a고딕15; font-size: 18px;">집들이(${fn:length(housewarming)})</p>
				<div class="row" id="housewarming_box">
				<c:forEach items="${housewarming }" var="housewarming" varStatus="status">
					<div class="col-3" style="margin: 0 !important;">						
						<div class="thumb-crop">
						<img class="auto" src="${pageContext.request.contextPath }/files/interior/interiorBoard/${housewarming.post_data }" 
						style="width:160%;" onclick="location.href='ibselect.do?board_no=${housewarming.board_no}&board_type=${housewarming.board_type}'">
						</div>
						<p style="font-family:a고딕14; font-size: 15px;">${housewarming.board_no}. ${housewarming.board_title}</p>
						
					</div>
				</c:forEach>
				</div>
				<hr>
				
				<!-- 노하우 -->	
				<p id="knowhow_title" style="font-family: a고딕15; font-size: 18px;">노하우(${fn:length(knowhow)})</p>
				<div class="row" id="knowhow_Box">
				<c:forEach items="${knowhow }" var="knowhow" varStatus="status">
					<div class="col-3" style="margin: 0 !important;">						
						<div class="thumb-crop">
						<img class="auto" src="${pageContext.request.contextPath}/files/interior/interiorBoard/${knowhow.post_data }" 
						style="width:160%;" onclick="location.href='ibselect.do?board_no=${knowhow.board_no}&board_type=${knowhow.board_type}'">
						</div>
						<p style="font-family:a고딕14; font-size: 15px;">${knowhow.board_no}. ${knowhow.board_title}</p>
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