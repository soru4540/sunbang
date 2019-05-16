<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>     
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

<!-- 매물 상태 수정 -->
<script type="text/javascript">
	$(function(){

		$("#sh_deletereason").css("display", "none");
		
		if($("#sh_realty_status").val() == "검수중"){
			$("#sh_product_progress").hide();
		}
		
		if($("#sh_realty_status").val() == "숨기기"){
			$("#sh_product_hide").css("background-color", "#61C0BF");
			$("#sh_product_hide").css("color", "white");
			$("#sh_product_hide").css("opacity", "0.2");
			$("#sh_updateformhide").show();
		}
		
		if($("#sh_realty_status").val() == "광고중"){
			$("#sh_product_ad").css("background-color", "#61C0BF");
			$("#sh_product_ad").css("color", "white");
			$("#sh_updateformhide").hide();
		}
		
		if($("#sh_realty_status").val() == "계약진행중"){
			$("#sh_product_ing").css("background-color", "#347f7c");
			$("#sh_product_ing").css("color", "white");
			$("#sh_updateformhide").hide();
		}
		
		if($("#sh_realty_status").val() == "거래완료"){
			$("#sh_product_complete").css("background-color", "#333333");
			$("#sh_product_complete").css("color", "white");
			$("#sh_updateformhide").hide();
		}	
		
		if($("#sh_realty_status").val() == "삭제" || $("#sh_realty_status").val() == "완전삭제"){
			$("#sh_product_delete").css("background-color", "#ff6666");
			$("#sh_product_delete").css("color", "white");
			$("#sh_updateformhide").hide();
		}	
		
		$("#sh_product_hide").click(function(){
			$("#sh_realty_status").val("숨기기");
			
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");
			$(".sh_product_progress_btn").css("opacity", "1");
			$("#sh_product_hide").css("background-color", "#61C0BF");
			$("#sh_product_hide").css("color", "white");
			$("#sh_product_hide").css("opacity", "0.2");
			$("#sh_deletereason").css("display", "none");
		});
		
		$("#sh_product_ad").click(function(){
			$("#sh_realty_status").val("광고중");
			
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");
			$(".sh_product_progress_btn").css("opacity", "1");
			$("#sh_product_ad").css("background-color", "#61C0BF");
			$("#sh_product_ad").css("color", "white");
			$("#sh_deletereason").css("display", "none");
			
			$("#sh_updateformhide").hide();
		});
		
		$("#sh_product_ing").click(function(){
			$("#sh_realty_status").val("계약진행중");
			
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");	
			$(".sh_product_progress_btn").css("opacity", "1");
			$("#sh_product_ing").css("background-color", "#347f7c");
			$("#sh_product_ing").css("color", "white");
			$("#sh_deletereason").css("display", "none");
			
			$("#sh_updateformhide").hide();
		});	
		
		$("#sh_product_complete").click(function(){
			$("#sh_realty_status").val("거래완료");
			
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");	
			$(".sh_product_progress_btn").css("opacity", "1");
			$("#sh_product_complete").css("background-color", "#333333");
			$("#sh_product_complete").css("color", "white");
			$("#sh_deletereason").css("display", "none");
			
			$("#sh_updateformhide").hide();
		});
		
		$("#sh_product_delete").click(function(){
			$("#sh_realty_status").val("삭제");
			
			$(".sh_product_progress_btn").css("background-color", "white");
			$(".sh_product_progress_btn").css("color", "#61C0BF");
			$(".sh_product_progress_btn").css("opacity", "1");
			$("#sh_product_delete").css("background-color", "#ff6666");
			$("#sh_product_delete").css("color", "white");
			$("#sh_deletereason").css("display", "");
			
			$("#sh_updateformhide").hide();
		});
		
		$($("#sh_product_deleteselect")).change(function(){
			$("#sh_realty_status").val($("#sh_product_deleteselect option:selected").val());
		});
		
		$("#sh_product_pupdate").click(function(){
			
			if($("#sh_realty_status").val() == "삭제" || $("#sh_realty_status").val() == "완전삭제" ){
				var result = confirm("정말로 삭제하시겠습니까?\n삭제 시 값을 변경하실 수 없습니다.");
				if(result == false){
					return false;
				}else{
					var rresult = confirm("내 방 관리로 이동하시겠습니까?");
					if(rresult == true){
						location.href="rmylist.do?user_no="+ ${loginUser.user_no};
					}
				}
			}
			
			var realty = new Object(); 
			realty.realty_no = ${realty.realty_no }
			realty.realty_status = $("#sh_realty_status").val();
			
			$.ajax({
				url: "rsupdate.do",
				type: "post",
				data: JSON.stringify(realty),
				contentType: "application/json; charset=utf-8",
				success: function(result){
					if(result == 1){
						alert("매물상태가 수정되었습니다.");
						if($("#sh_realty_status").val() == '숨기기'){
							$("#sh_updateformhide").show();
						}
						
					}
				}
			});
		});
	});
</script>
<!-- 매물 종류 -->
<script type="text/javascript">
	$(function(){
		$(".sh_pt_btn").each(function(i){
			$("#sh_123room").css("display", "none");
			$("#sh_op").css("display", "none");
			
			//종류선택
			if($("#sh_pt_value").val() == "원룸"){
				$("#sh_pt0").css("background-color", "#61C0BF");
				$("#sh_pt0").css("color", "white");	
				$("#sh_123room").css("display", "");
			}
			
			if($("#sh_pt_value").val() == "투룸"){
				$("#sh_pt1").css("background-color", "#61C0BF");
				$("#sh_pt1").css("color", "white");		
				$("#sh_123room").css("display", "");
			}
			
			if($("#sh_pt_value").val() == "쓰리룸"){
				$("#sh_pt2").css("background-color", "#61C0BF");
				$("#sh_pt2").css("color", "white");		
				$("#sh_123room").css("display", "");
			}
			
			if($("#sh_pt_value").val() == "오피스텔"){
				$("#sh_pt3").css("background-color", "#61C0BF");
				$("#sh_pt3").css("color", "white");	
				$("#sh_op").css("display", "");
			}
			
			if($("#sh_pt_value").val() == "아파트"){
				$("#sh_pt4").css("background-color", "#61C0BF");
				$("#sh_pt4").css("color", "white");	
				$("#sh_op").css("display", "");
			}
			//건물유형
			if($("#sh_bt_value").val() == "단독주택"){
				$("#sh_bt0").css("background-color", "#61C0BF");
				$("#sh_bt0").css("color", "white");	
			}
			
			if($("#sh_bt_value").val() == "다가구주택"){
				$("#sh_bt1").css("background-color", "#61C0BF");
				$("#sh_bt1").css("color", "white");	
			}
			
			if($("#sh_bt_value").val() == "빌라/연립/다세대"){
				$("#sh_bt2").css("background-color", "#61C0BF");
				$("#sh_bt2").css("color", "white");	
			}
			
			if($("#sh_bt_value").val() == "상가주택"){
				$("#sh_bt3").css("background-color", "#61C0BF");
				$("#sh_bt3").css("color", "white");	
			}
			
			if($("#sh_bt_value").val() == "오피스텔"){
				$("#sh_bt4").css("background-color", "#61C0BF");
				$("#sh_bt4").css("color", "white");	
			}
			
			if($("#sh_bt_value").val() == "도시생활주택"){
				$("#sh_bt5").css("background-color", "#61C0BF");
				$("#sh_bt5").css("color", "white");	
			}
			
			
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
				
				$("#sh_pt_value").val($("#sh_pt"+i).val());
				$("#sh_bt_value").val(null);
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
				
				$("#sh_bt_value").val($("#sh_bt"+i).val());
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
		
		if($('input[name=month_lease]').val() != 0){
			$("#sh_tradei_btn0").css("background-color", "#61C0BF");
			$("#sh_tradei_btn0").css("color", "white");
			$("#sh_tradei_0").css("display", "");
		}
		
		if($('input[name=deposit]').val() != 0){
			$("#sh_tradei_btn0").css("background-color", "#61C0BF");
			$("#sh_tradei_btn0").css("color", "white");
			$("#sh_tradei_0").css("display", "");
		}
		
		if($('input[name=payback_deposit_lease]').val() != 0){
			$("#sh_tradei_btn1").css("background-color", "#61C0BF");
			$("#sh_tradei_btn1").css("color", "white");
			$("#sh_tradei_1").css("display", "");
		}
		
		if($('input[name=purchase]').val() != 0){
			$("#sh_tradei_btn2").css("background-color", "#61C0BF");
			$("#sh_tradei_btn2").css("color", "white");
			$("#sh_tradei_2").css("display", "");
		}
		
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
				$("input[name=deposit]").val(0);
				$("input[name=month_lease]").val(0);
			}		
		});
		
		$("#sh_tradei_1_cancel").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result == true){
				$("#sh_tradei_1").css("display", "none");
				$("#sh_tradei_btn1").css("background-color", "white");
				$("#sh_tradei_btn1").css("color", "#61C0BF");
				$("input[name=payback_deposit_lease]").val(0);
			}
		});
		
		$("#sh_tradei_2_cancel").click(function(){
			var result = confirm("정말로 삭제하시겠습니까?");
			if(result == true){
				$("#sh_tradei_2").css("display", "none");
				$("#sh_tradei_btn2").css("background-color", "white");
				$("#sh_tradei_btn2").css("color", "#61C0BF");
				$("input[name=purchase]").val(0);
			}
		});
	});
</script>
<!-- 기본정보/건물크기 -->
<script type="text/javascript">
	$(function(){
		//공급면적
		$("#sh_sarea_m").val($("#sh_sarea_p").val() * 3.3058);
		$("#sh_sarea_p").val(Math.round($("#sh_sarea_m").val() / 3.3058));
		
		$("#sh_sarea_p").on("propertychange change keyup paste input", function(){
			$("#sh_sarea_m").val($("#sh_sarea_p").val() * 3.3058);
		});
		
		$("#sh_sarea_m").on("propertychange change keyup paste input", function(){
			$("#sh_sarea_p").val(Math.round($("#sh_sarea_m").val() / 3.3058));
		});
		
		
		//전용면적
		$("#sh_earea_m").val($("#sh_earea_p").val() * 3.3058);
		$("#sh_earea_p").val(Math.round($("#sh_earea_m").val() / 3.3058));
		
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
				$("#sh_required").css("display", "block");
				$('#sh_required_text').text("해당층수가 건물층수보다 클 수 없습니다.");
				$("#sh_mybuildingfloor").val("");
				$("#sh_mybuildingfloor").focus();
			} 
		});
		
		$("#sh_totalbuildingfloor").on("change", function(){
 			if(Number($("#sh_mybuildingfloor").val()) > Number($("#sh_totalbuildingfloor").val()) || $("#sh_mybuildingfloor").val().length > $("#sh_totalbuildingfloor").val().length){
				$("#sh_required").css("display", "block");
				$('#sh_required_text').text("건물층수가 해당층수보다 작을 수 없습니다.");
				$("#sh_totalbuildingfloor").val("");
				$("#sh_totalbuildingfloor").focus();
			} 
		});
	});
</script>
<!-- 난방종류 -->
<script type="text/javascript">
	$(function(){
		
		if($("#sh_heattingsystem_value").val() == 0){
			$("#sh_heattingsystem option:eq(1)").attr("selected", "selected");
		}
		
		if($("#sh_heattingsystem_value").val() == 1){
			$("#sh_heattingsystem option:eq(2)").attr("selected", "selected");
		}
		
		if($("#sh_heattingsystem_value").val() == 2){
			$("#sh_heattingsystem option:eq(3)").attr("selected", "selected");
		}
		
		$("#sh_heattingsystem").on("change", function(){
			$("#sh_heattingsystem_value").val($("#sh_heattingsystem option:selected").val());
		});
	});
</script>
<!-- 기본정보/입주 가능일 -->
<script type="text/javascript">
	$(function(){
		$("#sh_moveindate_3").css("display", "none");
		
		if($("#sh_madate").val() == 0){
			$("#sh_moveindate_0").css("background-color", "#61C0BF");
			$("#sh_moveindate_0").css("color", "white");			
		}
		else if($("#sh_madate").val() == 1){
			$("#sh_moveindate_1").css("background-color", "#61C0BF");
			$("#sh_moveindate_1").css("color", "white");			
		}
		else{
			$("#sh_moveindate_2").css("background-color", "#61C0BF");
			$("#sh_moveindate_2").css("color", "white");	
			$("#sh_moveindate_3").css("display", "");
			$("#sh_moveindate_3").val($("#sh_madate").val());
		}
		
		$(".sh_moveindate_btn").each(function(i){
			$(".sh_moveindate_btn").click(function(){
				$("#sh_moveindate_"+i).css("background-color", "white");
				$("#sh_moveindate_"+i).css("color", "#61C0BF");
				$("#sh_moveindate_3").css("display", "none");
			});
			
			$("#sh_moveindate_"+i).click(function(){
				$("#sh_moveindate_"+i).css("background-color", "#61C0BF");
				$("#sh_moveindate_"+i).css("color", "white");
				$("#sh_moveindate_3").val("");
				
				if(i == 2){
					$("#sh_moveindate_3").css("display", "");
				}
				
				$("#sh_moveindate_3").on("change", function(){
					$("#sh_madate").val($("#sh_moveindate_3").val());
				});
				
				$("#sh_madate").val($("#sh_moveindate_"+i).val());
			});
		});
	});
</script>
<!-- 추가 정보 -->
<script type="text/javascript">
	$(function(){
		$(".sh_option_btn").each(function(i){
			//관리비
			$("#sh_maintenancefee_value").css("display", "none");
			$("#sh_maintenancefee_won").css("display", "none");
			
			if($("#sh_management_pay").val() == 0){
				$("#sh_maintenancefee_btn0").css("background-color", "#61C0BF");
				$("#sh_maintenancefee_btn0").css("color", "white");				
			}else{
				$("#sh_maintenancefee_btn1").css("background-color", "#61C0BF");
				$("#sh_maintenancefee_btn1").css("color", "white");	
				$("#sh_maintenancefee_value").css("display", "");
				$("#sh_maintenancefee_won").css("display", "");
				
				if($("#sh_management_pay").val() == 1){
					$("#sh_maintenancefee_value").val(0);
				}
			}
			
			$("#sh_maintenancefee_btn"+i).click(function(){
				$(".sh_maintenancefee_btn").css("background-color", "white");
				$(".sh_maintenancefee_btn").css("color", "#61C0BF");
				$("#sh_maintenancefee_value").css("display", "none");
				$("#sh_maintenancefee_won").css("display", "none");
				
				
				$("#sh_maintenancefee_value").val(0);
				
				$("#sh_maintenancefee_btn"+i).css("background-color", "#61C0BF");
				$("#sh_maintenancefee_btn"+i).css("color", "white");
				
				if(i == 1){
					$("#sh_maintenancefee_value").css("display", "");
					$("#sh_maintenancefee_won").css("display", "");
				}
				
				$("#sh_maintenancefee_value").on("change", function(){
					$("#sh_management_pay").val($("#sh_maintenancefee_value").val());
				});
				
				$("#sh_management_pay").val($("#sh_maintenancefee_btn"+i).val());
			});
			
			
			//주차여부
			$("#sh_parking_value").css("display", "none");
			
			if($("#sh_parking_lot").val() == 0){
				$("#sh_parking_btn0").css("background-color", "#61C0BF");
				$("#sh_parking_btn0").css("color", "white");
			}else{
				$("#sh_parking_btn1").css("background-color", "#61C0BF");
				$("#sh_parking_btn1").css("color", "white");	
				$("#sh_parking_value").css("display", "");
				
				if($("#sh_parking_value").val() == 1){
					$("#sh_parking_value").val("");
				}
			}
			
			
			$("#sh_parking_btn"+i).click(function(){
				$(".sh_parking_btn").css("background-color", "white");
				$(".sh_parking_btn").css("color", "#61C0BF");
				$("#sh_parking_value").css("display", "none");
				
				$("#sh_parking_value").val("");
				
				$("#sh_parking_btn"+i).css("background-color", "#61C0BF");
				$("#sh_parking_btn"+i).css("color", "white");
				
				if(i == 1){
					$("#sh_parking_value").css("display", "");
				}
				
				$("#sh_parking_value").on("change", function(){
					$("#sh_parking_lot").val($("#sh_parking_value").val());
				});
				
				$("#sh_parking_lot").val($("#sh_parking_btn"+i).val());
				
			});
			
			//엘리베이터
			if($("#sh_elevator").val() == 0){
				$("#sh_elevator_btn0").css("background-color", "#61C0BF");
				$("#sh_elevator_btn0").css("color", "white");					
			}else{
				$("#sh_elevator_btn1").css("background-color", "#61C0BF");
				$("#sh_elevator_btn1").css("color", "white");			
			}
			
			$("#sh_elevator_btn"+i).click(function(){
				$(".sh_elevator_btn").css("background-color", "white");
				$(".sh_elevator_btn").css("color", "#61C0BF");
				$("#sh_elevator_btn"+i).css("background-color", "#61C0BF");
				$("#sh_elevator_btn"+i).css("color", "white");	
				
				$("#sh_elevator").val($("#sh_elevator_btn"+i).val());
			});
			
			//빌트인
			if($("#sh_builtin").val() == 0){
				$("#sh_builtin_btn0").css("background-color", "#61C0BF");
				$("#sh_builtin_btn0").css("color", "white");					
			}else{
				$("#sh_builtin_btn1").css("background-color", "#61C0BF");
				$("#sh_builtin_btn1").css("color", "white");			
			}			
			
			$("#sh_builtin_btn"+i).click(function(){
				$(".sh_builtin_btn").css("background-color", "white");
				$(".sh_builtin_btn").css("color", "#61C0BF");
				$("#sh_builtin_btn"+i).css("background-color", "#61C0BF");
				$("#sh_builtin_btn"+i).css("color", "white");
				
				$("#sh_builtin").val($("#sh_builtin_btn"+i).val());
			});
			
			//반려동물
			if($("#sh_allowance_pet").val() == 0){
				$("#sh_pet_btn0").css("background-color", "#61C0BF");
				$("#sh_pet_btn0").css("color", "white");					
			}else{
				$("#sh_pet_btn1").css("background-color", "#61C0BF");
				$("#sh_pet_btn1").css("color", "white");			
			}	
			
			$("#sh_pet_btn"+i).click(function(){
				$(".sh_pet_btn").css("background-color", "white");
				$(".sh_pet_btn").css("color", "#61C0BF");
				$("#sh_pet_btn"+i).css("background-color", "#61C0BF");
				$("#sh_pet_btn"+i).css("color", "white");	
				
				$("#sh_allowance_pet").val($("#sh_pet_btn"+i).val());
			});
			
			//베란다/발코니
			if($("#sh_balcony").val() == 0){
				$("#sh_veranda_btn0").css("background-color", "#61C0BF");
				$("#sh_veranda_btn0").css("color", "white");					
			}else{
				$("#sh_veranda_btn1").css("background-color", "#61C0BF");
				$("#sh_veranda_btn1").css("color", "white");			
			}	
			
			$("#sh_veranda_btn"+i).click(function(){
				$(".sh_veranda_btn").css("background-color", "white");
				$(".sh_veranda_btn").css("color", "#61C0BF");
				$("#sh_veranda_btn"+i).css("background-color", "#61C0BF");
				$("#sh_veranda_btn"+i).css("color", "white");		
				
				$("#sh_balcony").val($("#sh_veranda_btn"+i).val());
			});
			
			//전세자금대출
			if($("#sh_loan_availability").val() == 0){
				$("#sh_loan_btn0").css("background-color", "#61C0BF");
				$("#sh_loan_btn0").css("color", "white");					
			}else{
				$("#sh_loan_btn1").css("background-color", "#61C0BF");
				$("#sh_loan_btn1").css("color", "white");			
			}
			
			$("#sh_loan_btn"+i).click(function(){
				$(".sh_loan_btn").css("background-color", "white");
				$(".sh_loan_btn").css("color", "#61C0BF");
				$("#sh_loan_btn"+i).css("background-color", "#61C0BF");
				$("#sh_loan_btn"+i).css("color", "white");	
				
				$("#sh_loan_availability").val($("#sh_loan_btn"+i).val());
			});
			
			//구조
			if($("#sh_structure").val() == 0){
				$("#sh_structure_btn0").css("background-color", "#61C0BF");
				$("#sh_structure_btn0").css("color", "white");					
			}else if($("#sh_structure").val() == 1){
				$("#sh_structure_btn1").css("background-color", "#61C0BF");
				$("#sh_structure_btn1").css("color", "white");			
			}else if($("#sh_structure").val() == 2){
				$("#sh_structure_btn2").css("background-color", "#61C0BF");
				$("#sh_structure_btn2").css("color", "white");			
			}else if($("#sh_structure").val() == 3){
				$("#sh_structure_btn3").css("background-color", "#61C0BF");
				$("#sh_structure_btn3").css("color", "white");			
			}
			
			$("#sh_structure_btn"+i).click(function(){
				$(".sh_structure_btn").css("background-color", "white");
				$(".sh_structure_btn").css("color", "#61C0BF");
				$("#sh_structure_btn"+i).css("background-color", "#61C0BF");
				$("#sh_structure_btn"+i).css("color", "white");	
				
				$("#sh_structure").val($("#sh_structure_btn"+i).val());
			});
			
			//옵션항목
			if($("#sh_option_btn_value"+i).val() == 1){
				$("#sh_option_btn"+i).css("background-color", "#61C0BF");
				$("#sh_option_btn"+i).css("color", "white");	
				$("#sh_option_btn"+i).val(1);
			}
			
			if($(".sh_option_btn_value").val() == 0 ){
			   		$("#sh_option_btn0").val(1);
					$("#sh_option_btn0").css("background-color", "#61C0BF");
					$("#sh_option_btn0").css("color", "white");
			   }
			
			$("#sh_option_btn"+i).click(function(){
 				
				$("#sh_option_btn0").css("background-color", "white");
				$("#sh_option_btn0").css("color", "#61C0BF");
				$("#sh_option_btn0").val(0);
				
				if($("#sh_option_btn"+i).val() == 1){
					$("#sh_option_btn"+i).val(0);
					$("#sh_option_btn_value"+i).val(0);
					$("#sh_option_btn"+i).css("background-color", "white");
					$("#sh_option_btn"+i).css("color", "#61C0BF");
					
					if($("#sh_option_btn1").val() == 0 &&
					   $("#sh_option_btn2").val() == 0 &&		
					   $("#sh_option_btn3").val() == 0 &&
					   $("#sh_option_btn4").val() == 0 &&
					   $("#sh_option_btn5").val() == 0 &&
					   $("#sh_option_btn6").val() == 0 &&
					   $("#sh_option_btn7").val() == 0 &&
					   $("#sh_option_btn8").val() == 0 &&
					   $("#sh_option_btn9").val() == 0 &&
					   $("#sh_option_btn10").val() == 0 &&
					   $("#sh_option_btn11").val() == 0 &&
					   $("#sh_option_btn12").val() == 0 &&
					   $("#sh_option_btn13").val() == 0){
					   $("#sh_option_btn0").val(1);
					   $("#sh_option_btn0").css("background-color", "#61C0BF");
					   $("#sh_option_btn0").css("color", "white");
					}
					
				}else if($("#sh_option_btn"+i).val() == 0){
					$("#sh_option_btn"+i).val(1);
					$("#sh_option_btn_value"+i).val(1);
					$("#sh_option_btn"+i).css("background-color", "#61C0BF");
					$("#sh_option_btn"+i).css("color", "white");
				}
				
 				if(i == 0){
					$(".sh_option_btn").css("background-color", "white");
					$(".sh_option_btn").css("color", "#61C0BF");	
	 				$("#sh_option_btn0").css("background-color", "#61C0BF");
					$("#sh_option_btn0").css("color", "white");
					$(".sh_option_btn").val(0);
					$(".sh_option_btn_value").val(0);
					$("#sh_option_btn0").val(1);
				} 
			});
		});
	});
</script>
<!-- 상세설명 </br>처리 -->
<script type="text/javascript">
	$(function(){
		var str = $("#sh_realty_detail_comment").val();
		str = str.split('<br/>').join("\r\n");
		$('#sh_detaili_textarea').val(str);
	});	
</script>
<!-- 사진 등록 -->
<script type="text/javascript">
	$(function(){
		$(".sh_phototype_btn").css("background-color", "white");
		$(".sh_phototype_btn").css("color", "#61C0BF");	
		$("#sh_phototype_btn0").css("background-color", "#61C0BF");
		$("#sh_phototype_btn0").css("color", "white");
		
		$("#sh_commonphotoform").css("display", "none");
		$("#sh_360photoform").css("display", "none");
		$("#sh_commonphotoform").css("display", "");
		
		
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
<!-- 사진 등록 2 -->
<script type="text/javascript">
$(function() {
	$(".sh_pip").css("display", "none");
    $(".sh_remove").css("display", "none");
    $("#sh_file_thumbnail_0").css("display", "none");
    $("#sh_file_preveal_0").css("display", "");
        
	$(".sh_load_realty_image").each(function(i){
		
        if($("#sh_load_realty_image"+i).val() != ""){
        	$("#sh_file_preveal_0").css("display", "none");
        	$("#sh_file_thumbnail_0").css("display", "");
        	
			var root = "${pageContext.request.contextPath }/files/realty/realtyNormalImages/";
			var loadfilename = $('#sh_load_realty_image'+i).val();
			
			$("#sh_realty_image_name"+i).css("color", "grey");
        	$("#sh_realty_image_name"+i).val(loadfilename.substring(13) + " [기존 업로드한 사진]");
			
    		$("#sh_pip"+i).css("display", "");
            $("#sh_remove"+i).css("display", "");
            $('#sh_file_thumbnail_preview'+i).attr("src", root+loadfilename);
        }
        
		$("#sh_remove"+i).click(function() {
			$("#sh_load_realty_image"+i).val("");

			$("#sh_realty_image"+i).val("");
			document.querySelector('#sh_file_thumbnail_preview'+i).src = "" ;
			
			$("#sh_realty_image_name"+i).css("color", "#61C0BF");
			$("#sh_realty_image_name"+i).val("파일선택");
	        $("#sh_pip"+i).css("display", "none");
	        $("#sh_remove"+i).css("display", "none");
	        
			if($("#sh_load_realty_image0").val() == "" &&
			   $("#sh_load_realty_image1").val() == "" &&
			   $("#sh_load_realty_image2").val() == "" &&
			   $("#sh_load_realty_image3").val() == "" &&
			   $("#sh_load_realty_image4").val() == "" &&
			   $("#sh_load_realty_image5").val() == "" &&
			   $("#sh_load_realty_image6").val() == "" &&
			   $("#sh_load_realty_image7").val() == "" &&
			   $("#sh_realty_image0").val() == "" &&
			   $("#sh_realty_image1").val() == "" &&
			   $("#sh_realty_image2").val() == "" &&
			   $("#sh_realty_image3").val() == "" &&
			   $("#sh_realty_image4").val() == "" &&
			   $("#sh_realty_image5").val() == "" &&
			   $("#sh_realty_image6").val() == "" &&
			   $("#sh_realty_image7").val() == "" ){
				$("#sh_file_preveal_0").css("display","");
				$("#sh_file_thumbnail_0").css("display", "none");
			}
		});
	}); //each
	
	
	$(".realty_image").each(function(i){
		
		$("#sh_realty_image"+i).on("change", function(e){
			$("#sh_realty_image_name"+i).css("color", "#61C0BF");
			
			$("#sh_load_realty_image"+i).val("");
			
			$("#sh_file_preveal_0").css("display","none");
			$("#sh_file_thumbnail_0").css("display", "");
			
			var strFile = $("#sh_realty_image"+i).val();
			var lastIndex = strFile.lastIndexOf('\\');
			var strFileName = strFile.substring(lastIndex + 1, strFile.length);
			$("#sh_realty_image_name"+i).val(strFileName);
			
			if($("#sh_realty_image"+i).val() == ""){
				$("#sh_load_realty_image"+i).val("");

				document.querySelector('#sh_file_thumbnail_preview'+i).src = "" ;
		        $("#sh_pip"+i).css("display", "none");
		        $("#sh_remove"+i).css("display", "none");
		        $("#sh_realty_image_name"+i).val("파일선택");
			}
		});
		
		var file = document.querySelector("#sh_realty_image"+i);

		file.onchange = function () { 
		    var fileList = file.files ;
		    
		    // 읽기
		    var reader = new FileReader();
		    reader.readAsDataURL(fileList [0]);

		    //로드 한 후
		    reader.onload = function  () {
		        document.querySelector('#sh_file_thumbnail_preview'+i).src = reader.result ;
		        $("#sh_pip"+i).css("display", "");
		        $("#sh_remove"+i).css("display", "");
		    }; 
		}; 		
	});


});
</script>
<!-- 사진등록 3 -->
<script type="text/javascript">
$(function(){
    $(".sh_360pip").css("display", "none");
    $(".sh_360remove").css("display", "none");
    $("#sh_file_thumbnail_1").css("display", "none");
    $("#sh_file_preveal_1").css("display", "");
    
    if($("#sh_load_image360").val() != ""){
    	$("#sh_file_preveal_1").css("display", "none");
    	$("#sh_file_thumbnail_1").css("display", "");    
    	
		var root = "${pageContext.request.contextPath }/files/realty/realty360Images/";
		var loadfilename = $("#sh_load_image360").val();
		
		$("#sh_360_image_name").css("color", "grey");
    	$("#sh_360_image_name").val(loadfilename.substring(13) + " [기존 업로드한 사진]");		
    	
		$("#sh_360pip").css("display", "");
        $("#sh_360remove").css("display", "");
        $('#sh_360file_thumbnail_preview').attr("src", root+loadfilename);
    }
	
	$("#sh_360_image").on("change", function(e){
		$("#sh_360_image_name").css("color", "#61C0BF");
		$("#sh_load_image360").val("");
		
		$("#sh_file_preveal_1").css("display","none");
		$("#sh_file_thumbnail_1").css("display", "");
		
		var strFile = $("#sh_360_image").val();
		var lastIndex = strFile.lastIndexOf('\\');
		var strFileName = strFile.substring(lastIndex + 1, strFile.length);
		$("#sh_360_image_name").val(strFileName);
		
		if($("#sh_360_image").val() == ""){
			document.querySelector('#sh_360file_thumbnail_preview').src = "" ;
	        $("#sh_360pip").css("display", "none");
	        $("#sh_360remove").css("display", "none");
	        $("#sh_360_image_name").val("파일선택");
		}
		
	});
	
	$("#sh_360remove").click(function() {
		$("#sh_load_image360").val("");
		$("#sh_360_image").val("");
		document.querySelector('#sh_360file_thumbnail_preview').src = "" ;
		
		$("#sh_360_image_name").css("color", "#61C0BF");
		$("#sh_360_image_name").val("파일선택");
        $("#sh_360pip").css("display", "none");
        $("#sh_360remove").css("display", "none");
        
		if($("#sh_360_image").val() == "" ){
			$("#sh_file_preveal_1").css("display","");
			$("#sh_file_thumbnail_1").css("display", "none");
		}
	});
	
	var file = document.querySelector("#sh_360_image");

	file.onchange = function () { 
	    var fileList = file.files ;
	    
	    // 읽기
	    var reader = new FileReader();
	    reader.readAsDataURL(fileList [0]);

	    //로드 한 후
	    reader.onload = function  () {
	        document.querySelector('#sh_360file_thumbnail_preview').src = reader.result ;
	        $("#sh_360pip").css("display", "");
	        $("#sh_360remove").css("display", "");
	    }; 
	}; 	
});
</script>
<!-- 중간정검용 확인 function (삭제 예정) -->
<script type="text/javascript">
	$(function(){
		$("#psubmit").click(function(){
			console.log("확인");
			console.log("매물종류 : " + $('input[name=realty_type]').val());
			console.log("건물유형 : " + $('input[name=building_type]').val());
			console.log("도로명주소 : " + $('input[name=road_address]').val());
			console.log("지번주소 : " + $('input[name=land_lot]').val());
			console.log("상세주소 : " + $('input[name=detail_address]').val());
			console.log("월세 : " + $('input[name=month_lease]').val());
			console.log("보증금 : " + $('input[name=deposit]').val());
			console.log("전세 : " + $('input[name=payback_deposit_lease]').val());
			console.log("매매 : " + $('input[name=purchase]').val());
			console.log("공급면적 : " + $('input[name=residential]').val());
			
			console.log("전용면적 : " + $('input[name=exclusive_area]').val());
			console.log("건물층수 : " + $('input[name=building_layers]').val());
			console.log("해당층수 : " + $('input[name=realty_layers]').val());
			console.log("난방종류 : " + $('input[name=heatting_system]').val());
			console.log("입주가능일 : " + $('input[name=move_available_date]').val());
			console.log("관리비 : " + $('input[name=management_pay]').val());
			console.log("주차여부 : " + $('input[name=parking_lot]').val());
			console.log("엘리베이터 : " + $('input[name=elevator]').val());
			console.log("빌트인 : " + $('input[name=builtin]').val());
			console.log("반려동물 : " + $('input[name=allowance_pet]').val());
			  
			console.log("베란다/발코니 : " + $('input[name=balcony]').val());
			console.log("전세자금대출 : " + $('input[name=loan_availability]').val());
			console.log("구조 : " + $('input[name=structure]').val());
			console.log("에어컨 : " + $('input[name=airconditioner]').val());
			console.log("세탁기 : " + $('input[name=laundry_machine]').val());
			console.log("침대 : " + $('input[name=bed]').val());
			console.log("책상 : " + $('input[name=desk]').val());
			console.log("옷장 : " + $('input[name=closet]').val());
			console.log("TV : " + $('input[name=tv]').val());
			console.log("가스레인지 : " + $('input[name=gasrange]').val());

			console.log("신발장 : " + $('input[name=shoe_shelf]').val());
			console.log("냉장고 : " + $('input[name=refrigerator]').val());
			console.log("인덕션 : " + $('input[name=induction]').val());
			console.log("전자레인지 : " + $('input[name=microwave]').val());
			console.log("전자도어락 : " + $('input[name=door_lock]').val());
			console.log("비데 : " + $('input[name=bidet]').val());
			console.log("상세정보제목 : " + $('input[name=realty_detail_title]').val());
			console.log("상세정보설명 : " + $('textarea[name=realty_detail_comment]').val());
			console.log("일반사진1 : " + $('input[name=realty_image1]').val());
			console.log("일반사진 2: " + $('input[name=realty_image2]').val());
			
			console.log("일반사진3 : " + $('input[name=realty_image3]').val());
			console.log("일반사진4 : " + $('input[name=realty_image4]').val());
			console.log("일반사진5 : " + $('input[name=realty_image5]').val());
			console.log("일반사진6 : " + $('input[name=realty_image6]').val());
			console.log("일반사진7 : " + $('input[name=realty_image7]').val());
			console.log("일반사진8 : " + $('input[name=realty_image8]').val());
			console.log("360도사진 : " + $('input[name=image360]').val());
			console.log("회원번호 : " + $('input[name=user_no]').val());
		});
	});
</script>
<!--  required -->
<script type="text/javascript">
$(function(){
	//close
	$("#sh_required_close").click(function(){
		$("#sh_required").css("display", "none");
	});
	//제출버튼 클릭 시
	$("#psubmit").click(function(){
		
		//상세설명 <br>로 변환
		var str = $("#sh_detaili_textarea").val(); 
		str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
		$("#sh_detaili_textarea").val(str); 
		
		//매물종류
		if($('input[name=realty_type]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 매물종류를 선택하셔야 합니다.");
			
			var offset = $('#sh_pt').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		
		//주소
		else if($('input[name=road_address]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 주소를 입력하셔야 합니다.");
			
			var offset = $('#sh_li_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		else if($('input[name=detail_address]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 상세주소를 입력하셔야 합니다.");
			
			var offset = $('#sh_li_title').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		
		//거래종류
		else if($('input[name=month_lease]').val() == 0 &&
		   $('input[name=deposit]').val() == 0	&&
		   $('input[name=payback_deposit_lease]').val() == 0 &&
		   $('input[name=purchase]').val() == 0){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 거래종류를 1개 이상 입력하셔야 합니다.");
			
			var offset = $('#sh_tradei').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		} 
		
		//공급면적
		else if($('input[name=residential]').val() == 0){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 공급면적을 입력하셔야 합니다.");
			
			var offset = $('#sh_basici').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			
			$("input[name=residential]").focus();
		}
		
		//전용면적
		else if($('input[name=exclusive_area]').val() == 0){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 전용면적을 입력하셔야 합니다.");
			
			var offset = $('#sh_basici').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			
			$("input[name=exclusive_area]").focus();
		}		
		
		//건물층수
		else if($('input[name=building_layers]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 건물층수를 입력하셔야 합니다.");
			
			var offset = $('#sh_basici').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			
			$("input[name=building_layers]").focus();
		}
		
		//건물층수
		else if($('input[name=realty_layers]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 해당층수를 입력하셔야 합니다.");
			
			var offset = $('#sh_basici').offset();
			$("html, body").animate({scrollTop:offset.top},500);
			
			$("input[name=realty_layers]").focus();
		}			
		
		//난방종류
		else if($('input[name=heatting_system]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 난방종류를 선택하셔야 합니다.");
			
			var offset = $('#sh_heattingsystem').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		
		//입주 가능일
		else if($('input[name=move_available_date]').val() == ""){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 등록하실려면 입주가능일을 선택하셔야 합니다.");
			
			var offset = $('#sh_moveindate').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		
		else if($('input[name=move_available_date]').val() == "2"){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("날짜를 선택하셔야 합니다.");
			
			var offset = $('#sh_moveindate').offset();
			$("html, body").animate({scrollTop:offset.top},500);
		}
		
		//checkbox
		else if($("#customCheck1").is(":checked") == false){
			$("#sh_required").css("display", "block");
			$('#sh_required_text').text("매물을 수정하실려면 매물관리 규정 확인과 실제 매물과 다름이 없다는 것에 동의하셔야 합니다.");
		}
		
		else{
			
			if($('input[name=month_lease]').val() == ""){
				$('input[name=month_lease]').val(0)
			}
			if($('input[name=deposit]').val() == ""){
				$('input[name=deposit]').val(0)
			}
			if($('input[name=payback_deposit_lease]').val() == ""){
				$('input[name=payback_deposit_lease]').val(0)
			}
			if($('input[name=purchase]').val() == ""){
				$('input[name=purchase]').val(0)
			}
			
			$("#sh_realty_form").submit();
			alert("매물정보가 수정되었습니다.");
		}
	});			
});

</script>

<style type="text/css">
/* ------------------수정---------------------------- */

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
	border: 1px solid #61C0BF;
	background-color:#f2f2f2;	
	color:white;
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

/* ------------------수정---------------------------- */

#sh_commonphotoform label,
#sh_360photoform label {
	background-color:#61C0BF;	
	color:white;
	padding:8px 8px;
	margin: 8px;
	border: 1px solid #61C0BF;
	border-radius:4px;
	font-size:10pt;
	text-align:center;
	cursor:pointer
}

.sh_realty_image_name,
.sh_360_image_name {
	display: inline-block;
	border-radius:4px;
	background-color:white;	
	padding:8px 8px;
	width: 50%;
	color:#61C0BF;
	border: 1px solid #61C0BF;
	font-size:10pt;
}

.sh_file_thumbnail_preview,
.sh_360file_thumbnail_preview {
  max-height: 200px;
  border: 1px solid #f2f2f2;
  cursor: pointer;
}
.sh_pip,
.sh_360pip {
  display: inline-block;
  margin: 5px 5px 0 0;
}
.sh_remove,
.sh_360remove {
  display: block;
  background: #c8e9e9;
  color: white;
  text-align: center;
  cursor: pointer;
}

.sh_remove:hover,
.sh_360remove:hover {
  background: #61C0BF;
}

#sh_required {
	display: none;
	position: fixed;
	z-index: 3;
	color: #0c5460;
	background-color: #d1ecf1;
	border-color: #bee5eb;
	border-radius: 5px;
	margin-left: 55%;
    margin-right: 3%;
    padding: 15px;
}

#sh_required_close {
	float: right;
	cursor: pointer;
}

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

.sh_file_thumbnail {
        text-align: left;
        padding: 60px;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
        background-color:rgba(0,0,0, 0.01);
        width:100%;
}

#map {
        font-size: 15px;
        border: 1px solid #f2f2f2;
        border-radius: 5px;
		text-align: center;
		float:right;
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

#sh_realty_form h6 {
	text-align:center;
	outline: none;
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
#sh_basici input[type=text],
#sh_tradei input[type=number],
#sh_basici input[type=number] {
	width:20%;
	border: 1px solid #ced4da;
	border-radius:5px;
	height:30.8px;
	padding:5px;
}

#sh_additioni input[type=text],
#sh_additioni input[type=number] {
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
<c:import url="../common/realtyHeader.jsp" /><br>
<form id="sh_realty_form" action="rupdate.do" method="post" enctype="multipart/form-data">
<input type="hidden" name="user_no" value="${loginUser.user_no}">
<input type="hidden" name="realty_no" value="${realty.realty_no }">
<div class="container" style="font-family: a고딕12;">
  	<div id="sh_required"><!-- required alert -->
   		<strong>필수!</strong> <span id="sh_required_text"></span>&nbsp;&nbsp;&nbsp;
   		<span id="sh_required_close"><i class="fas fa-times"></i></span>
	</div><!-- required alert -->
	<div class="row">
		<div class="col-md-12">
			<div class="row"> <!-- 매물 수정 -->
				<div class="col-md-12">
					<br><h4 class="text-center">매물 수정</h4><hr>
					<div class="row">
						<div class="col-md-12">
							<div id="sh_pi">
								매물을 더 이상 광고하지 않길 원하시면 '숨기기'하면 됩니다.<br>
								허위 매물 등록 시 법적 처벌을 받을 수 있습니다.<br><br>
								매물상태가 '광고중'이거나 '계약진행중' 일 때는 수정이 불가합니다.<br>
								매물상태가 '숨기기' 상태이거나 '거래완료' 되었을 때 정보 수정이 가능합니다.<br>		
							</div>			
						</div>
					</div>					
				</div>
			</div>  <!-- 매물 수정 -->
			<br><br>
			<c:if test="${realty.realty_status != '검수중' }">
			<div class="row" id="sh_product_progress"> <!-- 매물 상태 수정 -->
				<div class="col-md-12">
						<h6>매물 상태 수정</h6><hr>	
					<div class="row">
						<div class="col-md-2">
							매물 상태
							<input type="hidden" id="sh_realty_status" name="realty_status" value="${realty.realty_status }">
						</div>
						<div class="col-md-10">
							<input type="button" class="sh_product_progress_btn" id="sh_product_hide" value="숨기기">
							<input type="button" class="sh_product_progress_btn" id="sh_product_ad" value="광고중">
							<input type="button" class="sh_product_progress_btn" id="sh_product_ing" value="계약진행중">
							<input type="button" class="sh_product_progress_btn" id="sh_product_complete" value="거래완료">
							<input type="button" class="sh_product_progress_btn" id="sh_product_delete" value="삭제">
							<input type="button" id="sh_product_pupdate" value="매물상태수정">
						</div>
					</div>
					<div class="row" id="sh_deletereason">
						<div class="col-md-2">
							삭제 사유
						</div>
						<div class="col-md-10">
							<select class="custom-select" id="sh_product_deleteselect">
								<option value="삭제" style="color:grey">삭제사유 선택</option>
								<option value="삭제">매물 거래가 완료되어서 매물을 노출시키고 싶지 않습니다.</option>
								<option value="완전삭제">천재지변에 의해서 매물을 판매할 수 없게 되었습니다.</option>
								<option value="완전삭제">매물 정보가 잘못입력되었습니다.</option>
								<option value="삭제">정보공개를 원치 않습니다.</option>
							</select>
						</div>
					</div>																
				</div>
			</div> <!-- 매물 상태 수정 -->
			</c:if>
			<div id="sh_updateformhide"><!-- 영역 숨기기를 위한 영역 잡아줌 -->
			<br><br>
			<div class="row">  <!-- 매물 종류 수정 -->
				<div id="sh_pt" class="col-md-12"><br>
					<h6>매물 종류 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">종류선택
						<input type="hidden" id="sh_pt_value" name="realty_type" value="${realty.realty_type }">
						</div>
						<div class="col-md-10">
								<input type="button" class="sh_pt_btn" id="sh_pt0" value="원룸">
								<input type="button" class="sh_pt_btn" id="sh_pt1" value="투룸">
								<input type="button" class="sh_pt_btn" id="sh_pt2" value="쓰리룸">
								<input type="button" class="sh_pt_btn" id="sh_pt3" value="오피스텔">
								<input type="button" class="sh_pt_btn" id="sh_pt4" value="아파트">
						</div>
					</div>
					<div class="row" id="sh_123room">
						<div class="col-md-2">건물유형
						<input type="hidden" id="sh_bt_value" name="building_type" value="${realty.building_type }">
						</div>
						<div class="col-md-10">
								<input type="button" class="sh_bt_btn" id="sh_bt0" value="단독주택">
								<input type="button" class="sh_bt_btn" id="sh_bt1" value="다가구주택">
								<input type="button" class="sh_bt_btn" id="sh_bt2" value="빌라/연립/다세대">
								<input type="button" class="sh_bt_btn" id="sh_bt3" value="상가주택">
						</div>
					</div>	
					<div class="row" id="sh_op">
						<div class="col-md-2">건물유형
						</div>
						<div class="col-md-10">
								<input type="button" class="sh_bt_btn" id="sh_bt4" value="오피스텔">
								<input type="button" class="sh_bt_btn" id="sh_bt5" value="도시생활주택">
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
										<a>도로명, 지번에 대해 통합검색이 가능합니다.</a>									
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
										<input type="text" class="tablecontent" id="sh_roadAddress" name="road_address" value="${realty.road_address }" readonly><br>
										<input type="text" class="tablecontent" id="sh_jibunAddress" name="land_lot" value="${realty.land_lot }" readonly>
										<span id="guide" style="color:#999;display:none"></span>
									</td>
								</tr>
								<tr>
									<td colspan="2">
										<input type="text" id="sh_detailAddress" name="detail_address" value="${realty.detail_address }" placeholder="동/호 를 입력해주세요 ex) 102동 304호">
									</td>
								</tr>														 
							</table>
							</div>
							<div class="col-md-5">
								<div id="map"></div>
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
    
    //주소로 좌표를 검색합니다
    geocoder.addressSearch('${realty.road_address }', function(result, status) {

        // 정상적으로 검색이 완료됐으면 
         if (status === daum.maps.services.Status.OK) {

            var coords = new daum.maps.LatLng(result[0].y, result[0].x);

            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
            map.setCenter(coords);
            
            // 결과값으로 받은 위치를 마커로 표시합니다
            var marker = new daum.maps.Marker({
                map: map,
                position: coords
            });
        } 
    });    
    
    function sh_execDaumPostcode() {
        new daum.Postcode({
            oncomplete: function(data) {
            	
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
                    document.getElementById("sh_roadAddress").value = expRoadAddr;
                    guideTextBox.style.display = 'block';

                } else if(data.autoJibunAddress) {
                    var expJibunAddr = data.autoJibunAddress;
                    guideTextBox.innerHTML = '(예상 지번 주소 : ' + expJibunAddr + ')';
                    document.getElementById("sh_jibunAddress").value = expJibunAddr;
                    guideTextBox.style.display = 'block';
                    
                } else {
                    guideTextBox.innerHTML = '';
                    guideTextBox.style.display = 'none';
                }
                
                // 주소 정보를 해당 필드에 넣는다.
                document.getElementById("sh_roadAddress").value = roadAddr;
                // 주소로 상세 정보를 검색
                geocoder.addressSearch(data.address, function(results, status) {
                    // 정상적으로 검색이 완료됐으면
                    if (status === daum.maps.services.Status.OK) {

                        var result = results[0]; //첫번째 결과의 값을 활용

                        // 해당 주소에 대한 좌표를 받아서
                        var coords = new daum.maps.LatLng(result.y, result.x);
                        // 지도를 보여준다.
                        mapContainer.style.display = "block";
                        map.relayout();
                        // 지도 중심을 변경한다.
                        map.setCenter(coords);
                        // 마커를 결과값으로 받은 위치로 옮긴다.
                        marker.setPosition(coords)
                    }
                });
                
            }
        }).open();
    }    
</script>					
			</div>  <!-- 위치 정보 -->
			<br><br>
			<div class="row" id="sh_tradei"> <!-- 거래 정보 수정 -->
				<div class="col-md-12">
						<h6>거래 정보 수정</h6><hr>				
					<div class="row">
						<div class="col-md-2">
							거래 종류
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_tradei_btn" id="sh_tradei_btn0">월세</button>
							<button type="button" class="sh_tradei_btn" id="sh_tradei_btn1">전세</button>
							<button type="button" class="sh_tradei_btn" id="sh_tradei_btn2">매매</button>
						</div>
					</div>
					<div class="row" id="sh_tradei_0">
						<div class="col-md-2">
							보증금 / 월세
						</div>					
						<div class="col-md-10" float="left">
							<input type="number" name="deposit" placeholder="보증금" min="0" value="${realty.deposit }"> / 
							<input type="number" name="month_lease" placeholder="월세" min="0" value="${realty.month_lease }"> 원
							<button type="button" id="sh_tradei_0_cancel"><i class="fas fa-times"></i></button>
						</div>
					</div>
					<div class="row" id="sh_tradei_1">
						<div class="col-md-2">
							전세
						</div>					
						<div class="col-md-10">
							<input type="number" name="payback_deposit_lease" placeholder="전세" min="0" value="${realty.payback_deposit_lease }"> 원
							<button type="button" id="sh_tradei_1_cancel"><i class="fas fa-times"></i></button>						
						</div>
					</div>
					<div class="row" id="sh_tradei_2">
						<div class="col-md-2">
							매매
						</div>					
						<div class="col-md-10">
							<input type="number" name="purchase" placeholder="매매" min="0" value="${realty.purchase }"> 원
							<button type="button" id="sh_tradei_2_cancel"><i class="fas fa-times"></i></button>						
						</div>
					</div>					
				</div>
			</div> <!-- 거래 정보 -->
			<br><br>
			<div class="row" id="sh_basici"> <!-- 기본 정보 수정 -->
				<div class="col-md-12">
							<h6>기본 정보 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">
							건물크기 <br>(1P = 3.3058㎡)
						</div>
						<div class="col-md-10">
							공급면적 <input type="number" id="sh_sarea_p" name="residential" min="0" value="${realty.residential }"> 평 <input type="text" id="sh_sarea_m" min="0" value="0"> ㎡ <hr>
							전용면적 <input type="number" id="sh_earea_p" name="exclusive_area" min="0" value="${realty.exclusive_area }"> 평 <input type="text" id="sh_earea_m" min="0" value="0"> ㎡
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							건물층수 / 해당층수
						</div>
						<div class="col-md-10">
							건물층수 <input type="number" placeholder="건물의 총" id="sh_totalbuildingfloor" name="building_layers" value="${realty.building_layers }"> 층  <hr>
							해당층수 <input type="number" placeholder="내가 사는" id="sh_mybuildingfloor" name="realty_layers" value="${realty.realty_layers }"> 층
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							난방종류
						</div>
						<div class="col-md-10">
							<input type="hidden" id="sh_heattingsystem_value" name="heatting_system" value="${realty.heatting_system }">
							<select class="custom-select" id="sh_heattingsystem">
								<option>난방 종류 선택</option>
								<option value="0">중앙난방</option>
								<option value="1">개별난방</option>
								<option value="2">지역난방</option>
							</select>
						</div>
					</div>
					<div class="row" id="sh_moveindate">
						<div class="col-md-2">
							입주 가능일
							<input type="hidden" id="sh_madate" name="move_available_date" value="${realty.move_available_date }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_moveindate_btn" id="sh_moveindate_0" value="0">즉시 입주</button>
							<button type="button" class="sh_moveindate_btn" id="sh_moveindate_1" value="1">날짜 협의</button>
							<button type="button" class="sh_moveindate_btn" id="sh_moveindate_2" value="2">날짜 선택</button>
							<input type="date" id="sh_moveindate_3">
						</div>
					</div>
				</div>
			</div>  <!-- 기본 정보 -->
			<br><br>
			<div class="row" id="sh_additioni"> <!-- 추가 정보 수정 -->
				<div class="col-md-12">
					<h6>추가 정보 수정</h6><hr>
					<div class="row">
						<div class="col-md-2">
							관리비
							<input type="hidden" id="sh_management_pay" name="management_pay" value="${realty.management_pay }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_maintenancefee_btn" id="sh_maintenancefee_btn0" value="0">없음</button>
							<button type="button" class="sh_maintenancefee_btn" id="sh_maintenancefee_btn1" value="1">있음</button>
							<input type="number" id="sh_maintenancefee_value" placeholder="0" value="${realty.management_pay }"><span id="sh_maintenancefee_won"> 원</span>
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							주차여부
							<input type="hidden" id="sh_parking_lot" name="parking_lot" value="${realty.parking_lot }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_parking_btn" id="sh_parking_btn0" value="0">불가능</button>
							<button type="button" class="sh_parking_btn" id="sh_parking_btn1" value="1">가능</button>	
							<input type="text" id="sh_parking_value" value="${realty.parking_lot }" placeholder="option : ex)세대 당 1대">					
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							엘리베이터
							<input type="hidden" id="sh_elevator" name="elevator" value="${realty.elevator }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_elevator_btn" id="sh_elevator_btn0" value="0">없음</button>
							<button type="button" class="sh_elevator_btn" id="sh_elevator_btn1" value="1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							빌트인
							<input type="hidden" id="sh_builtin" name="builtin" value="${realty.builtin }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_builtin_btn" id="sh_builtin_btn0" value="0">없음</button>
							<button type="button" class="sh_builtin_btn" id="sh_builtin_btn1" value="1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							반려동물
							<input type="hidden" id="sh_allowance_pet" name="allowance_pet" value="${realty.allowance_pet }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_pet_btn" id="sh_pet_btn0" value="0">불가능</button>
							<button type="button" class="sh_pet_btn" id="sh_pet_btn1" value="1">가능</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							베란다/발코니
							<input type="hidden" id="sh_balcony" name="balcony" value="${realty.balcony }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_veranda_btn" id="sh_veranda_btn0" value="0">없음</button>
							<button type="button" class="sh_veranda_btn" id="sh_veranda_btn1" value="1">있음</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							전세자금대출
							<input type="hidden" id="sh_loan_availability" name="loan_availability" value="${realty.loan_availability }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_loan_btn" id="sh_loan_btn0" value="0">불가능</button>
							<button type="button" class="sh_loan_btn" id="sh_loan_btn1" value="1">가능</button>						
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							구조
							<input type="hidden" id="sh_structure" name="structure"  value="${realty.structure }">
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_structure_btn" id="sh_structure_btn0" value="0">해당사항없음</button>
							<button type="button" class="sh_structure_btn" id="sh_structure_btn1" value="1">복층</button>
							<button type="button" class="sh_structure_btn" id="sh_structure_btn2" value="2">1.5룸/주방분리형</button>
							<button type="button" class="sh_structure_btn" id="sh_structure_btn3" value="3">다락방</button>													
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							옵션항목
						</div>
						<div class="col-md-10">
							<button type="button" class="sh_option_btn" id="sh_option_btn0">없음</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn1">에어컨</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn2">세탁기</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn3">침대</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn4">책상</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn5">옷장</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn6">TV</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn7">가스레인지</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn8">신발장</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn9">냉장고</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn10">인덕션</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn11">전자레인지</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn12">전자도어락</button>
							<button type="button" class="sh_option_btn" id="sh_option_btn13">비데</button>
							
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value1" name="airconditioner" value="${realty.airconditioner }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value2" name="laundry_machine" value="${realty.laundry_machine }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value3" name="bed" value="${realty.bed }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value4" name="desk" value="${realty.desk }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value5" name="closet" value="${realty.closet }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value6" name="tv" value="${realty.tv }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value7" name="gasrange" value="${realty.gasrange }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value8" name="shoe_shelf" value="${realty.shoe_shelf }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value9" name="refrigerator" value="${realty.refrigerator }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value10" name="induction" value="${realty.induction }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value11" name="microwave" value="${realty.microwave }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value12" name="door_lock" value="${realty.door_lock }">
							<input type="hidden" class="sh_option_btn_value" id="sh_option_btn_value13" name="bidet" value="${realty.bidet }">
						</div>
					</div>
				</div>
			</div> <!-- 추가 정보 -->
			<br><br>
			<div class="row" id="sh_detaili"> <!-- 상세 정보 수정 -->
				<div class="col-md-12">
					<h6>상세 정보 수정</h6><hr>				
					<div class="row">
						<div class="col-md-2">
							제목
						</div>
						<div class="col-md-10">
							<input type="text" id="sh_detaili_title" name="realty_detail_title" placeholder="ex) 강남역에서 5분거리, 편의시설이 다양한 신축건물입니다." value="${realty.realty_detail_title }">
						</div>
					</div>
					<div class="row">
						<div class="col-md-2">
							상세 설명
						</div>
						<div class="col-md-10">
<input type="hidden" id="sh_realty_detail_comment" value="${realty.realty_detail_comment }">													
<textarea rows="20" cols="30" id="sh_detaili_textarea" name="realty_detail_comment" 
placeholder=" 

- 방 정보와 관련없는 홍보성 정보는 입력하실 수 없습니다. (홈페이지 주소, 블로그, SNS, 메신저 ID, 전화번호, 이메일 등)

- 중개수수료를 언급한 내용은 입력할 수 없습니다. (중개수수료 무료, 반값 등) 

* 주의 사항 위반 시 허위매물로 간주되어 매물 삭제 및 이용의 제한이 있을 수 있습니다.">
</textarea>
						</div>
					</div>
				</div>
			</div> <!-- 상세 정보 -->
			<br><br>
			<div class="row"> <!-- 사진 수정 -->
				<div class="col-md-12">
					<h6>사진 수정</h6><hr>
					<div class="row" id="sh_phototype"> <!-- photo type 선택 -->
						<div class="col-md-12">
							<button type="button" class="sh_phototype_btn" id="sh_phototype_btn0">일반사진</button>
							<button type="button" class="sh_phototype_btn" id="sh_phototype_btn1">360°사진</button>	
						</div>
					</div>
					<div class="row" id="sh_commonphotoform"> <!-- 일반 사진 수정 -->
						<div class="col-md-12">
						
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image0" name="realty_image1" value="${realty.realty_image1}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image1" name="realty_image2" value="${realty.realty_image2}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image2" name="realty_image3" value="${realty.realty_image3}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image3" name="realty_image4" value="${realty.realty_image4}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image4" name="realty_image5" value="${realty.realty_image5}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image5" name="realty_image6" value="${realty.realty_image6}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image6" name="realty_image7" value="${realty.realty_image7}">
							<input type="hidden" class="sh_load_realty_image" id="sh_load_realty_image7" name="realty_image8" value="${realty.realty_image8}">
							
						<c:forEach var="i" begin="0" end="7">
							<div class="row" id="sh_realty_image_row${i}">
								<div class="col-md-12">
									<div class="custom-file">
									  <input type="text" id="sh_realty_image_name${i}" class="sh_realty_image_name" value="파일선택" readonly>
									  <label for="sh_realty_image${i}">사진 올리기 <i class="far fa-copy"></i></label>
									  <input type="file" class="realty_image" id="sh_realty_image${i}" name="realty_update_image${i}" accept="image/*" style="display:none">
									</div>
								</div>
							</div>
							
						</c:forEach>	
							<br>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_preveal" id="sh_file_preveal_0">
										<h6>실 사진 최소 2장, 총 8장까지 사진 등록이 가능합니다.</h6>
										<h6>불필요한 정보가 있는 매물은 비공개 처리 됩니다.</h6>
										<br>
										이미지를 업로드해주세요 <i class="far fa-copy"></i> 
									</div>
								</div>
							</div>					
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_thumbnail" id="sh_file_thumbnail_0" align="left">
										<c:forEach var="j" begin="0" end="7">
										<span class="sh_pip" id="sh_pip${j}">
											<img id="sh_file_thumbnail_preview${j}" class="sh_file_thumbnail_preview"><br>
											<span id="sh_remove${j}" class="sh_remove">삭제하기 x</span>
										</span>
										</c:forEach>	
									</div>									
								</div>
							</div>		
						</div>
					</div>
					
					<div class="row" id="sh_360photoform"> <!-- 360도 사진 수정 -->
						<div class="col-md-12">
						
						<input type="hidden" id="sh_load_image360" name="image360" value="${realty.image360 }">
						
							<div class="row">
								<div class="col-md-12">
									<div class="custom-file">
									  <input type="text" id="sh_360_image_name" class="sh_360_image_name" value="파일선택" readonly>
									  <label for="sh_360_image">사진 올리기 <i class="far fa-copy"></i></label>
									  <input type="file" class="sh_360_image" id="sh_360_image" name="sh_360_image" accept="image/*" style="display:none">
									</div>
								</div>
							</div>
							<br>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_preveal" id="sh_file_preveal_1">
										<h6><b>360°사진 제작하기</b></h6>
										<h6>'구글 스트리트 뷰' 앱으로 본인의 집을 찍으세요.</h6>
										<h6>찍으신 사진을 저장 후 사진 파일을 올려주시면 됩니다. (1장만 등록가능)</h6>
										<h6>불필요한 정보가 있는 매물은 비공개 처리 됩니다.</h6>
										<br>
										이미지를 업로드해주세요 <i class="far fa-copy"></i> 
									</div>
								</div>
							</div>	
							<div class="row">
								<div class="col-md-12">
									<div class="sh_file_thumbnail" id="sh_file_thumbnail_1" align="center">
										<span class="sh_360pip" id="sh_360pip">
											<img id="sh_360file_thumbnail_preview" class="sh_360file_thumbnail_preview"><br>
											<span id="sh_360remove" class="sh_360remove">삭제하기 <i class="fas fa-times"></i> </span>
										</span>
									</div>									
								</div>
							</div>								
											
						</div>
					</div>												
				</div>
			</div> <!-- 사진 수정 -->
			<br><br>
			<div class="row"> <!-- 동의 / 매물 수정 -->
				<div class="col-md-12" align="center">
				    
					<div class="custom-control custom-checkbox">
					  <input type="checkbox" class="custom-control-input" id="customCheck1">
					  <label class="custom-control-label" for="customCheck1">매물관리규정을 확인하였으며, 입력한 정보는 실제 매물과 다름이 없습니다.</label>
					</div>				    
				  <br><br>
					<div align="center">
				  	  <input type="reset" id="preset" value="취소">
					  <input type="button" id="psubmit" value="매물 수정">
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