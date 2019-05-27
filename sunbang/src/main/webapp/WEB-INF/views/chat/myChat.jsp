<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$("#blbtn").click(function(){
		$("#cblock").fadeIn();
	});
	$("#cbtn").click(function(){
		$("#cblock").fadeOut();
	});
	
	$("#blocksearch").on("keyup",function(){
		var value = $(this).val();
		$(".chbdiv").filter(function(){
			$(this).toggle($(this).text().indexOf(value) > -1)
		});
	});
	$("#nickreturn2").click(function(){
		$("#nicksearchdiv").show();
		$("#nickresultdiv").hide();
		$("#nicksearchbtn").show();
		$("#nickchatin").hide();
		$("#nickreturn").hide();
	});
	
	
	$("#nickreturn").click(function(){
		$("#nicksearchdiv").show();
		$("#nickresultdiv").hide();
		$("#nicksearchbtn").show();
		$("#nickchatin").hide();
		$("#nickreturn").hide();
	});
	
	$("#chatrsearch").on("keyup",function(){
		var value = $(this).val();
		$(".crdiv").filter(function(){
			$(this).toggle($(this).text().indexOf(value) > -1)
		});
	});
	
	$("input[name='chatfilter']").change(function(){
		var value = $(this).val();
		var checked = $(this).prop('checked');
		
		if(checked){
			$(".chatType").filter(function(){
				if($(this).text() == value){
				$(this).parent().show();
				}
			});
		}else{
			$(".chatType").filter(function(){
				if($(this).text() == value){
				$(this).parent().hide();
				}
			});
		}
	});
	
	$("#nickchatin").click(function(){
		$.ajax({
			url: "cuserchatinsert.do",
			type: "get",
			data: {chat_no: $("#resultusernod").val(), user_no: ${loginUser.user_no}},
			success:function(){
				alert("채팅 연결 성공");
				$("#usersearchclosebtn").trigger("click");
				$("#nicksearchdiv").show();
				$("#nickresultdiv").hide();
				$("#nicksearchbtn").show();
				$("#nickchatin").hide();
				$("#nickreturn").hide();
			},
			error:function(){
				console.warn("cuserchatinsert X");
			}
		});
	});
	
	$("#nicksearchbtn").click(function(){
		$.ajax({
			url: "cselectuser.do",
			type: "get",
			data: {nickname: $("#nicksearchinput").val()},
			dataType: "text",
			success: function(result){
				if(result != 0){
					$("#resultusernod").val(result);
					$("#nicksearchdiv").hide();
					$("#nickresultdiv").show();
					$("#ninini").html("<b>"+$("#nicksearchinput").val()+"</b>닉네임가진 유저가 있습니다 채팅하시겠습니까?");
					$("#nicksearchbtn").hide();
					$("#nickchatin").show();
					$("#nickreturn").hide();
				}else{
					$("#nicksearchdiv").hide();
					$("#nickresultdiv").show();
					$("#ninini").html("<b>"+$("#nicksearchinput").val()+"</b>닉네임가진 유저가 없습니다.");
					$("#nicksearchbtn").hide();
					$("#nickchatin").hide();
					$("#nickreturn").show();
				}
			},
			error:function(){
				console.warn("selectuser X");
			}
		});	
	});
	cbList();
function cbList(){
	$.ajax({
	url:"cblist.do",
	type: "get",
	contentType: "application/json; charset=utf-8",
	data: {userno: ${loginUser.user_no} },
	dataType: "json",
	async: false,
	cache: false,
	success: function(cbobj){
		var CB = JSON.parse(JSON.stringify(cbobj));
		var outCBlock = $("#cblist").html();
		
		for(var i in CB.cblist){
		outCBlock += '<div class="chatdiv chbdiv mt-1" id="cbdivd'+CB.cblist[i].block_no+'" style="cursor:default;">'+CB.cblist[i].nickname+'<span id="cbdel'+CB.cblist[i].block_no+'" class="icon ml-1"><i class="far fa-trash-alt"></i></span><span style="color:#888; float:right;">'+CB.cblist[i].block_time+'</span></div>';
		}
		$("#cblist").html(outCBlock);
	},
	error: function(){
		alert("리스트조회실패");
	}});
}
	
function chatmsgList(){
	$.ajax({
	url: "cmyfilter.do",
	type: "get",
	contentType: "application/json; charset=utf-8",
	data: {userno: ${loginUser.user_no} },
	dataType: "json",
	async: false,
	cache: false,
	success: function(obj){
		var jsonObj = JSON.parse(JSON.stringify(obj));
		var outClist = $("#chatlist").html();
		var outBell = $("#bellps").html();
				
		for(var i in jsonObj.clist){
			if(!$("#chatdiv"+jsonObj.clist[i].chat_no).length){
			outClist += "<div class='chatdiv crdiv mt-2' id='chatdiv"+jsonObj.clist[i].chat_no+"'>[<span class='chatType'>"+jsonObj.clist[i].chat_type+"</span>]";
			if(jsonObj.clist[i].chat_type == '단체'){
			outClist += jsonObj.clist[i].chat_name +"<span class='ccculist' id='ccculist"+jsonObj.clist[i].chat_no+"' style='display:none;'></span><span class='btn-lgreen mr-2' style='float:right;'><i class='far fa-minus-square'></i></span></div>";
			}else{
			outClist +="<span class='ccculist' id='ccculist"+jsonObj.clist[i].chat_no+"' style=''></span><span id='chatdeld"+jsonObj.clist[i].chat_no+"' class='btn-lgreen mr-2' style='float:right;'><i class='far fa-minus-square'></i></span></div>";	
			}}
			if(jsonObj.clist[i].alert_status == 'Y'){
			outBell = '<span id="bellon${mcn}"class="icon"><i class="fas fa-bell"></i></span>';
			}else{
			outBell = '<span id="belloff${mcn}"class="icon"><i class="fas fa-bell-slash"></i></span>';
			}
			$("#bellps"+jsonObj.clist[i].chat_no).html(outBell);
		}
		$("#chatlist").html(outClist);
		
		
/* 끝 */
 
/* 유저리스트 */ 
 		for(var i in jsonObj.clist){
 			$.ajax({
				url: "cuserlist.do",
				type: "get",
				contentType: "application/json; charset=utf-8",
				data: {chat_no: jsonObj.clist[i].chat_no, user_no : ${loginUser.user_no}},
				dataType: "json",
				async: false,
				cache: false,
				success: function(cuobj){
					var CU = JSON.parse(JSON.stringify(cuobj));
					var outCulist = $("#culist"+jsonObj.clist[i].chat_no).html();
					var outCCCulist = $("#ccculist"+jsonObj.clist[i].chat_no).html();
					
					for(var j in CU.culist){
						if(!$("#c"+CU.culist[j].chat_no+"u"+CU.culist[j].user_no+"div").length){
						outCulist +='<div id="c'+CU.culist[j].chat_no+'u'+CU.culist[j].user_no+'div" class="chatdiv mt-1">'+CU.culist[j].nickname+'';
						if( ${loginUser.user_no} != CU.culist[j].user_no && CU.culist[j].check_join != 'Y'){
						outCulist +='<span id="cbin'+CU.culist[j].user_no+'span" class="btn-lgreen"style="float:right;">차단</span>';
						}
						if(CU.culist[j].check_join != 'N'){
						outCulist +='<span class="icon" style="background:gold; border:0;">차단됨</span>';
						}
						outCulist +='</div>';
						if(!$("#ccuserlis"+CU.culist[j].chat_no+"t"+CU.culist[j].user_no).length){
						outCCCulist +='<span id="ccuserlis'+CU.culist[j].chat_no+'t'+CU.culist[j].user_no+'">'+CU.culist[j].nickname+',</span>';
						}
						}
					}
					$("#culist"+jsonObj.clist[i].chat_no).html(outCulist);
					$("#ccculist"+jsonObj.clist[i].chat_no).html(outCCCulist);
					
					/*  */
					
					/*  */
				},
				error: function(){
				}
 		});
 		}
 
		for(var i in jsonObj.clist){
/* 메세지 */
			$.ajax({
				url: "cmlist.do",
				type: "get",
				contentType: "application/json; charset=utf-8",
				data: {chat_no: jsonObj.clist[i].chat_no, user_no: ${loginUser.user_no} },
				dataType: "json",
				async: false,
				cache: false,
				success: function(mobj){
					
					var jsonMObj = JSON.parse(JSON.stringify(mobj));
					var outMlist = $("#mlista"+jsonObj.clist[i].chat_no).html();
					
					for(var j in jsonMObj.mlist){
						if(!$("#Umsg"+jsonMObj.mlist[j].message_no).length){
						if(${loginUser.user_no} != jsonMObj.mlist[j].user_no){
						outMlist +="<div id='Umsg"+jsonMObj.mlist[j].message_no+"' class='mb-1 Luser' style='width:100%; text-align:left;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div id='Muser"+jsonMObj.mlist[j].message_no+"' class='mb-1 Lchat' style='width:100%; overflow:auto;'><div class='Lballon'>";
						
							if(jsonMObj.mlist[j].message != ""){outMlist +=jsonMObj.mlist[j].message;}
							else if(jsonMObj.mlist[j].message_image != ""){outMlist +="<img src='files/chat/chatImages/"+jsonMObj.mlist[j].message_image+"' style='width:200px; height: 200px;'>";}
							else if(jsonMObj.mlist[j].renew_filename != ""){outMlist +=jsonMObj.mlist[j].origin_filename+'<a href="files/chat/chatImages/'+jsonMObj.mlist[j].renew_filename+'" download="'+jsonMObj.mlist[j].origin_filename+'"><span class="btn btn-lgreen px-2">다운로드</span></a>';}
							
						outMlist +="</div><span class='ml-1' style='float:left;'>"+jsonMObj.mlist[j].post_time+"</span><span class='ml-1 readc' style='float:left;'>"+jsonMObj.mlist[j].read_count+"+</span></div>";}
						if(${loginUser.user_no} == jsonMObj.mlist[j].user_no){
						outMlist +="<div id='Umsg"+jsonMObj.mlist[j].message_no+"' class='mb-1 Ruser' style='width:100%; text-align:right;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div id='Muser"+jsonMObj.mlist[j].message_no+"' class='mb-1 Rchat' style='width:100%; overflow:auto;'><div class='Rballon'>";
						
						if(jsonMObj.mlist[j].message != ""){outMlist +=jsonMObj.mlist[j].message;}
						else if(jsonMObj.mlist[j].message_image != ""){outMlist +="<img src='files/chat/chatImages/"+jsonMObj.mlist[j].message_image+"' style='width:200px; height: 200px;'>";}
						else if(jsonMObj.mlist[j].renew_filename != ""){outMlist +=jsonMObj.mlist[j].origin_filename+'<a href="files/chat/chatImages/'+jsonMObj.mlist[j].renew_filename+'" download="'+jsonMObj.mlist[j].origin_filename+'"><span class="btn btn-lgreen px-2">다운로드</span></a>';}
						
						outMlist +="</div><span class='mr-1' style='float:right;'>"+jsonMObj.mlist[j].post_time+"<br><span class='mdel' id='mdel"+jsonMObj.mlist[j].message_no+"'>&times;</span></span><span class='ml-1 readc' style='float:right;'>"+jsonMObj.mlist[j].read_count+"+</span></div>";}
						}
					}
					$("#mlista"+jsonObj.clist[i].chat_no).html(outMlist);
				},
				error: function(){
					console.log('dfd');
				}});
/* 끝 */
 

	}
	},
	error: function(){
	console.log('dfdsf');
	}})};
	chatmsgList();

<c:forEach var="m" begin="0" end="1000" step="1" varStatus="status">
		/* 유저목록 슬라이드 */
		$("#userbtn${m}").click(function(){
			$("#userlist${m}").show();
			$("#userlist${m}").animate({width: "300px"}, 300);
		});
		$("#chatback${m}").click(function(){
			$("#userlist${m}").animate({width: "0px"}, 300);
			$("#userlist${m}").hide(150);
		});
		
		/*  */
		$("#cbdel${m}").click(function(){
			$.ajax({
				url: "cbdel.do",
				type: "get",
				data: {block_no: ${m}},
				success:function(result){
					$("#cbdivd${m}").remove();
					$("#cbdel${m}").remove();
				},
				error:function(){
					
				}
					
			});
		});
		
		/* 메세지전송 */
		
		$("#msgbtn${m}").click(function(){
			$.ajax({
			url: "cminsert.do",
			type: "post",
			data: $("#mform${m}").serialize(),
			async: false,
			cache: false,
			success: function(result){
				$("#mtext${m}").val("");
			},
			error: function(request){
				alert("실패");
			}});
		});
		
		$("#cimg${m}").change(function(){
			var form = new FormData($("#imgform${m}")[0]);
			$.ajax({
			url: "cimginsert.do",
			type: "post",
			data: form,
			async: false,
			contentType: false,
			processData: false,
			success: function(result){
				$("#cimg${m}}").val("");
			},
			error: function(a, b ,c){
				alert($("#cimg${m}").val());
				alert(a+ b +c);
			}});
		});
		
		$("#cfile${m}").change(function(){
			var form = new FormData($("#fileform${m}")[0]);
			$.ajax({
			url: "cfileinsert.do",
			type: "post",
			data: form,
			async: false,
			contentType: false,
			processData: false,
			success: function(result){
				$("#cfile${m}}").val("");
			},
			error: function(a, b ,c){
				alert(a+ b +c);
			}});
		});
		
		/* 알람설정 */
		
/* 		if(){function(){
			$.ajax({
			url: "cupdatealert.do",
			type: "post",
			data: $("#mform${m}").serialize(),
			async: false,
			cache: false,
			success: function(malertresult){
			},
			error: function(request){
				alert("실패");
			}});
		}} */
		
		/* 메세지 삭제 */	
		
</c:forEach>

setInterval(function(){chatmsgList();
<c:forEach var="m" begin="0" end="10000" step="1">
/* 메세지목록띄우기 */
 
 
$("#chatdiv${m}").click(function(){
	$(".userlist").hide();
	$(".mlist").hide();
	$("#mlist${m}").fadeIn(300);
});

$("#chatdeld${m}").click(function(){
	$.ajax({
		url: "cdelete.do",
		type: "get",
		data: {user_no: ${loginUser.user_no}, chat_no: ${m}},
		success:function(){
			$("#chatdiv${m}").remove();
		},
		error:function(){
			
		}
	})
});

$('#cbin${m}span').click(function(){
	$.ajax({
		url: "cbinsert.do",
		type: "get",
		data: {user_no: ${loginUser.user_no}, block_user: ${m}},
		success:function(){
			$("#cblist").empty();
			cbList();
		},
		error:function(){
		}
	});
});

$("#mdel${m}").click(function(){
	$.ajax({
	url: "cmdel.do",
	type: "get",
	contentType: "application/json; charset=utf-8",
	data: {message_no: ${m} },
	async: false,
	success: function(mdresult){
		$("#Umsg${m}").remove();
		$("#Muser${m}").remove();
	},
	error: function(request){
		alert("실패");
	}});
});
</c:forEach>
},1500);
});
</script>
<style>
/* div{
border: 1px solid black;
} */
div ::-webkit-scrollbar {
	width: 10px;
}

div ::-webkit-scrollbar-track {
	background-color: rgba(97, 192, 191, 0.1);
}

div ::-webkit-scrollbar-thumb {
	border-radius: 8px;
	background-color: rgba(97, 192, 191, 0.4);
}

.Lballon {
	border-radius: 0px 10px 10px 10px;
	max-width: 300px;
	margin-left: 5%;
	padding: 1%;
	border: 1px solid #eee;
	background: white;
	float: left;
	word-wrap: break-word;
}

.Rballon {
	border-radius: 10px 0px 10px 10px;
	max-width: 300px;
	padding: 1%;
	margin-right: 5%;
	border: 1px solid #eee;
	background: white;
	float: right;
	word-wrap: break-word;
}

.icon {
	font-size: 12px;
	background: rgba(97, 192, 191, 0.4);
	border: 1px solid rgb(187, 227, 218);
	border-radius: 10px;
	color: #555;
	padding: 1%;
	float: right;
	cursor: pointer;
}
.icon:hover {
	opacity:0.8;
}

.icon-room {
	font-size: 20px;
	font-weight: 600;
	margin-left: 5%;
	margin-top: 5%;
}

.chatdiv {
	width: 100%;
	background: white;
	border-radius: 5px;
	padding: 2%;
	border: 1px solid #ddd;
	text-overflow: ellipsis;
	cursor: pointer;
	overflow:hidden;
	white-space: nowrap 
}

.btn-lgreen {
	background: rgba(97, 192, 191, 0.4) !important;
	font-weight: 600 !important;
	font-size: 13px !important;
	border-radius: 10px !important;
	padding: 1% !important;
	cursor: pointer;
}

.btn-lgreen:hover {
	opacity: 0.8;
}

.btn-lgrn {
	background: rgba(97, 192, 191, 0.4) !important;
	font-weight: 600 !important;
	font-size: 16px !important;
	border-radius: 10px !important;
	padding: 3% 6% !important;
	cursor: pointer;
}

#cblock {
	position: absolute;
	top: 0;
	left: 0;
	width: 100%;
	height: 700px;
	z-index: 5;
	background: white;
	display: none;
}

.imgps {
	position: absolute;
	bottom: 1%;
	left: 10px;
	z-index: 2;
}

.fileps {
	position: absolute;
	bottom: 1%;
	left: 35px;
	z-index: 2;
}

.mdel {
	position: relative;
	padding: 1%;
	border-radius: 50%;
	bottom: 5px;
	right: 5px;
	font-size: 15px;
	font-weight: 600;
	cursor: pointer;
	float: right;
}

.mdel:hover {
	background: #eee;
}

.userlist {
	background: white;
	height: 100%;
	width: 0;
	z-index: 5;
	position: absolute;
	right: -0;
	top: 0;
	border-radius: 10px;
	box-shadow: 1px 1px 4px 2px #bbb;
	display: none;
}

.readc {
	color: white;
	background: rgba(97, 192, 191, 0.4);
	padding: 3px;
	border-radius: 50%;
}
.custom-control-label{
cursor:pointer;
}
.btn-gray {
	background: #777 !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
	border-radius: 10px !important;
}

.btn-gray:hover {
	opacity: 0.9 !important;
	color: white !important;
}
</style>
</head>
<body>
 <div class="modal" id="Usersearchmo"><div class="modal-dialog"><div class="modal-content">
        <div class="modal-header"><h4 class="modal-title">유저랑 채팅하기</h4><button type="button" id="usersearchclosebtn" class="close" data-dismiss="modal">&times;</button></div>
        <div class="modal-body"><div id="nicksearchdiv"><input type="search" class="form-control" id="nicksearchinput" placeholder="닉네임검색"></div>
        								<div id="nickresultdiv" style="display:none;"><span id="ninini"></span><span id='nickreturn2' class='btn btn-lgreen' style='float:right'>뒤로가기</span></div></div><input type="hidden" id="resultusernod" name="chat_no">
        <div class="modal-footer border-0"><button type="button" id="nicksearchbtn" class="btn btn-lgreen" style="width:48%;">검색하기</button><button type="button" id="nickreturn" class="btn btn-lgreen" style="width:48%; display:none;">뒤로가기</button><button type="button" id="nickchatin" class="btn btn-lgreen" style="width:48%; display:none;">채팅하기</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
  </div></div></div>

<c:import url="../common/realtyHeader.jsp"/>

<div class="container">
	<div class="row" style="margin:10% 0;">
	
	
<!-- 채팅방목록 -->
	<div class="col-lg-4 col-md-5 col-sm-12" style="height:700px;"><div class="col-12" style="border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);">
<!-- 차단목록 -->
		<div id="cblock">
			<div style="height: 40px; background:rgba(187,222,214,0.7); padding:3%;"> <i class="fas fa-user-times"> 차단유저</i><span class="icon" id="cbtn"><i class="fas fa-comments"> 채팅방</i></span></div>
			<div style="height: 50px; background:rgba(187,222,214,0.7); padding:2%;"><input type="search" id="blocksearch" class="form-control" placeholder="닉네임검색"></div>
			<div id="cblist" style="height: 610px; background: rgba(186,221,213,0.1); overflow:auto; padding: 0 5%;"></div></div>
			
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12 dropdown" style="padding:2%;">
			<span class="icon-room mt-1"><i class="fas fa-comments"></i> 채팅방</span><span class="btn btn-lgreen dropdown-toggle ml-3" data-toggle="dropdown" style="margin-right:0;">방분류</span>
				<div class="dropdown-menu" style="font-size: 15px; padding-left:3%; background:rgba(186,221,213,0.5);">
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="dfdf" value="단체" checked><label class="custom-control-label" for="dfdf" style="width:100%;">단체</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="dfd"value="개인" checked><label class="custom-control-label" for="dfd" style="width:100%;">개인</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="df" value="부동산" checked><label class="custom-control-label" for="df" style="width:100%;">부동산</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="d" value="관리자" checked><label class="custom-control-label" for="d" style="width:100%;">관리자</label></span></div>
			<div class="icon" id="blbtn" style="margin-top:1%;"><i class="fas fa-user-times"> 차단</i></div><div class="icon mr-2 mt-1" style="font-weight:600;" data-toggle="modal" data-target="#Usersearchmo" data-backdrop="false">유저검색</div></div></div>
		<div class="row" style="padding:2%; background:rgba(187,222,214,0.7); height:50px;"><input type="search" id="chatrsearch" class="form-control" placeholder="채팅방, 닉네임검색"></div>
		<div class="row" style="height: 600px; background: rgba(186,221,213,0.1); overflow:auto;"><div id="chatlist" class="col-12">
		</div></div></div></div>
		
		
<!-- 메세지 목록 -->
	<div id="mlistout" class="col-lg-8 col-md-7 col-sm-12" style="height:700px; border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);">
<c:forEach var="mcn" begin="1" end="500" step="1">
<!-- 유저목록 -->
		<div class="userlist" id="userlist${mcn }">
			<div class="col-12" style="padding: 1%; height: 50px; background:rgba(187,222,214,0.7); padding:3%;"><i class="fas fa-users">유저목록</i><span class="icon" id="chatback${mcn }"><i class="fas fa-exchange-alt"></i></span></div>
			<div id="culist${mcn }" class="col-12" style="height: 650px; padding:0 4%; background: rgba(187,222,214,0.1); overflow:auto;"></div></div>
		<div class="mlist" id="mlist${mcn}" style="display:none;">
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12" style="padding: 1%;">채팅내역
			<%-- <span id="bellps${mcn }"><span id="bellon${mcn}"class="icon"><i class="fas fa-bell"></i></span></span> --%>
			<span id="userbtn${mcn }" class="icon mr-2"><i class="fas fa-users">유저목록</i></span></div></div>
	<div class="row" style="height: 550px; padding:1%; background: rgba(187,222,214,0.1); overflow:auto;"><div id="mlista${mcn }" class="col-12" style="overflow:auto;"></div></div>
	<span class="imgps"><form id="imgform${mcn }"><label class="btn btn-lgrn ml-1" for="cimg${mcn }"><i class="far fa-image "></i></label><input type="file" id="cimg${mcn }"  name="message_image" accept="image/*" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }"></form></span>
	<span class="fileps"><form id="fileform${mcn }"><label class="btn btn-lgrn ml-1" for="cfile${mcn }"><i class="fas fa-file-upload"></i></label><input type="file" id="cfile${mcn }" name="orgin_filename" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }"></form></span>
	<form id="mform${mcn }"><div class="row" style="height: 100px; background: rgba(187,222,214,0.1);">
	<div style="width:calc(100% - 80px); padding:1%; height:100%;"><textarea id="mtext${mcn }" class="form-control" name="messages" placeholder="메세지를 입력해주세요" maxlength="150" style="resize:none; height:100%;"></textarea></div>
	<div style="width: 80px; padding-top:1%; text-align:center;"><input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }">
	<input type="button" id="msgbtn${mcn }" class="btn btn-lgrn" value="전송"></div></form></div></div>
</c:forEach>
	</div>
</div>
	

<c:import url="../common/footer.jsp" />
</body>
</html>