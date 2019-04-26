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
</head>
<body>
	<div style="width: 800px; height: 600px; border: 1px solid gray;">
		<h4>부동산 매물 신고</h4>
		<div style="padding: 20px;">
			<form>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">매물번호</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="staticEmail" value="22341">
					</div>
				</div>
				<div class="form-group">
					<div class="col-auto my-1">
					<label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
						<label class="mr-sm-2 sr-only" for="inlineFormCustomSelect">사유선택</label> 
						<select class="custom-select mr-sm-2"
							id="inlineFormCustomSelect">
							<option selected>사유선택</option>
							<option value="1">허위매물</option>
							<option value="2">정보부족</option>
							<option value="3">기타</option>
						</select>
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">작성자</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="staticEmail" value="홍진솔">
					</div>
				</div>
				<div class="form-group row">
					<label for="staticEmail" class="col-sm-2 col-form-label">Email</label>
					<div class="col-sm-10">
						<input type="text" readonly class="form-control-plaintext"
							id="staticEmail" value="email@example.com">
					</div>
				</div>
				<div class="form-group">
					<label for="exampleFormControlTextarea1">Example textarea</label>
					<textarea class="form-control" id="exampleFormControlTextarea1"
						rows="3"></textarea>
				</div>
			</form>
		</div>
	</div>
</body>
</html>