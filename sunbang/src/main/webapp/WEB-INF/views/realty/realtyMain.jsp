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
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/bootstrap-slider.js"></script>
<link
	href="${pageContext.request.contextPath }/resources/css/bootstrap-slider.css"
	rel="stylesheet">
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d7db7b289215b9986b37fed37910b7&libraries=services,clusterer,drawing"></script>

<style type="text/css">
#hj_btn_filter.btn-success, #js_btn_subway.btn-success {
	color: #fff;
	background-color: #61c0bf;
	border-color: #61c0bf;
}

#hj_realtyOption {
	padding-left: 6%;
}

.col .custom-checkbox {
	margin: 10%;
}

#hj_filter_setting {
	padding-left: 5%;
	margin: 5%
}

.hj_slider_elements {
	margin-top: 3%;
	margin-bottom: 3%;
}

#hj_dropdownmenu {
	width: 800%;
	left: -280%;
	position: relative;
	padding: 40%;
}

#hj_estatelist {
	text-align: center;
}

#hj_h4 {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 1;
	-webkit-box-orient: vertical;
}

#hj_detail_title {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
	color: gray;
}

#hj_h6_a {
	overflow: hidden;
	text-overflow: ellipsis;
	display: -webkit-box;
	-webkit-line-clamp: 2;
	-webkit-box-orient: vertical;
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

.house {
	width: 96%;
	height: 250px;
	background-color: white;
	margin-left: 10px;
	margin-right: 10px;
	margin-top: 2%;
	color: #343a40;
	font-family: a고딕15;
	font-size: 16px;
}

.no-border {
	border: 0;
	box-shadow: none;
}

#hj_btn_filter {
	background-color: #61c0bf;
	margin-right: 15px;
}

#hj_btn_map {
	background-color: #61c0bf;
	margin-right: 15px;
	display: none;
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

.has-search .form-control {
	padding-left: 2.375rem;
	width: 20%;
	float: left;
}

.has-search .form-control-feedback {
	position: absolute;
	z-index: 2;
	display: block;
	width: 2.375rem;
	height: 2.375rem;
	line-height: 2.375rem;
	text-align: center;
	pointer-events: none;
	color: #aaa;
}

#hj_btn_submit {
	width: 100px;
	background-color: #61c0bf;
	margin-right: 15px;
}

#hj_search_row {
	margin: 8px;
}

b {
	margin-left: 10px;
	margin-right: 10px;
}

#hj_deposit_slider .slider-selection, #hj_monthly_slider .slider-selection,
	#hj_purchase_slider .slider-selection, #hj_area_slider .slider-selection
	{
	background: #61c0bf;
}

.slider.slider-horizontal {
	width: 30%;
	height: 20px;
}

#hj_purchase_type::before {
	content: '';
	clear: both;
}

@media ( max-width : 991px) {
	#hj_list {
		min-width: 100%;
		max-width: 100% !important;
	}
}
</style>

<script type="text/javascript">
	$(document).ready(function() {
		$("#hj_btn_filter").click(function() {
			$("#js_subway").hide();
			$("#hj_map").hide();
			$("#hj_filter").show();
			$("#hj_btn_filter").hide();
			$("#hj_btn_map").show();
		});
		$("#hj_btn_map").click(function() {
			$("#hj_map").show();
			$("#hj_filter").hide();
			$("#hj_btn_filter").show();
			$("#hj_btn_map").hide();
		});

		$("#js_btn_subway").click(function() {
			$("#hj_filter").hide();
			$("#hj_map").show();
			if ($("#js_subway").is(":visible") == true) {
				$("#js_subway").hide();
			} else {
				(function($) {
					$(document).ready(function() {
						$('img[usemap]').rwdImageMaps();
					});
				})(jQuery);
				$("#js_subway").show();
			}
		});

		$("#hj_map").click(function() {
			$("#js_subway").hide();
			window.scrollTo(0, 0);
		});
		if ($("#hj-checkbox7").is(":checked")) {
			$('#hj_slider_deposit').show();
		}
		if ($("#hj-checkbox6").is(":checked")) {
			$('#hj_slider_month').show();
		}
		if ($("#hj-checkbox8").is(":checked")) {
			$('#hj_slider_purchase').show();
		}
		$("#hj-checkbox7").change(function() {
			if ($("#hj-checkbox7").is(":checked")) {
				$('#hj_slider_deposit').show();
			} else {
				$('#hj_slider_deposit').hide();
			}
		});
		$("#hj-checkbox6").change(function() {
			if ($("#hj-checkbox6").is(":checked")) {
				$('#hj_slider_month').show();
			} else {
				$('#hj_slider_month').hide();
			}
		});
		$("#hj-checkbox8").change(function() {
			if ($("#hj-checkbox8").is(":checked")) {
				$('#hj_slider_purchase').show();
			} else {
				$('#hj_slider_purchase').hide();
			}
		});

		getList();
	});//ready
</script>





</head>
<body>

	<c:import url="../common/realtyHeader.jsp"></c:import>


	<div class="container-fluid">

		<div class="row" id="hj_row1">
			<div class="col-md-12">
				<div class="row" id="hj_search_row">
					<div class="col-md-3" style="padding-top: 0.5%;">
						<div class="form-group has-search">
							<span class="fa fa-search form-control-feedback"></span> <input
								type="text" id="hj_keyword" class="form-control"
								placeholder="강남구 역삼역" style="width: 100%;"
								onkeypress="if( event.keyCode==13 ){goSearch();}" />

						</div>
					</div>
					<div class="col-md-9">
						<div class="btn" id="hj_btn-group">
							<button type="button" id="hj_btn_filter" class="btn btn-success">검색
								필터</button>
							<button type="button" id="hj_btn_map" class="btn btn-success">검색
								필터</button>
						</div>
						<div class="btn">
							<button type="button" id="js_btn_subway" class="btn btn-success">역으로검색</button>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div style="max-height: 920px;">
			<div class="row" id="js_subway"
				style="display: none; background: white; width: 100%; position: relative; padding-top: 85%; overflow: hidden;">
				<img class="map-trans" alt="Map / Carte" usemap="#region-map"
					src="${pageContext.request.contextPath }/resources/images/subway.png"
					id="subwayimg"
					style="position: absolute; top: 0; left: 0; right: 0; bottom: 0; max-width: 100%; height: auto; margin: 0 auto;">
			</div>
			<map name="region-map">
				<area shape="rect" coords="672,619,685,632" href="#" alt="강남역"
					onclick="view('서울특별시 강남구 강남대로 지하 396')" />
				<area shape="rect" coords="196,350,226,363" href="#" alt="가양역"
					onclick="view('서울특별시 강서구 양천로 지하 485')" />
				<area shape="rect" coords="445,463,477,492" href="#" alt="용산역"
					onclick="view('서울 용산구 한강대로23길 55')" />
				<area shape="rect" coords="514,424,560,435" href="#" alt="숙대입구역"
					onclick="view('서울 용산구 갈월동 69-115')" />
				<area shape="rect" coords="789,736,809,755" href="#" alt="판교역"
					onclick="view('경기 성남시 분당구 판교역로 지하 160')" />
				<area shape="rect" coords="197,399,226,413" href="#" alt="염창역"
					onclick="view('서울 강서구 염창동 284-84')" />
				<area shape="rect" coords="58,487,97,504" href="#" alt="굴포천역"
					onclick="view('인천 부평구 갈산동 414')" />
				<area shape="rect" coords="510,391,540,415" href="#" alt="서울역"
					onclick="view('서울 용산구 한강대로 405')" />
				<area shape="rect" coords="326,298,346,338" href="#" alt="홍대입구역"
					onclick="view('서울 마포구 양화로 지하 160')" />
				<area shape="rect" coords="633,562,658,578" href="#" alt="고속터미널역"
					onclick="view('서울 서초구 신반포로 지하 188')" />
				<area shape="rect" coords="272,357,312,372" href="#" alt="합정역"
					onclick="view('서울 마포구 양화로 지하 55')" />
				<area shape="rect" coords="279,402,294,418" href="#" alt="당산역"
					onclick="view('서울 영등포구 당산로 229')" />
				<area shape="rect" coords="444,419,476,445" href="#" alt="효창공원앞역"
					onclick="view('서울 용산구 백범로 지하 287')" />
				<area shape="rect" coords="429,374,468,396" href="#" alt="공덕역"
					onclick="view('서울 마포구 마포대로 지하 100')" />
				<area shape="rect" coords="557,452,591,477" href="#" alt="이태원역"
					onclick="view('서울 용산구 이태원동 119-23')" />
			</map>
		</div>

		<div class="row" id="hj_filter" style="display: none;">

			<div class="col-md-12">
				<div>
					<div style="padding-left: 8%;">
						<h4 style="margin-top: 20px;">방 종류</h4>
						<p style="color: gray;">중복선택 가능</p>
					</div>
					<div id="hj_realty_type">
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox1"
								class="custom-control-input" name="oneroom" value="원룸" /> <label
								class="custom-control-label" for="hj-checkbox1">원룸</label>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox2"
								class="custom-control-input" name="tworoom" value="투룸" /> <label
								class="custom-control-label" for="hj-checkbox2">투룸</label>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox3"
								class="custom-control-input" name="threeroom" value="쓰리룸" /> <label
								class="custom-control-label" for="hj-checkbox3">쓰리룸</label>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox4"
								class="custom-control-input" name="officetel" value="오피스텔" /> <label
								class="custom-control-label" for="hj-checkbox4">오피스텔</label>
						</div>

						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox5"
								class="custom-control-input" name="apartment" value="아파트" /> <label
								class="custom-control-label" for="hj-checkbox5">아파트</label>
						</div>
					</div>
					<hr style="clear: both;">
					<div id="hj_purchase_type">
						<div style="padding-left: 8%;">
							<h4 style="margin-top: 20px;">매물 종류</h4>
							<p style="color: gray;">중복선택 가능</p>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox6"
								class="custom-control-input" name="monthly_lease"
								value="monthly_lease" /> <label class="custom-control-label"
								for="hj-checkbox6">월세</label>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox7"
								class="custom-control-input" name="payback_deposit_lease"
								value="payback_deposit_lease" /> <label
								class="custom-control-label" for="hj-checkbox7">전세</label>
						</div>
						<div class="custom-control custom-checkbox" style="float: left;">
							<input type="checkbox" id="hj-checkbox8"
								class="custom-control-input" name="purchase" value="purchase" />
							<label class="custom-control-label" for="hj-checkbox8">매매</label>
						</div>
					</div>
					<!-- hj_purchase_type -->

					<br style="clear: both;">

					<div id="hj_slider" style="padding-left: 8%;">


						<div id="hj_slider_month" style="display: none;">
							<div class="hj_slider_elements">
								<h5 style="margin-right: 10%;">월세</h5>
								<p id="monthlymin" style="float: left">최소 : 0 만원 ,</p>
								<p id="monthlymax">최대 : 무제한</p>
								<b>0</b> <input id="hj_monthly_slider" type="text" class="span2" />
								<b>무제한</b>
							</div>
						</div>

						<div id='hj_slider_deposit' style="display: none;">
							<div class="hj_slider_elements">
								<h5 style="margin-right: 5%;">보증금/전세가</h5>
								<p id="depositmin" style="float: left">최소 : 0 만원 ,</p>
								<p id="depositmax">최대 : 무제한</p>
								<b>0</b> <input id="hj_deposit_slider" type="text" class="span2" />
								<b>무제한</b>
							</div>
						</div>

						<div id="hj_slider_purchase" style="display: none;">
							<div class="hj_slider_elements">
								<h5 style="margin-right: 10%;">매매가</h5>
								<p id="purchasemin" style="float: left">최소 : 0 만원 ,</p>
								<p id="purchasemax">최대 : 무제한</p>
								<b>0</b> <input id="hj_purchase_slider" type="text"
									class="span2" /> <b>무제한</b>
							</div>
						</div>
					</div>
					<!-- hj_slider -->




					<hr style="both: clear;">
					<div id="hj_slider"
						style="padding-left: 8%; margin-top: 1px solid gray">
						<div class="hj_slider_elements">
							<h5 style="margin-right: 5%;">방크기(전용면적)</h5>
							<p id="areamin" style="float: left">최소 : 0 평 ,</p>
							<p id="areamax">최대 : 무제한</p>
							<b>0</b><input id="hj_area_slider" type="text"
								data-slider-value="[0, 100]" data-slider-ticks="[0, 50, 100]"
								data-slider-lock-to-ticks="true" /><b>무제한</b>
						</div>
					</div>
					<hr>
					<div class="row" id="hj_realtyOption">
						<!-- 1열 -->
						<div class="col" id="hj_options">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkEv"
									class="custom-control-input" name="elevator" value=1 /> <label
									class="custom-control-label" for="hj-checkEv">엘리베이터</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkPet"
									class="custom-control-input" name="allowance_pet" value=1 /> <label
									class="custom-control-label" for="hj-checkPet">반려동물가능</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkParking"
									class="custom-control-input" name="parking_lot" value=1 /> <label
									class="custom-control-label" for="hj-checkParking">주차공간</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkBidet"
									class="custom-control-input" name="bidet" value=1 /> <label
									class="custom-control-label" for="hj-checkBidet">비데</label>
							</div>
						</div>
						<!-- 2열 -->
						<div class="col" id="hj_options">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkBuiltin"
									class="custom-control-input" name="builtin" value=1 /> <label
									class="custom-control-label" for="hj-checkBuiltin">빌트인</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkBed"
									class="custom-control-input" name="bed" value=1 /> <label
									class="custom-control-label" for="hj-checkBed">침대</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkDesk"
									class="custom-control-input" name="desk" value=1 /> <label
									class="custom-control-label" for="hj-checkDesk">책상</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkAircond"
									class="custom-control-input" name="airconditioner" value=1 />
								<label class="custom-control-label" for="hj-checkAircond">에어컨</label>
							</div>
						</div>
						<!-- 3열 -->
						<div class="col" id="hj_options">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkBalcony"
									class="custom-control-input" name="balcony" value=1 /> <label
									class="custom-control-label" for="hj-checkBalcony">베란다/발코니</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkLoan"
									class="custom-control-input" name="loan_availability" value=1 />
								<label class="custom-control-label" for="hj-checkLoan">전세자금대출</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkTV"
									class="custom-control-input" name="tv" value=1 /> <label
									class="custom-control-label" for="hj-checkTV">TV</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkInduction"
									class="custom-control-input" name="induction" value=1 /> <label
									class="custom-control-label" for="hj-checkInduction">인덕션</label>
							</div>
						</div>
						<!-- 4열 -->
						<div class="col" id="hj_options">
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkDoor"
									class="custom-control-input" name="door_lock" value=1 /> <label
									class="custom-control-label" for="hj-checkDoor">전자도어락</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkMicroWave"
									class="custom-control-input" name="microwave" value=1 /> <label
									class="custom-control-label" for="hj-checkMicroWave">전자레인지</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkRefrigerator"
									class="custom-control-input" name="refrigerator" value=1 /> <label
									class="custom-control-label" for="hj-checkRefrigerator">냉장고</label>
							</div>
							<div class="custom-control custom-checkbox">
								<input type="checkbox" id="hj-checkLaundry"
									class="custom-control-input" name="laundry_machine" value=1 />
								<label class="custom-control-label" for="hj-checkLaundry">세탁기</label>
							</div>
						</div>
					</div>
					<hr>
					<div id="hj_filter_setting" border-top: 1pxsolidgray; padding-top:1%;>
						<div style="float: left; margin-right: 2%;">
							<button type="button" onClick=doFiltering(); id="hj_btn_submit"
								class="btn btn-success"returnfalse;>검색</button>
						</div>
						<div>
							<button type="button" onClick=doUnchecked(); id="hj_btn_submit"
								class="btn btn-success"returnfalse;>초기화</button>
						</div>
					</div>
				</div>


				<!-- 필터 -->

			</div>
			<!-- 안보이는거 -->
		</div>
		<!-- row -->

		<div class="row" id="hj_map">
			<div class="col-lg" style="padding-right: 0px; padding-left: 0;">
				<div id="map" style="width: 100%; min-height: 100%; height: 900px;"></div>

			</div>
			<!-- 지도를 표시할 div -->

			<div class="col-lg" id="hj_list"
				style="background-color: #EEEEEE; text-align: center; padding-left: 0; padding-right: 0; max-width: 30%; min-width: 400px;">
				<div id="hj_jsonLength"></div>
				<br>

				<div id="hj_housediv"
					style="width: 100%; height: 900px; overflow: auto;">

					<div id="house">
						<div id="hj_houseImages"></div>
						<div id="hj_houseDetail"></div>
					</div>
				</div>
			</div>
			<!-- "검색된 갯수 col-md-3" -->
		</div>
		<!-- row -->
	</div>
	<!-- container -->



	<script type="text/javascript">
		var areaMinval = 0;
		var areaMaxval = 100;
		var depositMinval = 0;
		var depositMaxval = 1000000000;
		var monthlyMinval = 0;
		var monthlyMaxval = 5000000;
		var purchaseMinval = 0;
		var purchaseMaxval = 1500000000;

		var areaSlider = new Slider("#hj_area_slider", {
			id : "hj_area_slider"
		});

		var depositSlider = new Slider("#hj_deposit_slider", {
			id : "hj_deposit_slider",
			min : 0,
			max : 1000000000,
			step : 10000000,
			range : true,
			value : [ 1, 1000000000 ]
		});
		var monthlySlider = new Slider("#hj_monthly_slider", {
			id : "hj_monthly_slider",
			min : 0,
			max : 5000000,
			step : 50000,
			range : true,
			value : [ 0, 5000000 ]
		});
		var purchaseSlider = new Slider("#hj_purchase_slider", {
			id : "hj_purchase_slider",
			min : 0,
			max : 1500000000,
			step : 10000000,
			range : true,
			value : [ 0, 1500000000 ]
		});
		depositSlider
				.on(
						"slide",
						function(sliderValue) {
							var value = document.getElementById("depositmin").textContent = sliderValue;
							depositMinval = value[0];
							depositMaxval = value[1];
							var minval = value[0] / 10000;
							var maxval = value[1] / 10000;
							if (minval < 10000) {
								minval += " 만원";
							} else {
								minval = minval / 10000 + " 억";
							}
							if (maxval < 10000) {
								maxval += " 만원";
							} else if (maxval == 100000) {
								maxval = "무제한"
							} else {
								maxval = maxval / 10000 + " 억";
							}

							if (minval == 0) {
								minval = 0;
							}

							$("#depositmin").html("최소 : " + minval + ", ");
							//$("#hj_jsonLength").html(jsonLength)
							$("#depositmax").html("최대 :" + maxval);
						});
		monthlySlider
				.on(
						"slide",
						function(sliderValue) {
							var value = document.getElementById("monthlymin").textContent = sliderValue;
							monthlyMinval = value[0];
							monthlyMaxval = value[1];
							var minval = value[0] / 10000;
							var maxval = value[1] / 10000;
							if (minval < 10000) {
								minval += " 만원";
							} else {
								minval = minval / 10000 + " 억";
							}
							if (maxval < 500) {
								maxval += " 만원";
							} else if (maxval == 500) {
								maxval = "무제한";
							} else {
								maxval = maxval / 10000 + " 억";
							}
							if (minval == 0) {
								minval = 0;
							}
							$("#monthlymin").html("최소 : " + minval + ", ");
							//$("#hj_jsonLength").html(jsonLength)
							$("#monthlymax").html("최대 :" + maxval);
						});
		purchaseSlider
				.on(
						"slide",
						function(sliderValue) {
							var value = document.getElementById("purchasemin").textContent = sliderValue;
							var minval = value[0] / 10000;
							var maxval = value[1] / 10000;
							purchaseMinval = value[0];
							purchaseMaxval = value[1];
							if (minval < 10000) {
								minval += " 만원";
							} else {
								minval = minval / 10000 + " 억";
							}
							if (maxval < 10000) {
								maxval += " 만원";
							} else if (maxval == 150000) {
								maxval = "무제한"
							} else {
								maxval = maxval / 10000 + " 억";
							}
							if (minval == 0) {
								minval = 0;
							}

							$("#purchasemin").html("최소 : " + minval + ", ");
							//$("#hj_jsonLength").html(jsonLength)
							$("#purchasemax").html("최대 :" + maxval);
						});
		areaSlider
				.on(
						"slide",
						function(sliderValue) {
							var value = document.getElementById("areamin").textContext = sliderValue;

							areaMinval = value[0];
							areaMaxval = value[1];
							var minval = value[0];
							var maxval = value[1];
							if (maxval == 100) {
								maxval = "무제한";
								$("#areamax").html("최대 :" + maxval);
							} else {
								$("#areamax").html("최대 :" + maxval + " 평");
							}
							$("#areamin").html("최소 : " + minval + " 평, ");
							//$("#hj_jsonLength").html(jsonLength)
						});

		//다음 지도 스크립트 

		var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
		mapOption = {
			center : new daum.maps.LatLng(37.53901168181422, 126.9876894417558), // 지도의 중심좌표
			level : 8
		// 지도의 확대 레벨
		};

		var map = new daum.maps.Map(mapContainer, mapOption); // 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다

		//역으로 검색
		function view(data) {
			$("#js_subway").hide();
			var addr = data;
			var geocoder = new daum.maps.services.Geocoder();
			// 주소로 좌표를 검색합니다
			geocoder.addressSearch(addr,
					function(result, status) {
						// 정상적으로 검색이 완료됐으면 
						if (status === daum.maps.services.Status.OK) {
							var coords = new daum.maps.LatLng(result[0].y,
									result[0].x);
							// 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
							map.setCenter(coords);
							map.setLevel(4);
							getList();
						}
					});
		}

		daum.maps.event.addListener(map, 'dragend', function() { //지도 드래그할때 작동       	
			getList();
		});

		daum.maps.event.addListener(map, 'zoom_changed', function() { //지도 축소,확대시 작동
			getList();
		});

		var clusterer = new daum.maps.MarkerClusterer({
			map : map, // 마커들을 클러스터로 관리하고 표시할 지도 객체 
			averageCenter : true, // 클러스터에 포함된 마커들의 평균 위치를 클러스터 마커 위치로 설정 
			minLevel : 6,
			minClusterSize : 3
		// 클러스터 할 최소 지도 레벨 	
		});

		function doFiltering() {
			$("#hj_filter").hide();
			$("#hj_map").show();
			getList();
		}
		function doUnchecked() {
			var inputs = document.getElementsByTagName("input");
			for (var x = 0; x < inputs.length; x++) {
				if (inputs[x].type == 'checkbox') {
					inputs[x].checked = false;
				}
				//<input id="hj_area_slider" type="text"
				//	data-slider-value="[0, 100]" data-slider-ticks="[0, 50, 100]"h
				//	data-slider-lock-to-ticks="true" /><b>무제한</b>
			}
			
			$('#hj_slider_deposit').hide();

			$('#hj_slider_month').hide();

			$('#hj_slider_purchase').hide();

			//$("hj_area_slider").slider('refresh');
			getList();
		}

		function goSearch() {
			var a = $("#hj_keyword").val();

			var ps = new daum.maps.services.Places();

			// 키워드로 장소를 검색합니다
			ps.keywordSearch(a, placesSearchCB);

			function placesSearchCB(data, status, pagination) {
				if (status === daum.maps.services.Status.OK) {

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정하기위해
					// LatLngBounds 객체에 좌표를 추가합니다
					var bounds = new daum.maps.LatLngBounds();

					for (var i = 0; i < data.length; i++) {
						bounds
								.extend(new daum.maps.LatLng(data[i].y,
										data[i].x));
					}

					// 검색된 장소 위치를 기준으로 지도 범위를 재설정합니다
					map.setBounds(bounds);
				}
			}
		}

		function getList() {
			var oneroom = "toto";
			var tworoom = "toto";
			var threeroom = "toto";
			var officetel = "toto";
			var apartment = "toto";
			var monthly_lease = "toto";
			var payback_deposit_lease = "toto";
			var purchase = "toto";
			var monthmin = monthlyMinval;
			var monthmax = monthlyMaxval;
			var depositmin = depositMinval;
			var depositmax = depositMaxval;
			var purchasemin = purchaseMinval;
			var purchasemax = purchaseMaxval;
			var areamin = areaMinval;
			var areamax = areaMaxval;

			var elevator = 0;
			var allowance_pet = 0;
			var parking_lot = 0;
			var bidet = 0;
			var builtin = 0;
			var bed = 0;
			var desk = 0;
			var airconditioner = 0;
			var balcony = 0;
			var loan_availability = 0;
			var tv = 0;
			var induction = 0;
			var door_lock = 0;
			var microwave = 0;
			var refrigerator = 0;
			var laundry_machine = 0;

			if ($('input[name="oneroom"]').is(':checked')) {
				oneroom = $("input[name='oneroom']:checked").val();
			} else {
				oneroom = "toto";
			}
			if ($('input[name="tworoom"]').is(':checked')) {
				tworoom = $("input[name='tworoom']:checked").val();
			} else {
				tworoom = "toto";
			}
			if ($('input[name="threeroom"]').is(':checked')) {
				threeroom = $("input[name='threeroom']:checked").val();
			} else {
				threeroom = "toto";
			}
			if ($('input[name="apartment"]').is(':checked')) {
				apartment = $("input[name='apartment']:checked").val();
			} else {
				apartment = "toto";
			}
			if ($('input[name="officetel"]').is(':checked')) {
				officetel = $("input[name='officetel']:checked").val();
			} else {
				officetel = "toto";
			}
			if ($('input[name="monthly_lease"]').is(':checked')) {

				monthmin = monthlyMinval;
				monthmax = monthlyMaxval;
			} else {
				monthmax = 0;
			}
			if ($('input[name="payback_deposit_lease"]').is(':checked')) {
				depositmin = depositMinval;
				depositmax = depositMaxval;
			} else {
				depositmax = 0;
			}
			if ($('input[name="purchase"]').is(':checked')) {
				purchasemin = purchaseMinval;
				purchasemax = purchaseMaxval;
			} else {
				purchasemax = 0;
			}
			if ($('input[name="elevator"]').is(':checked')) {
				elevator = 1;
			} else {
				elevator = 0;
			}
			if ($('input[name="allowance_pet"]').is(':checked')) {
				allowance_pet = 1;
			} else {
				allowance_pet = 0;
			}
			if ($('input[name="parking_lot"]').is(':checked')) {
				parking_lot = 1;
			} else {
				parking_lot = 0;
			}
			if ($('input[name="bidet"]').is(':checked')) {
				bidet = 1;
			} else {
				bidet = 0;
			}
			if ($('input[name="builtin"]').is(':checked')) {
				builtin = 1;
			} else {
				builtin = 0;
			}
			if ($('input[name="bed"]').is(':checked')) {
				bed = 1;
			} else {
				bed = 0;
			}
			if ($('input[name="desk"]').is(':checked')) {
				desk = 1;
			} else {
				desk = 0;
			}
			if ($('input[name="airconditioner"]').is(':checked')) {
				airconditioner = 1;
			} else {
				airconditioner = 0;
			}
			if ($('input[name="balcony"]').is(':checked')) {
				balcony = 1;
			} else {
				balcony = 0;
			}
			if ($('input[name="loan_availability"]').is(':checked')) {
				loan_availability = 1;
			} else {
				loan_availability = 0;
			}
			if ($('input[name="tv"]').is(':checked')) {
				tv = 1;
			} else {
				tv = 0;
			}
			if ($('input[name="induction"]').is(':checked')) {
				induction = 1;
			} else {
				induction = 0;
			}
			if ($('input[name="door_lock"]').is(':checked')) {
				door_lock = 1;
			} else {
				door_lock = 0;
			}
			if ($('input[name="microwave"]').is(':checked')) {
				microwave = 1;
			} else {
				microwave = 0;
			}
			if ($('input[name="refrigerator"]').is(':checked')) {
				refrigerator = 1;
			} else {
				refrigerator = 0;
			}
			if ($('input[name="laundry_machine"]').is(':checked')) {
				laundry_machine = 1;
			} else {
				laundry_machine = 0;
			}

			var image = "";
			$
					.ajax({
						url : "rlist.do",
						type : "post",
						dataType : "json",
						data : {
							oneroom : oneroom,
							tworoom : tworoom,
							threeroom : threeroom,
							officetel : officetel,
							apartment : apartment,
							min_monthly : monthmin,
							max_monthly : monthmax,
							min_payback : depositmin,
							max_payback : depositmax,
							min_purchase : purchasemin,
							max_purchase : purchasemax,
							min_area : areamin,
							max_area : areamax,
							elevator : elevator,
							allowance_pet : allowance_pet,
							parking_lot : parking_lot,
							bidet : bidet,
							builtin : builtin,
							bed : bed,
							desk : desk,
							airconditioner : airconditioner,
							balcony : balcony,
							loan_availability : loan_availability,
							tv : tv,
							induction : induction,
							door_lock : door_lock,
							microwave : microwave,
							refrigerator : refrigerator,
							laundry_machine : laundry_machine
						},
						success : function(data) {
							clusterer.clear();
							var realtyArr = new Array();
							var count = 0;
							var realty = "";
							var jsonStr = JSON.stringify(data);
							var json = JSON.parse(jsonStr);
							for ( var i in json) {

								var a = json[i].realty_status;
								if (a != "완전삭제" && a != "숨기기" && a != "삭제"
										&& a != "검수중" && a != "수정완료") {
									marking(i);
								} else {
									count++;
								}
							}//for
							function marking(param) {
								var bounds = map.getBounds();
								var swLatlng = bounds.getSouthWest();
								// 영역정보의 북동쪽 정보를 얻어옵니다 
								var neLatlng = bounds.getNorthEast();

								var x1 = swLatlng.getLat(); //남서쪽 위도 
								var y1 = swLatlng.getLng(); //남서쪽 경도

								var x2 = neLatlng.getLat(); // 북동쪽 위도
								var y2 = neLatlng.getLng(); // 북동족 경도

								var geocoder = new daum.maps.services.Geocoder(); //주소변환객체 생성
								//콜백 루틴 
								geocoder
										.addressSearch(
												json[i].road_address,
												function(result, status) {
													count++;
													if (status === daum.maps.services.Status.OK) {// 정상적으로 검색이 완료됐으면
														var arr = new Array();
														var coords = new daum.maps.LatLng(
																result[0].y,
																result[0].x);
														var x = coords.getLat(); //매물 위도
														var y = coords.getLng();//매물 경도
														if (((x1 < x) && (y1 < y))
																&& ((x < x2) && (y < y2))) {
															realtyArr
																	.push(json[param]);

															// 데이터에서 좌표 값을 가지고 마커를 표시합니다
															// 마커 클러스터러로 관리할 마커 객체는 생성할 때 지도 객체를 설정하지 않습니다
															var markers = $(
																	data.positions)
																	.map(
																			function(
																					param,
																					position) {
																				return new daum.maps.Marker(
																						{
																							position : new daum.maps.LatLng(
																									coords.lat,
																									coords.lng)
																						});
																			});

															var marker = new daum.maps.Marker(
																	{
																		map : map, // 마커를 표시할 지도
																		position : coords
																	}); //marker 
															daum.maps.event
																	.addListener(
																			marker,
																			'click',
																			function() {

																				ttt(json[param].realty_no);
																			});

															// 클러스터러에 마커들을 추가합니다
															clusterer
																	.addMarker(marker);
														}//if(좌표계산)
													}//if()
													if (count == (json.length)) {
														setRealtyList(realtyArr);
													}
												});//geocoder.addressSearch
							}//marking

							function setRealtyList(param) {
								var values = "";
								var pvalues = "";
								var payment = "";
								var charge;
								var calcharge = "";
								var length = param.length;
								var jsonLength = "<div style='background-color: white; width: 100%; height: 50px; padding-top: 10px; border-top: 1px solid #D5D5D5; color: #343a40; font-family: a고딕15; font-size: 16pt;'>"
										+ "조건에 맞는 방 " + length + " 개 </div>";
								if (json != null) {
									for ( var j in param) {
										if (param[j].premium == 'Y') {
											if (monthmax == 0
													&& depositmax == 0
													&& purchasemax == 0) {
												if (param[j].month_lease > 0) {
													payment = "월세 ";
													charge = param[j].deposit / 10000;
													charge += " / ";
													charge += param[j].month_lease / 10000;
												} //noncheck month
												else if (param[j].payback_deposit_lease > 0) {
													payment = "전세";
													if (param[j].payback_deposit_lease / 100000000 > 1) {
														charge = param[j].payback_deposit_lease / 100000000;
														charge += " 억";
													} else {
														charge = param[j].payback_deposit_lease / 10000;
														charge += "만";
													}
												} else if (param[j].purchase > 0) {
													payment = "매매 ";
													charge = param[j].purchase / 100000000
													charge += "억";

												}
												if (param[j].realty_image1 != null) {
													image = param[j].realty_image1;
												} else {
													image = sample.png;
												}
											} else { /*non check if*/
												if (monthmax != 0
														&& param[j].month_lease > 0) {
													payment = "월세 ";
													charge = param[j].deposit / 10000;
													charge += " / ";
													charge += param[j].month_lease / 10000;
												}
												if (depositmax != 0
														&& param[j].payback_deposit_lease > 0) {
													payment = "전세";
													if (param[j].payback_deposit_lease / 100000000 > 1) {
														charge = param[j].payback_deposit_lease / 100000000;
														charge += " 억";
													} else {
														charge = param[j].payback_deposit_lease / 10000;
														charge += "만";
													}
												}
												if (purchasemax != 0
														&& param[j].purchase > 0) {
													payment = "매매 ";
													charge = param[j].purchase / 100000000
													charge += "억";
												}
												if (param[j].realty_image1 != null) {
													image = param[j].realty_image1;
												} else {
													image = sample.png;
												}
											} //checked if
											pvalues += "<div class='house' id='hj_house"
													+ param[j].realty_no
													+ "' style='cursor: pointer; border:solid 3px #61c0bf;' onClick=abcd("
													+ param[j].realty_no
													+ ")>"
													+ "<div class='row'  style='background-color:#61c0bf; text-align: right; width:100%; margin:0 auto; padding: 1%;'><i class='fas fa-award' style='padding: 1%; color:white; width:100%; margin-right:10px'> Premium</i></div>"
													+ "<div id='hj_houseImages' >"
													+ "<img class='d-block' src='${pageContext.request.contextPath }/files/realty/realtyNormalImages/"
								+image
								+"'/>"

													+ "</div>"
													+ "<div id='hj_houseDetail'>"
													//+ "<a href=rdetail.do?realty_no="
													//+ param[j].realty_no
													//+ ">"
													+ "<h4 id='hj_h4' style='color:rgb(97, 192, 191);'>"
													+ payment
													+ "  "
													+ charge
													+ "</h4>"
													//+ "</a>"
													+ "<h6>"
													+ param[j].residential
													+ "㎥"
													+ "ㆍ"
													+ param[j].realty_layers
													+ "층</h6>"
													+ "<h6 id='hj_h6_a'>"
													+ param[j].road_address
													+ "</h6>"
													+ "<p id='hj_detail_title'>"
													+ param[j].realty_detail_title
													+ "</p>"
													+ "</div></div></a>";
										} /*premium if*/
										else {
											if (monthmax == 0
													&& depositmax == 0
													&& purchasemax == 0) {
												if (param[j].month_lease > 0) {
													payment = "월세 ";
													charge = param[j].deposit / 10000;
													charge += " / ";
													charge += param[j].month_lease / 10000;
												} //noncheck month
												else if (param[j].payback_deposit_lease > 0) {
													payment = "전세";
													if (param[j].payback_deposit_lease / 100000000 > 1) {
														charge = param[j].payback_deposit_lease / 100000000;
														charge += " 억";
													} else {
														charge = param[j].payback_deposit_lease / 10000;
														charge += "만";
													}
												} else if (param[j].purchase > 0) {
													payment = "매매 ";
													charge = param[j].purchase / 100000000
													charge += "억";

												}
												if (param[j].realty_image1 != null) {
													image = param[j].realty_image1;
												} else {
													image = sample.png;
												}

											} else { /*non check if*/
												if (monthmax != 0
														&& param[j].month_lease > 0) {
													payment = "월세 ";
													charge = param[j].deposit / 10000;
													charge += " / ";
													charge += param[j].month_lease / 10000;
												}
												if (depositmax != 0
														&& param[j].payback_deposit_lease > 0) {
													payment = "전세";
													if (param[j].payback_deposit_lease / 100000000 > 1) {
														charge = param[j].payback_deposit_lease / 100000000;
														charge += " 억";
													} else {
														charge = param[j].payback_deposit_lease / 10000;
														charge += "만";
													}
												}
												if (purchasemax != 0
														&& param[j].purchase > 0) {
													payment = "매매 ";
													charge = param[j].purchase / 100000000
													charge += "억";
												}
												if (param[j].realty_image1 != null) {
													image = param[j].realty_image1;
												} else {
													image = sample.png;
												}
											} //checked if
											values += "<div class='house' id='hj_house"
													+ param[j].realty_no
													+ "' style='cursor: pointer; border:solid 3px #61c0bf; height:180px;' onClick=abcd("
													+ param[j].realty_no
													+ ")><div id='hj_houseImages'>"
													+ "<img class='d-block' style='padding-top:1%; height:135px; margin-top:2%' src='${pageContext.request.contextPath }/files/realty/realtyNormalImages/"
													+ image
													+ "'/>"
													+ "</div>"
													+ "<div id='hj_houseDetail'>"
													//+ "<a href=rdetail.do?realty_no="
													//+ param[j].realty_no
													//+ ">"
													+ "<h4 id='hj_h4' style='color:rgb(97, 192, 191);'>"
													+ payment
													+ "  "
													+ charge
													+ "</h4>"
													//+ "</a>"
													+ "<h6>"
													+ param[j].residential
													+ "㎥"
													+ "ㆍ"
													+ param[j].realty_layers
													+ "층</h6>"
													+ "<h6 id='hj_h6_a'>"
													+ param[j].road_address
													+ "</h6>"
													+ "<p id='hj_detail_title'>"
													+ param[j].realty_detail_title
													+ "</p>" + "</div></div>";
										}//not premium if
									} //for
									pvalues += values;
									$("#hj_housediv").html(pvalues);
									$("#hj_jsonLength").html(jsonLength)
								}// if json != null
								else { // 조회된 결과가 없을때
									$("#hj_housediv").html("");
									$("#hj_jsonLength")
											.html(
													"<div style='background-color: white; width: 100%; height: 50px; padding-top: 10px; border-top: 1px solid #D5D5D5; color: #343a40; font-family: a고딕15; font-size: 16pt;'>"
															+ "조회된 결과가 없습니다"
															+ "</div>");
								}
							}//list func

						}//success
					});//ajax
		}//func
		function abcd(realtyno) {
			location.href = "rdetail.do?realty_no=" + realtyno;
		}
		function ttt(b) {
			$("#hj_housediv").scrollTop(0);

			var houseid = 'hj_house';
			houseid += b;

			var objsh = document.getElementById("hj_housediv");
			var sh = objsh.scrolltop = objsh.scrollHeight; //div 의  scroll 전체값;
			var rp = $("#" + houseid).offset();
			//console.log("div 전체 scroll value : " + sh);
			//console.log("선택한 div의 위치값(position,top) : " + rp.top);

			$("#hj_housediv").animate({scrollTop : (rp.top) - 500}, 1);

			//------------------------------------------------------------- 하이라이트 on/off	

			var t = $("#" + houseid).css("box-shadow");

			var house = document.getElementsByClassName("house");

			for (var x = 0; x < house.length; x++) {

				var id = $("#" + house[x].id).css("box-shadow");
				if (id != "3px solid rgb(97, 192, 191)") {
					$("#" + house[x].id).css("box-shadow",
							"0px 0px 0px 0px #ffffff");
				}
			}

			if (t != "5px 5px 8px 0px #6c757d") {
				$("#" + houseid).css("box-shadow", "5px 5px 8px 0px #6c757d");
			} else {
				$("#" + houseid).css("box-shadow", "0px 0px 0px 0px #ffffff");
			}
			//-------------------------------------------------------------

		}
	</script>
	<script
		src="${pageContext.request.contextPath }/resources/js/jquery.rwdImageMaps.min.js"></script>
</body>
</html>