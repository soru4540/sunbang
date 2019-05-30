<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript">
$(function(){
	function messageinsert(){
		$.ajax({
			url: "cminsert.do",
			type: "post",
			data: $("#jw_mform").serialize(),
			async: false,
			cache: false,
			success: function(result){
				$("#jw_mtext").val("");
				return result;
			},
			error: function(request){
				alert("실패");
			}});
	}
	
	function imageinsert(){
		var form = new FormData($("#jw_imgform")[0]);
		$.ajax({
		url: "cimginsert.do",
		type: "post",
		data: form,
		async: false,
		contentType: false,
		processData: false,
		success: function(result){
			$("#jw_cimg}").val("");
		},
		error: function(a, b ,c){
			alert($("#jw_cimg").val());
			alert(a+ b +c);
		}});
	}
	
	function fileinsert(){
		var form = new FormData($("#jw_fileform")[0]);
		$.ajax({
		url: "cfileinsert.do",
		type: "post",
		data: form,
		async: false,
		contentType: false,
		processData: false,
		success: function(result){
			$("#jw_cfile}").val("");
		},
		error: function(a, b ,c){
			alert(a+ b +c);
		}});
	}
	
	function checkchat(){
		var reresult;
		
		$.ajax({
			url: "ccheck.do",
			type: "get",
			data: {user_no: ${param.user_no}, realty_no: ${param.realty_no}, chat_type : "부동산"},
			dataType: "text",
			async:false,
			success: function(result){
				reresult = result;
			},
			error: function(){
				console.warn("chatcheck X");
			}
		});
		return reresult;
	}
	
	function insertchat(){
		$.ajax({
			url: "cinsert.do",
			type: "get",
			data: {user_no : ${param.user_no}, two_user_no: ${param.realty_user_no}, realty_no: ${param.realty_no}},
			dataType: "text",
			async: false,
			success: function(result){
			},
			error: function(){
				console.warn("insertchat X");
			}
		});
	}
	
	$("#jw_msgbtn").click(function(){
		var chatno = checkchat();
		if(chatno == "0"){
			insertchat();
			var chatno1=checkchat();
			$("input[name=chat_no]").val(chatno1);
			messageinsert();
		}
		if(chatno != "0"){
		$("input[name=chat_no]").val(chatno);
		messageinsert();
		}
	});
	
	$("#jw_cimg").change(function(){
		var chatno = checkchat();
		if(chatno == "0"){
			insertchat();
			var chatno1=checkchat();
			$("input[name=chat_no]").val(chatno1);
			imageinsert();
		}
		if(chatno != "0"){
		$("input[name=chat_no]").val(chatno);
		imageinsert();
		}
	});
	
	$("#jw_cfile").change(function(){
		var chatno = checkchat();
		if(chatno == "0"){
			insertchat();
			var chatno1=checkchat();
			$("input[name=chat_no]").val(chatno1);
			fileinsert();
		}
		if(chatno != "0"){
		$("input[name=chat_no]").val(chatno);
		fileinsert();
		}
	});
	
	$.ajax({
		url: "ccheck.do",
		type: "get",
		data: {user_no: ${param.user_no}, realty_no: ${param.realty_no}, chat_type : "부동산"},
		dataType: "text",
		success: function(result){
			$("input[name=chat_no]").val(result);
		if(result != 0){
			listmessage();
		}
		},
		error: function(){
			console.warn("chatcheck X");
		}
	});
	
	
	
	function listmessage(){
		$.ajax({
			url: "cmlist.do",
			type: "get",
			contentType: "application/json; charset=utf-8",
			data: {chat_no: $("input[name=chat_no]").val(), user_no: ${loginUser.user_no} },
			dataType: "json",
			async: false,
			cache: false,
			success: function(mobj){
				
				var jsonMObj = JSON.parse(JSON.stringify(mobj));
				var outMlist = $("#jw_mlista").html();
				
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
						}
				}
				$("#jw_mlista").html(outMlist);
			},
			error: function(){
				console.log('dfd');
			}});
	}
	
	setInterval(function(){
		listmessage();
		
		<c:forEach var="m" begin="0" end="10000" step="1" varStatus="status">
		$("#jw_mdel${m}").click(function(){
			$.ajax({
			url: "cmdel.do",
			type: "get",
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
	}, 500);
	
});
</script>
<style>
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
	background-color: #61C0BF !important;
	color: white;
	font-weight: 600 !important;
	font-size: 16px !important;
	border-radius: 10px !important;
	padding: 3% 6% !important;
	cursor: pointer;
}
.btn-lgrn:hover {
	opacity:0.8;
	color: white;
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

#jw_mlistout {
	width: 500px;
	height: 600px;
	border-radius: 10px;
	overflow: hidden;
	background:white;
	border: 1px solid rgba(187, 222, 214, 0.7);
	position: fixed;
	bottom: 50px;
	right:0;
	z-index:3;
	display:none;
}
.readc {
	color: white;
	background: rgba(97, 192, 191, 0.4);
	padding: 3px;
	border-radius: 50%;
}
@media (min-width: 1250px){
#jw_mlistout{
	bottom: 50px;
}
}
@media (max-width: 1200px){
#jw_mlistout{
	bottom: 100px;
}
@media (max-width: 450px){
#jw_mlistout{
	bottom: 150px;
}
}
</style>
</head>
<body>

	<div class="row" ><div class="col-12"><div id="jw_mlistout" class="col-12">
	<div class="row"><div class="col-12" style="text-overflow:ellipsis; overflow:hidden; white-space: nowrap; padding: 1%; height: 50px; background-color: #61C0BF; color:white; padding:3%;">${param.title}</div></div>
	<div class="row" style="height: 450px; padding:1%; background: rgba(187,222,214,0.1); overflow:auto;"><div id="jw_mlista" class="col-12" style="overflow:auto;"></div></div>
	<span class="imgps"><form id="jw_imgform"><label class="btn btn-lgrn ml-1" for="jw_cimg"><i class="far fa-image "></i></label><input type="file" id="jw_cimg"  name="message_image" accept="image/*" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="0"></form></span>
	<span class="fileps"><form id="jw_fileform"><label class="btn btn-lgrn ml-1" for="jw_cfile"><i class="fas fa-file-upload"></i></label><input type="file" id="jw_cfile" name="orgin_filename" style="display: none;">
		<input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="0"></form></span>
	<form id="jw_mform"><div class="row" style="height: 100px; background: rgba(187,222,214,0.1);">
	<div style="width:calc(100% - 80px); padding:1%; height:100%;"><textarea id="jw_mtext" class="form-control" name="messages" placeholder="메세지를 입력해주세요" maxlength="150" style="resize:none; height:100%;"></textarea></div>
	<div style="width: 80px; padding-top:1%; text-align:center;"><input type="hidden" name="user_no" value="${loginUser.user_no}"><input type="hidden" name="chat_no" value="0">
	<input type="button" id="jw_msgbtn" class="btn btn-lgrn" value="전송"></div></form>
</div></div></div>

</body>
</html>