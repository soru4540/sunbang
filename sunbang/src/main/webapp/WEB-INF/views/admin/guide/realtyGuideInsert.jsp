<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script src="https://code.jquery.com/jquery-latest.js"></script>
<script type="text/javascript"
	src="/sunbang/resources/editor/js/HuskyEZCreator.js" charset="utf-8"></script>
<script type="text/javascript"
	src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">
$(function() {
	//전역변수
	var obj = [];
	//스마트에디터 프레임생성
	nhn.husky.EZCreator.createInIFrame({
		oAppRef : obj,
		elPlaceHolder : "contents",
		sSkinURI : "<%=request.getContextPath()%>/resources/editor/SmartEditor2Skin.html",
		htParams : {
			// 툴바 사용 여부
			bUseToolbar : true,
			// 입력창 크기 조절바 사용 여부
			bUseVerticalResizer : true,
			// 모드 탭(Editor | HTML | TEXT) 사용 여부
			bUseModeChanger : true,
		}
	});
	//전송버튼
    $("#savebutton").click(function(){
        //id가 smarteditor인 textarea에 에디터에서 대입
        obj.getById["contents"].exec("UPDATE_CONTENTS_FIELD", []);
        var guide_system = document.ginsertform.guide_system.value;
		var category = document.ginsertform.category.value;
		var title = document.ginsertform.title.value;
		var thumbnail = document.ginsertform.thumbnail.value;
		var contents = document.ginsertform.contents.value;
		if (title == "") {
			alert("제목을 입력하세요.");
			document.ginsertform.title.focus;
			return;
		}
		if (thumbnail == "") {
			alert("썸네일을 업로드하세요.");
			document.ginsertform.thumbnail.focus;
			return;
		}
        //폼 submit
        document.ginsertform.action = "aginsert.do";
        $("#ginsertform").submit();
    })
});
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
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<div class="container" id="js_pginsert_con">
		<div class="row">
			<p id="js_pginsert_title">부동산 가이드 등록</p>
		</div>
		<form id="ginsertform" name="ginsertform" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" id="guide_system" name="guide_system"
					value="realty"> <label for="category">카테고리 선택</label> <select
					class="form-control" id="category" name="category">
					<option disabled>카테고리를 선택하세요</option>
					<option value="부동산 상식">부동산 상식</option>
					<option value="이사 가이드">이사 가이드</option>
					<option value="분양 정보">분양 정보</option>
					<option value="법률 지식">법률 지식</option>
					<option value="선방에서 집 구하기">선방에서 집 구하기</option>
					<option value="선방에 집 내놓기">선방에 집 내놓기</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="title" name="title" placeholder="제목 입력">
			</div>
			<div class="form-group">
				<label for="thumbnail">첨부파일</label> <input type="file"
					class="form-control-file" id="thumbnail" name="thumbnail">
			</div>
			<div class="form-group" style="height: 100%;">
				<label for="contents">내용입력</label>
				<div style="height: 100%;">
					<textarea name="contents" id="contents" style="width: 100%; height: 500px"></textarea>
				</div>
			</div>
			<div class="row">
				<div class="col" style="text-align: right;">
					<input class="btn btn-primary btn-sm" type="button" value="등록"
						id="savebutton">
				</div>
				<button type="button" class="btn btn-outline-info btn-sm"
					onclick="history.go(-1);">목록으로</button>
			</div>
		</form>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>