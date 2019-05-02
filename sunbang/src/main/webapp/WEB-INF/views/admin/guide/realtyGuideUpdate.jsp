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
			<p id="js_pginsert_title">부동산 가이드 수정</p>
		</div>
		<form>
			<div class="form-group">
				<label for="disabledSelect">카테고리 선택</label> <select
					class="form-control " id="disabledSelect" disabled >
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
					class="form-control" id="title" name="title" placeholder="제목 입력" value="부동산 등기부등본 어떻게 봐야하나요?">
			</div>
			<div class="form-group">
				<label for="file">첨부파일</label> <input type="file"
					class="form-control-file" id="file" name="files">
			</div>
			<div class="form-group" style="height:100%;">
				<label for="exampleFormControlTextarea1">내용입력</label>
				<div style="height:100%;">
					<textarea name="ir1" id="ir1" rows="20" cols="100">
					<pre>
자 그럼 본격적으로 부동산 등기부등본 쉽게 보는 법을 알아보겠습니다.

부동산 거래에 있어 해당 부동산의 권리관계를 명시한 서류가 등기부등본으로 눈에 보이지않는 정보까지 담고 있습니다. 

부동산 거래는 큰 목돈이 걸려 있어 등기부등본을 볼 줄 알면 사기나 잘못된 건물 또는 토지의 
구입을 예방할 수 있지만,등기부등본을 제대로 볼 줄 아는 사람이 많지 않은 것이 현실입니다. 


부동산 등기부등본은 토지등기부등본과 건물등기부등본이 있으며,
건물등기부등본은 아파트와 같은 집합건물등기부등본과 일반건물등기부등본으로 나눠집니다.


<img src="/sunbang/resources/images/pgdetail1.jpg">
(등기부등본의 구성)


등기부등본을 쉽고 올바르게 보기 위해선 등기부등본에 기재되는 등기의 종류에 대해서 기본적으로 알고 있어야 합니다. 

등기부등본에 기재할 수 있는 권리는 소유권, 지상권, 지역권, 전세권, 저당권이 인정되며, 
등기의 종류는 기입등기, 변경등기, 경정등기, 말소등기, 회복등기가 있습니다.

- 기입등기 : 새로운 등기원인이 발생하면 기입하는 등기로 소유권보존등기, 소유권이전등기, 근저당설정등기 등
- 변경등기 : 등기가 행해진 후 어떤 원인에 의해 변경이 발생할 때 하는 등기로 소유권변경등기, 근저당변경등기 등
- 경정등기 : 이미 기입된 등기에 대해 절차나 착오가 있을 경우 바로잡기 위한 등기로 소유권경정등기, 근저당경정등기 등
- 말소등기 : 이미 등기된 내용을 법적으로 소멸시키는 등기로 전세권말소등기, 근저당말소등기 등
- 회복등기 : 기존 등기가 부당하게 소멸된 경우 이를 부활시키는 등기로 전세권말소회복등기 등


부동산 등기부등본 갑구는 소유권에 대한 내용이 등기되고, 주로 변경 및 변동사항, 압류, 가압류, 경매신청, 
가등기, 환매등기, 예고등기 등이 기입되며, 을구는 소유권 이외의 권리사항으로 지상권, 지역권, 저당권, 
전세권, 임차권 등이 기입됩니다.

					</pre>
					</textarea>
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