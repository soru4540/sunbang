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
</head>
<body>
	<c:import url="../common/realtyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_primiumM_h">프리미엄 서비스 결제 내역</h4>
		<div id="js_primiumM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="400px;">등록번호</th>
						<th scope="col" width="400px;">상호</th>
						<th scope="col" width="200px;">대표자</th>
						<th scope="col" width="200px;">결제일자</th>
						<th scope="col" width="200px;">만료일</th>
						<th scope="col" width="100px;">이용가능일수</th>
						<th scope="col" width="300px;">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">1</th>
						<td><a href="javascript:detailView();">가3360-2585</a></td>
						<td>소망공인중개사사무소</td>
						<td>김영미</td>
						<td>2019/03/11</td>
						<td>2020/03/09</td>
						<td>323</td>
						<td id="status">이용중</td>
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