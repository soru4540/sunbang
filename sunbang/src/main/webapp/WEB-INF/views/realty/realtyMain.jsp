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
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript"
	src="//dapi.kakao.com/v2/maps/sdk.js?appkey=55d7db7b289215b9986b37fed37910b7&libraries=services,clusterer,drawing"></script>

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

.dropdown {
	width: auto;
	height: auto;
	float: left;
	margin-right:5px;
}

#hj_search_row {
	margin: 8px;
}
b {
margin-left:10px;
margin-right:10px;
}
#hj_deposit_slider .slider-selection, #hj_monthly_slider .slider-selection, #hj_purchase_slider .slider-selection{
			background: #61c0bf;
}
</style>

<script type="text/javascript">
$(document).ready(function() {
	changed();
	ajax();
 	$('.dropdown-toggle').on('click', function (e) {
		$(this).next().toggle();
	}); 
	$('.dropdown-menu.keep-open').on('click', function (e) {
		e.stopPropagation();          
	});
});//ready




</script>





</head>
<body>

	<c:import url="../common/realtyHeader.jsp"></c:import>


	<div class="container-fluid">

		<div class="row" id="hj_row1">
			<div class="col-md-12">
				<div class="row" id="hj_search_row">
					<div class="col-md-2">
						<div class="form-group has-search">
							<span class="fa fa-search form-control-feedback"></span> 
							<input type="text" class="form-control" placeholder="강남구 역삼역"  style="width: 100%;">
						</div>
					</div>
					<div class="col-md-10">
						<div class="dropdown">
							<div class="btn-group" id="hj_btn-group">
								<button id="hj_btn" type="button" id="hj_btn"
									class="btn btn-success dropdown-toggle no-border"
									data-toggle="dropdown" id="dropdownMenuButton"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">원룸,투ㆍ쓰리룸,오피스텔</button>
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
										<li>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" id="hj-checkbox4"
													class="custom-control-input" /> <label
													class="custom-control-label" for="hj-checkbox4">아파트</label>
											</div>
										</li>
								</ul>		
							</div> <!-- 방종류 -->
							</div>
							<div class="dropdown">
							<div class="btn-group" id="hj_btn-group">
								<button id="hj_btn" type="button" id="hj_btn"
									class="btn btn-success dropdown-toggle no-border"
									data-toggle="dropdown" id="dropdownMenuButton_1"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">월,전세/매매</button>
								<ul class="dropdown-menu" id="hj_dropdownmenu"
									aria-labelledby="dropdownMenuButton_1">
									<div style="padding-left: 8%;">
										<h4 style="margin-top: 20px;">매물 종류</h4>
										<p style="color: gray;">중복선택 가능</p>
									</div>
										<div>
										<li>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" id="hj-checkbox5"
													class="custom-control-input" /> <label
													class="custom-control-label" for="hj-checkbox5">월세</label>
											</div>
										</li>
										<li>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" id="hj-checkbox6"
													class="custom-control-input" /> <label
													class="custom-control-label" for="hj-checkbox6">전세</label>
											</div>
										</li>
										<li>
											<div class="custom-control custom-checkbox">
												<input type="checkbox" id="hj-checkbox7"
													class="custom-control-input" /> <label
													class="custom-control-label" for="hj-checkbox5">매매</label>
											</div>
										</li>
										
								</ul>		
							</div>
							</div>
							<div class="dropdown">
							<div class="btn-group" id="hj_btn-group">
								<button id="hj_btn" type="button"
									class="btn btn-success no-border dropdown-toggle"
									data-toggle="dropdown" id="dropdownMenuButton_1"
									data-toggle="dropdown" aria-haspopup="true"
									aria-expanded="false">가격대</button>
								<ul class="dropdown-menu" id="hj_dropdownmenu"
									aria-labelledby="dropdownMenuButton_1" style="width:450px	; height:auto; padding:30%;">
										<li>
											<div>
											<h5 style="float:left; margin-right:10%;">보증금/전세가</h5>
											<p id="depositmin" style="float:left">최소 : 0 만원 , </p>
											<p id="depositmax">최대 : 무제한</p>
											</div>
											<b>0</b> <input id="hj_deposit_slider" type="text" class="span2"/> <b>무제한</b>
										</li>
										<hr>
										<li>
											<h5 style="float:left; margin-right:10%;">월세</h5>
											<p id="monthlymin" style="float:left">최소 : 0 만원 , </p>
											<p id="monthlymax">최대 : 무제한</p>
											<b>0</b> <input id="hj_monthly_slider" type="text" class="span2"/> <b>무제한</b>
										</li>
										<hr>
										<li>
											<h5 style="float:left; margin-right:10%;">매매가</h5>
											<p id="purchasemin" style="float:left">최소 : 0 만원 , </p>
											<p id="purchasemax">최대 : 무제한</p>
											<b>0</b> <input id="hj_purchase_slider" type="text" class="span2"/> <b>무제한</b>
										</li>
								</ul>		
							</div>
							</div>
							
						</div>
					</div>
				</div>
			</div>
		</div>
		<script type="text/javascript">
		var depositSlider = new Slider("#hj_deposit_slider", { id: "hj_deposit_slider", min: 0, max: 1000000000, step:10000000 ,range: true, value: [1, 1000000000] });
		var monthlySlider = new Slider("#hj_monthly_slider", {id: "hj_monthly_slider", min : 0 , max: 5000000, step:50000, range : true, value:[0,5000000]});
		var purchaseSlider = new Slider("#hj_purchase_slider", {id: "hj_purchase_slider", min : 0, max: 1500000000, step:10000000, range : true, value:[0,1500000000]});
		depositSlider.on("slide", function(sliderValue) {
			var value = document.getElementById("depositmin").textContent = sliderValue;
			var minval = value[0]/10000;
			var maxval = value[1]/10000;
			if(minval < 10000) {
				minval += " 만원";	
			}
			else {
				minval = minval/10000 + " 억";
			}
			if(maxval < 10000) {
				maxval += " 만원";	
			}else if(maxval == 100000) {
				maxval = "무제한"
			}else {
				maxval = maxval/10000 + " 억";
			}
			
			if(minval == 0) {
				minval = 0;
			}
			
			
			
			$("#depositmin").html("최소 : "+minval + ", ");
			//$("#hj_jsonLength").html(jsonLength)
			$("#depositmax").html("최대 :" +maxval);
		});
		monthlySlider.on("slide", function(sliderValue) {
			var value = document.getElementById("monthlymin").textContent = sliderValue;
			var minval = value[0]/10000;
			var maxval = value[1]/10000;
			if(minval < 10000) {
				minval += " 만원";	
			}
			else {
				minval = minval/10000 + " 억";
			}
			if(maxval < 500) {
				maxval += " 만원";	
			}else if(maxval == 500) {
				maxval = "무제한";
			}else {
				maxval = maxval/10000 + " 억";
			}
			if(minval == 0) {
				minval = 0;
			}
			$("#monthlymin").html("최소 : "+minval + ", ");
			//$("#hj_jsonLength").html(jsonLength)
			$("#monthlymax").html("최대 :" +maxval);
		});
		purchaseSlider.on("slide", function(sliderValue) {
			var value = document.getElementById("purchasemin").textContent = sliderValue;
			var minval = value[0]/10000;
			var maxval = value[1]/10000;
			if(minval < 10000) {
				minval += " 만원";	
			}
			else {
				minval = minval/10000 + " 억";
			}
			if(maxval < 10000) {
				maxval += " 만원";	
			}else if(maxval == 150000) {
				maxval = "무제한"
			}else {
				maxval = maxval/10000 + " 억";
			}
			if(minval == 0) {
				minval = 0;
			}
			
			
			$("#purchasemin").html("최소 : "+minval + ", ");
			//$("#hj_jsonLength").html(jsonLength)
			$("#purchasemax").html("최대 :" +maxval);
		});
		
		</script>
		

		<div class="row">
			<div class="col-md-9" style="padding-right: 0px; padding-left: 0;">
				<div id="map" style="width: 100%; height: 800px;"></div>

			</div>
			<!-- 지도를 표시할 div -->

			<script>
				var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
			    mapOption = { 
			        center: new daum.maps.LatLng(37.56572628005628, 126.98773032243167), // 지도의 중심좌표
			        level: 8 // 지도의 확대 레벨
			    };

					// 지도를 표시할 div와  지도 옵션으로  지도를 생성합니다
					var map = new daum.maps.Map(mapContainer, mapOption);
					
					
					function markerFilter(a,b) {
						var address = a;
						var realty_no = b;
						var geocoder = new daum.maps.services.Geocoder(); //주소변환객체 생성
						var bounds = map.getBounds();
						
						    // 영역정보의 남서쪽 정보를 얻어옵니다 
						    var swLatlng = bounds.getSouthWest();
						    
						    // 영역정보의 북동쪽 정보를 얻어옵니다 
						    var neLatlng = bounds.getNorthEast();
						    
						    var x1 = swLatlng.getLat(); //남서쪽 위도 
						    var y1 = swLatlng.getLng(); //남서쪽 경도
						    
						    var x2 = neLatlng.getLat(); // 북동쪽 위도
						    var y2 = neLatlng.getLng(); // 북동족 경도 
						    
						    geocoder.addressSearch(address, function(result, status) { 
						    // 정상적으로 검색이 완료됐으면 
						     if (status === daum.maps.services.Status.OK) {
						    	 var coords = new daum.maps.LatLng(result[0].y, result[0].x);
						    	
						    	 var x = coords.getLat(); //매물 위도
							     var y = coords.getLng();//매물 경도
							 if((x1 < x)&&(x < x2) && (y1< y) && (y<y2)) {
									var marker = setMarker(coords);
									if(marker == 1) {
										realtyList(realty_no);
								 }
							   }// if
							   else {

							    	ajax();
							    }
						    }//매물 주소검색 if
						    
						   
						});//geocoder
					}
					var list = new Array();
					function realtyList(a) { //리스트 출력을위해 세션에저장						
						realty_no = a;
						list.push(realty_no);
						sessionStorage.setItem("list",JSON.stringify(list));
						ajax();
					}
					
					function setMarker(coords){ //마커 생성하는 메서드
						var marker = new daum.maps.Marker({
				            map: map,
				            position: coords
				        });// 결과값으로 받은 위치를 마커로 표시합니다	
				            return 1;
					}//setMarker()
					
					daum.maps.event.addListener(map, 'dragend', function() { //지도 드래그할때 작동       
				    sessionStorage.removeItem("list");
					list = new Array();
					changed();
					ajax();
					});
					
					daum.maps.event.addListener(map, 'zoom_changed', function() { //지도 축소,확대시 작동
				    sessionStorage.removeItem("list");
					list = new Array();
					changed();
					ajax();
					});

					function changed() { //매물 리스트 조회
						<c:forEach items="${realtymain}" var="item">			
					   	  markerFilter("${item.land_lot}",${item.realty_no});
						</c:forEach>
						}
					
					
					function ajax() {
						
						var z = JSON.parse(sessionStorage.getItem("list"));
						if(z != null){
						var values ="";
							 $.ajax({
									url: "rlist.do",
									type:"post",
									contentType: "application/json; charset=utf-8",
									data:JSON.stringify(z),
									success:function(data){
										var jsonStr = JSON.stringify(data);
										var json = JSON.parse(jsonStr);
										var payment = "";
										var charge = "";
										var calcharge = "";
										var length =json.length;
										var jsonLength = "<div style='background-color: white; width: 100%; height: 50px; padding-top: 10px; border-top: 1px solid #D5D5D5; color: #343a40; font-family: a고딕15; font-size: 16pt;'>"
											+"조건에 맞는 방 " + length + " 개</div>";
										
										for(var i in json) {										
											
											if(json[i].month_lease > 0) {
												payment = "월세 ";										
												charge = json[i].deposit/10000;
												charge += " / ";
												charge += json[i].month_lease/10000 ;
												}
											if (json[i].PAYBACK_DEPOSIT_LEASE > 0) {
												payment = "전세 ";
												if(json[i].payback_deposit_lease/10000 > 10) {
													charge = json[i].payback_deposit_lease/10000 + "억";
												} else {
													charge = json[i].payback_deposit_lease/10000 + "만";
												}										
											}
											if (json[i].purchase > 0) {
												payment = "매매 ";
												charge = json[i].purchase/100000000 + ".";
												charge += json[i].purchase%100000000 + "억"	;
											}
											values +="<div id='house'> <div id='hj_houseImages'> <img class='d-block' src='${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png' /></div>"
											+ "<div id='hj_houseDetail'>"
											+ "<a href=rdetail.do?realty_no="+json[i].realty_no +">"+	"<h4>" + payment +"  "+ charge+ "</h4>" +"</a>"
											+	"<h6>" + json[i].residential + "㎥" + "ㆍ"+json[i].realty_layers + "층</h6>"
											+	"<h6>" +json[i].road_address + "</h6>"
											+ "<p style=color:gray;>" +json[i].realty_detail_title + "</p>"
											+"</div></div>"
											}//for
											
											
											
											
											$("#hj_housediv").html(values);
											$("#hj_jsonLength").html(jsonLength)
										}//success
										
								});//ajax		
							} else {
								$("#hj_housediv").html("");
								$("#hj_jsonLength").html("<div style='background-color: white; width: 100%; height: 50px; padding-top: 10px; border-top: 1px solid #D5D5D5; color: #343a40; font-family: a고딕15; font-size: 16pt;'>"
										+"조회된 결과가 없습니다" +"</div>");
							}
						 }
						
				</script>

			<div class="col-md-3" style="background-color: #EEEEEE; text-align: center; padding-left: 0; padding-right: 0;">
	 			<div id="hj_jsonLength"></div>
				<br>
				<div id="hj_housediv"
					style="width: 100%; height: 700px; overflow: auto;">
					<div id="house">
						<div id="hj_houseImages"></div>
						<div id="hj_houseDetail">
							<h1>조회된 결과가 없다 이말이야</h1>
						</div>
					</div>
				</div>
			</div>
		</div>
	<!-- container -->
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>