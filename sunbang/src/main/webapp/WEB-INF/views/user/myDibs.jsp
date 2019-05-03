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
.check{
  position: absolute !important;
  bottom: 1% !important;
  right:2% !important;
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
.fa-eye{
  position: absolute !important;
  bottom: 0 !important;
  left:0 !important;
  padding: 3% !important;
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
  top: 1% !important;
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
</style>
</head>
<body>
<c:import url="../common/realtyHeader.jsp"/>

 <div class="modal fade" id="myModal"><div class="modal-dialog"><div class="modal-content">
        <div class="modal-header border-0""><h5 class="modal-title">메모</h5><button type="button" class="close" data-dismiss="modal">×</button></div>
        
        <div class="modal-body"><span class="float-right">작성날짜 : 19.02.18</span><textarea class="form-control" placeholder="메모하기" rows="5" style="resize:none;"></textarea></div>
        
        <div class="modal-footer border-0"><button class="btn btn-lgreen" style="width:48%;">확인</button><button type="button" class="btn btn-gray" style="width:48%;" data-dismiss="modal">취소</button></button></div>
</div></div></div>

<div class="container">
	<div class="row" style="margin-top:10%; padding-bottom:10%;">
	<div class="col-12"><span class="checktopout"><span class="checktop">찜</span> 찜목록</span></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check" > <b>확인 19.02.18</b></i><i class="far fa-clipboard" data-toggle="modal" data-target="#myModal"> <b>메모</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	<div class="col-6 col-md-4 col-lg-3 mt-5"><div class="card border-0"><div class="card-img-top"><div class="img-overlay"><i class="far fa-calendar-check"> <b>확인 19.02.18</b></i><i class="far fa-eye"> <b>40</b></i><span class="check">찜</span></div><img src="/sunbang/files/user/userImages/1234.jpg" style="width:100%; height: 200px;"></div>
		<div class="card-body" style="text-align:left;">투룸<br><b>부동산입니다</b><br>닉네임<br>3층 33m 관리 1만</div></div></div>
	</div>
</div>

<c:import url="../common/footer.jsp" />
</body>
</html>