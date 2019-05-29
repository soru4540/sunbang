<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
	window.addEventListener('load', function() {
	    var forms = $('.needs-validation');
	    
	    $("#jw_pwdinsertbtn").click(function(event){
	    	var result = checkpwd4();
	    	result = checkrepwd4();
	    	if(result == true){
	    		$.ajax({
	    			url: "uupdatepwd.do",
	    			type: "post",
	    			data: {user_no : $("#jw_resultuserno").val(), password: $("#jw_pwd4").val()},
	    			success: function(){
	    				$("#jw_mcolsebtn").trigger("click");
	    				$("#jw_upPwdalert").show();
	    			},
	    			error: function(){
	    				alert("수정 실패");
	    			}
	    		});
	    	}
    	});
	    
	    <c:forEach var="c" begin="1" end="3"> 
	    $("#jw_uinsertform${c}").submit(function(){
	    	var result2 = checknick${c}();
	    	var result5 = emailcheck${c}();
	    	var result6 = checkphoneresult${c}();
	    	if(result2 == "" || result5 == "" || result6 == ""){
	    		$("#jw_noinsertalert").show();
	    		return false;
	    	}else{
	    		return true;
	    	}
	    });
	    </c:forEach>
	    
	    var validation = Array.prototype.filter.call(forms, function(form) {
	      form.addEventListener('submit', function(event) {
	        if (form.checkValidity() === false) {
	          event.preventDefault();
	          event.stopPropagation();
	        }
	        form.classList.add('was-validated');
	      }, false);
	    });
	  }, false);
	
	$("#jw_uppbtn").click(function(){
		$("#jw_userpage").hide();
		$("#jw_uppage").fadeIn();
	});
	
	$("#jw_userpbtn").click(function(){
		$("#jw_uppage").hide();
		$("#jw_userpage").fadeIn();
	});
	
	<c:if test="${!empty premium}">	
	$("#jw_uppremiumbtn").click(function(){
		$.ajax({
			url: "upupdate.do",
			type: "get",
			data: {business_user_no: ${loginUser.business_user_no}, charge_no : ${premium.charge_no}},
			dataType: "text",
			success: function(result){
				if(result = "success"){
				alert("환불처리성공");
				$("#jw_resultpstatus").html("환불처리");
				}else{
					alert("환불실패");
				}
			},
			error: function(){
				alert("실패");
			}
		});
	});
	</c:if>
	
	function checkpwd4(){
		if($('#jw_pwd4').val() != ""){
		if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#jw_pwd4').val()) || /^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#jw_pwd4').val()) || /^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#jw_pwd4').val())){
			if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#jw_pwd4').val())){
				$('#jw_psecurity4').css("color", "green").html("안전");
			}
			if(/^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#jw_pwd4').val())){
				if($('#jw_pwd4').val().length >= 9){
					$('#jw_psecurity4').css("color", "green").html("안전");
				}else{
					$('#jw_psecurity4').css("color", "Gold").html("중간");
				}
			}
			if(/^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#jw_pwd4').val())){
				if($('#jw_pwd4').val().length >= 9){
					$('#jw_psecurity4').css("color", "green").html("안전");
				}else{
					$('#jw_psecurity4').css("color", "Gold").html("중간");
				}
			}	
			$('#jw_pwdsuc4').show();
			$('#jw_pwdfail4').hide();
			return true;
		}else{
			$('#jw_pwdsuc4').hide();
			$('#jw_pwdfail4').show().html("대문자 하나 또는 소문자 하나,특수 문자, 숫자 입력해주세요. (최소 6자 및 최대 16자)<br> 사용가능 특수문자 !,@,$,%");
			$('#jw_psecurity4').css("color", "red").html("낮음");
			return false;
		}
		}else{
			$('#jw_pwdsuc4').hide();
			$('#jw_pwdfail4').show().html("비밀번호를 입력해주세요");
			$('#jw_psecurity4').css("color", "red").html("위험");
			return false;
		}
		return false;
	}
	
	function checkrepwd4(){
	if($('#jw_repwd4').val() != ""){
		if($('#jw_pwd4').val() == $('#jw_repwd4').val()){
			$('#jw_repwdsuc4').show();
			$('#jw_repwdfail4').hide();
			return true;
		}else{
			$('#jw_repwdsuc4').hide();
			$('#jw_repwdfail4').show().html("비밀번호가 일치하지않습니다.");
			return false;
		}}else{
			$('#jw_repwdsuc4').hide();
			$('#jw_repwdfail4').show().html("입력해주세요.");
			return false;
		}
		return false;
	}
	
	$('#jw_repwd4').change(function(){
		checkrepwd4();
	});
	$('#jw_pwd4').change(function(){
		checkpwd4();
	});
	
	var mphone = '${loginUser.phone}'.split("-");
	var ophone = '${loginUser.office_phone}'.split("-");
	var license = '${loginUser.business_license_no}'.split("-");
	$("#jw_ophone1").val(ophone[0]);
	$("#jw_ophone2").val(ophone[1]);
	$("#jw_ophone3").val(ophone[2]);
	$("#jw_license1").val(license[0]);
	$("#jw_license2").val(license[1]);
	$("#jw_license3").val(license[2]);
	
	
	<c:forEach var="c" begin="1" end="3"> 
	$("#jw_phone${c}a").val(mphone[0]).attr("selected","selected");
	$("#jw_phone${c}b").val(mphone[1]);
	$("#jw_phone${c}c").val(mphone[2]);
	
	
	function emailcheck${c}(){
		if($("#jw_emailtext${c}").val() != ""){
			if(/^[0-9a-zA-Z]*@[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i.test($("#jw_emailtext${c}").val())){
				$("#jw_emafail${c}").hide();
				$("#jw_emasuc${c}").show().html("이메일형식이 맞습니다");
				return true;
			}else{
				$("#jw_emasuc${c}").hide();
				$("#jw_emafail${c}").show().html("이메일형식에 맞게 입력해주세요<br>예: @ .com");
				return false;
			}
		}else{
			$("#jw_emasuc${c}").hide();
			$("#jw_emafail${c}").show().html("이메일을 입력해주세요");
			return false;
		}
		return false;
		}

	$("#jw_emailtext${c}").change(function(){
		emailcheck${c}();
	});
	
	
	$("#jw_profile${c}").change(function(){
	    if(this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#jw_divview${c}').show();
	        	$('#jw_imgdel${c}').show();
	        	$("#jw_resultimg${c}").val("true");
	            $('#jw_divview${c}').html("<img src="+ e.target.result +" class='img-thumbnail' style='width:100%; height:100%; border-radius:3px;'>"); 
	        }
	        reader.readAsDataURL(this.files[0]);
	    }
	});
	$('#jw_imgdel${c}').click(function(){
		$("#jw_profile${c}").val("");
		$("#jw_resultimg${c}").val("none");
		$('#jw_divview${c}').hide();
    	$('#jw_imgdel${c}').hide();
	});
	

	function checknick${c}(){
		var rereturn;
		if($('#jw_nick${c}').val() != ""){
			if(/^(?=.*[a-zA-z가-힣])[a-zA-z\d가-힣]{3,10}$/.test($('#jw_nick${c}').val())){
				$.ajax({
					url: "uchecknick.do",
					type: "post",
					data: {nickname : $("#jw_nick${c}").val()},
					dataType: "text",
					async: false,
					success: function(response){
						if(response == "success"){
							$('#jw_nicksuc${c}').show().html("일치하는 닉네임이 없습니다");
							$('#jw_nickfail${c}').hide();
							rereturn = true;
						}else{
							if($("#jw_nick${c}").val() == '${loginUser.nickname}'){
								$('#jw_nicksuc${c}').show().html("지금 사용중인 닉네임입니다");
								$('#jw_nickfail${c}').hide();
								rereturn = true;
							}else{
							$('#jw_nicksuc${c}').hide();
							$('#jw_nickfail${c}').show().html("이미 사용중인 닉네임입니다");
							rereturn = false;
							}
						}
					},
					error: function(){
						console.warn("닉네임일치 X");
					}
				});
			}else{
				$('#jw_nicksuc${c}').hide();
				$('#jw_nickfail${c}').show().html("3~10자의 영문 소문자, 한글, 숫자(혼용)만 사용가능합니다");
				rereturn = false;
			}
			}else{
				$('#jw_nickfail${c}').show().html("닉네임을 입력하세요");
				$("#jw_nicksuc${c}").hide();
				rereturn = false;
			}
		return rereturn;
		}
		
	
	$("#jw_nick${c}").change(function(){
		checknick${c}();
		});
	
	$("#jw_phonebtn${c}").click(function(){
		$.ajax({
			url: "ucheckphone.do",
			type: "post",
			data: {phone : $("#jw_phone${c}a").val()+"-"+$("#jw_phone${c}b").val()+"-"+$("#jw_phone${c}c").val()},
			dataType: "text",
			success: function(response){
				if($("#jw_phone${c}b").val() !="" && $("#jw_phone${c}c").val() !=""){
				alert(response);
				$("#jw_phone${c}a").attr("readonly", false);
				$("#jw_phone${c}b").attr("readonly", false);
				$("#jw_phone${c}c").attr("readonly", false);
				$("#jw_pcheckresult${c}").val("false");
				$("#jw_pnumslide${c}").slideDown();
				$("#jw_phnumresult${c}").val(response);
				$("#jw_pnresultfail${c}").hide();
				$("#jw_psendresultsuc${c}").hide();
				$("#jw_psendresultfail${c}").hide();
				$("#jw_pnresultsuc${c}").show().html("인증번호가 발송되었습니다");
				}else{
					$("#jw_pnresultsuc${c}").hide();
					$("#jw_pnresultfail${c}").hide();
					$("#jw_psendresultsuc${c}").hide();
					$("#jw_psendresultfail${c}").show().html("전화번호를 입력해주세요");
				}
			},
			error: function(){
				alert("실패");
			}
		});
	});

	$("#jw_pcheckbtn${c}").click(function(){
		if($("#jw_phnumresult${c}").val() == $("#jw_phnuminput${c}").val()){
			$("#jw_pnresultsuc${c}").hide();
			$("#jw_pnresultfail${c}").hide();
			$("#jw_psendresultfail${c}").hide();
			$("#jw_psendresultsuc${c}").show().html("인증번호가 일치합니다");
			$("#jw_phone${c}a").attr("readonly", true);
			$("#jw_phone${c}b").attr("readonly", true);
			$("#jw_phone${c}c").attr("readonly", true);
			$("#jw_pcheckresult${c}").val("true");
			$("#jw_pnumslide${c}").slideUp();
			$("#jw_phonebtn${c}").html("재발송");
		}else{
			$("#jw_pnresultsuc${c}").hide();
			$("#jw_psendresultsuc${c}").hide();
			$("#jw_psendresultfail${c}").hide();
			$("#jw_pnresultfail${c}").show().html("인증번호가 일치하지않습니다");
		}
	});
	
	function checkphoneresult${c}(){
		if($("#jw_pcheckresult${c}").val() == "true"){
			return true;
		}else{
			$("#jw_psendresultfail${c}").show().html("휴대폰 인증을 해주시기바랍니다");
			return false;
		}
		return false;
	}
	
	</c:forEach>
	
	<c:if test="${!empty message}">
	$(function(){$("#jw_alertdiv").show();});
	</c:if>
});
</script>
<style>
/* div{
border:1px solid black;
} */
input[type="number"]::-webkit-outer-spin-button,
input[type="number"]::-webkit-inner-spin-button {
    -webkit-appearance: none !important;
    margin: 0 !important;
}
.ucon {
	font-size: 16px !important;
	border-radius: 0 !important;
}

.ucon:hover {
	font-size: 16px !important;
	border-radius: 0 !important;
	background: rgb(250, 250, 250) !important;
}

.btn-green {
	background: #61C0BF !important;
	color: white !important;
	font-size: 16px !important;
	font-weight: 600 !important;
}

.btn-green:hover {
	opacity: 0.9 !important;
	color: white !important;
}

.btn-lgreen {
	background: #61C0BF !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
	cursor: pointer;
}

.btn-lgreen:hover {
	opacity: 0.9 !important;
	color: white !important;
}
.btn-gray {
	background: #777 !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
	cursor: pointer;
}

.btn-gray:hover {
	opacity: 0.9 !important;
	color: white !important;
}
.imageview {
	width: 100px;
	height: 100px;
	<c:if test="${empty loginUser.user_profile}" >
	display: none;
	</c:if>
}
.btn-bgray {
	background: #61C0BF !important;
	color: white !important;
	font-size: 15px !important;
	font-weight: 600 !important;
	border-radius: 5px !important;
	height: 35px;
	cursor:pointer;
}

.btn-bgray:hover {
	opacity: 0.8 !important;
}
.card{
font-weight:600;
}
.dis{
<c:if test="${empty loginUser.user_profile}" >
 display:none;
 </c:if>
}
/* div{
border:1px solid black;
} */
</style>
</head>
<body>
<div id="jw_alertdiv" class="alert alert-success ualert" style="position:absolute; z-index:3; top:20%; right:10%; box-shadow:1px 1px 5px 3px #ddd; display:none;"><button type="button" class="close" data-dismiss="alert">&times;</button><h4 class="alert-heading" style="font-weight:600;">${messagetitle }</h4>${message}</div>
<div class="alert alert-info alert-dismissible fade show" id="jw_upPwdalert" style="position:absolute; z-index:3; top:20%; right:10%; box-shadow:1px 1px 5px 3px #ddd; display:none;"><button type="button" class="close" data-dismiss="alert">&times;</button><strong>패스워드 수정 성공!</strong> 다음 로그인부터 수정된패스워드로 로그인하십시오!!!</div>

<c:import url="../common/realtyHeader.jsp"/>

<div class="modal fade" id="jw_upPwd"> <div class="modal-dialog"><div class="modal-content" style="box-shadow:1px 1px 5px 3px #ddd;">
        <div class="modal-header border-0"><h4 class="modal-title">비밀번호 수정</h4><button type="button" class="close" data-dismiss="modal">&times;</button> </div>
        <div class="modal-body"><input type="hidden" id="jw_resultuserno" value="${loginUser.user_no }">
        	<div class="form-group"><label>비밀번호<small> (보안등급: <span id="jw_psecurity4"></span>)</small></label><input type="password" id="jw_pwd4" name="password" class="form-control ucon" required><div id="jw_pwdsuc4" class="valid-feedback">허용된 비밀번호입니다</div><div id="jw_pwdfail4" class="invalid-feedback"></div></div>
			<div class="form-group"><label>비밀번호 확인</label><input type="password" id="jw_repwd4" class="form-control ucon" required><div id="jw_repwdsuc4" class="valid-feedback">비밀번호가 일치합니다.</div><div id="jw_repwdfail4" class="invalid-feedback"></div></div></div>
        <div class="modal-footer border-0 d-flex"><button type="button" id="jw_pwdinsertbtn" class="btn btn-lgreen" style="width:48%; ">확인</button><button type="button" id="jw_mcolsebtn" class="btn btn-gray" style="width:48%; " data-dismiss="modal">취소</button></div>
</div> </div> </div>



<!-- 회원탈퇴 모달 -->
<div class="modal fade" id="jw_userdel" style="padding-top:10%;"><div class="modal-dialog"><form action="uuserout.do" method="post"><div class="modal-content">
     <div class="modal-header"><h4 class="modal-title">회원탈퇴</h4><button type="button" class="close" data-dismiss="modal">×</button></div>
     <div class="modal-body"><pre style="font-size:12px; white-space:pre-line">
회원탈퇴를 신청하기전에 아래 안내 사항을 한번 더 확인해주세요.
1. 회원 탈퇴 시, 현재 로그인된 아이디는 즉시 탈퇴 처리됩니다.
2. 회원 탈퇴 시, 회원 전용 웹 서비스 이용이 불가합니다.
3. 탈퇴 시 회원 정보 및 찜 서비스, 등록한 게시물 이용 기록이 모두 삭제됩니다.
4. 회원 정보 및 서비스 이용 기록은 모두 삭제되며, 삭제된 데이터는복구되지 않습니다.
5. 광고를 위한 매물이 등록되어 있을 경우, 탈퇴 시 모든 정보는 삭제 처리됩니다.</pre>
		<div class="form-group" style="font-size:13px;"><select class="form-control ucon" name="reason1">
										<option value="사유없음">탈퇴사유를 선택해주세요</option>
										<option value="더 이상 이용하지 않음">더 이상 이용하지 않음</option>
										<option value="탈퇴 후 재가입하려고">탈퇴 후 재가입하려고</option>
										<option value="원하는 정보가 없어서">원하는 정보가 없어서</option>
										<option value="사용하기 불편해서">사용하기 불편해서</option></select></div>
		<div class="form-group"><textarea class="form-control ucon" rows="3" name="reason2" placeholder="다른 사유가 있으시면 적어주십시오" style="resize:none;"></textarea><input type="hidden" name="user_no" value="${loginUser.user_no }"><input type="hidden" name="nickname" value="${loginUser.nickname }"></div></div>
	<div class="modal-footer" style="border:0;"><input type="submit" class="btn btn-danger btn-block" value="회원탈퇴"></div>
</div></form></div></div>

<div class="container mb-5">
<div class="row" style="margin-top:7%;"></div>
<div class="row" id="jw_userpage">
	<div class="col-12 mb-5"><div class="col-12 mx-auto" style="width:1000px;"><span class="font-weight-bold fa-2x"><i class="fas fa-user" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> </span><span style="font-size:28px; font-weight:600;">${loginUser.nickname} <small style="font-weight:600;">의 회원정보</small></span><span id="jw_uppbtn"class="btn btn-lgreen mt-1" style="float:right;">정보수정</span><span class="btn btn-lgreen mr-2 mt-1" data-toggle="modal" data-target="#jw_upPwd" data-backdrop="false" style="float:right;">비밀번호수정</span></div></div>
<c:if test="${loginUser.user_type eq '일반회원' || loginUser.user_type eq '매도인'}">	
	<div class="col-12"><div class="col-12 mx-auto" style="width:800px;">
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">프로필</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">회원분류</div><div class="card bg-light" style="padding: 8px 30px; width:33%;">회원등급</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;"><c:if test="${!empty loginUser.user_profile}" ><img class="img-thumbnail" src="files/user/userImages/${loginUser.user_profile}" style="width:120px; height: 100px;"></c:if></div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_type }</div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_status }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">아이디</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">닉네임</div><div class="card bg-light" style="padding: 8px 30px; width:33%;">성명</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_id}</div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.nickname }</div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_name }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">전화번호</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">이메일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.phone}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.email }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">가입일</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">최근 수정일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.join_date}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.update_date }</div></div>
		</div></div>
</c:if>
<c:if test="${loginUser.user_type eq '공인중개사' }">	
	<div class="col-12 col-lg-6">
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">중개사무소명</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">대표전화번호</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.office_name}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.office_phone }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">중개등록번호</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">사업자등록번호</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.office_regist_no}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.business_license_no }</div></div>
		<div class="d-flex"><div class="card bg-light" style="padding: 8px 30px; width:100%;">중개사무소주소</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:100%; word-wrap:break-word;">${loginUser.office_address }</div></div></div>
	<div class="col-12 col-lg-6">
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">프로필</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">회원분류<br><small>(프리미엄)</small></div><div class="card bg-light" style="padding: 8px 30px; width:33%;">회원등급</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;"><c:if test="${!empty loginUser.user_profile}" ><img class="img-thumbnail" src="files/user/userImages/${loginUser.user_profile}" style="width:120px; height: 100px;"></c:if></div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_type }<small>(${loginUser.premium_status })</small></div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_status }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">아이디</div><div class="card bg-light mr-2" style="padding: 8px 30px; width:33%;">닉네임</div><div class="card bg-light" style="padding: 8px 30px; width:33%;">성명</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_id}</div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.nickname }</div><div style="padding:15px 15px; width:33%; word-wrap:break-word;">${loginUser.user_name }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">전화번호</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">이메일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.phone}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.email }</div></div>
		<div class="d-flex"><div class="card bg-light mr-2" style="padding: 8px 30px; width:50%;">가입일</div><div class="card bg-light" style="padding: 8px 30px; width:50%;">최근 수정일</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.join_date}</div><div class="mr-2" style="padding:15px 15px; width:50%; word-wrap:break-word;">${loginUser.update_date }</div></div></div>
</c:if>
<c:if test="${loginUser.user_type eq '공인중개사' || loginUser.user_type eq '매도인'}">
	<div class="col-12 mt-5" style="margin-bottom: 10%;"><div class="col-12 mx-auto" style="width:1000px;">
		<div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-money-check-alt" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> <small><b>최근 프리미엄결제 내역</b></small></span></div>
		<div class="d-flex mt-4"><div class="card mr-2" style="padding: 8px 30px; width:33%;">프리미엄 결제일</div><div class="card mr-2" style="padding: 8px 30px; width:33%;">결제 금액</div><div class="card mr-2" style="padding: 8px 30px; width:24%;">결제 상태</div><div id="jw_uppremiumbtn" class="btn btn-lgreen" style="width:10%; padding-top:10px; font-size:16px;">환불신청</div></div>
		<div class="d-flex"><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${premium.charge_date }</div><div class="mr-2" style="padding:15px 15px; width:33%; word-wrap:break-word;">${premium.charged_payment }</div><div id="jw_resultpstatus"style="padding:15px 15px; width:33%; word-wrap:break-word;">${premium.charged_status }</div></div></div></div>
</c:if>
</div>
<div id="jw_uppage" style="display:none;">
<c:if test="${loginUser.user_type eq '일반회원' || loginUser.user_type eq '매도인'}">
<div class="row">
	<div class="col-12" ><div class="col-12" style="width:500px; margin:auto auto;">
		<div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 정보수정</span><span id="jw_userpbtn"class="btn btn-gray mt-1" style="float:right; cursor:pointer;"><i class="fas fa-exchange-alt"> 회원정보</i></span></div><form class="needs-validation" id="jw_uinsertform1" action="uupdate.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_no" value="${loginUser.user_no }">
			<input type="hidden" name="user_type" value="${loginUser.user_type }"><input type="hidden" name="business_user_no" value="${loginUser.business_user_no }"><input type="hidden" name="checkimg" value="${loginUser.user_profile }"><input type="hidden" id="jw_resultimg1" name="resultimg" value="false"><input type="hidden" name="user_id" value="${loginUser.user_id }">
		<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="jw_divview1"><c:if test= "${!empty loginUser.user_profile}"><img src="files/user/userImages/${loginUser.user_profile }" class='img-thumbnail' style='width:100%; height:100%; border-radius:3px;'></c:if></div><span class="d-flex"><label for="jw_profile1" class="btn btn-bgray">프로필 업로드</label><input type="file" id="jw_profile1" name="profile"  accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2 dis"  id="jw_imgdel1">취소</button></span></span></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="jw_nick1" name="nickname" value="${loginUser.nickname }" required><div id="jw_nicksuc1" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="jw_nickfail1" class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>성명</label><input type="text" class="form-control ucon" name="user_name" value="${loginUser.user_name }"  readonly required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="jw_emailtext1" name="email" class="form-control ucon" value="${loginUser.email }" required><div class="input-group-append"><!-- <button type="button" id="jw_emailbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button> --></div><div id="jw_emasuc1" class="valid-feedback"></div><div id="jw_emafail1" class="invalid-feedback"></div></div></div>
			<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="jw_phone1a" name="phone1" readonly required>
																												<option value="010" actofocus>010</option>
																												<option value="011">011</option>
																												<option value="016">016</option>
																												<option value="017">017</option>
																												<option value="018">018</option>
																												<option value="019">019</option>
			</select><input type="number" id="jw_phone1b" name="phone2" class="form-control ucon mr-2" readonly required><input type="number" id="jw_phone1c" name="phone3" class="form-control ucon"  readonly required><div class="input-group-append"><button type="button" id="jw_phonebtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">발송</button></div><div id="jw_psendresultsuc1" class="valid-feedback"></div><div id="jw_psendresultfail1" class="invalid-feedback">필수 정보입니다</div></div></div>
			<input type="hidden" id="jw_phnumresult1"><input type="hidden" id="jw_pcheckresult1" value="true">
		<div class="form-group px-1" id="jw_pnumslide1" style="display:none;"><div class="input-group"><input type="number" id="jw_phnuminput1" class="form-control ucon" placeholder="인증번호를 입력해주세요"><div class="input-group-append"><button type="button" id="jw_pcheckbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">확인</button></div><div id="jw_pnresultsuc1" class="valid-feedback"></div><div id="jw_pnresultfail1" class="invalid-feedback"></div></div></div>
		 <div class="form-group mt-4"><input type="submit" class="btn btn-block btn-green " value="수정"></div></form></div></div></div>
</c:if>
<c:if test="${loginUser.user_type eq '공인중개사' }">
<form class="needs-validation" id="jw_uinsertform3" action="uupdate.do" method="post" enctype="multipart/form-data" novalidate><div class="row">
	<div class="col-md-12"><div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-user-tie" style="background:#61C0BF; color:white; padding:1%; border-radius: 5px;"></i> 정보수정</span><span id="jw_userpbtn"class="btn btn-gray mt-1" style="float:right;"><i class="fas fa-exchange-alt"> 회원정보</i></span></div></div>
	<div class="col-md-6"><input type="hidden" name="user_no" value="${loginUser.user_no }"><input type="hidden" name="user_type" value="${loginUser.user_type }"><input type="hidden" name="business_user_no" value="${loginUser.business_user_no }"><input type="hidden" name="checkimg" value="${loginUser.user_profile }"><input type="hidden" id="jw_resultimg3" name="resultimg" value="false"><input type="hidden" name="user_id" value="${loginUser.user_id }">
		<div class="form-group"><label>중개사무소명</label><input type="text" class="form-control ucon" name="office_name" value="${loginUser.office_name }" required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>사업자 등록번호</label><div class="input-group"><input type="number" id="jw_license1" name="license1" class="form-control ucon mr-2" required><input type="number" id="jw_license2" name="license2" class="form-control ucon mr-2" required><input type="number" id="jw_license3" name="license3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div>
		<div class="form-group"><label>중개사무소 주소</label><input type="text" name="office_address"class="form-control ucon" value="${loginUser.office_address }"required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>중개사 대표자명</label><input type="text" name="user_name" class="form-control ucon" value="${loginUser.user_name }" readonly required><div class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>대표 전화번호</label><div class="input-group"><input type="number" id="jw_ophone1" name="ophone1" class="form-control ucon mr-2" required><input type="number" id="jw_ophone2" name="ophone2" class="form-control ucon mr-2" required><input type="number" id="jw_ophone3" name="ophone3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div></div>
	<div class="col-md-6">
		<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="jw_divview3"><c:if test= "${!empty loginUser.user_profile}"><img src="files/user/userImages/${loginUser.user_profile }" class='img-thumbnail' style='width:100%; height:100%; border-radius:3px;'></c:if></div><span class="d-flex"><label for="jw_profile3" class="btn btn-bgray">프로필 업로드</label><input type="file" id="jw_profile3" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2 dis"  id="jw_imgdel3">취소</button></span></span></div>
		<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="jw_nick3" name="nickname" value="${loginUser.nickname }"required><div id="jw_nicksuc3" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="jw_nickfail3" class="invalid-feedback">필수 정보입니다</div></div>
		<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="jw_emailtext3" name="email" value="${loginUser.email }"class="form-control ucon" required><div class="input-group-append"><!-- <button type="button" id="jw_emailbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button> --></div><div id="jw_emasuc3" class="valid-feedback"></div><div id="jw_emafail3" class="invalid-feedback"></div></div></div>
		<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="jw_phone3a" name="phone1" readonly required>
																												<option value="010" actofocus>010</option>
																												<option value="011">011</option>
																												<option value="016">016</option>
																												<option value="017">017</option>
																												<option value="018">018</option>
																												<option value="019">019</option>
			</select><input type="number" id="jw_phone3b" name="phone2" class="form-control ucon mr-2" readonly required><input type="number" id="jw_phone3c" name="phone3" class="form-control ucon"  readonly required><div class="input-group-append"><button type="button" id="jw_phonebtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">발송</button></div><div id="jw_psendresultsuc3" class="valid-feedback"></div><div id="jw_psendresultfail3" class="invalid-feedback">필수 정보입니다</div></div></div>
			<input type="hidden" id="jw_phnumresult3"><input type="hidden" id="jw_pcheckresult3" value="true">
		<div class="form-group px-1"  id="jw_pnumslide3" style="display:none;"><div class="input-group"><input type="number" id="jw_phnuminput3" class="form-control ucon" placeholder="인증번호를 입력해주세요"><div class="input-group-append"><button type="button" id="jw_pcheckbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">확인</button></div><div id="jw_pnresultsuc3" class="valid-feedback">인증번호가 일치합니다</div><div id="jw_pnresultfail3" class="invalid-feedback"></div></div></div></div></form>
	<div class="col-md-12 mt-4" style="text-align:center;"><input type="submit" class="btn btn-green" value="수정" style="width: 100%;"></div></div></form>
</c:if>
<div class="row" style="margin:0 auto; text-align:center; margin-bottom:10%; margin-top:3%;"><div class="col-12"><b data-toggle="modal" data-target="#jw_userdel" style="font-size:14px; cursor:pointer"><i class="fas fa-user-slash"></i>회원탈퇴</b></div></div></div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>