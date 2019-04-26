<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
<style type="text/css">
#js_interiorM_content {
	float: left;
	width: 360px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#js_interiorM_tb {
	min-height: 600px;
	text-align: center;
}

#js_interiorM_h {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
}
</style>
<script type="text/javascript">
	function detailView() {
		var popupX = (window.screen.width/2) - (1000/2);
		var popupY= (window.screen.height/2) - (700/2);
		window.open('/sunbang/views/admin/userReportDetail.jsp', 'detailView',
				'width=1000,height=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
		
	};
</script>
</head>
<body>
	<c:import url="../common/propertyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_interiorM_h">회원 신고 관리</h4>
		<div id="js_interiorM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="150px;">카테고리</th>
						<th scope="col" width="150px;">신고유저</th>
						<th scope="col">내용</th>
						<th scope="col" width="130px;">신고자</th>
						<th scope="col" width="130px;">일자</th>
						<th scope="col" width="130px;">처리일자</th>
						<th scope="col" width="100px;">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">4</th>
						<td>욕설</td>
						<td>홍진솔</td>
						<td id="js_interiorM_content"><a
							href="javascript:detailView();">제 글에 욕설 댓글을 남겼습니다. 어떻게 처리 좀 해주셨으면 좋겠습니다 ㅜㅜ</a></td>
						<td>안형진</td>
						<td>2019/04/16</td>
						<td></td>
						<td>미처리</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>사기</td>
						<td>이혜리</td>
						<td id="js_interiorM_content"><a href="#">자기 집이라고 하는데 찾아보니까 어느 회사 직원이더라구요! 확인 해주세요!!</a></td>
						<td>유은정</td>
						<td>2019/03/08</td>
						<td>2019/03/09</td>
						<td>처리</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>부적절한 행동</td>
						<td>황민규</td>
						<td id="js_interiorM_content"><a href="#">계속 제글에 이상한 댓글로 도배를 합니다. 저랑 전혀 알지 못하는 사람인데</a></td>
						<td>이철민</td>
						<td>2019/03/02</td>
						<td>2019/03/03</td>
						<td>처리</td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td>기타</td>
						<td>서지안</td>
						<td id="js_interiorM_content"><a href="#">저한테 계속 카카오톡아이디를 알려달라고 하는데 이걸 어떻게 처리해야할까요?</a></td>
						<td>사하라</td>
						<td>2019/02/10</td>
						<td>2019/02/11</td>
						<td>처리</td>
					</tr>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col">
				<select class="custom-select" name="selBox"
					style="max-width: 200px;">
					<option value="">카테고리 선택 후 검색</option>
					<option value="욕설">욕설</option>
					<option value="사기">사기</option>
					<option value="부적절한 행동">부적절한 행동</option>
					<option value="기타">기타</option>
				</select>
				<button class="btn btn-info btn-sm" onclick="selSearch();">검색</button>
			</div>
			<div class="col" style="margin-left:150px;">
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
				<button class="btn btn-dark btn-sm"
					onclick="history.go(-1);">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>