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
		window.open('/sunbang/views/admin/interiorReportDetail.jsp', 'detailView',
				'width=1000,height=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
		
	};
</script>
</head>
<body>
	<c:import url="../common/propertyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_interiorM_h">인테리어 신고 관리</h4>
		<div id="js_interiorM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="150px;">카테고리</th>
						<th scope="col" width="150px;">게시판</th>
						<th scope="col" width="150px;">글번호</th>
						<th scope="col">내용</th>
						<th scope="col" width="130px;">작성자</th>
						<th scope="col" width="130px;">일자</th>
						<th scope="col" width="130px;">처리일자</th>
						<th scope="col" width="100px;">상태</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<th scope="row">5</th>
						<td>허위글</td>
						<td>노하우</td>
						<td>1000</td>
						<td id="js_interiorM_content"><a
							href="javascript:detailView();">저 집 20평대 아파트가 아니라 30평대로 알고
								있는데 20평대 인테리어라고 거짓말 했네요;;; 저렇게 넓을 수가 없습니다.</a></td>
						<td>김수정</td>
						<td>2019/04/16</td>
						<td></td>
						<td>미처리</td>
					</tr>
					<tr>
						<th scope="row">4</th>
						<td>사진도용</td>
						<td>사진</td>
						<td>232</td>
						<td id="js_interiorM_content"><a href="#">제가 인스타에 올린 사진을
								자신의 집이라며 올렸습니다. 삭제하라고 말했는데도 삭제를 안하네요. 삭제 시켜주세요!!</a></td>
						<td>유은정</td>
						<td>2019/03/08</td>
						<td>2019/03/09</td>
						<td>처리</td>
					</tr>
					<tr>
						<th scope="row">3</th>
						<td>사진도용</td>
						<td>사진</td>
						<td>123</td>
						<td id="js_interiorM_content"><a href="#">제가 세달전에 올렸던
								조명사진을 가져다 쓴 것 같습니다. 확인해주세요!</a></td>
						<td>이철민</td>
						<td>2019/03/02</td>
						<td>2019/03/03</td>
						<td>처리</td>
					</tr>
					<tr>
						<th scope="row">2</th>
						<td>광고</td>
						<td>집들이</td>
						<td>100</td>
						<td id="js_interiorM_content"><a href="#">집들이라고 올려놓고 광고네
								ㅋㅋㅋㅋ 무슨 가구업체인것 같아여 처리좀;;;</a></td>
						<td>사하라</td>
						<td>2019/02/10</td>
						<td>2019/02/11</td>
						<td>처리</td>
					</tr>
					<tr>
						<th scope="row">1</th>
						<td>기타</td>
						<td>노하우</td>
						<td>232</td>
						<td id="js_interiorM_content"><a href="#">이 글은 노하우 글이 아닌거
								같아요 ~ 그냥 자기 집자랑인거 같은데 ;; 집들이 게시판으로 옮기는게 좋지않을까요?</a></td>
						<td>허소리</td>
						<td>2019/01/21</td>
						<td>2019/01/22</td>
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
					<option value="허위글">허위글</option>
					<option value="사진도용">사진도용</option>
					<option value="욕설">욕설</option>
					<option value="광고">광고</option>
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