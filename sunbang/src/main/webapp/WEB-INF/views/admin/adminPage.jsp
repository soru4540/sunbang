<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
<style type="text/css">
#js_apage_tb {
	min-height: 400px;
	white-space: nowrap;
	overflow: auto;
	border: 1px solid lightgray;
	text-align: center;
}

#js_apage_content {
	float: left;
	width: 540px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#icon{
	padding-left: 3%;
	color: #343a40;
	font-weight: bold;
}

#col {
	align: center;
	text-align: center;
	border: 3px solid #343a40;
	border-radius: 2em 2em 2em 2em;
	margin: 20px;
	margin-top: 50px;
	padding: 30px;
	padding-top: 50px;
	padding-bottom: 50px;
}
#count{
	float: unset!important;
	margin-left: 5px;
	
}
</style>
<!-- <script type="text/javascript">
$(function() {
	
})
</script> -->
</head>
<body>

	<c:import url="../common/realtyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<div style="margin-top: 50px;">
			<h5 style="margin: 20px;">신고 미처리 건 : 3건</h5>
			<div id="js_apage_tb">
				<table class="table table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col" width="60px;">No</th>
							<th scope="col" width="100px;">분류</th>
							<th scope="col" width="150px;">카테고리</th>
							<th scope="col">내용</th>
							<th scope="col" width="130px;">작성자</th>
							<th scope="col" width="130px;">일자</th>
						</tr>
					</thead>
					<tbody>
						<tr>
							<th scope="row">1</th>
							<td>부동산</td>
							<td>허위매물</td>
							<td id="js_apage_content">예약하고 가봤더니 저 조건의 매물은 없다고 다른 매물을
								추천해주는 데, 훨씬 비싸고 별로인 집들이더라구요 ㅜ 저걸로 낚시하는 듯</td>
							<td>홍진솔</td>
							<td>2019/04/17</td>
						</tr>
						<tr>
							<th scope="row">2</th>
							<td>회원</td>
							<td>기타</td>
							<td id="js_apage_content">사진 게시판에 계속 광고 사진을 올려요! 보기싫은데 어떻게
								처리 좀 해주세요!!!</td>
							<td>홍진솔</td>
							<td>2019/04/16</td>
						</tr>
						<tr>
							<th scope="row">3</th>
							<td>인테리어</td>
							<td>허위글</td>
							<td id="js_apage_content">저 집 20평대 아파트가 아니라 30평대로 알고 있는데
								20평대 인테리어라고 거짓말 했네요;;; 저렇게 넓을 수가 없습니다.</td>
							<td>김수정</td>
							<td>2019/04/16</td>
						</tr>
					</tbody>
				</table>
			</div>
			
			<div class="row">
				<div class="col" id="col">
					<a href="/sunbang/views/admin/reportView.jsp" id="icon"><i class="fas fa-comments fa-3x"></i><br> <br>1:1 상담<br>리스트<span class="badge badge-danger float-right" id="count">3</span></a>
				</div>
				<div class="col" id="col"><a href="/sunbang/views/admin/businessUserManagement.jsp" id="icon"><i class="fas fa-user-tie fa-3x"></i><br> <br>신규<br>기업회원</a><span class="badge badge-danger float-right" id="count">2</span></div>
				<div class="col" id="col"><a href="/sunbang/views/admin/premiumManagement.jsp" id="icon"><i class="fas fa-award fa-3x"></i><br> <br>프리미엄 <br>결제 내역</a><span class="badge badge-danger float-right" id="count">4</span></div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>