<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>           
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71150a085c893cb9531eb155dbf54998&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<!-- 맨위로 -->
<script type="text/javascript">
$(function(){
	$("#sh_top").click(function(){
		var offset = $('html').offset();
		$("html, body").animate({scrollTop:offset.top},500);
	});
});
</script>
<!-- 매물상태별 출력변화 -->
<script type="text/javascript">
	$(function(){
		if(${realty.realty_status == '광고중'}){
			$("#sh_realty_status").css("background-color", "#61C0BF");
		}
		if(${realty.realty_status == '계약진행중'}){
			$("#sh_realty_status").css("background-color", "#347f7c");
		}
		if(${realty.realty_status == '거래완료'}){
			$("#sh_realty_status").css("background-color", "#333333");
			$("#sh_realty_status").css("color", "white");
		}
		if(${realty.realty_status == '검수중'}){
			$("#sh_realty_status").css("background-color", "#ff6666");
			$("#sh_realty_status").css("color", "white");
		}
		if(${realty.realty_status == '수정완료'}){
			$("#sh_realty_status").css("background-color", "#ff6666");
			$("#sh_realty_status").css("color", "white");
		}		
	});
</script>
<!-- 수정하기 -->
<script type="text/javascript">
	$(function(){
		$("#sh_update_btn").click(function(){
			var message = confirm("수정하기 페이지로 이동하시겠습니까?");
			if(message == true){
				location.href="rupdateview.do?realty_no=${realty.realty_no }";
			}
		});
	});
</script>
<!-- 360도 사진 띄우기 -->
<script type="text/javascript">
	$(function() {
		if( ${ realty.image360 == null }){
			$("#sh_360_btn").css("display", "none");
		}
		
		$("#sh_360_btn").click(function(e){
			e.stopPropagation();
			window.open('r360.do?image360=${realty.image360 }', '360도', 'height=' + screen.height + ',width=' + screen.width + 'fullscreen=yes');
		});
	});
</script>
<!-- 평 / ㎡ 변환 -->
<script type="text/javascript">
$(function(){
	$("#sh_changebtn0").on("click", function(){
		if($("#sh_change0").val() == 0){
			$("#sh_changenumber0").text("${realty.exclusive_area * 3.3058}");
			$("#sh_changetext0").text("㎡");
			$("#sh_change0").val(1);
		}else{
			$("#sh_changenumber0").text("${realty.exclusive_area}");
			$("#sh_changetext0").text("평");
			$("#sh_change0").val(0);
		}
	});
	
	$("#sh_changebtn1").on("click", function(){
		if($("#sh_change1").val() == 0){
			$("#sh_changenumber1").text("${realty.exclusive_area * 3.3058 }");
			$("#sh_changenumber2").text("${realty.residential * 3.3058 }");
			$("#sh_changetext1").text("㎡");
			$("#sh_change1").val(1);
		}else{
			$("#sh_changenumber1").text("${realty.exclusive_area }");
			$("#sh_changenumber2").text("${realty.residential }");
			$("#sh_changetext1").text("평");
			$("#sh_change1").val(0);
		}
	});
});	
</script>
<!-- 찜하기 -->
<script type="text/javascript">
	$(function(){
		var realty_no = ${realty.realty_no };
		$.ajax({
			url: "rdcount.do",
			type: "post",
			data: {realty_no: realty_no},
			success: function(result){
				$("#sh_rdcount").html(result);
			}
		});
		
		var dibs = new Object();
		dibs.user_no = ${loginUser.user_no };
		dibs.realty_no = ${realty.realty_no };

		$.ajax({
			url: "rdcheck.do",
			type: "post",
			data: JSON.stringify(dibs),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(result == 0){
					$("#sh_dibs_uncheck").css("display", "");
					$("#sh_dibs_value").val(0);
				}else{
					$("#sh_dibs_check").css("display", "");
					$("#sh_dibs_value").val(1);
				}
			}
		});	
		
		
		$("#sh_rdinsert").click(function(){
			if($("#sh_dibs_value").val() == 0){
				var message = confirm("매물을 찜하기 하시겠습니까?");
				if(message == true){
					$.ajax({
						url: "rdinsert.do",
						type: "post",
						data: JSON.stringify(dibs),
						contentType: "application/json; charset=utf-8",
						success: function(result){
							if(result == 1){
								$("#sh_dibs_uncheck").css("display", "none");
								$("#sh_dibs_check").css("display", "");
							}else{
								$("#sh_dibs_uncheck").css("display", "");
								$("#sh_dibs_check").css("display", "none");
							}
							
							$("#sh_dibs_value").val(1);
							
							$.ajax({
								url: "rdcount.do",
								type: "post",
								data: {realty_no: realty_no},
								success: function(result){
									$("#sh_rdcount").html(result);
								}
							});
						} //success
					});	//ajax
				} //if
			}else{
				alert("찜하기가 취소되었습니다.");
				$.ajax({
					url: "rddelete.do",
					type: "post",
					data: JSON.stringify(dibs),
					contentType: "application/json; charset=utf-8",
					success: function(result){
						if(result == 1){
							$("#sh_dibs_uncheck").css("display", "");
							$("#sh_dibs_check").css("display", "none");
						}else{
							$("#sh_dibs_uncheck").css("display", "none");
							$("#sh_dibs_check").css("display", "");
						}
						
						$("#sh_dibs_value").val(0);
						
						$.ajax({
							url: "rdcount.do",
							type: "post",
							data: {realty_no: realty_no},
							success: function(result){
								$("#sh_rdcount").html(result);
							}
						});
					} //success
				});	//ajax				
			} //else
		}); //click
	}); //document.ready
</script>
<!-- 허위매물신고 -->
<script type="text/javascript">
	$(function(){
		
		var report = new Object();
		report.user_no = ${loginUser.user_no };
		report.realty_no = ${realty.realty_no };
		
		$.ajax({
			url: "rrcheck.do",
			type: "post",
			data: JSON.stringify(report),
			contentType: "application/json; charset=utf-8",
			success: function(result){
				if(result == 0){
					$("#sh_report").unbind('click', false);
				}else{
					$("#sh_report").bind('click', false);
					$("#sh_report").click(function(){
						alert("이미 신고하신 게시물입니다.");
					});
				}
			}
		});		
		
		$("#sh_rrinsert_btn").click(function(){
			//신고내용 <br>로 변환
			var str = $("#sh_rreportcontent").val(); 
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("#sh_rreportcontent").val(str); 

			report.contents = $("#sh_rreportcontent").val();
			
			$.ajax({
				url: "rrinsert.do",
				type: "post",
				data: JSON.stringify(report),
				contentType: "application/json; charset=utf-8",
				success: function(result){
					if(result == 1){
						alert("신고가 완료되었습니다.");
						$("#sh_report").bind('click', false);
						$("#sh_report").click(function(){
							alert("이미 신고하신 게시물입니다.");
						});
					}
				}
			});				
		});
	});
</script>
<!-- 상세설명 </br>처리 -->
<script type="text/javascript">
	$(function(){
		var str = $('#sh_detaili_textarea').val();
		str = str.split('<br/>').join("\r\n");
		$('#sh_detaili_textarea').val(str);
	});	
</script>
<!-- 채팅버튼 비활성화 -->
<script type="text/javascript">
   $(function(){
	   $("#sh_chat_btn_1").click(function(){
			<c:if test='${!empty loginUser.user_no}'>
			 if(${loginUser.user_no == realty.user_no }){
				 var message = confirm("채팅내역으로 이동하시겠습니까?");
		            if(message == true){
		               location.href="cmyview.do";
		            }
			 }else{
			$("#jw_mlistout").toggle();
			 }
			</c:if>
			<c:if test='${empty loginUser.user_no}'>
			alert('로그인하시오');
			</c:if>
		})
		$("#sh_chat_btn_2").click(function(){
			
			<c:if test='${!empty loginUser.user_no}'>
			 if(${loginUser.user_no == realty.user_no }){
				 var message = confirm("채팅내역으로 이동하시겠습니까?");
		            if(message == true){
		               location.href="cmyview.do";
		            }
			 }else{
		$("#jw_mlistout").toggle();
			 }
			</c:if>
			<c:if test='${empty loginUser.user_no}'>
			alert('로그인하시오');
			</c:if>
		})
   });
</script>
<style type="text/css">

#sh_top {
	width:100%;
	height:30px;
	color: grey;
	background-color: #f2f2f2;
	text-align:center;
	margin: 2px;
	cursor:pointer;
}

@media screen and (min-width: 800px) {
  #sh_top {
	position: fixed;
	top: 85%;
	left: 5%;
	width: 5%;
	border-radius: 5px;
	padding:2px;
  }
}

#sh_realtydetail_hide,
#sh_realtydetail_delete {
	margin: 5px;
	padding: 5px;
	text-align: center;
	font-size: 20pt;
	border: 1px solid #f2f2f2;
	border-radius: 5px;
	color:#595959;
}

#sh_realty_status {
	width: 100%;
	margin: 1px;
	padding: 5px;
	border-radius: 5px;
	font-weight: bold;
}

#sh_premium_style {
	float:right;
	font-weight: normal;
	color:white;
}

.carousel-item {
	cursor: pointer;
}

#sh_optionicon img {
	width: 80px;
}

#sh_report{
	color: #b30000;
}

#sh_360_btn, #sh_chat_btn_1, #sh_chat_btn_2 {
	background-color: #61C0BF;
}

#sh_update_btn {
	width: 100%;
	color: #61C0BF;
	border: 1px solid #61C0BF;
	border-radius: 5px;
	margin: 1px;
	padding: 5px;
	cursor:pointer;
}

#sh_update_btn:hover {
	color: white;
	background-color: #61C0BF;
}

#sh_rreportcontent {
	width:100%;
	border: 1px solid #ced4da;
	border-radius:4px;
}

#sh_changebtn0 {
	border-radius:4px;
	background-color:white;	
	color:#61C0BF;
	border: 1px solid #61C0BF;
	font-size: 12pt;
	padding:4px 4px;
}

#sh_changebtn1 {
	border-radius:4px;
	background-color:white;	
	color:#61C0BF;
	border: 1px solid #61C0BF;
}

.sh_sidebar {
  margin: 0;
  padding: 0;
  width: 100%;
  height: 100%;
  position: relative;
  background-color:#f2f2f2;
  border-radius: 5px;
}

.sh_sidebar a {
  display: block;
  color: black;
  padding: 16px;
  text-decoration: none;
}
 
#sh_recommendinterior_title {
  background-color: #61C0BF;
  color: white;
  text-decoration: none;
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
	cursor:pointer;
}

.sh_recommendinterior_content {
	width:100%;
	padding:10px;
} 

#sh_carousel .d-block {
    width: auto;
    height: 400px;
}

#sh_carousel {
	background-color:rgba(0,0,0, 0.01);
}

#sh_hpr a:link {color:black; cursor:pointer;}
#sh_hpr a:visited {color:black;text-decoration:none} 	
#sh_hpr a:active {color:black;text-decoration:none} 
#sh_hpr a:hover {color:black;text-decoration:none; cursor:pointer;} 


.map_wrap, .map_wrap * {margin:0; padding:0;font-family:'Malgun Gothic',dotum,'돋움',sans-serif;font-size:12px;}
.map_wrap {position:relative;width:100%;height:350px;}
#category {position:absolute;top:10px;left:10px;border-radius: 5px; border:1px solid #909090;box-shadow: 0 1px 1px rgba(0, 0, 0, 0.4);background: #fff;overflow: hidden;z-index: 2;}
#category li {float:left;list-style: none;width:40px;px;border-right:1px solid #acacac;padding:6px 0;text-align: center; cursor: pointer;}
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
<c:import url="../common/realtyHeader.jsp" /><br>
	<div class="container" style="font-family: a고딕12;">
	<c:if test="${realty.realty_status == '숨기기' }">
		<div class="row" id="sh_realtydetail_hide">
			<div class="col-md-12">
				<hr><br><br>
				등록자에 의해서 숨겨진 매물입니다.
				<br><br><br><br><hr>
			</div>
		</div>
	</c:if>
	<c:if test="${realty.realty_status == '삭제' || realty.realty_status == '완전삭제'}">
		<div class="row" id="sh_realtydetail_delete">
			<div class="col-md-12">
				<hr><br><br>
				등록자에 의해서 삭제된 매물입니다.
				<br><br><br><br><hr>
			</div>
		</div>
	</c:if>
	
	<c:if test="${realty.realty_status != '숨기기' && realty.realty_status != '삭제' && realty.realty_status != '완전삭제'}">
		<div class="row">
			<div class="col-md-12">
				<nav class="navbar navbar-default bg-light fixed-bottom"> <!-- 하단바 -->
					<ul class="nav navbar-nav navbar-left">
						${realty.road_address } / ${realty.realty_type } / 
						<c:if test="${realty.month_lease != 0 }">
							월세 <fmt:formatNumber value="${realty.month_lease }" groupingUsed="true" /> 원 : 보증금 <fmt:formatNumber value="${realty.deposit }" groupingUsed="true" /> 원 /
						</c:if>
						<c:if test="${realty.payback_deposit_lease != 0 }">
							전세 <fmt:formatNumber value="${realty.payback_deposit_lease }" groupingUsed="true" /> 원 /
						</c:if>
						<c:if test="${realty.purchase != 0 }">
							매매  <fmt:formatNumber value="${realty.purchase }" groupingUsed="true" /> 원 /
						</c:if>
						${realty.exclusive_area }평 / 
						${user.office_name } ${user.user_name } 
					</ul>
					<ul class="nav navbar-nav navbar-right">
						<button type="button" id="sh_chat_btn_1" class="btn btn-sm btn-success">상담하기 <i class="far fa-comment-dots"></i></button>
					</ul>

				</nav>  <!-- 하단바 -->

				<div class="row"> <!-- 매물정보 -->
					<div class="col-md-3">
						<br>${realty.realty_type }<br>
						<c:if test="${realty.month_lease != 0 }">
							<h5>월세 <fmt:formatNumber value="${realty.month_lease }" groupingUsed="true" /> 원 <br> 
								보증금 <fmt:formatNumber value="${realty.deposit }" groupingUsed="true" /> 원</h5>
						</c:if>
						<c:if test="${realty.payback_deposit_lease != 0 }">
							<h5>전세 <fmt:formatNumber value="${realty.payback_deposit_lease }" groupingUsed="true" /> 원</h5>
						</c:if>
						<c:if test="${realty.purchase != 0 }">
							<h5>매매 <fmt:formatNumber value="${realty.purchase }" groupingUsed="true" /> 원</h5>
						</c:if>
					</div>
					<div class="col-md-2">
						<br>전용 면적 <br>
						<h3> 
						<span id="sh_changenumber0">${realty.exclusive_area }</span>
						<span id="sh_changetext0">평</span> 
						<button id="sh_changebtn0"><i class="fas fa-sync-alt"></i></button>
						</h3>
						<input type="hidden" id="sh_change0" value=0>
					</div>
					<div class="col-md-5" id="sh_optionicon">
						<br>
						<c:if test="${realty.airconditioner != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/에어컨.png"></c:if>
						<c:if test="${realty.laundry_machine != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/세탁기.png"></c:if>
						<c:if test="${realty.bed != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/침대.png"></c:if>
						<c:if test="${realty.desk != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/책상.png"></c:if>
						<c:if test="${realty.closet != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/옷장.png"></c:if>
						<c:if test="${realty.tv != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/tv.png"></c:if>
						<c:if test="${realty.gasrange != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/가스레인지.png"></c:if>
						<c:if test="${realty.shoe_shelf != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/신발장.png"></c:if>
						<c:if test="${realty.refrigerator != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/냉장고.png"></c:if>
						<c:if test="${realty.induction != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/인덕션.png"></c:if>
						<c:if test="${realty.microwave != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/전자레인지.png"></c:if>
						<c:if test="${realty.door_lock != 0}"><img src="${pageContext.request.contextPath }/files/realty/optionImages/전자도어락.png"></c:if>
						<c:if test="${realty.bidet != 0}"></c:if> 
					</div>
					<div class="col-md-2" align="right">
						<br>
						 
						<b>${user.office_name }</b><br>
						<c:if test="${user.premium_status == 'Y' }">
						<i class="fas fa-award"></i> 
						</c:if>
						${user.user_name }
						<button type="button" id="sh_chat_btn_2" class="btn btn-sm btn-success">상담하기 <i class="far fa-comment-dots"></i></button>
					</div>
				</div> <!-- 매물정보 -->
				<br>
				<div class="row" id="sh_hpr"> <!-- 조회수 / 찜하기 / 신고 -->
					<div class="col-md-12">
						<a><i class="far fa-eye"></i> ${realty.realty_hits }</a> &nbsp;
						
						<input type="hidden" id="sh_dibs_value">
						<a id="sh_rdinsert">
							<i class="far fa-bookmark" id="sh_dibs_uncheck" style="display:none"></i> 
							<i class="fas fa-bookmark" id="sh_dibs_check" style="display:none"></i>
							<span id="sh_rdcount"></span>
						</a> &nbsp;
						<c:if test="${not empty loginUser }">
							<a data-toggle="modal" data-target="#sh_reportModal" id="sh_report"><i class="far fa-angry"></i> 허위매물신고</a>
						</c:if>

						<!-- The Modal -->
						<div class="modal fade" id="sh_reportModal">
							<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">허위매물 신고</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">
										<p style="color:#006080">매물에 대한 잘못된 정보를 신고해주세요!</p>
										<p>확인 후 허위매물일 경우 해당 매물은 삭제되거나 이용이 제재됩니다.<br>
											허위신고일 시 신고자는 법적인 책임을 질 수 있습니다.<br>
										 	선방은 자체 검수를 통해 허위매물 근절에 노력하고 있습니다.</p><br>
										<h5> 신고내용 </h5><hr> 	
										<textarea rows="20" cols="20" id="sh_rreportcontent" placeholder="신고 사유를 작성해주세요"></textarea>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" id="sh_rrinsert_btn" class="btn btn-secondary" data-dismiss="modal">제출</button>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div> <!-- 조회수 / 찜하기 / 신고 -->
				
				<div class="row" id="sh_realty_status">
					<div class="col-md-12">
						${realty.realty_status }
						<c:if test="${user.premium_status == 'Y' }">
						<span id="sh_premium_style">선방에서 인증한 프리미엄 회원의 매물입니다.</span>
						</c:if>
					</div>
				</div>
				<c:if test="${loginUser.user_no == realty.user_no }">
					<div class="row" id="sh_update_btn">
						<div class="col-md-12">
							수정하기
						</div>
					</div>	
				</c:if>
				
				<div class="row"> <!-- 기본정보/추가정보 -->
					<div class="col-md-12">
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>해당층/건물층 </b> ${realty.realty_layers }층 / ${realty.building_layers }층
							</div>
							<div class="col-md-3">
								<b>전용/계약면적 </b> 
								<span id="sh_changenumber1">${realty.exclusive_area }</span> /
								<span id="sh_changenumber2">${realty.residential }</span> 
								<span id="sh_changetext1"> 평 </span>
								<button id="sh_changebtn1"><i class="fas fa-sync-alt"></i></button>
								<input type="hidden" id="sh_change1" value=0>
							</div>
							<div class="col-md-3">
								<b>난방종류 </b>
								<c:if test="${realty.heatting_system == 0 }">중앙난방</c:if>
								<c:if test="${realty.heatting_system == 1 }">개별난방</c:if>
								<c:if test="${realty.heatting_system == 2 }">지역난방</c:if>
							</div>
							<div class="col-md-3">
								<b>입주가능일 </b>
								<c:if test="${realty.move_available_date == '0' }">즉시 입주</c:if>
								<c:if test="${realty.move_available_date == '1' }">날짜 협의</c:if>
								<c:if test="${realty.move_available_date != '0' && realty.move_available_date != '1'}"> ${realty.move_available_date }</c:if>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>관리비 </b>
								<c:if test="${realty.management_pay == 0}">없음</c:if>
								<c:if test="${realty.management_pay == 1}">있음</c:if>
								<c:if test="${realty.management_pay != 0 && realty.management_pay != 1}">${realty.management_pay }원</c:if>
							</div>
							<div class="col-md-3">
								<b>주차장 </b> 
								<c:if test="${realty.parking_lot == '0' }">없음</c:if>
								<c:if test="${realty.parking_lot == '1' }">가능</c:if>
								<c:if test="${realty.parking_lot != '0' && realty.parking_lot != '1'}">${realty.parking_lot }</c:if>
							</div>
							<div class="col-md-3">
								<b>엘리베이터 </b>
								<c:if test="${realty.elevator == 0 }">없음</c:if>
								<c:if test="${realty.elevator != 0 }">있음</c:if>
							</div>
							<div class="col-md-3">
								<b>빌트인 </b> 
								<c:if test="${realty.builtin == 0 }">없음</c:if>
								<c:if test="${realty.builtin != 0 }">있음</c:if>
							</div>
						</div>
						<hr>
						<div class="row">
							<div class="col-md-3">
								<b>반려동물 </b>
								<c:if test="${realty.allowance_pet == 0 }">불가능</c:if>
								<c:if test="${realty.allowance_pet != 0 }">가능</c:if>
							</div>
							<div class="col-md-3">
								<b>베란다/발코니 </b>
								<c:if test="${realty.balcony == 0 }">없음</c:if>
								<c:if test="${realty.balcony != 0 }">있음</c:if>								
							</div>
							<div class="col-md-3">
								<b>전세자금대출 </b> 
								<c:if test="${realty.loan_availability == 0 }">불가능</c:if>
								<c:if test="${realty.loan_availability != 0 }">가능</c:if>									
							</div>
							<div class="col-md-3">
								<c:if test="${realty.structure == '0' }"></c:if>
								<c:if test="${realty.structure == '1' }"><b>구조 </b> 복층</c:if>
								<c:if test="${realty.structure == '2' }"><b>구조 </b> 1.5룸/주방분리형</c:if>
								<c:if test="${realty.structure == '3' }"><b>구조 </b> 다락방</c:if>
							</div>
						</div>
						<hr>
					</div>
				</div> <!-- 기본정보/추가정보 -->

				<!-- ~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~ -->
				<div class="row">
					<div class="col-md-9">
						<div class="row" id="sh_carousel">  <!-- carousel 이미지 -->
							<div align="center" class="col-md-12">
								<div class="carousel slide" id="sh_realty_images">
									<ol class="carousel-indicators">
										<c:if test="${not empty realty.realty_image1 }">
											<li data-slide-to="0" data-target="#sh_realty_images" class="active"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image2 }">
											<li data-slide-to="1" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image3 }">
											<li data-slide-to="2" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image4 }">
											<li data-slide-to="3" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image5 }">
											<li data-slide-to="4" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image6 }">
											<li data-slide-to="5" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image7 }">
											<li data-slide-to="6" data-target="#sh_realty_images"></li>
										</c:if>
										<c:if test="${not empty realty.realty_image8 }">
											<li data-slide-to="7" data-target="#sh_realty_images"></li>
										</c:if>

									</ol>
									<div class="carousel-inner" id="carousel-inner">
										<c:if test="${not empty realty.realty_image1 }">
											<div class="carousel-item active" data-toggle="modal" data-target="#sh_realty_modal1">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image1 }" />
												<div class="carousel-caption" id="sh_360_caption">
													<button type="button" id="sh_360_btn" class="btn btn-sm btn-success">360° <i class="far fa-images"></i></button>
												</div>
											</div>
											<div class="modal fade" id="sh_realty_modal1">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image1 }" />
														</div>
													</div>
												</div>
											</div>												
										</c:if>	
										<c:if test="${not empty realty.realty_image2 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal2">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image2 }" />
											</div>
											<div class="modal fade" id="sh_realty_modal2">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image2 }" />
														</div>
													</div>
												</div>
											</div>												
										</c:if>
										<c:if test="${not empty realty.realty_image3 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal3">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image3 }" />
											</div>	
											<div class="modal fade" id="sh_realty_modal3">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image3 }" />
														</div>
													</div>
												</div>
											</div>																					
										</c:if>										
										<c:if test="${not empty realty.realty_image4 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal4">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image4 }" />
											</div>	
											<div class="modal fade" id="sh_realty_modal4">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image4 }" />
														</div>
													</div>
												</div>
											</div>																					
										</c:if>	
										<c:if test="${not empty realty.realty_image5 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal5">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image5 }" />
											</div>	
											<div class="modal fade" id="sh_realty_modal5">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image5 }" />
														</div>
													</div>
												</div>
											</div>																					
										</c:if>	
										<c:if test="${not empty realty.realty_image6 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal6">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image6 }" />
											</div>		
											<div class="modal fade" id="sh_realty_modal6">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image6 }" />
														</div>
													</div>
												</div>
											</div>																				
										</c:if>	
										<c:if test="${not empty realty.realty_image7 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal7">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image7 }" />
											</div>	
											<div class="modal fade" id="sh_realty_modal7">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image7 }" />
														</div>
													</div>
												</div>
											</div>																					
										</c:if>	
										<c:if test="${not empty realty.realty_image8 }">
											<div class="carousel-item" data-toggle="modal" data-target="#sh_realty_modal8">
												<img class="d-block" src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image8 }" />
											</div>	
											<div class="modal fade" id="sh_realty_modal8">
												<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
													<div class="modal-content">
														<div class="modal-body">
															<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image8 }" />
														</div>
													</div>
												</div>
											</div>																					
										</c:if>	
									</div>
									<a class="carousel-control-prev" href="#sh_realty_images"
										data-slide="prev"><span class="carousel-control-prev-icon"></span>
										<span class="sr-only">Previous</span></a> <a
										class="carousel-control-next" href="#sh_realty_images"
										data-slide="next"><span class="carousel-control-next-icon"></span>
										<span class="sr-only">Next</span></a>
								</div>
							</div>
						</div> <!-- carousel 이미지 -->
						<div class="row"> <!-- 상세설명 -->
							<div class="col-md-6" align="center">
								<br><br><br><br>
								<h2>${realty.realty_detail_title }</h2>
							</div>
							<div class="col-md-6">
								<br><br><br><br>
								<h5>
								<span id="sh_detaili_textarea">${realty.realty_detail_comment }</span>
								</h5>
								<br><br><br><br><br><br><br>
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
<!-- 위치정보 -->
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

//주소-좌표 변환 객체를 생성합니다
var geocoder = new daum.maps.services.Geocoder();

//주소로 좌표를 검색합니다
geocoder.addressSearch('${realty.road_address }', function(result, status) {

    // 정상적으로 검색이 완료됐으면 
     if (status === daum.maps.services.Status.OK) {

        var coords = new daum.maps.LatLng(result[0].y, result[0].x);

        // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
        map.setCenter(coords);

        //지도에 표시할 원을 생성합니다
		var circle = new daum.maps.Circle({
		    center : new daum.maps.LatLng(result[0].y, result[0].x),  // 원의 중심좌표 입니다 
		    radius: 50, // 미터 단위의 원의 반지름입니다 
		    strokeWeight: 2, // 선의 두께입니다 
		    strokeColor: '#75B8FA', // 선의 색깔입니다
		    strokeOpacity: 1, // 선의 불투명도 입니다 1에서 0 사이의 값이며 0에 가까울수록 투명합니다
		    
		    fillColor: '#CFE7FF', // 채우기 색깔입니다
		    fillOpacity: 0.7  // 채우기 불투명도 입니다   
		}); 
		
        // 결과값으로 받은 위치를 마커로 표시합니다
        var marker = new daum.maps.Marker({
            map: map,
            position: coords
        });
        
		// 지도에 원을 표시합니다 
		circle.setMap(map); 
    } 
});    

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
					<br><br>	
					</div>
					<div class="col-md-3">
						<div class="sh_sidebar"> <!-- 사이드바 -->
						  <a class="active" id="sh_recommendinterior_title" href="interiormain.do"><i class="fas fa-paint-roller"></i>&nbsp;&nbsp;인테리어추천</a>
						  
						  <c:forEach items="${recommenditop5 }" var="recommenditop5" varStatus="status">
						  
						  <div class="row" id="sh_recommendinterior"> <!-- 추천 인테리어 -->
						  	<div class="col-md-12">
						  		<input type="hidden" value="${recommenditop5.board_no }">
						  		<img src="${pageContext.request.contextPath }/files/interior/interiorBoard/${recommenditop5.post_data }" 
						  		     class="sh_recommendinterior_img" onclick="location.href='ibselect.do?board_no=${recommenditop5.board_no }&board_type=${recommenditop5.board_type }'">
			  					<div class="sh_recommendinterior_content">
			  					<p><b>건물</b> ${recommenditop5.housing_type } / ${recommenditop5.floor_area } 평<br>
			  					   <b>스타일</b> ${recommenditop5.style }<br>
			  					</div>
						  	</div>   				  	
						  </div> <!-- 추천 인테리어 -->
						  						  						  	
						</c:forEach>
						
						</div> <!-- 사이드바 -->						
					</div>
				</div>
			</div>
		</div>
	</c:if>
	<div class="row" id="sh_top">
		<div class="col-md-12">
			<i class="fas fa-angle-double-up"></i>
		</div>
	</div>	
	</div>
	<br>
	<br>
<c:import url="../common/footer.jsp" />
<c:import url="/chatview.do">
	<c:param name="realty_no" value="${realty.realty_no }"/>
	<c:param name="title" value="${realty.realty_detail_title }"/>
	<c:param name="user_no" value="${loginUser.user_no }"/>
	<c:param name="realty_user_no" value="${realty.user_no }"/>
</c:import>
</body>
</html>