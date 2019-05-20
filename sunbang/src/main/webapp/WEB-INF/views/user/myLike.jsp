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
<script type="text/javascript">
$(function(){
	<c:forEach var="c" items="${uboard}">
	$("#likedel${c.like_no}").click(function(){
		$.ajax({
			url: "udellike.do",
			type: "get",
			data: {like_no : ${c.like_no} },
			success: function(response){
				$("#likediv${c.like_no}").remove();
			},
			error:function(){
				alert("실패");
			}
		});
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
.card:hover img{
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
  padding: 2% !important;
  background:rgba(255, 182, 185, 0.8) !important;
  border-radius:7px !important;
  color:white !important;
  font-size:14px !important;
  cursor:pointer;
}
.fh:hover{
font-weight:bold !important;
}
.ffe{
  position: absolute !important;
  bottom: 0 !important;
  left:0 !important;
  padding: 3% !important;
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
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

<div class="container">
	<div class="row" style="margin-top:10%; padding-bottom:10%;">
	<div class="col-12"><i class="fas fa-heart fhh"></i> <b class="hearttop">좋아요목록</b></div>
	<c:forEach var="board" items="${uboard}">
	<div id="likediv${board.like_no}" class="col-6 col-md-4 col-lg-3 mt-5"><div class="card ca border-0"><div class="card-img-top cit"><div class="img-overlay"><i class="far fa-eye ffe"> <b>${board.board_hits }</b></i><i class="far fa-heart fh" id="likedel${board.like_no }"> <b>${board.like_count }</b></i></div><img src="${pageContext.request.contextPath }/files/interior/interiorMain/${board.post_data }" style="width:100%; height: 200px;"></div>
		<div class="card-body cd" style="text-align:left;"><b style="color:red;">${board.board_type }</b>
		<br><b>${board.board_title }</b><br><c:if test="${!empty board.user_profile }"><img src="${pageContext.request.contextPath }/files/user/userImages/${board.user_profile }" class="rounded-circle" style="width:30px; height:30px;"></c:if>${board.nickname}</div></div></div>
	</c:forEach>
	</div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>