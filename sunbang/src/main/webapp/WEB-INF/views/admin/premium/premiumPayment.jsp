<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
	
<!-- 결제 api -->
<script type="text/javascript" src="https://cdn.iamport.kr/js/iamport.payment-1.1.5.js"></script>
<script>
function request_pay(){
	if($("#sh_premium_type").val() == ""){
		alert("결제상품을 선택하셔야 합니다.");
		return false;
	}
	if(${empty loginUser}){
		alert("로그인이 필요한 서비스 입니다.");
		return false;
	}
	if(${loginUser.premium_status == 'Y'}){
		alert("프리미엄 상품의 기한이 남아있습니다. 만료 후 결제해 주세요");
		return false;
	}
	IMP.init('imp41671884');
	IMP.request_pay({
		pg: 'html5_inicis',
	    merchant_uid : "${loginUser.business_user_no}_"+$("#sh_premium_type").val() + new Date().getTime(),
	    name : "프리미엄" + $("#sh_premium_type").val() + "일",
	    amount : $("#sh_charged_payment").val(),
	    buyer_email : "${loginUser.email }",
	    buyer_name : "${loginUser.user_name }",
	    buyer_tel : "${loginUser.phone }"
	
	}, function(rsp) {
	    if ( rsp.success ) {
			var msg = '결제가 완료되었습니다.';
			msg += '\n고유ID : ' + rsp.imp_uid;
			msg += '\n상점 거래ID : ' + rsp.merchant_uid;
			msg += '\결제 금액 : ' + rsp.paid_amount;
			msg += '카드 승인번호 : ' + rsp.apply_num; 
			alert(msg);
	    	$('#sh_pay_form').submit();
	    	alert("결제가 완료되었습니다! 선방의 프리미엄 회원이 되신걸 환영합니다.");
	    	
		} else {
	    	var msg = '결제에 실패하였습니다. \n';
	    	msg += '에러내용 : ' + rsp.error_msg;
	    	alert(msg);
	    	
	    	//$('#sh_pay_form').submit(); //결제없이 값넘기기 테스트용 삭제해야함
		}
	});	
}

</script>
<!-- 일반회원 매물 등록 5개 초과 시 -->
<script type="text/javascript">
	$(function(){
		if(${message != null}){
			alert("${message}");
		}
	});
</script>
<script type="text/javascript">
	$(function(){
		$("#sh_30").click(function(){
			$("#sh_pay_type input[type=button]").css("background-color", "white");
			$("#sh_pay_type input[type=button]").css("color", "#17A2B8");
			
			$("#sh_30").css("background-color", "#17A2B8");
			$("#sh_30").css("color", "white");
			
			$("#sh_pay_result_value").html("프리미엄 30일 권을 선택하셨습니다.");
			
			$("#sh_premium_type").val("30");
			$("#sh_charged_payment").val("9900");
			//$("#sh_charged_payment").val("100");
			
		});
		
		$("#sh_90").click(function(){
			$("#sh_pay_type input[type=button]").css("background-color", "white");
			$("#sh_pay_type input[type=button]").css("color", "#17A2B8");
			
			$("#sh_90").css("background-color", "#17A2B8");
			$("#sh_90").css("color", "white");
			
			$("#sh_pay_result_value").html("프리미엄 90일 권을 선택하셨습니다.");
			
			$("#sh_premium_type").val("90");
			$("#sh_charged_payment").val("27000");
			//$("#sh_charged_payment").val("200");
		});
		
		$("#sh_180").click(function(){
			$("#sh_pay_type input[type=button]").css("background-color", "white");
			$("#sh_pay_type input[type=button]").css("color", "#17A2B8");
			
			$("#sh_180").css("background-color", "#17A2B8");
			$("#sh_180").css("color", "white");
			
			$("#sh_pay_result_value").html("프리미엄 180일 권을 선택하셨습니다.");
			
			$("#sh_premium_type").val("180");
			$("#sh_charged_payment").val("53000");
			//$("#sh_charged_payment").val("300");
		});
		
		$("#sh_365").click(function(){
			$("#sh_pay_type input[type=button]").css("background-color", "white");
			$("#sh_pay_type input[type=button]").css("color", "#17A2B8");
			
			$("#sh_365").css("background-color", "#17A2B8");
			$("#sh_365").css("color", "white");
			
			$("#sh_pay_result_value").html("프리미엄 365일 권을 선택하셨습니다.");
			
			$("#sh_premium_type").val("365");
			$("#sh_charged_payment").val("100000");
			//$("#sh_charged_payment").val("400");
		});
	});
</script>	
	
<style type="text/css">
#sh_pay_title {
	text-align: center;
	font-family: a고딕13;
}

#sh_pay_title h3 {
	padding: 20px;
	font-family: a고딕15;
}

#sh_pay_type .col-md-12{
	padding: 10px;
	font-family: a고딕13;
	text-align:center;
	width: 100%;
}

#sh_pay_type input[type=button]{
	background-color:white;
	color: #17A2B8;
	width: 100%;
	height:100px;
	border: 2px solid #17A2B8;
	border-radius: 0.8em 0.8em 0.8em 0.8em;
	font-family: a고딕13;
	font-size: 20px;
	transition-duration: 0.5s
}

#sh_pay_type input[type=button]:hover{
	background-color:#17A2B8;
	color: white;
}

#sh_pay_result {
	text-align:center;
	width: 100%;	
	font-family: a고딕13;
	font-size: 18px;
}

#sh_pay_submit {
	text-align: center;
	color: white;	
	background-color:#17A2B8;
	border: 1px solid #17A2B8;
	border-radius: 4px;
	height: 50px;
	width:100px;
}

</style>

</head>
<body>
<c:import url="../../common/realtyHeader.jsp" />
<br><br><br><br>
<div class="container" style="min-height:960px;">
	<div class="row" id="sh_pay_title">
		<div class="col-md-12">
			<h3>선방 프리미엄 서비스</h3>
			<h4>프리미엄 매물 소개 + 매물 무제한 등록</h4>
		</div>
	</div>
	<br><br>
	<div class="row">
		<div class="col-md-12">
			<div class="row" id="sh_pay_type">
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<input type="button" id="sh_30" value="30일">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<p id="sh_30_price">9,900 원</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<input type="button" id="sh_90" value="90일">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<span style="color:red; text-decoration:line-through;">
							<p style="color:grey;">29,700 원</p>
							</span>
							<p id="sh_90_price">27,000 원</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<input type="button" id="sh_180" value="180일">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<span style="color:red; text-decoration:line-through;">
							<p style="color:grey;">59,400 원</p>
							</span>						
							<p id="sh_180_price">53,000 원</p>
						</div>
					</div>
				</div>
				<div class="col-md-3">
					<div class="row">
						<div class="col-md-12">
							<input type="button" id="sh_365" value="365일">
						</div>
					</div>
					<div class="row">
						<div class="col-md-12">
							<span style="color:red; text-decoration:line-through;">
							<p style="color:grey;">120,450 원</p>
							</span>							
							<p id="sh_365_price">100,000 원</p>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<br><br><br>
	<div class="row" id="sh_pay_result">
		<div class="col-md-12">
			<p id="sh_pay_result_value"></p>
			<br>
			<form id="sh_pay_form" action="upinsert.do" method="post" >
			<input type="hidden" name="premium_type" id="sh_premium_type">
			<input type="hidden" name="charged_payment" id="sh_charged_payment">
			<input type="hidden" name="business_user_no" value="${loginUser.business_user_no }"> 
			<input type="button" id="sh_pay_submit" onclick="request_pay()" value="결제하기">
			</form>
		</div>
	</div>
</div>
<br><br><br><br>
<c:import url="../../common/footer.jsp" />
</body>
</html>