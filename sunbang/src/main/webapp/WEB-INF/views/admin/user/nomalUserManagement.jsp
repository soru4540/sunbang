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
	<c:import url="../common/realtyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_primiumM_h">회원 관리</h4>
		<div id="js_primiumM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="200px;">회원번호</th>
						<th scope="col" width="200px;">ID</th>
						<th scope="col" width="200px;">이름</th>
						<th scope="col" width="200px;">가입일자</th>
						<th scope="col" width="200px;">수정일자</th>
						<th scope="col" width="150px;">상태</th>
						<th scope="col" width="400px;">사유</th>
						<th scope="col"></th>
						<th scope="col" width="300px;">처리</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">3</th>
						<td><a href="#">234</a></td>
						<td>soru4540</td>
						<td>홍진솔</td>
						<td>2019/03/23</td>
						<td>2019/03/25</td>
						<td id="status">정지</td>
						<td>타회원에게 욕설</td>
						<td><input type="button" class="btn btn-info btn-sm"
							value="수정" id="btn1" onclick="location.href=''"></td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="활성" id="btn1" onclick="location.href=''"> <input	
							type="button" class="btn btn-warning btn-sm" value="비활성" id="btn2"
							onclick="location.href=''" style="opacity:0.3;">
					</tr>
					<tr>
						<th scope="row">2</th>
						<td><a href="#">134</a></td>
						<td>mimi6578</td>
						<td>장미미</td>
						<td>2019/02/12</td>
						<td></td>
						<td id="status">이용중</td>
						<td></td>
						<td></td>
						<td><input type="button" class="btn btn-success btn-sm"
							value="활성" id="btn1" onclick="location.href=''" style="opacity:0.3;"> <input
							type="button" class="btn btn-warning btn-sm" value="비활성" id="btn2"
							onclick="location.href=''">
					</tr>
					<tr>
						<th scope="row">1</th>
						<td><a href="#">743</a></td>
						<td>bbb3456</td>
						<td>김비비</td>
						<td>2019/03/01</td>
						<td>2019/01/12</td>
						<td id="status">탈퇴</td>
						<td>아이디 변경하고싶어서 탈퇴하고 다시 가입합니다.</td>
						<td></td>
						<td><input
							type="button" class="btn btn-danger btn-sm" value="완전삭제" id="btn2"
							onclick="location.href=''">
					</tr>

				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col" style="max-width: 150px; margin:0 auto;">
				<select class="custom-select" name="selBox">
					<option value="">선택</option>
					<option value="아이디">아이디</option>
					<option value="이름">이름</option>
					<option value="탈퇴사유">탈퇴사유</option>
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