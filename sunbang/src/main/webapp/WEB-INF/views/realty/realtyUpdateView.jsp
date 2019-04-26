<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<title>선방</title>

<!-- 주소 api -->
<script src="//dapi.kakao.com/v2/maps/sdk.js?appkey=71150a085c893cb9531eb155dbf54998&libraries=services"></script>
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>
<script>
    function sh_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
                var addr = data.address; // 최종 주소 변수

                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sh_roadAddress").value = addr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        //mapd 삭제
                        document.getElementById("mapd").style.display = 'none';
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
            	
                var roadAddr = data.roadAddress; // 도로명 주소 변수
                var extraRoadAddr = ''; // 참고 항목 변수
                
                if(data.bname !== '' && /[동|로|가]$/g.test(data.bname)){
                    extraRoadAddr += data.bname;
                }
                if(data.buildingName !== '' && data.apartment === 'Y'){
                   extraRoadAddr += (extraRoadAddr !== '' ? ', ' + data.buildingName : data.buildingName);
                }
                if(extraRoadAddr !== ''){
                    extraRoadAddr = ' (' + extraRoadAddr + ')';
                }

                // 우편번호와 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sh_roadAddress").value = roadAddr;
                document.getElementById("sh_jibunAddress").value = data.jibunAddress;
                
                var guideTextBox = document.getElementById("guide");
                // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                if(data.autoRoadAddress) {
                    var expRoadAddr = data.autoRoadAddress + extraRoadAddr;
                    guideTextBox.innerHTML = '(예상 도로명 주소 : ' + expRoadAddr + ')';
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    guideTextBox.style.display = 'block';
                    
                } else {
                    //guideTextBox.innerHTML = '';
                    //guideTextBox.style.display = 'none';
                }
            }
        }).open();
			//$("#mapd").hide();
    }
</script>

<!-- 매물 상태 수정 -->
<script type="text/javascript">
	$(function(){
		$("#sh_deletereason").css("display", "none");
		$("#sh_product_hide").click(function(){
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");		
			$("#sh_product_hide").css("background-color", "grey");
			$("#sh_product_hide").css("color", "white");
			$("#sh_deletereason").css("display", "none");
		});
		$("#sh_product_ad").click(function(){
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");
			$("#sh_product_ad").css("background-color", "#61C0BF");
			$("#sh_product_ad").css("color", "white");
			$("#sh_deletereason").css("display", "none");
		});
		$("#sh_product_ing").click(function(){
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");			
			$("#sh_product_ing").css("background-color", "#347f7c");
			$("#sh_product_ing").css("color", "white");
			$("#sh_deletereason").css("display", "none");
		});		
		$("#sh_product_complete").click(function(){
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");			
			$("#sh_product_complete").css("background-color", "#333333");
			$("#sh_product_complete").css("color", "white");
			$("#sh_deletereason").css("display", "none");
		});
		$("#sh_product_delete").click(function(){
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");			
			$("#sh_product_delete").css("background-color", "#ff6666");
			$("#sh_product_delete").css("color", "white");
			$("#sh_deletereason").css("display", "");
		});
	});
</script>
<!-- 매물 상태에 따른 update form 숨기기 $("#sh_updateformhide").css("display","none"); -->

<!-- 매물 종류 -->
<script type="text/javascript">
	$(function(){
		$(".sh_pt_btn").each(function(i){
			$("#sh_123room").css("display", "none");
			$("#sh_op").css("display", "none");
			
			$(".sh_pt_btn").click(function(){
				$("#sh_pt"+i).css("background-color", "white");
				$("#sh_pt"+i).css("color", "#61C0BF");
			});
			
			$("#sh_pt"+i).click(function(){
				$("#sh_pt"+i).css("background-color", "#61C0BF");
				$("#sh_pt"+i).css("color", "white");
				$(".sh_bt_btn").css("background-color", "white");
				$(".sh_bt_btn").css("color", "#61C0BF");
				
				if(i <= 2){
					$("#sh_123room").css("display", "");					
					$("#sh_op").css("display", "none");
				}else if(i == 3){
					$("#sh_op").css("display", "");
					$("#sh_123room").css("display", "none");
				}else{
					$("#sh_123room").css("display", "none");
					$("#sh_op").css("display", "none");
				}
			});			
		});
		
		$(".sh_bt_btn").each(function(i){
			$(".sh_bt_btn").click(function(){
				$("#sh_bt"+i).css("background-color", "white");
				$("#sh_bt"+i).css("color", "#61C0BF");
			});
			
			$("#sh_bt"+i).click(function(){
				$("#sh_bt"+i).css("background-color", "#61C0BF");
				$("#sh_bt"+i).css("color", "white");
			});	
		});
	});
</script>
<!-- 거래 정보 -->
<script type="text/javascript">
	$(function(){
		$("#sh_tradei_0").css("display", "none");
		$("#sh_tradei_1").css("display", "none");
		$("#sh_tradei_2").css("display", "none");
		
		$("#sh_tradei_btn0").click(function(){
			$("#sh_tradei_btn0").css("background-color", "#61C0BF");
			$("#sh_tradei_btn0").css("color", "white");
			$("#sh_tradei_0").css("display", "");
		});
		
		$("#sh_tradei_btn1").click(function(){
			$("#sh_tradei_btn1").css("background-color", "#61C0BF");
			$("#sh_tradei_btn1").css("color", "white");
			$("#sh_tradei_1").css("display", "");
		});
		
		$("#sh_tradei_btn2").click(function(){
			$("#sh_tradei_btn2").css("background-color", "#61C0BF");
			$("#sh_tradei_btn2").css("color", "white");
			$("#sh_tradei_2").css("display", "");
		});
		
		$("#sh_tradei_0_cancel").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result == true){
				$("#sh_tradei_0").css("display", "none");
				$("#sh_tradei_btn0").css("background-color", "white");
				$("#sh_tradei_btn0").css("color", "#61C0BF");
				$("input[name=deposit]").val("");
				$("input[name=monthlyrent]").val("");
			}		
		});
		
		$("#sh_tradei_1_cancel").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result == true){
				$("#sh_tradei_1").css("display", "none");
				$("#sh_tradei_btn1").css("background-color", "white");
				$("#sh_tradei_btn1").css("color", "#61C0BF");
				$("input[name=lease]").val("");
			}
		});
		
		$("#sh_tradei_2_cancel").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result == true){
				$("#sh_tradei_2").css("display", "none");
				$("#sh_tradei_btn2").css("background-color", "white");
				$("#sh_tradei_btn2").css("color", "#61C0BF");
				$("input[name=deal]").val("");
			}
		});
		
	});
</script>
<!-- 기본정보/건물크기 -->
<script type="text/javascript">
	$(function(){
		//공급면적
		$("#sh_sarea_p").on("propertychange change keyup paste input", function(){
			$("#sh_sarea_m").val($("#sh_sarea_p").val() * 3.3058);
		});
		
		$("#sh_sarea_m").on("propertychange change keyup paste input", function(){
			$("#sh_sarea_p").val(Math.round($("#sh_sarea_m").val() / 3.3058));
		});
		
		//전용면적
		$("#sh_earea_p").on("propertychange change keyup paste input", function(){
			$("#sh_earea_m").val($("#sh_earea_p").val() * 3.3058);
		});
		
		$("#sh_earea_m").on("propertychange change keyup paste input", function(){
			$("#sh_earea_p").val(Math.round($("#sh_earea_m").val() / 3.3058));
		});
	});
</script>
<!-- 기본정보/건물층수-해당층수 -->
<script type="text/javascript">
	$(function(){
		$("#sh_mybuildingfloor").on("change", function(){
 			if(Number($("#sh_mybuildingfloor").val()) > Number($("#sh_totalbuildingfloor").val()) || $("#sh_mybuildingfloor").val().length > $("#sh_totalbuildingfloor").val().length){
				alert("해당층수가 건물층수보다 클 수 없습니다.");
				$("#sh_mybuildingfloor").val("");
				$("#sh_mybuildingfloor").focus();
			} 
		});
		
		$("#sh_totalbuildingfloor").on("change", function(){
 			if(Number($("#sh_mybuildingfloor").val()) > Number($("#sh_totalbuildingfloor").val()) || $("#sh_mybuildingfloor").val().length > $("#sh_totalbuildingfloor").val().length){
				alert("건물층수가 해당층수보다 작을 수 없습니다.");
				$("#sh_totalbuildingfloor").val("");
				$("#sh_totalbuildingfloor").focus();
			} 
		});
	});
</script>
<!-- 기본정보/입주 가능일 -->
<script type="text/javascript">
	$(function(){
		$("#sh_moveindate_3").css("display", "none");
		
		$(".sh_moveindate_btn").each(function(i){
			$(".sh_moveindate_btn").click(function(){
				$("#sh_moveindate_"+i).css("background-color", "white");
				$("#sh_moveindate_"+i).css("color", "#61C0BF");
				$("#sh_moveindate_3").css("display", "none");
			});
			
			$("#sh_moveindate_"+i).click(function(){
				$("#sh_moveindate_"+i).css("background-color", "#61C0BF");
				$("#sh_moveindate_"+i).css("color", "white");
				
				if(i == 2){
					$("#sh_moveindate_3").css("display", "");
				}
			});
		});
	});
</script>
<!-- 추가 정보 -->
<script type="text/javascript">
	$(function(){
		$(".sh_option_btn").each(function(i){
			
			$("#sh_maintenancefee").css("display", "none");
			$("#sh_maintenancefee_btn"+i).click(function(){
				$(".sh_maintenancefee_btn").css("background-color", "white");
				$(".sh_maintenancefee_btn").css("color", "#61C0BF");
				$("#sh_maintenancefee").css("display", "none");
				
				$("#sh_maintenancefee_btn"+i).css("background-color", "#61C0BF");
				$("#sh_maintenancefee_btn"+i).css("color", "white");
				
				if(i == 1){
					$("#sh_maintenancefee").css("display", "");
				}
			});
			
			$("#sh_parking").css("display", "none");
			$("#sh_parking_btn"+i).click(function(){
				$(".sh_parking_btn").css("background-color", "white");
				$(".sh_parking_btn").css("color", "#61C0BF");
				$("#sh_parking").css("display", "none");
				
				$("#sh_parking_btn"+i).css("background-color", "#61C0BF");
				$("#sh_parking_btn"+i).css("color", "white");
				
				if(i == 1){
					$("#sh_parking").css("display", "");
				}				
			});
			
			$("#sh_elevator_btn"+i).click(function(){
				$(".sh_elevator_btn").css("background-color", "white");
				$(".sh_elevator_btn").css("color", "#61C0BF");
				$("#sh_elevator_btn"+i).css("background-color", "#61C0BF");
				$("#sh_elevator_btn"+i).css("color", "white");				
			});
			
			$("#sh_builtin_btn"+i).click(function(){
				$(".sh_builtin_btn").css("background-color", "white");
				$(".sh_builtin_btn").css("color", "#61C0BF");
				$("#sh_builtin_btn"+i).css("background-color", "#61C0BF");
				$("#sh_builtin_btn"+i).css("color", "white");				
			});
			
			$("#sh_pet_btn"+i).click(function(){
				$(".sh_pet_btn").css("background-color", "white");
				$(".sh_pet_btn").css("color", "#61C0BF");
				$("#sh_pet_btn"+i).css("background-color", "#61C0BF");
				$("#sh_pet_btn"+i).css("color", "white");				
			});
			
			$("#sh_veranda_btn"+i).click(function(){
				$(".sh_veranda_btn").css("background-color", "white");
				$(".sh_veranda_btn").css("color", "#61C0BF");
				$("#sh_veranda_btn"+i).css("background-color", "#61C0BF");
				$("#sh_veranda_btn"+i).css("color", "white");				
			});
			
			$("#sh_loan_btn"+i).click(function(){
				$(".sh_loan_btn").css("background-color", "white");
				$(".sh_loan_btn").css("color", "#61C0BF");
				$("#sh_loan_btn"+i).css("background-color", "#61C0BF");
				$("#sh_loan_btn"+i).css("color", "white");				
			});
			
			$("#sh_structure_btn"+i).click(function(){
				$(".sh_structure_btn").css("background-color", "white");
				$(".sh_structure_btn").css("color", "#61C0BF");
				$("#sh_structure_btn"+i).css("background-color", "#61C0BF");
				$("#sh_structure_btn"+i).css("color", "white");				
			});
			
			$("#sh_option_btn"+i).click(function(){
				if(i == 0){
					$(".sh_option_btn").css("background-color", "white");
					$(".sh_option_btn").css("color", "#61C0BF");	
				}
				
				$("#sh_option_btn0").css("background-color", "white");
				$("#sh_option_btn0").css("color", "#61C0BF");
				$("#sh_option_btn"+i).css("background-color", "#61C0BF");
				$("#sh_option_btn"+i).css("color", "white");				
			});
		});
	});
</script>
<!-- 사진 등록 -->
<script type="text/javascript">
	$(function(){
		$("#sh_commonphotoform").css("display", "none");
		$("#sh_360photoform").css("display", "none");
		
		$("#sh_phototype_btn0").click(function(){
			$(".sh_phototype_btn").css("background-color", "white");
			$(".sh_phototype_btn").css("color", "#61C0BF");	
			$("#sh_phototype_btn0").css("background-color", "#61C0BF");
			$("#sh_phototype_btn0").css("color", "white");
			
			$("#sh_commonphotoform").css("display", "none");
			$("#sh_360photoform").css("display", "none");
			$("#sh_commonphotoform").css("display", "");
		});
		
		$("#sh_phototype_btn1").click(function(){
			$(".sh_phototype_btn").css("background-color", "white");
			$(".sh_phototype_btn").css("color", "#61C0BF");			
			$("#sh_phototype_btn1").css("background-color", "#61C0BF");
			$("#sh_phototype_btn1").css("color", "white");
			
			$("#sh_commonphotoform").css("display", "none");
			$("#sh_360photoform").css("display", "none");
			$("#sh_360photoform").css("display", "");
		});
	});
</script>
<style type="text/css">

#sh_pi {
        margin: 10px;
        padding: 10px;
        text-align: left;
        font-size: 13px;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
}

.sh_file_preveal {
        text-align: center;
        padding: 60px;
        font-size: 20px;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
        background-color:rgba(0,0,0, 0.01);
        width:100%;
        height: 300px;
}

#map {
        font-size: 15px;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
		text-align: center;
		float:right;
		width:100%;height:300px;margin-top:10px;display:none;
}

#mapd {	
        font-size: 15px;
        padding: 100px;
        color:white;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
		text-align: center;
		float:right;
		background-color:rgba(0,0,0,0.8);
		width:100%;height:300px;margin-top:10px;
}

#sh_address,
#sh_detailAddress {
	width:100%;
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

#sh_roadAddress, 
#sh_jibunAddress {
	width:100%;	
	border:0;
}

#sh_pt .col-md-2, 
#sh_li_title, 
#sh_tradei .col-md-2, 
#sh_basici .col-md-2, 
#sh_additioni .col-md-2,
#sh_detaili .col-md-2,
#sh_product_progress .col-md-2 {
	background-color:#edf8f8;
	text-align:center;
	padding: 10px;
	font-size: 10pt;
	border: 1px solid white;
	border-radius: 5px;
}

#sh_pt .col-md-10, 
#sh_tradei .col-md-10, 
#sh_basici .col-md-10, 
#sh_additioni .col-md-10,
#sh_detaili .col-md-10,
#sh_product_progress .col-md-10 {
	padding:7px;
}

.btn btn-outline-secondary btn-sm {
	background-color:#61C0BF;
}

.sh_pt_btn, 
.sh_bt_btn, 
.sh_moveindate_btn,
.sh_maintenancefee_btn,
.sh_parking_btn,
.sh_elevator_btn,
.sh_builtin_btn,
.sh_pet_btn,
.sh_veranda_btn,
.sh_loan_btn,
.sh_structure_btn,
.sh_option_btn {
	border-radius:4px;
	background-color:white;	
	padding:8px 8px;
	color:#61C0BF;
	border: 1px solid #61C0BF;
	font-size:10pt;
}

.sh_option_btn {
	margin-bottom:6px;
}

.sh_pt_btn:hover, 
.sh_bt_btn:hover, 
.sh_moveindate_btn:hover,
.sh_maintenancefee_btn:hover,
.sh_parking_btn:hover,
.sh_elevator_btn:hover,
.sh_builtin_btn:hover,
.sh_pet_btn:hover,
.sh_veranda_btn:hover,
.sh_loan_btn:hover,
.sh_structure_btn:hover,
.sh_option_btn:hover,
#psubmit:hover,
#preset:hover {
	background-color:#61C0BF;
	color:white;
}

#postbtn {
	background-color: #61C0BF;
	color:white;
	width:100%;
	float:right;
}

.sh_tradei_btn {
	border-radius:4px;
	background-color:white;	
	padding:8px 8px;
	width:100px;
	color:#61C0BF;
	border: 1px solid #61C0BF;
	font-size:12pt;
}

#psubmit, #preset {
	border-radius:4px;
	background-color:white;	
	padding:8px 8px;
	width:100px;
	color:#61C0BF;
	border: 1px solid #61C0BF;
	font-size:12pt;	
}

 #sh_tradei_0_cancel, 
 #sh_tradei_1_cancel,
 #sh_tradei_2_cancel {
    box-sizing: border-box;
    margin: 0px;
    padding: 0px;
    cursor: pointer;
	width: 22px;
    height: 22px;
    color:white;
    background-color: rgb(102, 102, 102);
    position: absolute;
    top: 50%;
    right: 0px;
    transform: translateY(-50%);
    border-width: 0px;
    border-radius: 2px;
} 

h6 {
	text-align:center;
	outline: none;
}

#sh_detaili_textarea {
	width:100%; height:300px;
}

#sh_product_hide {
	background-color:white;	
	color:#61C0BF;
	padding:8px 8px;
	margin:2px;
	width:100px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
}
#sh_product_hide:hover {
	border: 1px dashed #61C0BF;
	background-color:white;	
	color:#61C0BF;
}

#sh_product_ad {
	background-color:white;	
	color:#61C0BF;
	padding:8px 8px;
	margin:2px;
	width:100px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
}
#sh_product_ad:hover {
	border: 1px solid #61C0BF;
	background-color:#61C0BF;	
	color:white;
}

#sh_product_ing {
	background-color:white;	
	color:#61C0BF;
	padding:8px 8px;
	margin:2px;
	width:100px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
}

#sh_product_ing:hover {
	border: 1px solid #347f7c;
	background-color:#347f7c;	
	color:white;
}

#sh_product_complete {
	background-color:white;	
	color:#61C0BF;
	padding:8px 8px;
	margin:2px;
	width:100px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
}
#sh_product_complete:hover {
	border: 1px solid #333333;
	background-color:#333333;	
	color:white;
}

#sh_product_delete {
	background-color:white;	
	color:#61C0BF;
	padding:8px 8px;
	margin:2px;
	width:100px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
}
#sh_product_delete:hover {
	border: 1px solid #ff6666;
	background-color:#ff6666;	
	color:white;
}

#sh_product_pupdate {
	background-color:#61C0BF;	
	color:white;
	padding:8px 8px;
	margin:2px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:12pt;
	float:right;
}

.sh_phototype_btn {
	background-color:white;	
	color:#61C0BF;
	padding:6px 6px;
	width:100px;
	border: 1px solid #61C0BF;
	font-size:12pt;	
	float:left;
}

.sh_phototype_btn:hover {
	background-color:#61C0BF;	
	color:white;
}

#sh_tradei input[type=text],
#sh_basici input[type=text]{
	width:20%;
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

#sh_additioni input[type=text] {
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

#sh_detaili_title {
	width:100%;
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

#sh_detaili_textarea {
	width:100%; height:300px;
	border: 1px solid #ced4da;
}

#sh_moveindate_3 {
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

</style>

</head>
<body>
<c:import url="../common/propertyHeader.jsp" /><br>
<div class="container" style="font-family: a고딕12;">
	<div class="row">
		<div class="col-md-12">
			<div class="row"> <!-- 매물 수정 -->
				<div class="col-md-12">
					<br><h4 class="text-center">매물 수정</h4><hr>
					<div class="row">
						<div class="col-md-12">
							<div id="sh_pi">
										매물을 더 이상 광고하지 않길 원하시면 '숨기기'하면 됩니다.<br>
										매물 종류 / 위치 정보 /기본 정보를 잘못 입력했을 시 삭제 사유를 입력해주시고,
										삭제 후 재등록해주십시오.<br>
										허위 매물 등록 시 법적 처벌을 받을 수 있습니다.
							</div>			
						</div>
					</div>					
				</div>
			</div>  <!-- 매물 등록 -->
			<br><br>
			<div class="row" id="sh_product_progress"> <!-- 매물 상태 수정 -->
				<div class="col-md-12">
						<h6>매물 상태 수정</h6><hr>	
					<div class="row">
						<div class="col-md-2">
							매물 상태
						</div>
						<div class="col-md-10">
							<button class="sh_product_progress_btn" id="sh_product_hide">숨기기</button>
							<button class="sh_product_progress_btn" id="sh_product_ad">광고하기</button>
							<button class="sh_product_progress_btn" id="sh_product_ing">계약진행중</button>
							<button class="sh_product_progress_btn" id="sh_product_complete">거래완료</button>
							<button class="sh_product_progress_btn" id="sh_product_delete">삭제</button>
							<button id="sh_product_pupdate">매물상태수정</button>
						</div>
					</div>
					<div class="row" id="sh_deletereason">
						<div class="col-md-2">
							삭제 사유
						</div>
						<div class="col-md-10">
							<select class="custom-select">
								<option>삭제 사유</option>
								<option>거래완료로 인해서</option>
								<option>정보 오입력으로 인해서</option>
								<option>매물정보제공을 원치 않기 때문에</option>
								<option>기타 사유</option>
							</select>
						</div>
					</div>																
				</div>
			</div> <!-- 매물 상태 수정 -->
			
			<div id="sh_updateformhide"><!-- 영역 숨기기를 위한 영역 잡아줌 -->
			<br><br>
			<div class="row">  <!-- 매물 종류 수정 -->
				<div id="sh_pt" class="col-md-12"><br>
					<h6>매물 종류 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">종류선택
						</div>
						<div class="col-md-10">
								<button class="sh_pt_btn" id="sh_pt0">원룸</button>
								<button class="sh_pt_btn" id="sh_pt1">투룸</button>
								<button class="sh_pt_btn" id="sh_pt2">쓰리룸</button>
								<button class="sh_pt_btn" id="sh_pt3">오피스텔</button>
								<button class="sh_pt_btn" id="sh_pt4">아파트</button>	
						</div>
					</div>
					<div class="row" id="sh_123room">
						<div class="col-md-2">건물유형
						</div>
						<div class="col-md-10">
								<button class="sh_bt_btn" id="sh_bt0">단독주택</button>
								<button class="sh_bt_btn" id="sh_bt1">다가구주택</button>
								<button class="sh_bt_btn" id="sh_bt2">빌라/연립/다세대</button>
								<button class="sh_bt_btn" id="sh_bt3">상가주택</button>
						</div>
					</div>	
					<div class="row" id="sh_op">
						<div class="col-md-2">건물유형
						</div>
						<div class="col-md-10">
								<button class="sh_bt_btn" id="sh_bt4">오피스텔</button>
								<button class="sh_bt_btn" id="sh_bt5">도시생활주택</button>						
						</div>
					</div>										
				</div>
			</div> <!-- 매물 종류 수정 -->
			<br><br>
			<div class="row"> <!-- 위치 정보 수정 -->
					<div class="col-md-12">
						<h6>위치 정보 수정</h6><hr>
						<div class="row">
							<div class="col-md-2" id="sh_li_title">주소</div>
							<div class="col-md-5">
							<table>
								<tr>
									<td colspan="2">
										<a>도로명, 건물명, 지번에 대해 통합검색이 가능합니다.</a>									
									</td>
								</tr>
								<tr>
									<td>
										<input type="text" id="sh_address" placeholder="주소">
									</td>
									<td>
										<input type="button" id="postbtn" class="btn btn-sm btn-success" onclick="sh_execDaumPostcode()" value="주소 찾기"><br>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" class="tablecontent" id="sh_roadAddress" readonly><br>
										<input type="text" class="tablecontent" id="sh_jibunAddress" readonly>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" id="sh_detailAddress" placeholder="동 / 호 를 입력해주세요 ex) 102동 304호">
									</td>
								</tr>														 
							</table>
							</div>
							<div class="col-md-5">
								<div id="map"></div>
								<div id="mapd">
									주소 검색을 하시면 해당 위치가<br> 
									지도에 표시됩니다.<br><br>
									<i class="fas fa-map-marker-alt fa-2x"></i>
								</div>
							</div>
						</div>
					</div>
<!-- 지도 맴핑 찍어주기 -->
<script>
    var mapContainer = document.getElementById('map'), // 지도를 표시할 div
        mapOption = {
            center: new daum.maps.LatLng(37.537187, 127.005476), // 지도의 중심좌표
            level: 2 // 지도의 확대 레벨
        };

    //지도를 미리 생성
    var map = new daum.maps.Map(mapContainer, mapOption);
    //주소-좌표 변환 객체를 생성
    var geocoder = new daum.maps.services.Geocoder();
    //마커를 미리 생성
    var marker = new daum.maps.Marker({
        position: new daum.maps.LatLng(37.537187, 127.005476),
        map: map
    });
</script>					
			</div>  <!-- 위치 정보 수정 -->
			<br><br>
			<div class="row" id="sh_tradei"> <!-- 거래 정보 수정 -->
				<div class="col-md-12">
						<h6>거래 정보 수정</h6><hr>				
					<div class="row">
						<div class="col-md-2">
							거래 종류
						</div>
						<div class="col-md-10">
							<button class="sh_tradei_btn" id="sh_tradei_btn0">월세</button>
							<button class="sh_tradei_btn" id="sh_tradei_btn1">전세</button>
							<button class="sh_tradei_btn" id="sh_tradei_btn2">매매</button>
						</div>
					</div>
					<div class="row" id="sh_tradei_0">
						<div class="col-md-10" float="left">
							<input type="text" name="deposit" placeholder="보증금"> / 
							<input type="text" name="monthlyrent" placeholder="월세"> 만원
							<button type="button" id="sh_tradei_0_cancel"><i class="fas fa-times"></i></button>
						</div>
					</div>
					<div class="row" id="sh_tradei_1">
						<div class="col-md-10">
							<input type="text" name="lease" placeholder="전세"> 만원
							<button type="button" id="sh_tradei_1_cancel"><i class="fas fa-times"></i></button>						
						</div>
					</div>
					<div class="row" id="sh_tradei_2">
						<div class="col-md-10">
							<input type="text" name="deal" placeholder="매매"> 만원
							<button type="button" id="sh_tradei_2_cancel"><i class="fas fa-times"></i></button>						
						</div>
					</div>						
				</div>
			</div> <!-- 거래 정보 수정 -->
			<br><br>
			<div class="row" id="sh_basici"> <!-- 기본 정보 수정 -->
				<div class="col-md-12">
							<h6>기본 정보 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">
							건물크기 <br>(1P = 3.3058㎡)
						</div>
						<div class="col-md-10">
							공급면적 <input type="text" id="sh_sarea_p"> 평 <input type="text" id="sh_sarea_m"> ㎡ <hr>
							전용면적 <input type="text" id="sh_earea_p"> 평 <input type="text" id="sh_earea_m"> ㎡
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							건물층수 / 해당층수
						</div>
						<div class="col-md-10">
							건물층수 <input type="text" placeholder="건물의 총" id="sh_totalbuildingfloor"> 층  <hr>
							해당층수 <input type="text" placeholder="내가 사는" id="sh_mybuildingfloor"> 층
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							난방종류
						</div>
						<div class="col-md-10">
							<select class="custom-select">
								<option>난방 종류 선택</option>
								<option>중앙난방</option>
								<option>개별난방</option>
								<option>지역난방</option>
							</select>
						</div>
					</div>
					<div class="row" id="sh_moveindate">
						<div class="col-md-2">
							입주 가능일
						</div>
						<div class="col-md-10">
							<button class="sh_moveindate_btn" id="sh_moveindate_0">즉시 입주</button>
							<button class="sh_moveindate_btn" id="sh_moveindate_1">날짜 협의</button>
							<button class="sh_moveindate_btn" id="sh_moveindate_2">날짜 선택</button>
							<input type="date" id="sh_moveindate_3">
						</div>
					</div>
				</div>
			</div>  <!-- 기본 정보 수정 -->
			<br><br>
			<div class="row" id="sh_additioni"> <!-- 추가 정보 수정 -->
				<div class="col-md-12">
					<h6>추가 정보 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">
							관리비
						</div>
						<div class="col-md-10">
							<button class="sh_maintenancefee_btn" id="sh_maintenancefee_btn0">없음</button>
							<button class="sh_maintenancefee_btn" id="sh_maintenancefee_btn1">있음</button>
							<input type="text" id="sh_maintenancefee" placeholder="0원">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							주차여부
						</div>
						<div class="col-md-10">
							<button class="sh_parking_btn" id="sh_parking_btn0">불가능</button>
							<button class="sh_parking_btn" id="sh_parking_btn1">가능</button>	
							<input type="text" id="sh_parking" placeholder="option : ex)세대 당 1대">					
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							엘리베이터
						</div>
						<div class="col-md-10">
							<button class="sh_elevator_btn" id="sh_elevator_btn0">없음</button>
							<button class="sh_elevator_btn" id="sh_elevator_btn1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							빌트인
						</div>
						<div class="col-md-10">
							<button class="sh_builtin_btn" id="sh_builtin_btn0">없음</button>
							<button class="sh_builtin_btn" id="sh_builtin_btn1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							반려동물
						</div>
						<div class="col-md-10">
							<button class="sh_pet_btn" id="sh_pet_btn0">불가능</button>
							<button class="sh_pet_btn" id="sh_pet_btn1">가능</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							베란다/발코니
						</div>
						<div class="col-md-10">
							<button class="sh_veranda_btn" id="sh_veranda_btn0">없음</button>
							<button class="sh_veranda_btn" id="sh_veranda_btn1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							전세자금대출
						</div>
						<div class="col-md-10">
							<button class="sh_loan_btn" id="sh_loan_btn0">불가능</button>
							<button class="sh_loan_btn" id="sh_loan_btn1">가능</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							구조
						</div>
						<div class="col-md-10">
							<button class="sh_structure_btn" id="sh_structure_btn0">해당사항없음</button>
							<button class="sh_structure_btn" id="sh_structure_btn1">복층</button>
							<button class="sh_structure_btn" id="sh_structure_btn2">1.5룸/주방분리형</button>
							<button class="sh_structure_btn" id="sh_structure_btn3">다락방</button>													
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							옵션항목
						</div>
						<div class="col-md-10">
							<button class="sh_option_btn" id="sh_option_btn0">없음</button>
							<button class="sh_option_btn" id="sh_option_btn1">에어컨</button>
							<button class="sh_option_btn" id="sh_option_btn2">세탁기</button>
							<button class="sh_option_btn" id="sh_option_btn3">침대</button>
							<button class="sh_option_btn" id="sh_option_btn4">책상</button>
							<button class="sh_option_btn" id="sh_option_btn5">옷장</button>
							<button class="sh_option_btn" id="sh_option_btn6">TV</button>
							<button class="sh_option_btn" id="sh_option_btn7">가스레인지</button>
							<button class="sh_option_btn" id="sh_option_btn8">신발장</button>
							<button class="sh_option_btn" id="sh_option_btn9">냉장고</button>
							<button class="sh_option_btn" id="sh_option_btn10">인덕션</button>
							<button class="sh_option_btn" id="sh_option_btn11">전자레인지</button>
							<button class="sh_option_btn" id="sh_option_btn12">전자도어락</button>
							<button class="sh_option_btn" id="sh_option_btn13">비데</button>
						</div>
					</div>
				</div>
			</div> <!-- 추가 정보 수정 -->
			<br><br>
			<div class="row" id="sh_detaili"> <!-- 상세 정보 수정 -->
				<div class="col-md-12">
					<h6>상세 정보 수정</h6><hr>				
					<div class="row">
						<div class="col-md-2">
							제목
						</div>
						<div class="col-md-10">
							<input type="text" id="sh_detaili_title" placeholder="ex) 강남역에서 5분거리, 편의시설이 다양한 신축건물입니다.">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							상세 설명
						</div>
						<div class="col-md-10">													
<textarea rows="20" cols="30"id="sh_detaili_textarea"  
placeholder=" 

- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다. (홈페이지 주소, 블로그, SNS, 메신저 ID, 전화번호, 이메일 등)

- 중개수수료를 언급한 내용은 입력할 수 없습니다. (중개수수료 무료, 반값 등) 

* 주의 사항 위반 시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다."></textarea>
						</div>
					</div>
				</div>
			</div> <!-- 상세 정보 수정 -->
			<br><br>
			<div class="row"> <!-- 사진 수정 -->
				<div class="col-md-12">
					<h6>사진 수정</h6><hr>
					<div class="row" id="sh_phototype"> <!-- photo type 선택 -->
						<div class="col-md-12">
							<button class="sh_phototype_btn" id="sh_phototype_btn0">일반사진</button>
							<button class="sh_phototype_btn" id="sh_phototype_btn1">360°사진</button>	
						</div>
					</div>
					<div class="row" id="sh_commonphotoform"> <!-- 일반 사진 등록 -->
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="custom-file">
									  <input type="file" class="custom-file-input" id="customFile">
									  <label class="custom-file-label" for="customFile">Choose file</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_preveal">
										<h6>실 사진 최소 2장, 총 8장까지 사진 등록이 가능합니다.</h6>
										<h6>불필요한 정보가 있는 매물은 비공개 처리 됩니다.</h6>
										<br>
										drag & drop <i class="far fa-copy"></i> 
									</div>
								</div>
							</div>					
						</div>
					</div>
					<div class="row" id="sh_360photoform"> <!-- 360도 사진 등록 -->
						<div class="col-md-12">
							<div class="row">
								<div class="col-md-12">
									<div class="custom-file">
									  <input type="file" class="custom-file-input" id="customFile">
									  <label class="custom-file-label" for="customFile">Choose file</label>
									</div>
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_preveal">
										<h6><b>360°사진 제작하기</b></h6>
										<h6>'구글 스트리트 뷰' 앱으로 본인의 집을 찍으세요.</h6>
										<h6>찍으신 사진을 저장 후 사진 파일을 올려주시면 됩니다.</h6>
										<h6>불필요한 정보가 있는 매물은 비공개 처리 됩니다.</h6>
										<br>
										drag & drop <i class="far fa-copy"></i> 
									</div>
								</div>
							</div>					
						</div>
					</div>												
				</div>
			</div> <!-- 사진 등록 -->
			<br><br>
			<div class="row"> <!-- 동의 / 매물 수정 -->
				<div class="col-md-12" align="center">
<form>				    
					<div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck1" required>
					  <label class="custom-control-label" for="customCheck1">매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</label>
					</div>				    
				  <br><br>
					<div align="center">
				  	  <input type="reset" id="preset" value="취소">
					  <input type="submit" id="psubmit" value="매물 등록">
					</div>
				</div>
			</div>  <!-- 동의 / 매물 수정 -->
			</div>
			<br><br><br><br><br><br>
		</div>
	</div>
</div>
</form>
<c:import url="../common/footer.jsp" />
</body>
</html>