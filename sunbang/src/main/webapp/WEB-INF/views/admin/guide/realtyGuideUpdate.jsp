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
		var title = document.gupdateform.title.value;
		var contents = document.gupdateform.contents.value;
		if (title == "") {
			alert("제목을 입력하세요.");
			document.gupdateform.title.focus;
			return;
		}
        //폼 submit
        document.gupdateform.action = "agupdate.do";
        $("#gupdateform").submit();
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
			<p id="js_pginsert_title">부동산 가이드 수정</p>
		</div>
		<form id="gupdateform" name="gupdateform" method="POST" enctype="multipart/form-data">
			<div class="form-group">
				<input type="hidden" id="guide_system" name="guide_system" value="realty">
				<input type="hidden" id="guide_no" name="guide_no" value="${guide.guide_no }">
				<label for="category">카테고리 선택</label> 
				<select class="form-control " id="category" disabled >
					<option value="${guide.category }">${guide.category }</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="title" name="title" value="${guide.title }">
			</div>
			<div class="form-group">
				<input type="hidden" id="othumbnail" name="othumbnail" value="${guide.thumbnail }">
				<label for="file">첨부파일</label>
				<input type="file"class="form-control-file" id="thumbnail" name="thumbnail">
			</div>
			<div class="form-group" style="height:100%;">
				<label for="exampleFormControlTextarea1">내용입력</label>
				<div style="height:100%;">
					<textarea name="contents" id="contents" style="width: 100%; height: 500px">
						<p>${guide.contents }</p>
					</textarea>
				</div>
			</div>
			<div class="row" id="js_iginsert_btn">
				<div class="col" style="text-align: right;">
					<input class="btn btn-primary btn-sm" type="button" value="수정등록"
						id="savebutton">
				</div>
				<button type="button" class="btn btn-outline-info btn-sm"
					onclick="history.go(-1);">뒤로가기</button>
			</div>
		</form>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>