<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>선방</title>
<script type="text/javascript" src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script>
$(function(){
 window.addEventListener('load', function() {
	    var forms = $('.needs-validation');
	    
	    $("#pwdinsertbtn").click(function(event){
	    	var result = checkpwd4();
	    	result = checkrepwd4();
	    	if(result == true){
	    		$.ajax({
	    			url: "uupdatepwd.do",
	    			type: "post",
	    			data: {user_no : $("#resultuserno").val(), password: $("#pwd4").val()},
	    			success: function(){
	    				$('#alertpwddelbtn').trigger("click");
	    				$("#pwdsucalert").show();
	    				setTimeout(function(){
	    					$("#pwdsucalert").fadeOut();
	    				}, 2500);
	    			},
	    			error: function(){
	    				alert("수정 실패");
	    			}
	    		});
	    	}
    	});
	    
	    $("#loginbtntwo").click(function(){
	    	var result = capchaCheck4();
	    	if(result != ""){
			$.ajax({
			url: "ulogin.do",
			type: "post",
			data: $("#loginformtwo").serialize(),
			dataType: "text",
			success: function(response){
				$("#loginid2").val("");
				$("#loginpwd2").val("");
				if(response =="success"){
					var page = "realtymain.do";
					if('${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogout.do"&& '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogin.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uloginview.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uinsert.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uuserout.do" && '${param.pageuri}'.length != 0){
					page = '${param.pageuri}'.substring(1, '${param.pageuri}'.length);
					}
					location.replace(page);
				}
				if(response == "idfail"){
					failbar2("탈퇴한 아이디거나 아이디가 틀렸습니다<br>다시 입력해주세요.");
				}
				if(response == "pwdfail"){
					failbar2("패스워드가 틀렸습니다 다시 입력해주세요.");
				}
				if(response == "countfail"){
					failbar2("패스워드가 틀렸습니다 다시 입력해주세요.");
					$("#loginform").hide();
					$("#loginformtwo").show();
					capcha4();
				}
			},
			error: function(){
				console.warn("로그인실패");
				$("#loginid").val("");
				$("#loginpwd").val("");
			}});
	    	}else{
	    		capcha${c}();
	    	}
		});
	    
	    <c:forEach var="c" begin="1" end="3"> 
	    $("#uinsertform${c}").submit(function(){
	    	var result1 = checkuid${c}();
	    	var result2 = checknick${c}();
	    	var result3 = checkpwd${c}();
	    	var result4 = checkrepwd${c}();
	    	var result5 = emailcheck${c}();
	    	var result6 = checkphoneresult${c}();
	    	var result7 = capchaCheck${c}();
	    	if(result1 == "" || result2 == "" || result3 == "" || result4 == "" || result5 == "" || result6 == "" || result7 == ""){
	    		$("#noinsertalert").show();
	    		capcha${c}();
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
 	$("#idalertclose").click(function(){
 		$("#idalert").hide();
 	});
	
	$("#accountpage").click(function(){
		$("#turn").css("transform", "rotateY(180deg)");
		$("#userback").css("z-index", 1);
		$("#loginfront").css("z-index", 0);
		$("#turnfooter").css("transition-delay", "0s");
		$("#turnfooter").css("margin-top", $(".container").height()+$("#accountheight").height()+200);
	});
	$(".returnlogin").click(function(){
		$("#turn").css("transform", "rotateY(360deg)");
		$("#userback").css("z-index", 0);
		$("#loginfront").css("z-index", 1);
		$("#turnfooter").css("transition-delay", "0.3s");
		$("#turnfooter").css("margin-top", $(".container").height()+$("#loginfront").height()+200);
	});
	$(".widthchange").click(function(){
		$("#userback").css("width", "100%");
	});
	$(".widthreset").click(function(){
		$("#userback").css("width", "500px");
	})
	$("#noinsertbtn").click(function(){
		$("#noinsertalert").hide();
	});
	
	function failbar(message){
		$("#loginfailbar").show().html(message);
	}
	function failbar2(message){
		$("#loginfailbar2").show().html(message);
	}
	
	function capchaCheck4(){
		var rereturn;
		$.ajax({
			url: "capresult.do",
			type: "get",
			data: {key: $("#ckey4").val(), value: $("#cvalue4").val()},
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			async: false,
			success: function(result){
				if(result.result == true){
					rereturn = true;
				}else{
					$("#capfaildiv4").show().html("값이 틀렸습니다. 재입력하시기바랍니다");
					capcha4();
					rereturn = false;
				}
			},
			error: function(){
				console.warn("capcheck X");
			}
		});
		
		return rereturn;
	}


	function capcha4(){
		$.ajax({
		url: "capkey.do",
		type: "get",
		dataType: "json",
		success : function(capcha){
			
			$.ajax({
			url: "capimage.do",
			type: "get",
			data: {key : capcha.key},
			dataType: "json",
			contentType: "application/json; charset=utf-8",
			success: function(image){
			$("#ckey4").val(capcha.key);
			$("#capcha4").html('<img src="files/user/capchaImages/'+ image +'.jpg" style="width:100%; height:100%;">');
			},
			error: function(){
				console.warn("capimageX");
			}
			});
		},
		error : function(){
			console.warn("capX");
		}
		});
	}

		$("#capreturn4").click(function(){
			capcha4();
		});
	
	$("#idsucbtn").click(function(){
		if($('#idphoneresult').val() != ""){
			if($("#idphonenum").val() == $("#idphoneresult").val()){
				$("#valid").show().css("color", "green").html("인증번호가 일치합니다.");
				$("#idalertid").html($('#resultuserid').val());
				$("#idalert").show();
			}else{
				alert($("#idphonenum").val());
				$("#valid").show().css("color", "red").html("인증번호가 일치하지않습니다.");
			}
			
		}else{
			$("#valid").show().css("color", "red").html("인증하지않으셨습니다.");
		}
	});
	
	$("#idphonebtn").click(function(){
		$.ajax({
			url: "ufindid.do",
			type: "post",
			dataType: "text",
			data: $("#idphoneform").serialize(),
			success:function(user_id){
				if(user_id =="fail"){
					$("#valid").show().css("color", "red").html("일치하는 회원정보가 없습니다.");
				}else{
					 $.ajax({
						url: "ucheckphone.do",
						type: "post",
						data: {phone : $("#idphone1").val()+"-"+$("#idphone2").val()+"-"+$("#idphone3").val()},
						dataType: "text",
						success: function(response){
							$("#valid").show().css("color", "green").html("회원정보가 일치합니다. 인증번호를 보냈습니다.");
							$('#idphoneresult').val(response);
							$('#resultuserid').val(user_id);
						},
						error: function(){
							console.warn("phone X");
						}
					});
				}
			},
			error:function(){
				console.warn("Idphone X");
			}
		});
	});
	
	$("#pwdsucbtn").click(function(){
		if($('#pwdphoneresult').val() != ""){
			if($("#pwdphonenum").val() == $("#pwdphoneresult").val()){
				$("#valpwd").show().css("color", "green").html("인증번호가 일치합니다.");
				$("#phonepwddiv").hide();
				$("#uppwddiv").show();
			}else{
				$("#valpwd").show().css("color", "red").html("인증번호가 일치하지않습니다.");
			}
			
		}else{
			$("#valpwd").show().css("color", "red").html("인증하지않으셨습니다.");
		}
	});
	
	$("#pwdphonebtn").click(function(){
		$.ajax({
			url: "ufindpwd.do",
			type: "post",
			dataType: "text",
			data: $("#pwdphoneform").serialize(),
			success:function(user_no){
				if(user_no =="fail"){
					$("#valpwd").show().css("color", "red").html("일치하는 회원정보가 없습니다.");
				}else{
					$.ajax({
						url: "ucheckphone.do",
						type: "post",
						data: {phone : $("#pwdphone1").val()+"-"+$("#pwdphone2").val()+"-"+$("#pwdphone3").val()},
						dataType: "text",
						success: function(response){
							alert(response);
							$("#valpwd").show().css("color", "green").html("회원정보가 일치합니다. 인증번호를 보냈습니다.");
							$('#pwdphoneresult').val(response);
							$('#resultuserno').val(user_no);
						},
						error: function(){
							alert("실패");
						}
					});
				}
			},
			error:function(){
				alert("실패");
			}
		});
	});
	
	
	function checkpwd4(){
		if($('#pwd4').val() != ""){
		if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#pwd4').val()) || /^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#pwd4').val()) || /^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#pwd4').val())){
			if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#pwd4').val())){
				$('#psecurity4').css("color", "green").html("안전");
			}
			if(/^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#pwd4').val())){
				if($('#pwd4').val().length >= 9){
					$('#psecurity4').css("color", "green").html("안전");
				}else{
					$('#psecurity4').css("color", "Gold").html("중간");
				}
			}
			if(/^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#pwd4').val())){
				if($('#pwd4').val().length >= 9){
					$('#psecurity4').css("color", "green").html("안전");
				}else{
					$('#psecurity4').css("color", "Gold").html("중간");
				}
			}	
			$('#pwdsuc4').show();
			$('#pwdfail4').hide();
			return true;
		}else{
			$('#pwdsuc4').hide();
			$('#pwdfail4').show().html("대문자 하나 또는 소문자 하나,특수 문자, 숫자 입력해주세요. (최소 6자 및 최대 16자)<br> 사용가능 특수문자 !,@,$,%");
			$('#psecurity4').css("color", "red").html("낮음");
			return false;
		}
		}else{
			$('#pwdsuc4').hide();
			$('#pwdfail4').show().html("비밀번호를 입력해주세요");
			$('#psecurity4').css("color", "red").html("위험");
			return false;
		}
		return false;
	}
	
	function checkrepwd4(){
	if($('#repwd4').val() != ""){
		if($('#pwd4').val() == $('#repwd4').val()){
			$('#repwdsuc4').show();
			$('#repwdfail4').hide();
			return true;
		}else{
			$('#repwdsuc4').hide();
			$('#repwdfail4').show().html("비밀번호가 일치하지않습니다.");
			return false;
		}}else{
			$('#repwdsuc4').hide();
			$('#repwdfail4').show().html("입력해주세요.");
			return false;
		}
		return false;
	}
	
	$('#repwd4').change(function(){
		checkrepwd4();
	});
	$('#pwd4').change(function(){
		checkpwd4();
	});
	
	$("#loginbtn").click(function(){
		$.ajax({
		url: "ulogin.do",
		type: "post",
		data: $("#loginform").serialize(),
		dataType: "text",
		success: function(response){
			$("#loginid").val("");
			$("#loginpwd").val("");
			if(response =="success"){
				var page = "realtymain.do";
				if('${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogout.do"&& '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "ulogin.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uloginview.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uinsert.do" && '${param.pageuri}'.substring(1, '${param.pageuri}'.length) != "uuserout.do" && '${param.pageuri}'.length != 0){
				page = '${param.pageuri}'.substring(1, '${param.pageuri}'.length);
				}
				location.replace(page);
			}
			if(response == "idfail"){
				failbar("탈퇴한 아이디거나 아이디가 틀렸습니다<br>다시 입력해주세요.");
			}
			if(response == "pwdfail"){
				failbar("패스워드가 틀렸습니다 다시 입력해주세요.");
			}
			if(response == "countfail"){
				failbar2("로그인 시도가 5회실패하였습니다 다시 입력해주세요.");
				$("#loginform").hide();
				$("#loginformtwo").show();
				capcha4();
			}
		},
		error: function(){
			console.warn("로그인실패");
			$("#loginid").val("");
			$("#loginpwd").val("");
		}});
	});
	
	
	$("#emailbtn1").click(function(){
		$.ajax({
			url: "ucheckemail.do",
			type: "post",
			data: {email : $("#emailtext1").val()},
			dataType: "text",
			success: function(response){
				alert("성공");
			},
			error: function(){
				alert("실패");
			}
		});
	});
	
	
<c:forEach var="c" begin="1" end="3"> 

function emailcheck${c}(){
	if($("#emailtext${c}").val() != ""){
		if(/^[0-9a-zA-Z]*@[0-9a-zA-Z]*.[a-zA-Z]{2,3}$/i.test($("#emailtext${c}").val())){
			$("#emafail${c}").hide();
			$("#emasuc${c}").show().html("이메일형식이 맞습니다");
			return true;
		}else{
			$("#emasuc${c}").hide();
			$("#emafail${c}").show().html("이메일형식에 맞게 입력해주세요<br>예: @ .com");
			return false;
		}
	}else{
		$("#emasuc${c}").hide();
		$("#emafail${c}").show().html("이메일을 입력해주세요");
		return false;
	}
	return false;
	}

$("#emailtext${c}").change(function(){
	emailcheck${c}();
});

$("#phonebtn${c}").click(function(){
	$.ajax({
		url: "ucheckphone.do",
		type: "post",
		data: {phone : $("#phone${c}a").val()+"-"+$("#phone${c}b").val()+"-"+$("#phone${c}c").val()},
		dataType: "text",
		success: function(response){
			if($("#phone${c}b").val() !="" && $("#phone${c}c").val() !=""){
			alert(response);
			$("#phone${c}a").attr("readonly", false);
			$("#phone${c}b").attr("readonly", false);
			$("#phone${c}c").attr("readonly", false);
			$("#pcheckresult${c}").val("false");
			$("#pnumslide${c}").slideDown();
			$("#phnumresult${c}").val(response);
			$("#pnresultfail${c}").hide();
			$("#psendresultsuc${c}").hide();
			$("#psendresultfail${c}").hide();
			$("#pnresultsuc${c}").show().html("인증번호가 발송되었습니다");
			}else{
				$("#pnresultsuc${c}").hide();
				$("#pnresultfail${c}").hide();
				$("#psendresultsuc${c}").hide();
				$("#psendresultfail${c}").show().html("전화번호를 입력해주세요");
			}
		},
		error: function(){
			alert("실패");
		}
	});
});

$("#pcheckbtn${c}").click(function(){
	if($("#phnumresult${c}").val() == $("#phnuminput${c}").val()){
		$("#pnresultsuc${c}").hide();
		$("#pnresultfail${c}").hide();
		$("#psendresultfail${c}").hide();
		$("#psendresultsuc${c}").show().html("인증번호가 일치합니다");
		$("#phone${c}a").attr("readonly", true);
		$("#phone${c}b").attr("readonly", true);
		$("#phone${c}c").attr("readonly", true);
		$("#pcheckresult${c}").val("true");
		$("#pnumslide${c}").slideUp();
		$("#phonebtn${c}").html("재발송");
	}else{
		$("#pnresultsuc${c}").hide();
		$("#psendresultsuc${c}").hide();
		$("#psendresultfail${c}").hide();
		$("#pnresultfail${c}").show().html("인증번호가 일치하지않습니다");
	}
});

function checkphoneresult${c}(){
	if($("#pcheckresult${c}").val() == "true"){
		return true;
	}else{
		$("#psendresultfail${c}").show().html("휴대폰 인증을 해주시기바랍니다");
		return false;
	}
	return false;
}

function capchaCheck${c}(){
	var rereturn;
	$.ajax({
		url: "capresult.do",
		type: "get",
		data: {key: $("#ckey${c}").val(), value: $("#cvalue${c}").val()},
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		async: false,
		success: function(result){
			if(result.result == true){
				rereturn = true;
			}else{
				$("#capfaildiv${c}").show().html("값이 틀렸습니다. 재입력하시기바랍니다");
				capcha${c}();
				rereturn = false;
			}
		},
		error: function(){
			console.warn("capcheck X");
		}
	});
	
	return rereturn;
}


function capcha${c}(){
	$.ajax({
	url: "capkey.do",
	type: "get",
	dataType: "json",
	success : function(capcha){
		
		$.ajax({
		url: "capimage.do",
		type: "get",
		data: {key : capcha.key},
		dataType: "json",
		contentType: "application/json; charset=utf-8",
		success: function(image){
		$("#ckey${c}").val(capcha.key);
		$("#capcha${c}").html('<img src="files/user/capchaImages/'+ image +'.jpg" style="width:100%; height:100%;">');
		},
		error: function(){
			console.warn("capimageX");
		}
		});
	},
	error : function(){
		console.warn("capX");
	}
	});
}

	/* capcha${c}(); */
	
	$("#capreturn${c}").click(function(){
		capcha${c}();
	});

	$("#profile${c}").change(function(){
	    if(this.files && this.files[0]) {
	        var reader = new FileReader();
	        reader.onload = function (e) {
	        	$('#divview${c}').show();
	        	$('#imgdel${c}').show();
	            $('#divview${c}').html("<img src="+ e.target.result +" class='img-thumbnail' style='width:100%; height:100%; border-radius:3px;'>"); 
	        }
	        reader.readAsDataURL(this.files[0]);
	    }
	});
	$('#imgdel${c}').click(function(){
		$("#profile${c}").val("");
		$('#divview${c}').hide();
    	$('#imgdel${c}').hide();
	});
	
	function checkuid${c}(){
		var rereturn;
		if($('#uid${c}').val() !=""){
			if(/^(?=.*[a-z])[a-z\d]{5,15}$/.test($('#uid${c}').val())){
				$.ajax({
					url: "ucheckid.do",
					type: "post",
					data: {userid : $("#uid${c}").val()},
					dataType: "text",
					async: false,
					success: function(response){
						if(response == "success"){
						$('#idfail${c}').hide();
						$('#idsuc${c}').show();
						rereturn = true;
						}else{
						$('#idsuc${c}').hide();
						$('#idfail${c}').show().html("이미 사용중이거나 탈퇴한 아이디입니다.");
						rereturn = false;
						}
					},
					error: function(){
					}
				});
			}else{
				$('#idsuc${c}').hide();
				$('#idfail${c}').show().html("5~15자의 영문 소문자, 숫자(혼용)만 사용가능합니다");
				rereturn = false;
			}}else{
				$('#idfail${c}').show().html("아이디를 입력하세요");
				$('#idsuc${c}').hide();
				rereturn = false;
			}
			return rereturn;
	}
	
	$('#uid${c}').change(function(){
		checkuid${c}();
		});
	
	function checknick${c}(){
		var rereturn;
		if($('#nick${c}').val() != ""){
			if(/^(?=.*[a-zA-z가-힣])[a-zA-z\d가-힣]{3,10}$/.test($('#nick${c}').val())){
				$.ajax({
					url: "uchecknick.do",
					type: "post",
					data: {nickname : $("#nick${c}").val()},
					dataType: "text",
					async: false,
					success: function(response){
						if(response == "success"){
							$('#nicksuc${c}').show();
							$('#nickfail${c}').hide();
							rereturn = true;
						}else{
							$('#nicksuc${c}').hide();
							$('#nickfail${c}').show().html("이미 사용중인 닉네임입니다");
							rereturn = false;
						}
					},
					error: function(){
						console.warn("닉네임일치 X");
					}
				});
			}else{
				$('#nicksuc${c}').hide();
				$('#nickfail${c}').show().html("3~10자의 영문 소문자, 한글, 숫자(혼용)만 사용가능합니다");
				rereturn = false;
			}
			}else{
				$('#nickfail${c}').show().html("닉네임을 입력하세요");
				$("#nicksuc${c}").hide();
				rereturn = false;
			}
		return rereturn;
		}
		
	
	$("#nick${c}").change(function(){
		checknick${c}();
		});
	
	function checkpwd${c}(){
		if($('#pwd${c}').val() != ""){
			if($('#pwd${c}').val().search($('#uid${c}').val()) > -1 && $('#uid${c}').val() != ""){
				$('#pwdsuc${c}').hide();
				$('#pwdfail${c}').show().html("비밀번호에 아이디가 포함되었습니다");
				$('#psecurity${c}').css("color", "red").html("위험");
				return false;
			}else if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#pwd${c}').val()) || /^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#pwd${c}').val()) || /^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#pwd${c}').val())){
				if(/^(?=.*[a-z])(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Za-z\d!@$%]{6,16}$/.test($('#pwd${c}').val())){
					$('#psecurity${c}').css("color", "green").html("안전");
				}
				if(/^(?=.*[a-z])(?=.*\d)(?=.*[!@$%])[a-z\d!@$%]{6,16}$/.test($('#pwd${c}').val())){
					if($('#pwd${c}').val().length >= 9){
						$('#psecurity${c}').css("color", "green").html("안전");
					}else{
						$('#psecurity${c}').css("color", "Gold").html("중간");
					}
				}
				if(/^(?=.*[A-Z])(?=.*\d)(?=.*[!@$%])[A-Z\d!@$%]{6,16}$/.test($('#pwd${c}').val())){
					if($('#pwd${c}').val().length >= 9){
						$('#psecurity${c}').css("color", "green").html("안전");
					}else{
						$('#psecurity${c}').css("color", "Gold").html("중간");
					}
				}	
				$('#pwdsuc${c}').show();
				$('#pwdfail${c}').hide();
				return true;
			}else{
				$('#pwdsuc${c}').hide();
				$('#pwdfail${c}').show().html("대문자 하나 또는 소문자 하나,특수 문자, 숫자 입력해주세요. (최소 6자 및 최대 16자)<br> 사용가능 특수문자 !,@,$,%");
				$('#psecurity${c}').css("color", "red").html("낮음");
				return false;
			}
			}else{
				$('#pwdsuc${c}').hide();
				$('#pwdfail${c}').show().html("비밀번호를 입력해주세요");
				$('#psecurity${c}').css("color", "red").html("위험");
				return false;
			}
			return false;
	}
	
	$('#pwd${c}').change(function(){
		checkpwd${c}();
		});
	
	function checkrepwd${c}(){
		if($('#repwd${c}').val() != ""){
			if($('#pwd${c}').val() == $('#repwd${c}').val()){
				$('#repwdsuc${c}').show();
				$('#repwdfail${c}').hide();
				return true;
			}else{
				$('#repwdsuc${c}').hide();
				$('#repwdfail${c}').show().html("비밀번호가 일치하지않습니다.");
				return false;
			}}else{
				$('#repwdsuc${c}').hide();
				$('#repwdfail${c}').show().html("입력해주세요.");
				return false;
			}
			return false;
		}
	$('#repwd${c}').change(function(){
		checkrepwd${c}();
	});
	
</c:forEach>


<c:if test="${!empty message}">
$(function(){$("#alertdiv").show();});
</c:if>



});
</script>
<style>
input[type="number"]::-webkit-outer-spin-button, input[type="number"]::-webkit-inner-spin-button
	{
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
	border-radius: 5px !important;
	cursor: pointer !important;
}

.btn-lgreen:hover {
	opacity: 0.9 !important;
	color: white !important;
}

.btn-bgray {
	background: #61C0BF !important;
	color: white !important;
	font-size: 15px !important;
	font-weight: 600 !important;
	border-radius: 5px !important;
	height: 35px;
	cursor: pointer;
}

.btn-bgray:hover {
	opacity: 0.8 !important;
}

.btn-gray {
	background: #777 !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
}

.btn-gray:hover {
	opacity: 0.9 !important;
	color: white !important;
}

.unav i {
	font-size: 18px !important;
}

.unav span {
	font-size: 16px !important;
}

.unav {
	color: #bbb !important;
}

.unav:hover {
	color: #888 !important;
}

.umt {
	font-weight: bold !important;
}

.alert-white {
	background: white !important;
	color: black !important;
	display: fixed !important;
	z-index: 5 !important;
	width: 300px !important;
	margin: 0 auto !important;
}

#userback {
	position: absolute !important;
	width: 100%;
	height: 100% !important;
	backface-visibility: hidden !important;
	z-index: 0 !important;
	transform: rotateY(180deg) !important;
}

#loginfront {
	width: 380px;
	background: white !important;
	z-index: 1 !important;
	position: absolute !important;
	backface-visibility: hidden !important;
}

.ubsc {
	background: #777 !important;
}

.ubsc:hover {
	background: #777 !important;
	opacity: 0.9 !important;
}

.maindiv:hover {
	color: white;
	text-decoration: none;
}

.imageview {
	width: 100px;
	height: 100px;
	display: none;
}

.ualert {
	position: absolute;
	z-index: 3;
	margin: auto auto;
	width: 300px;
	box-shadow: 1px 1px 4px 2px #ddd;
	display: none;
}

.capreturn {
	border: 1px solid #ddd;
	border-radius: 5px;
	position: absolute;
	background: rgba(255, 255, 255, 0.6);
	top: 3px;
	right: 5px;
	padding: 3px 6px;
	z-index: 80;
	cursor: pointer;
}

.capreturn:hover {
	background: rgba(255, 255, 255, 0.8);
}

#maindiv1 {
	width: 100px;
	height: 100px;
	border-radius: 5px;
	background: #61C0BF;
	color: white;
	text-align: center;
}

#maindiv2 {
	width: 100px;
	height: 100px;
	border-radius: 5px;
	background: #FFB6B9;
	color: white;
	text-align: center;
}
@keyframes mainone {
	0% {background: linear-gradient(to bottom right, white, #61C0BF);}
	25% {background: linear-gradient(to bottom right, #61C0BF, white, #61C0BF,#61C0BF,#61C0BF);}
	50% {background: linear-gradient(to bottom right, #61C0BF, white, #61C0BF);}
	75% {background: linear-gradient(to bottom right, #61C0BF, #61C0BF, #61C0BF, white, #61C0BF);}
	100% {background: linear-gradient(to top left, white, #61C0BF);}
}
@keyframes maintwo {
	0% {background: linear-gradient(to bottom right, white, #FFB6B9);}
	25% {background: linear-gradient(to bottom right, #FFB6B9, white, #FFB6B9,#FFB6B9,#FFB6B9);}
	50% {background: linear-gradient(to bottom right, #FFB6B9, white, #FFB6B9);}
	75% {background: linear-gradient(to bottom right, #FFB6B9, #FFB6B9, #FFB6B9, white, #FFB6B9);}
	100% {background: linear-gradient(to top left, white, #FFB6B9);}
}


#maindiv1:hover{
	animation: mainone 0.3s;
	opacity: 0.8;
}

#maindiv2:hover {
	animation: maintwo 0.3s;
	opacity: 0.8;
}
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<!-- 아이디 찾기 모달 -->
 <div class="modal fade" id="findId"><div class="modal-dialog" ><div class="modal-content">
        <div class="modal-header border-0"><h5 class="modal-title umt">아이디 찾기</h5><button type="button" class="close" data-dismiss="modal">&times;</button></div>
        <div class="modal-body"><ul class="nav nav-tabs">
 		  <!--  <li class="nav-item"><a class="nav-link unav" data-toggle="tab" href="#emailId"><i class="far fa-envelope"></i> <span>이메일</span></a></li> -->
 		   <li class="nav-item"><a class="nav-link unav active" data-toggle="tab" href="#phoneId"><i class="fas fa-phone"></i> <span>전화번호</span></a></li></ul>
 		   <div class="tab-content">
    			<!-- <div id="emailId" class="container tab-pane fade"><form id="idemailform"><br>
    				<div class="form-group d-flex"><input type="text" class="form-control ucon" name="user_name" placeholder="이름" style="width: calc(100% - 80px);"></div>
    				<div class="form-group"><span class="d-flex"><input type="email" class="form-control ucon" placeholder="이메일"><button type="button" class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></span></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호" style="width: calc(100% - 80px);"></div></form></div> -->
    			<div id="phoneId" class="container tab-pane active"><form id="idphoneform"><br>
    				<div class="form-group d-flex"><input type="text" class="form-control ucon" name="user_name" placeholder="이름"  style="width: calc(100% - 80px);"></div>
    				<div class="form-group d-flex" ><span class="d-flex" style="width: calc(100% - 80px);"><select class="form-control ucon mr-2" name="phone1" id="idphone1" >
    																													<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" name="phone2" id="idphone2" class="form-control ucon mr-2"><input type="number" id="idphone3" name="phone3"class="form-control ucon"></span><button type="button" id="idphonebtn"class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></div>
    				<div class="form-group d-flex"><input type="hidden" id="idphoneresult"><input type="hidden" id="resultuserid"><input type="number" id="idphonenum" class="form-control ucon" placeholder="인증번호"  style="width: calc(100% - 80px);"></div></form>
    				<div id="valid" style="font-size:13px; padding: 0 10px; display:none;"></div></div></div></div>
        <div class="modal-footer border-0"><button type="button" id="idsucbtn" class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
</div></div>
<div id="idalert" class="alert alert-white fade show" style="display:none;"><button type="button" id="idalertclose" class="close">&times;</button>아이디는 <b id="idalertid">abcd</b>입니다.</div>
</div>

<!-- 비밀번호 찾기 모달 -->
 <div class="modal fade" id="findPwd"><div class="modal-dialog"><div class="modal-content"><div id="phonepwddiv">
        <div class="modal-header border-0"><h5 class="modal-title umt">비밀번호 찾기</h5><button type="button" class="close" data-dismiss="modal">&times;</button> </div>
        <div class="modal-body"><ul class="nav nav-tabs">
 		   <!-- <li class="nav-item"><a class="nav-link unav" data-toggle="tab" href="#emailPwd"><i class="far fa-envelope"></i> <span>이메일</span></a></li> -->
 		   <li class="nav-item"> <a class="nav-link unav active" data-toggle="tab" href="#phonePwd"><i class="fas fa-phone"></i> <span>전화번호</span></a></li></ul>
 		   <div class="tab-content">
    			<!-- <div id="emailPwd" class="container tab-pane fade"><form id="pwdemailform"><br>
					<div class="form-group d-flex"><input type="text" class="form-control ucon" name="user_id" placeholder="아이디" style="width: calc(100% - 80px);"></div>
    				<div class="form-group"><span class="d-flex"><input type="email" class="form-control ucon" placeholder="이메일"><button type="button" class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></span></div>
    				<div class="form-group d-flex"><input type="number" class="form-control ucon" placeholder="인증번호" style="width: calc(100% - 80px);"></div></form></div> -->
    			<div id="phonePwd" class="container tab-pane active"><form id="pwdphoneform"><br>
					<div class="form-group d-flex"><input type="text" class="form-control ucon" name="user_id" placeholder="아이디"  style="width: calc(100% - 80px);"></div>
    				<div class="form-group d-flex" ><span class="d-flex" style="width: calc(100% - 80px);"><select class="form-control ucon mr-2" name="phone1">
   																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>	
    				</select><input type="number" name="phone2" class="form-control ucon mr-2"><input type="number" name="phone3" class="form-control ucon"></span><button type="button" id="pwdphonebtn" class="btn btn-lgreen" style="width:80px; margin-left:10px;">보내기</button></div>
    				<div class="form-group d-flex"><input type="hidden" id="pwdphoneresult"><input type="hidden" id="resultuserno"><input type="number" id="pwdphonenum"  class="form-control ucon" placeholder="인증번호"  style="width: calc(100% - 80px);"></div></form>
    				<div id="valpwd" style="font-size:13px; padding: 0 10px; display:none;"></div></div></div></div>
        <div class="modal-footer border-0"><button type="button" id="pwdsucbtn" class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div></div><div id="uppwddiv" style="display:none;"><form id="pwdform" class="needs-validation"  novalidate>
        
        <div class="modal-header border-0"><h5 class="modal-title umt">비밀번호 재등록</h5><button type="button" class="close" data-dismiss="modal">&times;</button></div>
        <div class="modal-body">
        	<div class="form-group"><label>비밀번호<small> (보안등급: <span id="psecurity4"></span>)</small></label><input type="password" id="pwd4" name="password" class="form-control ucon" required><div id="pwdsuc4" class="valid-feedback">허용된 비밀번호입니다</div><div id="pwdfail4" class="invalid-feedback"></div></div>
			<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd4" class="form-control ucon" required><div id="repwdsuc4" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail4" class="invalid-feedback"></div></div></div>
        <div class="modal-footer border-0"><button type="button" id="pwdinsertbtn" class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" id="alertpwddelbtn" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div></form></div>
</div><div></div></div></div>

<div class="container">

<div id="noinsertalert" class="alert alert-danger alert-dismissible fade show" style="z-index:5; position:fixed; right:10%; top:20%; display:none;"><button type="button" class="close" id="noinsertbtn">&times;</button>
    <strong>가입 실패!</strong> 미입력된값을 입력해주세요. </div>
    
<div class="row">
	<div class="col-12" style="perspective: 2000px;">

<!-- 로그인 및 회원가입 -->
		<div class="d-flex justify-content-center" id="turn" style="margin-top:10%; transition: transform 1s; transform-style: preserve-3d;">
		<div class="col-12 back" id="userback" style="width:500px;">

<!-- 회원가입 -->

			 <div class="mb-3"><span class="font-weight-bold fa-2x"><i class="fas fa-home" style="background:#61C0BF; color:white; padding:10px; border-radius: 5px;"></i> 회원가입</span>
			 						<button class="btn btn-gray float-right mt-1 returnlogin"><i class="fas fa-exchange-alt"> 로그인</i></button></div><div><ul class="nav nav-tabs ml-auto">
   			<li class="nav-item"><a class="nav-link unav active widthreset" data-toggle="tab"  href="#user"><i class="fas fa-user"></i> <span>일반회원</span></a></li>
   			<li class="nav-item"><a class="nav-link unav widthreset" data-toggle="tab" href="#seller"><i class="fas fa-home"></i> <span>매도인</span></a></li>
    		<li class="nav-item"><a class="nav-link unav widthchange" data-toggle="tab" href="#realtor"><i class="fas fa-user-tie"></i> <span>공인중개사</span></a></li></ul></div>
        <div class="tab-content" id="accountheight">
    		<div id="user" class="container tab-pane active" style="padding-bottom:10%;"><br><form id="uinsertform1" class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="일반회원">
    			<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview1"></div><span class="d-flex"><label for="profile1" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile1" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel1" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid1" class="form-control ucon" name="user_id" required><div id="idsuc1" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail1" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="nick1" name="nickname" required><div id="nicksuc1" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="nickfail1" class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>성명</label><input type="text" class="form-control ucon" name="user_name" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext1" name="email" class="form-control ucon" required><div class="input-group-append"><!-- <button type="button" id="emailbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button> --></div><div id="emasuc1" class="valid-feedback"></div><div id="emafail1" class="invalid-feedback"></div></div></div>
					<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="phone1a" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" id="phone1b" name="phone2" class="form-control ucon mr-2" required><input type="number" id="phone1c" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" id="phonebtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">발송</button></div><div id="psendresultsuc1" class="valid-feedback"></div><div id="psendresultfail1" class="invalid-feedback">필수 정보입니다</div></div></div>
					<input type="hidden" id="phnumresult1"><input type="hidden" id="pcheckresult1" value="false">
				<div class="form-group px-1" id="pnumslide1" style="display:none;"><div class="input-group"><input type="number" id="phnuminput1" class="form-control ucon" placeholder="인증번호를 입력해주세요"><div class="input-group-append"><button type="button" id="pcheckbtn1" class="btn btn-lgreen" style="width:85px; margin-left:8px;">확인</button></div><div id="pnresultsuc1" class="valid-feedback"></div><div id="pnresultfail1" class="invalid-feedback"></div></div></div>
				<div class="form-group"><label>비밀번호<small> (보안등급: <span id="psecurity1"></span>)</small></label><input type="password" id="pwd1" name="password" class="form-control ucon" required><div id="pwdsuc1" class="valid-feedback">허용된 비밀번호입니다</div><div id="pwdfail1" class="invalid-feedback"></div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd1" class="form-control ucon" required><div id="repwdsuc1" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail1" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card">
					<div class="card-body" style="padding:1%; height:100px"><div id="capcha1" style="width:100%; height:100%;"></div><span id="capreturn1" class="capreturn"><i class="fas fa-undo"></i></span></div>
					<div class="card-footer form-group" style="background:white; border:0; padding: 0 3%; padding-top:1%;"><input type="hidden" id="ckey1" name="key"><input type="text" id="cvalue1" class="form-control" name="value"></div></div><div id="capfaildiv1" class="invalid-feedback pl-2"></div></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="sbcheck1" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck1">선방서비스 이용약관동의(필수)</label></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="usecheck1" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck1">개인정보수집 및 이용에대한동의(필수)</label></div>
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></form></div>
				 
    		<div id="seller" class="container tab-pane fade" style="padding-bottom:10%;"><br><form id="uinsertform2" class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="매도인">
    			<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview2"></div><span class="d-flex"><label for="profile2" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile2" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel2" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid2" name="user_id" class="form-control ucon" required><div id="idsuc2" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail2" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="nick2" name="nickname" required><div id="nicksuc2" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="nickfail2" class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>성명</label><input type="text" name="user_name" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext2" name="email" class="form-control ucon" required><div class="input-group-append"><!-- <button type="button" id="emailbtn2" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button> --></div><div id="emasuc2" class="valid-feedback"></div><div id="emafail2" class="invalid-feedback"></div></div></div>
				<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="phone2a" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" id="phone2b" name="phone2" class="form-control ucon mr-2" required><input type="number" id="phone2c" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" id="phonebtn2" class="btn btn-lgreen" style="width:85px; margin-left:8px;">발송</button></div><div id="psendresultsuc2" class="valid-feedback"></div><div id="psendresultfail2" class="invalid-feedback">필수 정보입니다</div></div></div>
					<input type="hidden" id="phnumresult2"><input type="hidden" id="pcheckresult2" value="false">
				<div class="form-group px-1" id="pnumslide2" style="display:none;"><div class="input-group"><input type="number" id="phnuminput2" class="form-control ucon" placeholder="인증번호를 입력해주세요"><div class="input-group-append"><button type="button" id="pcheckbtn2" class="btn btn-lgreen" style="width:85px; margin-left:8px;">확인</button></div><div id="pnresultsuc2" class="valid-feedback">인증번호가 일치합니다</div><div id="pnresultfail2" class="invalid-feedback"></div></div></div>
				<div class="form-group"><label>비밀번호<small> (보안등급: <span id="psecurity2"></span>)</small></label><input type="password" id="pwd2" name="password" class="form-control ucon" required><div id="pwdsuc2" class="valid-feedback">허용된 비밀번호입니다</div><div id="pwdfail2" class="invalid-feedback"></div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd2" class="form-control ucon" required><div id="repwdsuc2" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail2" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card">
					<div class="card-body" style="padding:1%; height:100px"><div id="capcha2" style="width:100%; height:100%;"></div><span id="capreturn2" class="capreturn"><i class="fas fa-undo"></i></span></div>
					<div class="card-footer form-group" style="background:white; border:0; padding: 0 3%; padding-top:1%;"><input type="hidden" id="ckey2" name="key"><input type="text" id="cvalue2" class="form-control" name="value"></div></div><div id="capfaildiv2" class="invalid-feedback pl-2"></div></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="sbcheck2" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck2">선방서비스 이용약관동의(필수)</label></div>
				<div class="form-group custom-control custom-checkbox" style="font-size:13px"><input id="usecheck2" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck2">개인정보수집 및 이용에대한동의(필수)</label></div>
				<div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></form></div>
				
    		<div id="realtor" class="container tab-pane fade" style="padding-bottom:10%;"><br><form id="uinsertform3" class="needs-validation" action="uinsert.do" method="post" enctype="multipart/form-data" novalidate><input type="hidden" name="user_type" value="공인중개사"><div class="row"><div class="col-lg-6">
				<div class="form-group"><label>중개사무소명</label><input type="text" class="form-control ucon" name="office_name" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>중개등록번호</label><input type="text" name="office_regist_no" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>사업자 등록번호</label><div class="input-group"><input type="number" name="license1" class="form-control ucon mr-2" required><input type="number" name="license2" class="form-control ucon mr-2" required><input type="number" name="license3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div>
				<div class="form-group"><label>중개사무소 주소</label><input type="text" name="office_address"class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>중개사 대표자명</label><input type="text" name="user_name" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>대표 전화번호</label><div class="input-group"><input type="number" name="ophone1" class="form-control ucon mr-2" required><input type="number" name="ophone2" class="form-control ucon mr-2" required><input type="number" name="ophone3" class="form-control ucon" required><div class="invalid-feedback">필수 정보입니다</div></div></div></div><div class="col-lg-6">
				<div class="form-group"><label>프로필</label><br><span class="d-flex justify-content-between align-items-center"><div class="imageview" id="divview3"></div><span class="d-flex"><label for="profile3" class="btn btn-bgray">프로필 업로드</label><input type="file" id="profile3" name="profile" accept="image/*" style="display:none;"><button type="button" class="btn btn-bgray ml-2"  id="imgdel3" style="display:none;">취소</button></span></span></div>
				<div class="form-group"><label>아이디</label><input type="text" id="uid3" name="user_id" class="form-control ucon" required><div id="idsuc3" class="valid-feedback">일치하는 아이디가 없습니다</div><div id="idfail3" class="invalid-feedback"></div></div>
				<div class="form-group"><label>닉네임</label><input type="text" class="form-control ucon" id="nick3" name="nickname" required><div id="nicksuc3" class="valid-feedback">일치하는 닉네임이 없습니다</div><div id="nickfail3" class="invalid-feedback">필수 정보입니다</div></div>
				<div class="form-group"><label>이메일</label><div class="input-group"><input type="email" id="emailtext3" name="email" class="form-control ucon" required><div class="input-group-append"><!-- <button type="button" id="emailbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">인증</button> --></div><div id="emasuc3" class="valid-feedback"></div><div id="emafail3" class="invalid-feedback"></div></div></div>
					<div class="form-group"><label>휴대폰번호</label><div class="input-group"><select class="form-control ucon mr-2" id="phone3a" name="phone1" required>
																														<option value="010" actofocus>010</option>
																														<option value="011">011</option>
																														<option value="016">016</option>
																														<option value="017">017</option>
																														<option value="018">018</option>
																														<option value="019">019</option>
					</select><input type="number" id="phone3b" name="phone2" class="form-control ucon mr-2" required><input type="number" id="phone3c" name="phone3" class="form-control ucon" required><div class="input-group-append"><button type="button" id="phonebtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">발송</button></div><div id="psendresultsuc3" class="valid-feedback"></div><div id="psendresultfail3" class="invalid-feedback">필수 정보입니다</div></div></div>
					<input type="hidden" id="phnumresult3"><input type="hidden" id="pcheckresult3" value="false">
				<div class="form-group px-1"  id="pnumslide3" style="display:none;"><div class="input-group"><input type="number" id="phnuminput3" class="form-control ucon" placeholder="인증번호를 입력해주세요"><div class="input-group-append"><button type="button" id="pcheckbtn3" class="btn btn-lgreen" style="width:85px; margin-left:8px;">확인</button></div><div id="pnresultsuc3" class="valid-feedback">인증번호가 일치합니다</div><div id="pnresultfail3" class="invalid-feedback"></div></div></div>
				<div class="form-group"><label>비밀번호<small> (보안등급: <span id="psecurity3"></span>)</small></label><input type="password" id="pwd3" name="password"class="form-control ucon" required><div id="pwdsuc3" class="valid-feedback">허용된 비밀번호입니다</div><div id="pwdfail3" class="invalid-feedback"></div></div>
				<div class="form-group"><label>비밀번호 확인</label><input type="password" id="repwd3" class="form-control ucon" required><div id="repwdsuc3" class="valid-feedback">비밀번호가 일치합니다.</div><div id="repwdfail3" class="invalid-feedback"></div></div>
				<div class="form-group"><div class="card">
					<div class="card-body" style="padding:1%; height:100px"><div id="capcha3" style="width:100%; height:100%;"></div><span id="capreturn3" class="capreturn"><i class="fas fa-undo"></i></span></div>
					<div class="card-footer form-group" style="background:white; border:0; padding: 0 3%; padding-top:1%;"><input type="hidden" id="ckey3" name="key"><input type="text" id="cvalue3" class="form-control" name="value"></div></div><div id="capfaildiv3" class="invalid-feedback pl-2"></div></div></div>
				<div class="col-lg-6 col-12 custom-control custom-checkbox mb-2" style="font-size:13px; padding-left: 40px;"><input id="sbcheck3" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="sbcheck3">선방서비스 이용약관동의(필수)</label></div>
				<div class="col-lg-6 col-12 custom-control custom-checkbox mb-2" style="font-size:13px; padding-left: 40px;"><input id="usecheck3" class="custom-control-input" type="checkbox" required><label class="custom-control-label" for="usecheck3">개인정보수집 및 이용에대한동의(필수)</label></div><div class="col-lg-12">
				 <div class="form-group d-flex justify-content-between"><input type="submit" class="btn btn-green " value="가입신청" style="width:48%;"><button type="button" class="btn btn-secondary ubsc returnlogin" data-dismiss="modal" style="width:48%;">취소</button></div></div></div></form></div></div></div>
				 
<!-- 로그인 --><div id="pwdsucalert" class="alert alert-success" style="z-index:3; display:none;"><strong>패스워드 수정 성공!</strong> 로그인 하시기 바랍니다~</div>
		<div class="col-12" id="loginfront">
			<div class="mb-5 d-flex justify-content-around"><a class="maindiv" href="realtymain.do"><div id="maindiv1"><b style="line-height:100px;"><i class="fas fa-home" style="font-size:20px;"></i> 부동산</b></div></a>
																			<a class="maindiv" href="interiormain.do"><div id="maindiv2"><b style="line-height:100px;"><i class="fas fa-paint-roller" style="font-size:20px;"></i> 인테리어</b></div></a></div>
			<div class="mb-3" align="center"><span class="font-weight-bold fa-2x"><i class="fas fa-home" style="background:#61C0BF; color:white; padding:2%; border-radius: 5px;"></i> 선방</span></div>
			<form id="loginform"><div class="form-group"><input type="text" id="loginid" class="form-control ucon form-control ucon-lg" name="user_id" placeholder="아이디" style="border-bottom:0;"><input type="password" id="loginpwd" class="form-control ucon form-control ucon-lg" name="password" placeholder="비밀번호"></div>
			<div id="loginfailbar" class="form-group" style="display:none; font-size:14px; padding: 0 5%; color:red">아이디가 틀렸습니다</div>
			<div class="form-group"><input type="button" id="loginbtn" class="btn btn-block btn-lg btn-green" value="로그인"></div>
			<div class="custom-control custom-checkbox" style="font-size: 13px;"><input type="checkbox" id="logincheck"class="custom-control-input" name="logincheck" value="cookie" style="display:none;"><label for="logincheck" class="custom-control-label" style="cursor:pointer;">로그인 상태 유지</label></div></form>
			
			<form id="loginformtwo" style="display:none;"><div class="form-group"><input type="text" id="loginid2" class="form-control ucon form-control ucon-lg" name="user_id" placeholder="아이디" style="border-bottom:0;"><input type="password" id="loginpwd2" class="form-control ucon form-control ucon-lg" name="password" placeholder="비밀번호"></div>
			<div id="loginfailbar2" class="form-group" style="display:none; font-size:14px; padding: 0 5%; color:red">아이디가 틀렸습니다</div>
			<div class="form-group"><div class="card">
			<div class="card-body" style="padding:1%; height:100px"><div id="capcha4" style="width:100%; height:100%;"></div><span id="capreturn4" class="capreturn"><i class="fas fa-undo"></i></span></div>
			<div class="card-footer form-group" style="background:white; border:0; padding: 0 3%; padding-top:1%;"><input type="hidden" id="ckey4" name="key"><input type="text" id="cvalue4" class="form-control" name="value"></div></div><div id="capfaildiv4" class="invalid-feedback pl-2"></div></div>
			<div class="form-group"><input type="button" id="loginbtntwo" class="btn btn-block btn-lg btn-green" value="로그인"></div>
			<div class="custom-control custom-checkbox" style="font-size: 13px;"><input type="checkbox" id="logincheck"class="custom-control-input" name="logincheck" value="cookie" style="display:none;"><label for="logincheck" class="custom-control-label" style="cursor:pointer;">로그인 상태 유지</label></div></form>
			
			<div class="d-flex justify-content-between mb-3 mt-3" style="border-top:1px solid #ddd; padding-top:5%;">
				<div class="btn btn-lgreen" data-toggle="modal" data-target="#findId">아이디 찾기</div>
				<div class="btn btn-lgreen ml-2 mr-2"  data-toggle="modal" data-target="#findPwd">비밀번호 찾기</div>
				<div class="btn btn-lgreen"  id="accountpage" >회원가입</div></div></div>
		</div></div>
<div id="alertdiv" class="alert alert-success ualert"><button type="button" class="close" data-dismiss="alert">&times;</button><h4 class="alert-heading" style="font-weight:600;">${messagetitle }</h4>${message}</div></div>
</div>

<div id="turnfooter" style="margin-top:700px;"><c:import url="../common/footer.jsp" /></div>

</body>
</html>