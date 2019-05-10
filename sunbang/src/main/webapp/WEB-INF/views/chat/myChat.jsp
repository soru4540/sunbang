<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
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
	var outMlist = $("#mlistout").html(); 
	for(var mcount= 1; mcount < 95; mcount++){
		outMlist += "<div class='mlist' id='mlist"+mcount+"' style='display:none;'></div>";
	};
	$("#mlistout").html(outMlist);
	
setTimeout(
	$.ajax({
	url: "cmyfilter.do",
	type: "get",
	contentType: "application/json; charset=utf-8",
	data: {userno: ${loginUser.user_no} },
	dataType: "json",
	async: false,
	success: function(obj){
		$("#chatlist").empty();
		$(".mlist").empty();
		var jsonObj = JSON.parse(JSON.stringify(obj));
		var outClist = $("#chatlist").html();
		var outClist2 = $("#mlist").html();
				
		for(var i in jsonObj.clist){
			outClist += "<div class='chatdiv mt-1' id='chatdiv"+jsonObj.clist[i].chat_no+"'>"+ jsonObj.clist[i].chat_name +"</div>";
			
			outClist2 = "<div class='row' style='height: 50px; background:rgba(187,222,214,0.7);'><div class='col-12' style='padding: 1%;'>"+jsonObj.clist[i].chat_no+"방제목"+
			"<span class='icon'><i class='fas fa-bell'></i></span>"+
			"<span class='icon mr-2'><i class='fas fa-users'>유저목록</i></span></div></div>"+
	"<div class='row' style='height: 520px; padding:1%; background: rgba(187,222,214,0.1);'><div id='mlista"+jsonObj.clist[i].chat_no+"' class='col-12' style='overflow:auto;'></div></div>"+
	"<div class='row' style='height: 130px; background: rgba(187,222,214,0.1);'>"+
	"<div style='width:calc(100% - 80px); padding:1%; '><form a><textarea class='form-control' style='resize:none; height:100%;'></textarea></div>"+
	"<div style='width: 80px; padding-top:1%; '>"+
		"<div align='center'><input type='button' class='btn btn-lgrn' value='전송'></form></div>"+
		"<div class='mt-4'><label class='btn btn-lgrn ml-1' for='cimg'><i class='far fa-image '></i></label><input type='file' id='cimg' accept='image/*' style='display: none;'>"+
		"<label class='btn btn-lgrn ml-1' for='cfile'><i class='fas fa-file-upload'></i></label><input type='file' id='cfile' style='display: none;'></div></div></div>";
		
			$("#mlist"+jsonObj.clist[i].chat_no).html(outClist2);
			
		}
		$("#chatlist").html(outClist);
		
		
		
/* 끝 */
		for(var i in jsonObj.clist){
/* 메세지 */
			$.ajax({
				url: "cmlist.do",
				type: "get",
				contentType: "application/json; charset=utf-8",
				data: {chatno: jsonObj.clist[i].chat_no },
				dataType: "json",
				async: false,
				success: function(mobj){
					$("#mlista"+jsonObj.clist[i].chat_no).empty();
					var jsonMObj = JSON.parse(JSON.stringify(mobj));
					var outMlist = $("#mlista"+jsonObj.clist[i].chat_no).html();
					
					for(var j in jsonMObj.mlist){
						if(${loginUser.user_no} != jsonMObj.mlist[j].user_no){
						outMlist +="<div class='mb-1 Luser' style='width:100%; text-align:left;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div class='mb-1 Lchat' style='width:100%; overflow:auto;'><div class='Lballon'>"+jsonMObj.mlist[j].message+"</div><span class='ml-1' style='float:left;'>"+jsonMObj.mlist[j].post_time+"</span></div>";}
						if(${loginUser.user_no} == jsonMObj.mlist[j].user_no){
						outMlist +="<div class='mb-1 Ruser' style='width:100%; text-align:right;'>"+jsonMObj.mlist[j].nickname+"</div>"+
						"<div class='mb-1 Rchat' style='width:100%; overflow:auto;'><div class='Rballon'>"+jsonMObj.mlist[j].message+"</div><span class='mr-1' style='float:right;'>"+jsonMObj.mlist[j].post_time+"</span></div>";}
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
	}}), 4000);
	
/* 메세지목록띄우기 */
<c:forEach var="mcnt" begin="0" end="100" step="1">
$("#chatdiv${mcnt}").click(function(){
	$(".mlist").css("display", "none");
	$("#mlist${mcnt}").fadeIn();
});
</c:forEach>
});
</script>
<style>
/* div{
border: 1px solid black;
} */
.Lballon {
	border-radius: 0px 10px 10px 10px;
	width: 300px;
	margin-left: 20px;
	padding: 1%;
	border: 1px solid #eee;
	background: white;
	float: left;
	word-wrap: break-word;
}

.Rballon {
	border-radius: 10px 0px 10px 10px;
	width: 300px;
	padding: 1%;
	margin-right: 20px;
	border: 1px solid #eee;
	background: white;
	float: right;
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
	cursor:pointer;
}

.btn-lgreen {
	background: rgba(97, 192, 191, 0.4) !important;
	font-weight: 600 !important;
	font-size: 13px !important;
	border-radius: 10px !important;
	padding: 1% !important;
	cursor:pointer;
}

.btn-lgrn {
	background: rgba(97, 192, 191, 0.4) !important;
	font-weight: 600 !important;
	font-size: 16px !important;
	border-radius: 10px !important;
	padding: 3% 6% !important;
	cursor:pointer;
}

#cblock {
	position: absolute;
	top: 0;
	left: 0;
	width:100%;
	height: 700px;
	z-index: 5;
	background: white;
	display:none;
}
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<div class="container">
	<div class="row" style="margin:10% 0;">
	
	
<!-- 채팅방목록 -->
	<div class="col-lg-4 col-md-5 col-sm-12" style="height:700px;"><div class="col-12" style="border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);">
		<div id="cblock">
			<div style="height: 40px; background:rgba(187,222,214,0.7); padding:3%;"> <i class="fas fa-user-times"> 차단유저</i><span class="icon" id="cbtn"><i class="fas fa-comments"> 채팅방</i></span></div>
			<div style="height: 50px; background:rgba(187,222,214,0.7); padding:2%;"><input type="search" class="form-control" placeholder="닉네임검색"></div>
			<div style="height: 610px; background: rgba(186,221,213,0.1); overflow:auto; padding: 0 2%;"><div class="chatlist mt-2">차단유저</div></div></div>
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12 dropdown" style="padding:2%;">
			<span class="icon-room mt-1"><i class="fas fa-comments"></i> 채팅방</span><span class="btn btn-lgreen dropdown-toggle ml-3" data-toggle="dropdown" style="margin-right:0;">방분류</span>
				<div class="dropdown-menu" style="font-size: 15px; padding-left:3%; background:rgba(186,221,213,0.5);">
					<div class="dropdown-item-text custom-checkbox"><input type="checkbox" class="custom-control-input" id="dfdf" checked><label class="custom-control-label" for="dfdf" style="width:100%;">단체</label></div>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" class="custom-control-input" id="dfd" checked><label class="custom-control-label" for="dfd" style="width:100%;">개인</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" class="custom-control-input" id="df" checked><label class="custom-control-label" for="df" style="width:100%;">부동산</label></span>
					<span class="dropdown-item-text custom-checkbox"><input type="checkbox" class="custom-control-input" id="d" checked><label class="custom-control-label" for="d" style="width:100%;">관리자</label></span></div>
			<div class="icon" id="blbtn" style="margin-top:1%;"><i class="fas fa-user-times"> 차단</i></div></div></div>
		<div class="row" style="padding:2%; background:rgba(187,222,214,0.7); height:50px;"><input type="search" class="form-control" placeholder="채팅방, 닉네임검색"></div>
		<div class="row" style="height: 600px; background: rgba(186,221,213,0.1); overflow:auto;"><div id="chatlist" class="col-12">
		</div></div></div></div>
		
		
<!-- 메세지 목록 -->		
	<div id="mlistout" class="col-lg-8 col-md-7 col-sm-12" style="height:700px; border-radius: 10px; overflow:hidden; border: 1px solid rgba(187,222,214,0.7);"><!-- <div id="mlist">
		<div class="row" style="height: 50px; background:rgba(187,222,214,0.7);"><div class="col-12" style="padding: 1%;">방제목
				<span class="icon"><i class="fas fa-bell"></i></span> 
				<span class="icon mr-2"><i class="fas fa-users"> 유저목록</i></span></div></div>
		<div class="row" style="height: 520px; padding:1%; background: rgba(187,222,214,0.1);"><div class="col-12" style="overflow:auto;">
			<div class="mb-1" id="Luser" style="width:100%; text-align:left;">보낸이</div>
			<div class="mb-1" id="Lchat" style="width:100%; overflow:auto;"><div id="Lmsg" class="Lballon">내용</div><span class="ml-1" style="float:left;">시간</span></div>
			<div class="mb-1" id="Ruser" style="width:100%; text-align:right;">받는이</div>
			<div class="mb-1" id="Rchat" style="width:100%; overflow:auto;"><div id="Rmsg" class="Rballon">내용2</div><span class="mr-1" style="float:right;">시간</span></div></div></div>
		<div class="row" style="height: 130px; background: rgba(187,222,214,0.1);">
			<div style="width:calc(100% - 80px); padding:1%; "><textarea class="form-control" style="resize:none; height:100%;"></textarea></div>
			<div style="width: 80px; padding-top:1%;">
				<div align="center"><input type="button" class="btn btn-lgrn" value="전송"></div>
				<div class="mt-4"><label class="btn btn-lgrn ml-1" for="cimg"><i class="far fa-image "></i></label><input type="file" id="cimg" accept="image/*" style="display: none;">
				<label class="btn btn-lgrn ml-1" for="cfile"><i class="fas fa-file-upload"></i></label><input type="file" id="cfile" style="display: none;"></div></div></div></div> --><div id="mnone" style="width:100%; height:100%; display:none;">빈방</div></div>
	</div>
</div>


<c:import url="../common/footer.jsp" />
</body>
</html>