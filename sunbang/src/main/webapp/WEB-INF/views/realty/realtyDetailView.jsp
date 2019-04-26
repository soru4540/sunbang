<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<title>선방</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71150a085c893cb9531eb155dbf54998&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script type="text/javascript">
	//360도 사진 띄우기
	$(function() {
		$("#sh_360_btn").click(function(){
			window.open('r360.do', '360도', 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		});
	});
</script>
<!-- 모달창 띄우기 -->
<script type="text/javascript">
	$(function() {
		// Get the modal
		var modal = document.getElementById('sh_img_modal');

		// Get the image and insert it inside the modal - use its "alt" text as a sh_modal_caption
		var img = document.getElementById('sh_img1_1');
		var modalImg = document.getElementById("sh_img2_1");
		var captionText = document.getElementById("sh_modal_caption");
		img.onclick = function() {
			modal.style.display = "block";
			modalImg.src = this.src;
			captionText.innerHTML = this.alt;
		}

		// Get the <span> element that closes the modal
		var span = document.getElementsByClassName("close")[0];

		// When the user clicks on <span> (x), close the modal
		span.onclick = function() {
			modal.style.display = "none";
		}
	});
</script>
<style type="text/css">
.carousel-item {
	cursor: pointer;
}

.modal {
	display: none; /* Hidden by default */
	position: fixed; /* Stay in place */
	z-index: 1; /* Sit on top */
	padding-top: 100px; /* Location of the box */
	left: 0;
	top: 0;
	width: 100%; /* Full width */
	height: 100%; /* Full height */
	overflow: auto; /* Enable scroll if needed */
	background-color: rgb(0, 0, 0); /* Fallback color */
	background-color: rgba(0, 0, 0, 0.8); /* Black w/ opacity */
}

.modal-content {
	margin: auto;
	display: block;
	width: 90%;
	max-width: 800px;
}

#caption {
	margin: auto;
	display: block;
	width: 90%;
	max-width: 800px;
	text-align: center;
	color: #ccc;
	padding: 10px 0;
	height: 150px;
}

.close {
	position: absolute;
	top: 15px;
	right: 35px;
	color: #f1f1f1;
	font-size: 40px;
	font-weight: bold;
	transition: 0.3s;
}

.close:hover, .close:focus {
	color: #bbb;
	text-decoration: none;
	cursor: pointer;
}

/* 100% Image Width on Smaller Screens */
@media only screen and (max-width: 800px) {
	.modal-content {
		width: 100%;
	}
}

#sh_360_btn, #sh_chat_btn {
	background-color: #61C0BF;
}

.sh_sidebar {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  position: relative;
  background-color:#f2f2f2;
}

.sh_sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
.sh_sidebar a.active {
  background-color: #61C0BF;
  color: white;
}

.sh_sidebar a:hover:not(.active) {
  background-color: #555;
  color: white;
}

@media screen and (max-width: 950px) {
  .sh_sidebar {
    width: 100%;
    height: auto;
    position: relative;
  }
}

@media screen and (max-width: 400px) {
  .sh_sidebar a {
    text-align: center;
    float: none;
  }
}

.sh_recommendinterior_img {
	width:100%;
	padding:20px;
}

.sh_recommendinterior_content {
	width:100%;
	padding:10px;
} 

#sh_carousel .d-block {
    width: auto;
    height: 400px;
}

.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:50px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
#category li.on {background: #eee;}
#category li:hover {background: #ffe6e6;border-left:1px solid #acacac;margin-left: -1px;}
#category li:last-child{margin-right:0;border-right:0;}
#category li span {display: block;margin:0 auto 3px;width:27px;height: 28px;}
#category li .category_bg {background:url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png) no-repeat;}
#category li .bank {background-position: -10px 0;}
#category li .mart {background-position: -10px -36px;}
#category li .pharmacy {background-position: -10px -72px;}
#category li .oil {background-position: -10px -108px;}
#category li .cafe {background-position: -10px -144px;}
#category li .store {background-position: -10px -180px;}
#category li.on .category_bg {background-position-x:-46px;}
.placeinfo_wrap {position:absolute;bottom:28px;left:-150px;width:300px;}
.placeinfo {position:relative;width:100%;border-radius:6px;border: 1px solid #ccc;border-bottom:2px solid #ddd;padding-bottom: 10px;background: #fff;}
.placeinfo:nth-of-type(n) {border:0; box-shadow:0px 1px 2px #888;}
.placeinfo_wrap .after {content:'';position:relative;margin-left:-12px;left:50%;width:22px;height:12px;background:url('http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')}
.placeinfo a, .placeinfo a:hover, .placeinfo a:active{color:#fff;text-decoration: none;}
.placeinfo a, .placeinfo span {display: block;text-overflow: ellipsis;overflow: hidden;white-space: nowrap;}
.placeinfo span {margin:5px 5px 0 5px;cursor: default;font-size:13px;}
.placeinfo .title {font-weight: bold; font-size:14px;border-radius: 6px 6px 0 0;margin: -1px -1px 0 -1px;padding:10px; color: #fff;background: #d95050;background: #d95050 url(http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/arrow_white.png) no-repeat right 14px center;}
.placeinfo .tel {color:#0f7833;}
.placeinfo .jibun {color:#999;font-size:11px;margin-top:0;}

</style>
</head>
<body>
<c:import url="../common/propertyHeader.jsp" /><br>
	<div class="container">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default bg-light fixed-bottom"> <!-- 하단바 -->
					<ul class="nav navbar-nav navbar-left">
						효창동 / 오피스텔 / 전세 1억 5000만원 / 57.6㎡ / 선방공인중개사무소 김성현
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<button type="button" id="sh_chat_btn"
							class="btn btn-sm btn-success">상담하기 <i class="far fa-comment-dots"></i></button>
					</ul>

				</nav>  <!-- 하단바 -->

				<div class="row"> <!-- 매물정보 -->
					<div class="col-md-3">
						<br>오피스텔 <br>
						<h3>전세 1억 5000만원</h3>
					</div>
					<div class="col-md-2">
						<br>전용 면적 <br>
						<h3>57.6㎡</h3>
					</div>
					<div class="col-md-5">
						<br> 
						<img src="${pageContext.request.contextPath }/files/realty/optionImages/냉장고.png" style="width: 80px"> 
						<img src="${pageContext.request.contextPath }/files/realty/optionImages/세탁기.png" style="width: 80px"> 
						<img src="${pageContext.request.contextPath }/files/realty/optionImages/에어컨.png" style="width: 80px"> 
						<img src="${pageContext.request.contextPath }/files/realty/optionImages/전자레인지.png" style="width: 80px">
						<img src="${pageContext.request.contextPath }/files/realty/optionImages/전자도어락.png" style="width: 80px">
					</div>
					<div class="col-md-2" align="right">
						<br>
						<b>선방공인중개사무소</b><br><i class="fas fa-award"></i> 김성현
						<button type="button" id="sh_chat_btn" class="btn btn-sm btn-success">상담하기 <i class="far fa-comment-dots"></i></button>
					</div>
				</div> <!-- 매물정보 -->
				<br>
				<div class="row"> <!-- 조회수 / 찜하기 / 신고 -->
					<div class="col-md-12">
						<a><i class="far fa-eye"></i> 1</a> &nbsp;
						<a><i class="far fa-heart"></i> 1</a> &nbsp;
						<!-- <i class="fas fa-heart"></i> --> 
						<a><i class="far fa-angry"></i> 허위매물신고</a>
					</div>
				</div> <!-- 조회수 / 찜하기 / 신고 -->

				<div class="row"> <!-- 기본정보/추가정보 -->
					<div class="col-md-12">
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>해당층/건물층 </b> 10층/15층
							</div>
							<div class="col-md-3">
								<b>전용/계약면적 </b> 28.3 / 38.65㎡
							</div>
							<div class="col-md-3">
								<b>난방종류 </b> 개별난방
							</div>
							<div class="col-md-3">
								<b>입주가능일 </b> 즉시 입주 
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>관리비 </b> 5만원
							</div>
							<div class="col-md-3">
								<b>주차장 </b> 세대 당 1대
							</div>
							<div class="col-md-3">
								<b>엘리베이터 </b> 있음
							</div>
							<div class="col-md-3">
								<b>빌트인 </b> 있음
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>반려동물 </b> 불가능
							</div>
							<div class="col-md-3">
								<b>베란다/발코니 </b> 있음
							</div>
							<div class="col-md-3">
								<b>전세자금대출 </b> 불가능
							</div>
							<div class="col-md-3">
								<b>구조 </b> 복층 1.5룸/주방분리형
							</div>
						</div>
						<hr>
					</div>
				</div> <!-- 기본정보/추가정보 -->

				<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div class="row">
					<div class="col-md-9">
						<div class="row" id="sh_carousel" style="background-color:rgba(0,0,0, 0.01);">  <!-- carousel 이미지 -->
							<div align="center" class="col-md-12">
								<div class="carousel slide" id="carousel-621227">
									<ol class="carousel-indicators">
										<li data-slide-to="0" data-target="#carousel-621227"></li>
										<li data-slide-to="1" data-target="#carousel-621227"></li>
										<li data-slide-to="2" data-target="#carousel-621227"></li>
										<li data-slide-to="3" data-target="#carousel-621227"
											class="active"></li>
									</ol>
									<div class="carousel-inner" id="carousel-inner">
										<div class="carousel-item active">
											<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png" />
											<div class="carousel-caption">
												<button type="button" id="sh_360_btn" class="btn btn-sm btn-success">360° <!-- <i class="fas fa-camera"></i> --> <i class="far fa-images"></i></button>
											</div>
										</div>
										<div class="carousel-item">
											<img id="sh_img1_1" class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png" />
										</div>
										<div class="carousel-item">
											<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png" />
										</div>
										<div class="carousel-item">
											<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample3.png" />
										</div>
									</div>
									<a class="carousel-control-prev" href="#carousel-621227"
										data-slide="prev"><span class="carousel-control-prev-icon"></span>
										<span class="sr-only">Previous</span></a> <a
										class="carousel-control-next" href="#carousel-621227"
										data-slide="next"><span class="carousel-control-next-icon"></span>
										<span class="sr-only">Next</span></a>
								</div>
								<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
								<!-- The Modal -->
								<div id="sh_img_modal" class="modal">
									<span class="close">&times;</span> <img class="modal-content"
										id="sh_img2_1">
									<div id="sh_modal_caption"></div>
								</div>
	
							</div>
						</div> <!-- carousel 이미지 -->
						<div class="row"> <!-- 상세설명 -->
							<div class="col-md-6" align="center">
								<br>
								<h2>신축오피스텔 풀옵션 즉시 입주 가능!</h2>
							</div>
							<div class="col-md-6">
								<br>
								<h3>안녕하세요 선방입니다.</h3>
								<br>
								<p>풀옵션 신축 오피스텔 입니다.</p>
								<p>역에서 가깝습니다.</p>
								<p>주변 편의시설이 다양합니다.</p>
								<p>
									<a class="btn" href="#">상세정보 »</a>
								</p>
							</div>
						</div> <!-- 상세설명 -->
						<div class="row" align="center"> <!-- 지도 -->
							<div class="col-md-12">
								<div class="row">
									<div class="col-md-12">
										<div class="map_wrap">
										    <div id="map" style="width:100%;height:400px;position:relative;overflow:hidden;border-radius:5px;"></div>
										    <ul id="category">
										        <li id="BK9" data-order="0"> 
										            <span class="category_bg bank"></span>
										            은행
										        </li>       
										        <li id="MT1" data-order="1"> 
										            <span class="category_bg mart"></span>
										            마트
										        </li>  
										        <li id="PM9" data-order="2"> 
										            <span class="category_bg pharmacy"></span>
										            약국
										        </li>  
										        <li id="OL7" data-order="3"> 
										            <span class="category_bg oil"></span>
										            주유소
										        </li>  
										        <li id="CE7" data-order="4"> 
										            <span class="category_bg cafe"></span>
										            카페
										        </li>  
										        <li id="CS2" data-order="5"> 
										            <span class="category_bg store"></span>
										            편의점
										        </li>      
										    </ul>
										</div>								
<script>
// 마커를 클릭했을 때 해당 장소의 상세정보를 보여줄 커스텀오버레이입니다
var placeOverlay = new daum.maps.CustomOverlay({zIndex:1}), 
    contentNode = document.createElement('div'), // 커스텀 오버레이의 컨텐츠 엘리먼트 입니다 
    markers = [], // 마커를 담을 배열입니다
    currCategory = ''; // 현재 선택된 카테고리를 가지고 있을 변수입니다
 
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = {
        center: new daum.maps.LatLng(37.54231547578105, 126.9645557963219), // 지도의 중심좌표
        level: 3 // 지도의 확대 레벨
    };  

// 지도를 생성합니다    
var map = new daum.maps.Map(mapContainer, mapOption); 

//지도에 표시할 원을 생성합니다
var circle = new daum.maps.Circle({
    center : new daum.maps.LatLng(37.54231547578105, 126.9645557963219),  // 원의 중심좌표 입니다 
    radius: 50, // 미터 단위의 원의 반지름입니다 
    strokeWeight: 2, // 선의 두께입니다 
    strokeColor: '#75B8FA', // 선의 색깔입니다
    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
    
    fillColor: '#CFE7FF', // 채우기 색깔입니다
    fillOpacity: 0.7  // 채우기 불투명도 입니다   
}); 

// 지도에 원을 표시합니다 
circle.setMap(map); 


// 장소 검색 객체를 생성합니다
var ps = new daum.maps.services.Places(map); 

// 지도에 idle 이벤트를 등록합니다
daum.maps.event.addListener(map, 'idle', searchPlaces);

// 커스텀 오버레이의 컨텐츠 노드에 css class를 추가합니다 
contentNode.className = 'placeinfo_wrap';

// 커스텀 오버레이의 컨텐츠 노드에 mousedown, touchstart 이벤트가 발생했을때
// 지도 객체에 이벤트가 전달되지 않도록 이벤트 핸들러로 daum.maps.event.preventMap 메소드를 등록합니다 
addEventHandle(contentNode, 'mousedown', daum.maps.event.preventMap);
addEventHandle(contentNode, 'touchstart', daum.maps.event.preventMap);

// 커스텀 오버레이 컨텐츠를 설정합니다
placeOverlay.setContent(contentNode);  

// 각 카테고리에 클릭 이벤트를 등록합니다
addCategoryClickEvent();

// 엘리먼트에 이벤트 핸들러를 등록하는 함수입니다
function addEventHandle(target, type, callback) {
    if (target.addEventListener) {
        target.addEventListener(type, callback);
    } else {
        target.attachEvent('on' + type, callback);
    }
}

// 카테고리 검색을 요청하는 함수입니다
function searchPlaces() {
    if (!currCategory) {
        return;
    }
    
    // 커스텀 오버레이를 숨깁니다 
    placeOverlay.setMap(null);

    // 지도에 표시되고 있는 마커를 제거합니다
    removeMarker();
    
    ps.categorySearch(currCategory, placesSearchCB, {useMapBounds:true}); 
}

// 장소검색이 완료됐을 때 호출되는 콜백함수 입니다
function placesSearchCB(data, status, pagination) {
    if (status === daum.maps.services.Status.OK) {

        // 정상적으로 검색이 완료됐으면 지도에 마커를 표출합니다
        displayPlaces(data);
    } else if (status === daum.maps.services.Status.ZERO_RESULT) {
        // 검색결과가 없는경우 해야할 처리가 있다면 이곳에 작성해 주세요

    } else if (status === daum.maps.services.Status.ERROR) {
        // 에러로 인해 검색결과가 나오지 않은 경우 해야할 처리가 있다면 이곳에 작성해 주세요
        
    }
}

//지도에 마커를 전부표출하는 함수입니다
function displayPlaces(places) {

    // 몇번째 카테고리가 선택되어 있는지 얻어옵니다
    // 이 순서는 스프라이트 이미지에서의 위치를 계산하는데 사용됩니다
    var order = document.getElementById(currCategory).getAttribute('data-order');

    

    for ( var i=0; i<places.length; i++ ) {

            // 마커를 생성하고 지도에 표시합니다
            var marker = addMarker(new daum.maps.LatLng(places[i].y, places[i].x), order);

            // 마커와 검색결과 항목을 클릭 했을 때
            // 장소정보를 표출하도록 클릭 이벤트를 등록합니다
            (function(marker, place) {
                daum.maps.event.addListener(marker, 'click', function() {
                    displayPlaceInfo(place);
                });
            })(marker, places[i]);
    }
}

// 마커를 생성하고 지도 위에 마커를 표시하는 함수입니다
function addMarker(position, order) {
    var imageSrc = 'http://t1.daumcdn.net/localimg/localimages/07/mapapidoc/places_category.png', // 마커 이미지 url, 스프라이트 이미지를 씁니다
        imageSize = new daum.maps.Size(27, 28),  // 마커 이미지의 크기
        imgOptions =  {
            spriteSize : new daum.maps.Size(72, 208), // 스프라이트 이미지의 크기
            spriteOrigin : new daum.maps.Point(46, (order*36)), // 스프라이트 이미지 중 사용할 영역의 좌상단 좌표
            offset: new daum.maps.Point(11, 28) // 마커 좌표에 일치시킬 이미지 내에서의 좌표
        },
        markerImage = new daum.maps.MarkerImage(imageSrc, imageSize, imgOptions),
            marker = new daum.maps.Marker({
            position: position, // 마커의 위치
            image: markerImage 
        });

    marker.setMap(map); // 지도 위에 마커를 표출합니다
    markers.push(marker);  // 배열에 생성된 마커를 추가합니다

    return marker;
}

// 지도 위에 표시되고 있는 마커를 모두 제거합니다
function removeMarker() {
    for ( var i = 0; i < markers.length; i++ ) {
        markers[i].setMap(null);
    }   
    markers = [];
}

// 클릭한 마커에 대한 장소 상세정보를 커스텀 오버레이로 표시하는 함수입니다
function displayPlaceInfo (place) {
    var content = '<div class="placeinfo">' +
                    '   <a class="title" href="' + place.place_url + '" target="_blank" title="' + place.place_name + '">' + place.place_name + '</a>';   

    if (place.road_address_name) {
        content += '    <span title="' + place.road_address_name + '">' + place.road_address_name + '</span>' +
                    '  <span class="jibun" title="' + place.address_name + '">(지번 : ' + place.address_name + ')</span>';
    }  else {
        content += '    <span title="' + place.address_name + '">' + place.address_name + '</span>';
    }                
   
    content += '    <span class="tel">' + place.phone + '</span>' + 
                '</div>' + 
                '<div class="after"></div>';

    contentNode.innerHTML = content;
    placeOverlay.setPosition(new daum.maps.LatLng(place.y, place.x));
    placeOverlay.setMap(map);  
}


// 각 카테고리에 클릭 이벤트를 등록합니다
function addCategoryClickEvent() {
    var category = document.getElementById('category'),
        children = category.children;

    for (var i=0; i<children.length; i++) {
        children[i].onclick = onClickCategory;
    }
}

// 카테고리를 클릭했을 때 호출되는 함수입니다
function onClickCategory() {
    var id = this.id,
        className = this.className;

    placeOverlay.setMap(null);

    if (className === 'on') {
        currCategory = '';
        changeCategoryClass();
        removeMarker();
    } else {
        currCategory = id;
        changeCategoryClass(this);
        searchPlaces();
    }
}

// 클릭된 카테고리에만 클릭된 스타일을 적용하는 함수입니다
function changeCategoryClass(el) {
    var category = document.getElementById('category'),
        children = category.children,
        i;

    for ( i=0; i<children.length; i++ ) {
        children[i].className = '';
    }

    if (el) {
        el.className = 'on';
    } 
} 
</script>										
									</div>
								</div>
	
							</div>
						</div><br><br>  <!-- 지도 -->
						</div>
					<div class="col-md-3">
						<div class="sh_sidebar"> <!-- 사이드바 -->
						  <a class="active" href="#home"><i class="fas fa-paint-roller"></i>&nbsp;&nbsp;인테리어추천</a>
						  <div class="row" id="sh_recommendinterior"> <!-- 추천 인테리어 -->
						  	<div class="col-md-12">
						  		<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png" class="sh_recommendinterior_img">
			  					<div class="sh_recommendinterior_content">
			  					<p><b>건물</b> 오피스텔 / 20평<br>
			  					   <b>스타일</b> 모던, 내추럴<br>
			  					   <b>작업</b> 셀프•DIY</p>
			  					</div>
						  	</div>   				  	
						  </div> <!-- 추천 인테리어 -->
						  
						  <div class="row" id="sh_recommendinterior"> <!-- 추천 인테리어 -->
						  	<div class="col-md-12">
						  		<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png" class="sh_recommendinterior_img">
			  					<div class="sh_recommendinterior_content">
			  					<p><b>건물</b> 오피스텔 / 20평<br>
			  					   <b>스타일</b> 모던, 내추럴<br>
			  					   <b>작업</b> 셀프•DIY</p>
			  					</div>
						  	</div>   				  	
						  </div> <!-- 추천 인테리어 -->
						  
						  <div class="row" id="sh_recommendinterior"> <!-- 추천 인테리어 -->
						  	<div class="col-md-12">
						  		<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png" class="sh_recommendinterior_img">
			  					<div class="sh_recommendinterior_content">
			  					<p><b>건물</b> 오피스텔 / 20평<br>
			  					   <b>스타일</b> 모던, 내추럴<br>
			  					   <b>작업</b> 셀프•DIY</p>
			  					</div>
						  	</div>   				  	
						  </div> <!-- 추천 인테리어 -->						  						  
						  						  						  	
						</div> <!-- 사이드바 -->						
					</div>
				</div>
			</div>
		</div>
	</div>
	<br>
	<br>
<c:import url="../common/footer.jsp" />
</body>
</html>