<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>main</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d7db7b289215b9986b37fed37910b7"></script>
<style type="text/css">
#hj_dropdownmenu {
	text-align: left;
	height: 300px;
	width: 300px;
}

#hj_estatelist {
	text-align: center;
}

#hj_houseImages {
	backround-color: white;
	width: 33%;
	height: 68%;
	margin: 2%;
	float: left;
}

#hj_houseImages img {
	width: 100%;
	height: 100%;
}

#hj_houseDetail {
	float: left;
	text-align: left;
	width: 58%;
	height: 68%;
	margin: 2%;
	padding-top: 1.3%;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

#house {
	width: 96%;
	height: 200px;
	background-color: white;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 3%;
	border: 1px solid #D5D5D5;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

.no-border {
	border: 0;
	box-shadow: none;
}

#hj_btn {
	background-color: #61c0bf;
		margin-right: 15px;
}

.custom-control {
	margin-left: 8%;
	margin-top: 2%;
	margin-bottom: 2%;
}

.custom-control-label {
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}
</style>

</head>
<body>

	<div class="container-fluid">

			
		<c:import url="../common/realtyHeader.jsp"></c:import>
		

		<div class="row">
			<div class="col-md-12" style="padding-right: 0px; padding-left: 0px;">
				<br>
				<div
					style="float: left; margin-left: 2%; margin-right: 5%; padding-right: 5%; padding-bottom: 25px;">
					<!-- border-right: 1px solid #dee2e6; -->

					<form>
						<input class="form-control" type="text" placeholder="역삼역">
					</form>

				</div>

				<div class="dropdown">
					<div class="btn-group" id="hj_btn-group">
						<button id="hj_btn" type="button"  id="hj_btn"
							class="btn btn-success dropdown-toggle no-border"
							data-toggle="dropdown" id="dropdownMenuButton"
							data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">원룸,투ㆍ쓰리룸,오피스텔</button>

						<ul class="dropdown-menu" id="hj_dropdownmenu"
							aria-labelledby="dropdownMenuButton">
							<div style="padding-left: 8%;">
								<h4 style="margin-top: 20px;">방 종류</h4>
								<p style="color: gray;">중복선택 가능</p>
							</div>
							<div>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox1"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox1">원룸</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox2"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox2">투ㆍ쓰리룸</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">오피스텔</label>
									</div>
								</li>

								<hr>

								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">아파트</label>
									</div>
								</li>
						</ul>


						<div class="dropdown">
							<button type="button"  id="hj_btn"
								class="btn btn-success dropdown-toggle no-border"
								data-toggle="dropdown" id="dropdownMenuButton1"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">월세, 전세, 매매</button>

							<ul class="dropdown-menu" id="hj_dropdownmenu"
								aria-labelledby="dropdownMenuButton1">
								<div style="padding-left: 8%;">
									<h4 style="margin-top: 20px;">매물 종류</h4>
									<p style="color: gray;">중복선택 가능</p>
								</div>

								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox1"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox1">월세</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox2"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox2">전세</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">매매</label>
									</div>
								</li>

							</ul>
						</div>

						<div class="dropdown">
							<button type="button"  id="hj_btn"
								class="btn btn-success dropdown-toggle no-border"
								data-toggle="dropdown" id="dropdownMenuButton1"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">가격대</button>

							<ul class="dropdown-menu" id="hj_dropdownmenu"
								aria-labelledby="dropdownMenuButton1">
								<div style="padding-left: 8%;">
									<h4 style="margin-top: 20px;">매물 종류</h4>
									<p style="color: gray;">중복선택 가능</p>
								</div>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox1"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox1">option
											1</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox2"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox2">option
											2</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">option
											3</label>
									</div>
								</li>

							</ul>
						</div>
						<div class="dropdown">
							<button type="button"  id="hj_btn"
								class="btn btn-success dropdown-toggle no-border"
								data-toggle="dropdown" id="dropdownMenuButton1"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">관리비</button>

							<ul class="dropdown-menu" id="hj_dropdownmenu"
								aria-labelledby="dropdownMenuButton1">
								<div style="padding-left: 8%;">
									<h4 style="margin-top: 20px;">매물 종류</h4>
									<p style="color: gray;">중복선택 가능</p>
								</div>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox1"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox1">option
											1</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox2"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox2">option
											2</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">option
											3</label>
									</div>
								</li>

							</ul>
						</div>

						<div class="dropdown">
							<button type="button"  id="hj_btn"
								class="btn btn-success dropdown-toggle no-border"
								data-toggle="dropdown" id="dropdownMenuButton1"
								data-toggle="dropdown" aria-haspopup="true"
								aria-expanded="false">방크기</button>

							<ul class="dropdown-menu" id="hj_dropdownmenu"
								aria-labelledby="dropdownMenuButton1">
								<div style="padding-left: 8%;">
									<h4 style="margin-top: 20px;">매물 종류</h4>
									<p style="color: gray;">중복선택 가능</p>
								</div>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox1"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox1">option
											1</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox2"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox2">option
											2</label>
									</div>
								</li>
								<li>
									<div class="custom-control custom-checkbox">
										<input type="checkbox" id="hj-checkbox3"
											class="custom-control-input" /> <label
											class="custom-control-label" for="hj-checkbox3">option
											3</label>
									</div>
								</li>

							</ul>
						</div>


					</div>
				</div>
			</div>
		</div>







		<div class="row">
			<div class="col-md-9" style="padding-right: 0px; padding-left: 0;">
				<div id="map" style="width: 100%; height: 800px;"></div>
				<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new daum.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
			        level: 3 // 지도의 확대 레벨
			    };


					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption);
				</script>
			</div>
			<div class="col-md-3"
				style="background-color: #EEEEEE; text-align: center; padding-left: 0; padding-right: 0;">
				<div
					style="background-color: white; width: 100%; height: 50px; padding-top: 10px; border-top: 1px solid #D5D5D5; color: #343a40; font-family: a고딕15; font-size: 16pt;">
					조건에 맞는 방 n 개</div>
				<br>
				<div style="width: 100%; height: 700px; overflow: auto;">
					<div id="house">
						<div id="hj_houseImages">
							<!-- <img src="resources/images/1.jpg"> -->
						</div>
						<div id="hj_houseDetail">
							<h4>전세 1억</h4>
							<h6>43mㆍ3층</h6>
							<h6>강서구 가양동</h6>
							</p>
							<p style="color: red; float: left;">♥</p>
							<p style="color: gray;">세상에나 마상에나</p>
						</div>
					</div>

					<div id="house">
						<div id="hj_houseImages">
							<!-- <img src="resources/images/2.png"> -->
						</div>
						<div id="hj_houseDetail">
							<h4>전세 2억</h4>
							<h6>49mㆍ10층</h6>
							<h6>중구 종로</h6>
							</p>
							<p style="color: gray;">지금까지 이런 방은 없었다</p>
						</div>
					</div>
					<div id="house">
						<div id="hj_houseImages">
							<!-- <img src="resources/images/3.jpg"> -->
						</div>
						<div id="hj_houseDetail">
							<h4>월 100/50</h4>
							<h6>200mㆍ3층</h6>
							<h6>서대문구 이태원</h6>
							</p>
							<p style="color: gray;">도널드 트럼프 대통령이 머문집</p>
						</div>
					</div>
					<div id="house">
						<div id="hj_houseImages">
							<!-- <img src="resources/images/1.jpg"> -->
						</div>
						<div id="hj_houseDetail">
							<h4>전세 1억</h4>
							<h6>43mㆍ3층</h6>
							<h6>강서구 가양동</h6>
							</p>
							<p style="color: red; float: left;">♥</p>
							<p style="color: gray;">세상에나 마상에나</p>
						</div>
					</div>
					<div id="house">
						<div id="hj_houseImages">
							<!-- <img src="resources/images/1.jpg"> -->
						</div>
						<div id="hj_houseDetail">
							<h4>전세 1억</h4>
							<h6>43mㆍ3층</h6>
							<h6>강서구 가양동</h6>
							</p>
							<p style="color: red; float: left;">♥</p>
							<p style="color: gray;">세상에나 마상에나</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>