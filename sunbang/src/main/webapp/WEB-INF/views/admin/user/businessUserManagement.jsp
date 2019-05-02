<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
<style type="text/css">
#js_primiumM_tb {
	min-height: 600px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
}

#js_primiumM_h {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
}
</style>
<script type="text/javascript"
	src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	function detailView() {
		var popupX = (window.screen.width/2) - (1000/2);
		var popupY= (window.screen.height/2) - (700/2);
		window.open('/sunbang/views/admin/businessUserDetail.jsp', 'detailView',
				'width=1000,height=650, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
		
	};
</script>
<script type="text/javascript">
$(function() {
	if ($("#status").text() == "승인") {
		console.log("승인");
		$("#btn1").attr('disabled', true);
		$("#btn1").css("opacity", "0.3");
	} else if ($("#status").text() == "보류") {
		$("#btn2").attr('disabled', true);
		$("#btn2").css("opacity", "0.3");
	} else if ($("#status").text() == "거절") {
		$("#btn2").attr('disabled', true);
		$("#btn2").css("opacity", "0.3");
		$("#btn3").attr('disabled', true);
		$("#btn3").css("opacity", "0.3");
	}
});
</script>
</head>
<body>
	<c:import url="../common/propertyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_primiumM_h">기업회원 관리</h4>
		<div id="js_primiumM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="400px;">등록번호</th>
						<th scope="col" width="400px;">상호</th>
						<th scope="col" width="200px;">대표자</th>
						<th scope="col" width="200px;">신청일자</th>
						<th scope="col" width="200px;">처리일자</th>
						<th scope="col" width="100px;">P</th>
						<th scope="col" width="150px;">상태</th>
						<th scope="col" width="300px;">처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">6</th>
						<td><a href="javascript:detailView();">28237-2018-00133</a></td>
						<td>100억공인중개사사무소</td>
						<td>김세연</td>
						<td>2019/04/19</td>
						<td></td>
						<td>N</td>
						<td id="status">미승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick="location.href=''"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>
					<tr>
						<th scope="row">5</th>
						<td><a href="#">가3360-3841</a></td>
						<td>강남부동산공인중개사사무소</td>
						<td>허명희</td>
						<td>2019/04/15</td>
						<td></td>
						<td>N</td>
						<td id="status">미승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick="location.href=''"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td><a href="#">가3360-6022</a></td>
						<td>광개토공인중개사사무소</td>
						<td>김용상</td>
						<td>2019/04/11</td>
						<td></td>
						<td>N</td>
						<td id="status">미승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick="location.href=''"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td><a href="#">가3360-6174</a></td>
						<td>미소공인중개사사무소</td>
						<td>노예실</td>
						<td>2019/04/03</td>
						<td></td>
						<td>N</td>
						<td id="status">미승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick="location.href=''"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td><a href="#">가3360-6022</a></td>
						<td>백송공인중개사사무소</td>
						<td>김현숙</td>
						<td>2019/03/29</td>
						<td></td>
						<td>N</td>
						<td id="status">미승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick="location.href=''"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td><a href="#">가3360-2585</a></td>
						<td>소망공인중개사사무소</td>
						<td>김영미</td>
						<td>2019/03/11</td>
						<td></td>
						<td>Y</td>
						<td id="status">승인</td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="승인" id="btn1" onclick=""  style="disabled:true; opacity:0.3;"> <input
							type="button" class="btn btn-warning btn-sm" value="보류" id="btn2"
							onclick="location.href=''"> <input type="button"
							class="btn btn-danger btn-sm" value="거절" id="btn3"
							data-toggle="modal" data-target="#delete"></td>
					</tr>

				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col" style="max-width: 150px; margin:0 auto;">
				<select class="custom-select" name="selBox">
					<option value="">선택</option>
					<option value="등록번호">등록번호</option>
					<option value="상호">상호</option>
					<option value="상태">상태</option>
				</select>
			</div>
			<div class="col" style="max-width: 200px; margin:0 auto; padding:0px;">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search">
				
			</div>
			<div class="col" style="margin:0 auto; padding:0px;">
			<button class="btn btn-info btn" onclick="">검색</button>
			</div>
			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
						</a></li>
						<li class="page-item"><a class="page-link" href="#">1</a></li>
						<li class="page-item"><a class="page-link" href="#">2</a></li>
						<li class="page-item"><a class="page-link" href="#">3</a></li>
						<li class="page-item"><a class="page-link" href="#"
							aria-label="Next"> <span aria-hidden="true">&raquo;</span>
						</a></li>
					</ul>
				</nav>
			</div>
			<div class="col" align="right">
				<button class="btn btn-dark" onclick="history.go(-1);">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>