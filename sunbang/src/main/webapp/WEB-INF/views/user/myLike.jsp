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
<style>
card{
overflow:hidden !important;
}
.card-img-top{
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
.far.fa-heart{
  position: absolute !important;
  bottom: 2% !important;
  right:2% !important;
  padding: 2% !important;
  background:rgba(255, 182, 185, 0.8) !important;
  border-radius:7px !important;
  color:white !important;
  font-size:14px !important;
}
.far.fa-heart:hover{
font-weight:bold !important;
}
.far.fa-eye{
  position: absolute !important;
  bottom: 0 !important;
  left:0 !important;
  padding: 3% !important;
}
.card-body{
 font-size:14px !important;
}
.card-body b{
 font-size:18px !important;
}
.fas.fa-heart{
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
	<div class="col-12"><i class="fas fa-heart"></i> <b class="hearttop">좋아요목록</b></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-eye"> <b>40</b></i><i class="far fa-heart"> <b>20</b></i></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:center;"><b>인테리어소개입니다</b><br>닉네임</div></div></div>
	</div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>