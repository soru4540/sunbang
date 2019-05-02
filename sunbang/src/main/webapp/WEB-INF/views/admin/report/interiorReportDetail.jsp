<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="stylesheet"
	href="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/css/bootstrap.min.css"
	integrity="sha384-ggOyR0iXCbMQv3Xipma34MD+dH/1fQ784/j6cY/iJTQUOhcWr7x9JvoRxT2MZw1T"
	crossorigin="anonymous">
<script src="https://code.jquery.com/jquery-3.3.1.slim.min.js"
	integrity="sha384-q8i/X+965DzO0rT7abK41JStQIAqVgRVzpbzo5smXKp4YfRvH+8abtTE1Pi6jizo"
	crossorigin="anonymous"></script>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/popper.js/1.14.7/umd/popper.min.js"
	integrity="sha384-UO2eT0CpHqdSJQ6hJty5KVphtPhzWj9WO1clHTMGa3JDZwrnQq4sF86dIHNDz0W1"
	crossorigin="anonymous"></script>
<script
	src="https://stackpath.bootstrapcdn.com/bootstrap/4.3.1/js/bootstrap.min.js"
	integrity="sha384-JjSmVgyd0p3pXB1rRibZUAYoIIy6OrQ6VrjIEaFf/nJGzIxFDsf4x0xIM+B07jRM"
	crossorigin="anonymous"></script>
<style type="text/css">
h4 {
	font-weight: bold;
	margin-bottom: 40px;
	margin-top: 40px;
}

.col-form-label {
	text-align: center;
	background-color: #f8f9fa;
}

#tb {
	margin: 0 auto;
	width: 90%;
}

.col-sm-10 {
	padding-right: 15px;
	padding-left: 15px;
}

#contents {
	height: 300px;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
}
</style>
<script type="text/javascript">
$(function(){
	$(window).bind("beforeunload", function (){
		opener.parent.location.reload();
		window.close();
	});
});
</script>

</head>
<body>
	<div class="container" style="height: 100%;">
		<div>
			<h4 align="center">인테리어 신고글 상세</h4>
		</div>
		<div id="tb">
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">카테고리</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="category"
						value="허위글">
				</div>
				<label class="col-sm-2 col-form-label">게시판</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="feedbackDate"
						value="노하우">
				</div>
			</div>

			<div class="form-group row">
				<label class="col-sm-2 col-form-label">글번호</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="userId"
						value="1000">
				</div>
				<label class="col-sm-2 col-form-label">작성자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="statusNo"
						value="김수정">
				</div>
			</div>
			<div class="form-group row">
				<label class="col-sm-2 col-form-label">일자</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="userId"
						value="2019/04/16">
				</div>
				<label class="col-sm-2 col-form-label">상태</label>
				<div class="col-sm">
					<input type="text" class="form-control" id="statusNo"
						value="미처리">
				</div>
			</div>

			<div class="form-group row">
				<label for="inputcontents" class="col-sm-2 col-form-label">내용</label>
				<div class="col-sm-10">
					<div class="form-control" id="contents">
						<p>저 집 20평대 아파트가 아니라 30평대로 알고 있는데
								20평대 인테리어라고 거짓말 했네요;;; 저렇게 넓을 수가 없습니다.</p>
					</div>
				</div>
			</div>
			<div class="form-group row">
				<div align="right" style="width: 98%;">
					<button type="reset" class="btn btn-primary"
						onclick="">처리완료</button>
					<button type="reset" class="btn btn-secondary"
						onclick="window.close();">닫기</button>
				</div>
			</div>
		</div>
	</div>
</body>
</html>