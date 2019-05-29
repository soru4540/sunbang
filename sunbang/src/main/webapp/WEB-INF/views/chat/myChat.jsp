<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
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
	$("#jw_blbtn").click(function(){
		$("#jw_cblock").fadeIn();
	});
	$("#jw_cbtn").click(function(){
		$("#jw_cblock").fadeOut();
	});
	
	$("#jw_blocksearch").on("keyup",function(){
		var value = $(this).val();
		$(".chbdiv").filter(function(){
			$(this).toggle($(this).text().indexOf(value) > -1)
		});
	});
	$("#jw_nickreturn2").click(function(){
		$("#jw_nicksearchdiv").show();
		$("#jw_nickresultdiv").hide();
		$("#jw_nicksearchbtn").show();
		$("#jw_nickchatin").hide();
		$("#jw_nickreturn").hide();
	});
	
	
	$("#jw_nickreturn").click(function(){
		$("#jw_nicksearchdiv").show();
		$("#jw_nickresultdiv").hide();
		$("#jw_nicksearchbtn").show();
		$("#jw_nickchatin").hide();
		$("#jw_nickreturn").hide();
	});
	
	$("#jw_teamchatinbtn").click(function(){
		$.ajax({
			url: "teamchatinsert.do",
			type: "get",
			data: {chat_name : $("#jw_teamchatname").val()},
			success: function(){
				$("#jw_teamchatname").val("");
			},
			error: function(){
				
			}
		})
	});
	
	$("#jw_chatrsearch").on("keyup",function(){
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
	
	$("#jw_nickchatin").click(function(){
		$.ajax({
			url: "cuserchatinsert.do",
			type: "get",
			data: {chat_no: $("#jw_resultusernod").val(), user_no: ${loginUser.user_no}},
			success:function(){
				alert("채팅 연결 성공");
				$("#jw_usersearchclosebtn").trigger("click");
				$("#jw_nicksearchdiv").show();
				$("#jw_nickresultdiv").hide();
				$("#jw_nicksearchbtn").show();
				$("#jw_nickchatin").hide();
				$("#jw_nickreturn").hide();
			},
			error:function(){
				console.warn("cuserchatinsert X");
			}
		});
	});
	
	$("#jw_nicksearchbtn").click(function(){
		$.ajax({
			url: "cselectuser.do",
			type: "get",
			data: {nickname: $("#jw_nicksearchinput").val()},
			dataType: "text",
			success: function(result){
				if(result != 0){
					$("#jw_resultusernod").val(result);
					$("#jw_nicksearchdiv").hide();
					$("#jw_nickresultdiv").show();
					$("#jw_ninini").html("<b>"+$("#jw_nicksearchinput").val()+"</b>닉네임가진 유저가 있습니다 채팅하시겠습니까?");
					$("#jw_nicksearchbtn").hide();
					$("#jw_nickchatin").show();
					$("#jw_nickreturn").hide();
				}else{
					$("#jw_nicksearchdiv").hide();
					$("#jw_nickresultdiv").show();
					$("#jw_ninini").html("<b>"+$("#jw_nicksearchinput").val()+"</b>닉네임가진 유저가 없습니다.");
					$("#jw_nicksearchbtn").hide();
					$("#jw_nickchatin").hide();
					$("#jw_nickreturn").show();
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
		var outCBlock = $("#jw_cblist").html();
		
		for(var i in CB.cblist){
		outCBlock += '<div class="chatdiv chbdiv mt-1" id="jw_cbdivd'+CB.cblist[i].block_no+'" style="cursor:default;">'+CB.cblist[i].nickname+'<span id="jw_cbdel'+CB.cblist[i].block_no+'" class="icon ml-1"><i class="far fa-trash-alt"></i></span><span style="color:#888; float:right;">'+CB.cblist[i].block_time+'</span></div>';
		}
		$("#jw_cblist").html(outCBlock);
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
		var outClist = $("#jw_chatlist").html();
		var outBell = $("#jw_bellps").html();
		
		
		for(var i in jsonObj.clist){
			
			if(!$("#jw_chatdiv"+jsonObj.clist[i].chat_no).length){
				if(${loginUser.user_no} == 0 && jsonObj.clist[i].message_count == 0){
				}else{
			outClist += "<div class='chatdiv crdiv mt-2' id='jw_chatdiv"+jsonObj.clist[i].chat_no+"'>[<span class='chatType'>"+jsonObj.clist[i].chat_type+"</span>]<input type='hidden' id='jw_chattyped"+jsonObj.clist[i].chat_no+"' value='"+jsonObj.clist[i].chat_type+"'><input type='hidden' id='jw_chatnamed"+jsonObj.clist[i].chat_no+"' value='"+jsonObj.clist[i].chat_name +"'>";
			if(jsonObj.clist[i].chat_type == '단체'){
			outClist += jsonObj.clist[i].chat_name +"<span class='ccculist' id='jw_ccculist"+jsonObj.clist[i].chat_no+"' style='display:none;'></span><span class='btn-lgreen mr-2' style='float:right;'>나가기</span></div>";
			}else if(jsonObj.clist[i].chat_type == '관리자'){
				outClist +="<span class='ccculist' id='jw_ccculist"+jsonObj.clist[i].chat_no+"' style=''></span></div>";
			}else{
			outClist +="<span class='ccculist' id='jw_ccculist"+jsonObj.clist[i].chat_no+"' style=''></span><span id='jw_chatdeld"+jsonObj.clist[i].chat_no+"' class='btn-lgreen mr-2' style='float:right;'>나가기</span></div>";	
			}}
			if(jsonObj.clist[i].alert_status == 'Y'){
			outBell = '<span id="jw_bellon${mcn}"class="icon"><i class="fas fa-bell"></i></span>';
			}else{
			outBell = '<span id="jw_belloff${mcn}"class="icon"><i class="fas fa-bell-slash"></i></span>';
			}
			$("#jw_bellps"+jsonObj.clist[i].chat_no).html(outBell);
			}
		}
		$("#jw_chatlist").html(outClist);
		
		
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
					var outCulist = $("#jw_culist"+jsonObj.clist[i].chat_no).html();
					var outCCCulist = $("#jw_ccculist"+jsonObj.clist[i].chat_no).html();
					var redd= 0;
					for(var j in CU.culist){
						if(!$("#jw_c"+CU.culist[j].chat_no+"u"+CU.culist[j].user_no+"div").length){
						outCulist +='<div id="jw_c'+CU.culist[j].chat_no+'u'+CU.culist[j].user_no+'div" class="chatdiv mt-1">'+CU.culist[j].nickname+'';
						if( ${loginUser.user_no} != CU.culist[j].user_no && CU.culist[j].check_join != 'Y'){
							if(CU.culist[j].user_no == 0){
							}else{
						outCulist +='<span id="jw_cbin'+CU.culist[j].user_no+'span" class="btn-lgreen"style="float:right;">차단</span>';		
							}
						}
						if(CU.culist[j].check_join != 'N'){
						outCulist +='<span class="icon" style="background:gold; border:0;">차단됨</span>';
						}
						outCulist +='</div>';
						if(!$("#jw_ccuserlis"+CU.culist[j].chat_no+"t"+CU.culist[j].user_no).length){
							if(redd == 0){
							outCCCulist +='<span id="jw_ccuserlis'+CU.culist[j].chat_no+'t'+CU.culist[j].user_no+'">'+CU.culist[j].nickname+'</span>';
							}else{
							outCCCulist +=',<span id="jw_ccuserlis'+CU.culist[j].chat_no+'t'+CU.culist[j].user_no+'">'+CU.culist[j].nickname+'</span>';		
							}
						}
						redd = redd+1;
						}
					}
					$("#jw_culist"+jsonObj.clist[i].chat_no).html(outCulist);
					$("#jw_ccculist"+jsonObj.clist[i].chat_no).html(outCCCulist);
					
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
					var outMlist = $("#jw_mlista"+jsonObj.clist[i].chat_no).html();
					
					for(var j in jsonMObj.mlist){
						if(!$("#jw_Umsg"+jsonMObj.mlist[j].message_no).length){
						if(${loginUser.user_no} != jsonMObj.mlist[j].user_no){
						outMlist +="<div id='jw_Umsg"+jsonMObj.mlist[j].message_no+"' class='mb-1 Luser' style='width:100%; text-align:left;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div id='jw_Muser"+jsonMObj.mlist[j].message_no+"' class='mb-1 Lchat' style='width:100%; overflow:auto;'><div class='Lballon'>";
						
							if(jsonMObj.mlist[j].message != ""){outMlist +=jsonMObj.mlist[j].message;}
							else if(jsonMObj.mlist[j].message_image != ""){outMlist +="<img src='files/chat/chatImages/"+jsonMObj.mlist[j].message_image+"' style='width:200px; height: 200px;'>";}
							else if(jsonMObj.mlist[j].renew_filename != ""){outMlist +=jsonMObj.mlist[j].origin_filename+'<a href="files/chat/chatImages/'+jsonMObj.mlist[j].renew_filename+'" download="'+jsonMObj.mlist[j].origin_filename+'"><span class="btn btn-lgreen px-2">다운로드</span></a>';}
							
						outMlist +="</div><span class='ml-1' style='float:left;'>"+jsonMObj.mlist[j].post_time+"</span><span class='ml-1 readc' style='float:left;'>"+jsonMObj.mlist[j].read_count+"+</span></div>";}
						if(${loginUser.user_no} == jsonMObj.mlist[j].user_no){
						outMlist +="<div id='jw_Umsg"+jsonMObj.mlist[j].message_no+"' class='mb-1 Ruser' style='width:100%; text-align:right;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div id='jw_Muser"+jsonMObj.mlist[j].message_no+"' class='mb-1 Rchat' style='width:100%; overflow:auto;'><div class='Rballon'>";
						
						if(jsonMObj.mlist[j].message != ""){outMlist +=jsonMObj.mlist[j].message;}
						else if(jsonMObj.mlist[j].message_image != ""){outMlist +="<img src='files/chat/chatImages/"+jsonMObj.mlist[j].message_image+"' style='width:200px; height: 200px;'>";}
						else if(jsonMObj.mlist[j].renew_filename != ""){outMlist +=jsonMObj.mlist[j].origin_filename+'<a href="files/chat/chatImages/'+jsonMObj.mlist[j].renew_filename+'" download="'+jsonMObj.mlist[j].origin_filename+'"><span class="btn btn-lgreen px-2">다운로드</span></a>';}
						
						outMlist +="</div><span class='mr-1' style='float:right;'>"+jsonMObj.mlist[j].post_time+"<br><span class='mdel' id='jw_mdel"+jsonMObj.mlist[j].message_no+"'>&times;</span></span><span class='ml-1 readc' style='float:right;'>"+jsonMObj.mlist[j].read_count+"+</span></div>";}
						$("#jw_mlista"+jsonObj.clist[i].chat_no).html(outMlist);
						$("#jw_scroll"+jsonObj.clist[i].chat_no).scrollTop($("#jw_mlista"+jsonObj.clist[i].chat_no).height());
						}
					}
					
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
		$("#jw_userbtn${m}").click(function(){
			$("#jw_userlist${m}").show();
			$("#jw_userlist${m}").animate({width: "300px"}, 300);
		});
		$("#jw_chatback${m}").click(function(){
			$("#jw_userlist${m}").animate({width: "0px"}, 300);
			$("#jw_userlist${m}").hide(150);
		});
		
		
		/*  */
		
		/* 메세지전송 */
		
		$("#jw_msgbtn${m}").click(function(){
			if($("#jw_mtext${m}").val() != ""){
			$.ajax({
			url: "cminsert.do",
			type: "post",
			data: $("#jw_mform${m}").serialize(),
			async: false,
			cache: false,
			success: function(result){
				$("#jw_mtext${m}").val("");
			},
			error: function(request){
				alert("실패");
			}});
			}else{
				alert("빈값 못보냄");
			}
		});
		
		$("#jw_cimg${m}").change(function(){
			var form = new FormData($("#jw_imgform${m}")[0]);
			$.ajax({
			url: "cimginsert.do",
			type: "post",
			data: form,
			async: false,
			contentType: false,
			processData: false,
			success: function(result){
				$("#jw_cimg${m}}").val("");
			},
			error: function(a, b ,c){
				alert($("#jw_cimg${m}").val());
				alert(a+ b +c);
			}});
		});
		
		$("#jw_cfile${m}").change(function(){
			var form = new FormData($("#jw_fileform${m}")[0]);
			$.ajax({
			url: "cfileinsert.do",
			type: "post",
			data: form,
			async: false,
			contentType: false,
			processData: false,
			success: function(result){
				$("#jw_cfile${m}}").val("");
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
			data: $("#jw_mform${m}").serialize(),
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
 
 
$("#jw_chatdiv${m}").click(function(event){
	
	if($("#jw_chattyped${m}").val() == "단체"){
			$.ajax({
				url: "chatchatcheck.do",
				type: "get",
				async: false,
				data: {user_no : ${loginUser.user_no}, chat_no: ${m}, chat_name: $("#jw_chatnamed${m}").val()},
				dataType: "text",
				success:function(){
				},
				error:function(){
				}
			});
	}
	$(".userlist").hide();
	$(".mlist").hide();
	$("#jw_mlist${m}").fadeIn(300);
});

$("#jw_cbdel${m}").click(function(){
	$.ajax({
		url: "cbdel.do",
		type: "get",
		data: {block_no: ${m}},
		success:function(result){
			$("#jw_cbdivd${m}").remove();
			$("#jw_cbdel${m}").remove();
			$(".jw_culist").empty();
			chatmsgList();
		},
		error:function(){
			
		}
			
	});
});

$("#jw_chatdeld${m}").click(function(event){
	event.stopPropagation();
	$.ajax({
		url: "cdelete.do",
		type: "get",
		async: false,
		data: {user_no: ${loginUser.user_no}, chat_no: ${m}},
		success:function(){
			$("#jw_chatdiv${m}").remove();
		},
		error:function(){
			
		}
	});
});

$('#jw_cbin${m}span').click(function(){
	$.ajax({
		url: "cbinsert.do",
		type: "get",
		async: false,
		data: {user_no: ${loginUser.user_no}, block_user: ${m}},
		success:function(){
			$("#jw_cblist").empty();
			cbList();
			$(".jw_culist").empty();
			chatmsgList();
		},
		error:function(){
		}
	});
});

$("#jw_mdel${m}").click(function(){
	$.ajax({
	url: "cmdel.do",
	type: "get",
	async: false,
	contentType: "application/json; charset=utf-8",
	data: {message_no: ${m} },
	async: false,
	success: function(mdresult){
		$("#jw_Umsg${m}").remove();
		$("#jw_Muser${m}").remove();
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

#jw_cblock {
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
<c:import url="../common/realtyHeader.jsp"/>

<div class="modal" id="jw_teamchatin"><div class="modal-dialog"><div class="modal-content">
	<div class="modal-header"><h4 class="modal-title">단체 채팅방 만들기</h4><button type="button" id="" class="close" data-dismiss="modal">&times;</button></div>
        <div class="modal-body"><input type="text" id="jw_teamchatname" class="form-control" placeholder="채팅방제목"></div>
        <div class="modal-footer border-0"><button type="button" id="jw_teamchatinbtn" class="btn btn-lgreen" style="width:48%;">등록</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
</div></div></div>

 <div class="modal" id="jw_Usersearchmo"><div class="modal-dialog"><div class="modal-content">
        <div class="modal-header"><h4 class="modal-title">유저랑 채팅하기</h4><button type="button" id="jw_usersearchclosebtn" class="close" data-dismiss="modal">&times;</button></div>
        <div class="modal-body"><div id="jw_nicksearchdiv"><input type="search" class="form-control" id="jw_nicksearchinput" placeholder="닉네임검색"></div>
        								<div id="jw_nickresultdiv" style="display:none;"><span id="jw_ninini"></span><span id='jw_nickreturn2' class='btn btn-lgreen' style='float:right'>뒤로가기</span></div></div><input type="hidden" id="jw_resultusernod" name="chat_no">
        <div class="modal-footer border-0"><button type="button" id="jw_nicksearchbtn" class="btn btn-lgreen" style="width:48%;">검색하기</button><button type="button" id="jw_nickreturn" class="btn btn-lgreen" style="width:48%; display:none;">뒤로가기</button><button type="button" id="jw_nickchatin" class="btn btn-lgreen" style="width:48%; display:none;">채팅하기</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></div>
  </div></div></div>

<div class="container">
	<div class="row" style="margin:10% 0;">
	
	
<!-- 채팅방목록 -->
	<div class="col-lg-4 col-md-5 col-sm-12" style="height:700px;"><div class="col-12" style="border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);"><c:if test="${loginUser.user_no == 0 }"><span class="icon"  data-toggle="modal" data-target="#jw_teamchatin" data-backdrop="false" style="position:absolute; z-index:5; top:35px; left:30px; font-weight:600;">단체방만들기</span></c:if>
<!-- 차단목록 -->
		<div id="jw_cblock">
			<div style="height: 40px; background:rgba(187,222,214,0.7); padding:3%;"> <i class="fas fa-user-times"> 차단유저</i><span class="icon" id="jw_cbtn"><i class="fas fa-comments"> 채팅방</i></span></div>
			<div style="height: 50px; background:rgba(187,222,214,0.7); padding:2%;"><input type="search" id="jw_blocksearch" class="form-control" placeholder="닉네임검색"></div>
			<div id="jw_cblist" style="height: 610px; background: rgba(186,221,213,0.1); overflow:auto; padding: 0 5%;"></div></div>
			
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12 dropdown" style="padding:2%;">
			<span class="icon-room mt-1"><i class="fas fa-comments"></i> 채팅방</span><span class="btn btn-lgreen dropdown-toggle ml-3" data-toggle="dropdown" style="margin-right:0;">방분류</span>
				<div class="dropdown-menu" style="font-size: 15px; padding-left:3%; background:rgba(186,221,213,0.5);">
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="jw_dfdf" value="단체" checked><label class="custom-control-label" for="jw_dfdf" style="width:100%;">단체</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="jw_dfd"value="개인" checked><label class="custom-control-label" for="jw_dfd" style="width:100%;">개인</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="jw_df" value="부동산" checked><label class="custom-control-label" for="jw_df" style="width:100%;">부동산</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" name="chatfilter" class="custom-control-input" id="jw_d" value="관리자" checked><label class="custom-control-label" for="jw_d" style="width:100%;">관리자</label></span></div>
			<div class="icon" id="jw_blbtn" style="margin-top:1%;"><i class="fas fa-user-times"> 차단</i></div><div class="icon mr-2 mt-1" style="font-weight:600;" data-toggle="modal" data-target="#jw_Usersearchmo" data-backdrop="false">유저검색</div></div></div>
		<div class="row" style="padding:2%; background:rgba(187,222,214,0.7); height:50px;"><input type="search" id="jw_chatrsearch" class="form-control" placeholder="채팅방, 닉네임검색"></div>
		<div class="row" style="height: 600px; background: rgba(186,221,213,0.1); overflow:auto;"><div id="jw_chatlist" class="col-12">
		</div></div></div></div>
		
		
<!-- 메세지 목록 -->
	<div id="jw_mlistout" class="col-lg-8 col-md-7 col-sm-12" style="height:700px; border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);">
<c:forEach var="mcn" begin="1" end="500" step="1">
<!-- 유저목록 -->
		<div class="userlist" id="jw_userlist${mcn }">
			<div class="col-12" style="padding: 1%; height: 50px; background:rgba(187,222,214,0.7); padding:3%;"><i class="fas fa-users">유저목록</i><span class="icon" id="jw_chatback${mcn }"><i class="fas fa-exchange-alt"></i></span></div>
			<div class="jw_culist"id="jw_culist${mcn }" class="col-12" style="height: 650px; padding:0 4%; background: rgba(187,222,214,0.1); overflow:auto;"></div></div>
		<div class="mlist" id="jw_mlist${mcn}" style="display:none;">
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12" style="padding: 1%;">채팅내역
			<%-- <span id="jw_bellps${mcn }"><span id="jw_bellon${mcn}"class="icon"><i class="fas fa-bell"></i></span></span> --%>
			<span id="jw_userbtn${mcn }" class="icon mr-2"><i class="fas fa-users">유저목록</i></span></div></div>
	<div id="jw_scroll${mcn }" class="row" style="height: 550px; padding:1%; background: rgba(187,222,214,0.1); overflow:auto;"><div id="jw_mlista${mcn }" class="col-12" style="overflow:auto;"></div></div>
	<span class="imgps"><form id="jw_imgform${mcn }"><label class="btn btn-lgrn ml-1" for="jw_cimg${mcn }"><i class="far fa-image "></i></label><input type="file" id="jw_cimg${mcn }"  name="message_image" accept="image/*" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }"></form></span>
	<span class="fileps"><form id="jw_fileform${mcn }"><label class="btn btn-lgrn ml-1" for="jw_cfile${mcn }"><i class="fas fa-file-upload"></i></label><input type="file" id="jw_cfile${mcn }" name="orgin_filename" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }"></form></span>
	<form id="jw_mform${mcn }"><div class="row" style="height: 100px; background: rgba(187,222,214,0.1);">
	<div style="width:calc(100% - 80px); padding:1%; height:100%;"><textarea id="jw_mtext${mcn }" class="form-control" name="messages" placeholder="메세지를 입력해주세요" maxlength="150" style="resize:none; height:100%;"></textarea></div>
	<div style="width: 80px; padding-top:1%; text-align:center;"><input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="${mcn }">
	<input type="button" id="jw_msgbtn${mcn }" class="btn btn-lgrn" value="전송"></div></form></div></div>
</c:forEach>
	</div></div>
</div>
	
<c:import url="../common/footer.jsp" />
</body>
</html>