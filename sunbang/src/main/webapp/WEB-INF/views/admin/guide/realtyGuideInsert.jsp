<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>SUNBANG</title>
<script type="text/javascript" src="../se2/js/service/HuskyEZCreator.js"
	charset="utf-8"></script>
<script type="text/javascript"
	src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
	$(function() {
		var oEditors = [];
		nhn.husky.EZCreator.createInIFrame({
			oAppRef : oEditors,
			elPlaceHolder : "ir1",
			sSkinURI : "../se2/SmartEditor2Skin.html",
			fCreator : "createSEditor2"
		});
	})
</script>
<style type="text/css">
#js_pginsert_con {
	min-height: 960px;
}

#js_pginsert_con .row {
	margin: 40px;
}

#js_pginsert_title {
	margin: 0 auto;
	font-size: 25px;
	font-family: a고딕15;
}
</style>
</head>
<body>
	<c:import url="../common/realtyHeader.jsp"></c:import>
	<div class="container" id="js_pginsert_con">
		<div class="row">
			<p id="js_pginsert_title">부동산 가이드 등록</p>
		</div>
		<form>
			<div class="form-group">
				<label for="exampleFormControlSelect1">카테고리 선택</label> <select
					class="form-control" id="exampleFormControlSelect1">
					<option>부동산 상식</option>
					<option>이사 가이드</option>
					<option>분양 정보</option>
					<option>법률 지식</option>
					<option>선방에서 집 구하기</option>
					<option>선방에 집 내놓기</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="title" name="title" placeholder="제목 입력">
			</div>
			<div class="form-group">
				<label for="file">첨부파일</label> <input type="file"
					class="form-control-file" id="file" name="files">
			</div>
			<div class="form-group" style="height:100%;">
				<label for="exampleFormControlTextarea1">내용입력</label>
				<div style="height:100%;">
					<textarea name="ir1" id="ir1" rows="20" cols="100"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col" style="text-align: right;">
					<input class="btn btn-primary btn-sm" type="submit" value="등록">
				</div>
				<button type="button" class="btn btn-outline-info btn-sm"
								onclick="history.go(-1);">목록으로</button>
			</div>
		</form>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>