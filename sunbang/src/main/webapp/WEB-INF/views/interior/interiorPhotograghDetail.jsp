<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ page import="org.kh.sunbang.interior.model.vo.BoardFull"%>
<%
	BoardFull boardF = (BoardFull) request.getAttribute("boardF");
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<script type="text/javascript">
$(function(){
	// 버튼 클릭시 게시글 제거
	$("#boardDelete").click(function(){
		var result = confirm("게시글을 삭제하시겠습니까?");
		if(result){
			location.href = '/sunbang/ibdelete.do?section=${param.section}&num=${param.num}&no=${board.board_no}';
		}
	});
</script>

<style type="text/css">
.fix_con {
	position: fixed;
	width: 20%;
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

.di {
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
	font-family: a고딕14;
	position: relative;
	z-index: 2;
}

.wrapper {
	display: grid;
	grid-template-columns: 47% 50%;
	grid-gap: 3%;
	background-color: #fafafa;
	color: #444;
}

.box {
	background-color: #444;
	color: #fafafa;
	border-radius: 5px;
	padding: 20px;
	font-size: 150%;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<div class="container">
		<form enctype="multipart/form-data">
			<div class="row">
				<!-- 사진 영역 -->
				<div class="col-8" style="width:100%;">
					<br> <br>
					<div class="row"
						style="display: grid; grid-template-columns: 80% 10% 10%; padding: initial;">
						<div class="col">
							<h6 style="font-family: a고딕14;">타입/타입/타입</h6>
						</div>
						<div class="col" style="text-align: right; padding-right: 0px;">
							<button type="button" class="btn btn-secondary btn-sm" 
							onclick="location.href='ibupdateview.do?#">수정</button>
						</div>
						<div class="col" style="text-align: right; ">
							<button type="button" class="btn btn-danger btn-sm"  id="boardDelete"
							onclick="location.href='ibdelete.do'">삭제</button>
						</div>
					</div>
					<br> <img style="width: -webkit-fill-available;"
						src="${pageContext.request.contextPath }/files/interior/interiorBoard/1557914876268.jpg">
					<br> <br> <img style="width: -webkit-fill-available;"
						src="${pageContext.request.contextPath }/files/interior/interiorBoard/1557914876268.jpg">
				</div>
				<br>
				<!-- 프로필 -->
				<div class="col-4">
					<br> <br>
					<div class="fix_con">
						<div class="d1" style="background-color: white; padding: 5%;">
							<!-- board type -->
							<p style="margin: 0 auto; padding-top: 4px; font-family: a고딕14;">사진</p>
							<!-- 올린 날짜 -->
							<p>
								<a style="font-color: lightgray;">2019.05.14(화) 10:04</a>
							</p>
							<div class="row"
								style="display: grid; grid-template-columns: 47% 50%; padding: initial;">
								<div class="col" style="padding-right: 3px;">
									<button type="button" class="btn btn-outline-danger"
										style="width: -webkit-fill-available; font-size: 25px;">♡</button>
								</div>
								<div class="col" style="padding-right: 5px;">
									<button type="button" class="btn btn-outline-info"
										style="width: -webkit-fill-available; font-size: 25px;">☆</button>
								</div>
							</div>
							<br>
							<div class="row"
								style="display: grid; grid-template-columns: 60% 40%; padding: initial;">
								<div class="col">
									<p>
										<i style='font-size: 24px;' class='far'>&#xf580;</i> <a
											class="font-weight-bold">닉네임</a>
									</p>
								</div>
								<div class="col" style="text-align: right;">
									<button type="button" class="btn btn-link"
										style="font-size: 12px; padding-right: 0px;">신고</button>
								</div>
							</div>
							<p>시티 뷰와 포근한 조명이 완성한 '나만의 집'</p>
							<hr>
							<button type="button" class="btn btn-primary btn-lg btn-block"
								style="font-size: 15px;">이 집의 모든 제품 보기</button>
							<br>
							<div class="rb" style="text-align: center;">
								<!-- 부동산 추천 -->
								<h6 style="font-family: a고딕14;">'닉네임'님을 위한 부동산 추천</h6>
								<div class="wrapper">
									<div class="box a">A</div>
									<div class="box b">B</div>
									<div class="box c">C</div>
									<div class="box d">D</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</form>
		<br>
		<br>
	</div>
	<div style="position: relative;  z-index: 1;">
		<c:import url="../common/footer.jsp" />
	</div>
</body>
</html>