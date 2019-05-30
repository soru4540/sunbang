<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function(){
	<c:forEach var="c" items="${uboard}">
	$("#jw_likedel${c.like_no}").click(function(){
		var result = confirm("좋아요 취소하시겠습니까?");
		if(result != ""){
		$.ajax({
			url: "udellike.do",
			type: "get",
			data: {like_no : ${c.like_no} },
			success: function(response){
				$("#jw_likediv${c.like_no}").remove();
			},
			error:function(){
				alert("실패");
			}
		});
		}
		
	});
	</c:forEach>
});
</script>
<style>
card{
overflow:hidden !important;
}
.cit{
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
.fh{
  position: absolute !important;
  bottom: 2% !important;
  right:2% !important;
  padding: 1% !important;
  background:rgba(255, 182, 185, 0.8) !important;
  border-radius:7px !important;
  color:white !important;
  font-size:14px !important;
}

.cd{
 font-size:14px !important;
}
.cd b{
 font-size:18px !important;
}
.fhh{
padding: 1% !important;
 background:rgba(255, 182, 185, 0.8) !important;
  border-radius:7px !important;
  color:white !important;
  font-size:40px !important;
}
.hearttop{
 color:black !important;
  font-size:36px !important;
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
<c:import url="../common/interiorHeader.jsp"/>

<div class="container" style="min-height:900px;">
	<div class="row" style="margin-top:10%; padding-bottom:10%;">
	<div class="col-12"><i class="fas fa-heart fhh"></i> <b class="hearttop">좋아요목록</b></div>
	<c:if test="${empty uboard}">
	<div class="col-12" style="text-align:center; font-size: 30px; color: rgba(255, 182, 185, 0.8) ; font-weight: 800; padding:15% 0;"><hr>좋아요목록이 없습니다.<hr></div>
	</c:if>
	<c:forEach var="board" items="${uboard}">
	<div id="jw_likediv${board.like_no}" class="col-6 col-md-4 col-lg-3 mt-5"><div class="card ca border-0"><div class="card-img-top cit"><div class="img-overlay"><span class="fh"><i class="far fa-eye"> <b>${board.board_hits }</b></i> <i class="far fa-heart"> <b>${board.like_count }</b></i></span><span class="ddddel" id="jw_likedel${board.like_no }">&times;</span></div><img src="${pageContext.request.contextPath }/files/interior/interiorMain/${board.post_data }" style="width:100%; height: 200px;"></div>
		<a href="ibselect.do?board_no=${board.board_no }&board_type=${board.board_type}" style="text-decoration:none; color:#333;"><div class="card-body cd" style="text-align:left;"><b style="color:red;">${board.board_type }</b>
		<br><b>${board.board_title }</b><br><c:if test="${!empty board.user_profile }"><img src="files/user/userImages/${board.user_profile }" class="rounded-circle" style="width:20px; height:20px;"></c:if>${board.nickname}</div></a></div></div>
	</c:forEach>
	</div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>