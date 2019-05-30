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
<script type="text/javascript">
$(function(){
	
	<c:forEach var="realty" items="${urealty }">
	$("#jw_deldib${realty.dibs_no}").click(function(){
		var result = confirm("찜하기 취소하시겠습니까?");
		if(result != ""){
		$.ajax({
			url: "udeldibs.do",
			type: "get",
			data: {dibs_no : ${realty.dibs_no} },
			success:function(){
				$("#jw_dibsdiv${realty.dibs_no }").remove();
			},
			error: function(){
				alert("실패");
			}
		});
		}
	});
	
	$("#jw_memobtn${realty.dibs_no}").click(function(){
		$.ajax({
			url: "udibsmemo.do",
			type: "post",
			data: $("#jw_memoform${realty.dibs_no}").serialize(),
			success: function(response){
				$("#jw_ale${realty.dibs_no }").fadeIn();
				setTimeout(function(){
					$("#jw_ale${realty.dibs_no }").fadeOut();
				}, 1000);
			},
			error: function(){
				alert("실패");
			}
		});
	});
	
	</c:forEach>
});
</script>
<style>
/* .card:hover {
  animation: shake 0.2s;
  animation-iteration-count: 1;
}

@keyframes shake {
  0% { transform: translate(1px, 1px) rotate(0deg); }
  20% { transform: translate(-3px, 0px) rotate(1deg); }
  40% { transform: translate(1px, -1px) rotate(1deg); }
  60% { transform: translate(-3px, 1px) rotate(0deg); }
  80% { transform: translate(-1px, -1px) rotate(1deg); }
  100% { transform: translate(1px, -2px) rotate(-1deg); }
} */
card{
overflow:hidden !important;
}
.card-img-top{
overflow:hidden !important;
position:relative !important;
border-radius: 10px !important;
}
.card:hover .card-img-top img{
	transform : scale(1.2) !important;
	transition: 0.3s !important;
}
.img-overlay{
z-index:1 !important;
position:absolute !important;
width:100% !important;
height:100% !important;
opacity:1 !important;
}
.check{
  position: absolute !important;
  bottom: 1% !important;
  left:2% !important;
  padding: 1% 2% !important;
  font-size: 13px !important;
  border-radius:8px !important;
 	background:rgba(97, 192, 191, 0.8) !important;
  color:white !important;
  font-weight:bold !important;
}
.checktopout{
  font-size: 30px !important;
  font-weight:bold !important;
}
.checktop{
  padding: 1% 2% !important;
  border-radius:8px !important;
 background:rgba(97, 192, 191, 0.8) !important;
  color:white !important;
  font-weight:bold !important;
}
.card-body b{
 font-size:15px !important;
 color:black !important;
}
.fa-calendar-check{
  position: absolute !important;
  top: 1% !important;
  left:1% !important;
  padding: 2% !important;
  background: rgba(75, 188, 244, 0.8) !important;
  border-radius:7px !important;
  color:white !important;
  font-size:14px !important;
}
.fa-clipboard{
  position: absolute !important;
  bottom: 1% !important;
  right:1% !important;
  padding: 2% !important;
  background: rgba(250, 227, 217, 0.7) !important;
  border-radius:7px !important;
  color:black !important;
  font-size:14px !important;
  cursor:pointer !important;
}
.card-body{
padding:1% !important;
text-align:left !important;
font-size:13px !important;
color:#777 !important;
}
.btn-lgreen {
	background: #61C0BF !important;
	color: white !important;
	font-size: 12px !important;
	font-weight: 600 !important;
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
}
.btn-gray:hover {
	opacity: 0.9 !important;
	color: white !important;
}
.ddddel{
  position: absolute ;
  top: 1%;
  right:1% ;
  padding: 0% 2%;
  background: #ddd;
  font-size: 18px;
  font-weight:600;
  cursor:pointer;
  border-radius:7px;
}
.ddddel:hover{
opacity: 0.8;
}
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>
<c:forEach var="realty" items="${urealty }">
 <div class="modal fade" id="jw_myModal${realty.dibs_no }"><div class="modal-dialog"><div class="modal-content"><form id="jw_memoform${realty.dibs_no }">
        <div class="modal-header border-0""><h5 class="modal-title">메모</h5><button type="button" class="close" data-dismiss="modal">×</button></div>
        <div class="modal-body"><textarea class="form-control" name="memo" placeholder="메모하기" rows="5" style="resize:none;">${realty.memo }</textarea><input type="hidden" name="dibs_no" value="${realty.dibs_no }"></div>
        <div class="modal-footer border-0"><button type="button" id="jw_memobtn${realty.dibs_no }" class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></button></div></form>
</div><div id="jw_ale${realty.dibs_no }" class="alert alert-success mt-5" style="display:none;"><strong>메모 등록!</strong> 메모내용등록하셨습니다</div></div></div>
</c:forEach>

<div class="container" style="min-height:900px;">
	<div class="row" style="margin-top:10%; padding-bottom:10%;">
	<div class="col-12"><span class="checktopout"><span class="checktop">찜</span> 찜목록</span></div>
	<c:if test="${empty urealty}">
	<div class="col-12" style="text-align:center; font-size: 30px; color: #61C0BF ; font-weight: 800; padding:15% 0;"><hr>찜목록이 없습니다.<hr></div>
	</c:if>
	<c:forEach var="realty" items="${urealty }">
	<div id="jw_dibsdiv${realty.dibs_no }" class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check" > <b>입주가능일 <c:if test="${realty.move_available_date eq '0'}">즉시입주</c:if> <c:if test="${realty.move_available_date eq '1'}">날짜협의</c:if> </b></i><i class="far fa-clipboard" data-toggle="modal" data-target="#jw_myModal${realty.dibs_no }"> <b>메모</b></i><span class="check"><i class="far fa-eye"> <b>${realty.realty_hits }</b></i> 찜 (${realty.dibs_count })</span><span class="ddddel" id="jw_deldib${realty.dibs_no }" >&times;</span></div><img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realty.realty_image1}" style="width:100%; height:auto;"></div>
		<a href="rdetail.do?realty_no=${realty.realty_no }" style="text-decoration:none; color:#777;"><div class="card-body" style="text-align:left;">${realty. realty_type}<br><b>${realty.realty_detail_title }</b><br><c:if test="${!empty realty.user_profile }"><img src="files/user/userImages/${realty.user_profile }" class="rounded-circle" style="width:20px; height:20px;"></c:if>${realty.nickname }</a></div></div></div>
	</c:forEach>
	</div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>