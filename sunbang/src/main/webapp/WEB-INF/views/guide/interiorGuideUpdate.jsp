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
#js_iginsert_con {
	min-height: 960px;
}

#js_iginsert_con .row {
	margin: 40px;
	margin-bottom:100px;
}

#js_iginsert_title {
	margin: 0 auto;
	font-size: 25px;
	font-family: a고딕15;
}

#js_iginsert_pre .img{
	width:1000px;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp"></c:import>
	<div class="container" id="js_iginsert_con">
		<div class="row">
			<p id="js_iginsert_title">20평대 아파트 리모델링 비용 정리</p>
		</div>
		<form>
			<div class="form-group">
				<label for="disabledSelect">카테고리 선택</label> <select
					class="form-control " id="disabledSelect" disabled >
					<option>비용정리</option>
					<option>셀프 인테리어</option>
					<option>리모델링</option>
					<option>선방 이용가이드</option>
				</select>
			</div>
			<div class="form-group">
				<label for="exampleFormControlInput1">제목</label> <input type="text"
					class="form-control" id="title" name="title" placeholder="제목 입력" value="20평대 아파트 리모델링 비용 정리">
			</div>
			<div class="form-group">
				<label for="file">첨부파일</label> <input type="file"
					class="form-control-file" id="file" name="files">
			</div>
			<div class="form-group" style="height:100%;">
				<label for="exampleFormControlTextarea1">내용입력</label>
				<div style="height:100%;">
					<textarea name="ir1" id="ir1" rows="20" cols="100">
					<pre id="js_iginsert_pre">
						
						
아름다운 아파트 인테리어, 게시글에 포함된 모든 사진은 견적과는 무관합니다. :)

작은 아파트를 알아보다가 광명의 한 대단지 아파트를 알게되었어요. 
이사갈곳이 워낙 연식이 오래된 곳이라 내부 인테리어는 꼭 해야만 했는데요. 

평수가 다양했던 곳이라 미래 계획을 세워두고 평수부터 고민하다가 이사비용과 리모델링 비용을 대략 알아야 결정이 가능해서 
20평, 30평대의 각각 리모델링 비용과 함께 큰 공사없이 해볼 수 있는 도배,장판,몰딩,걸레받이,조명,필름지 시공등 20평, 30평대의 부분인테리어 비용을 알아보았어요. 


오늘은 20평대 아파트의 리모델링 비용을 정리해보겠습니다.

24평 아파트 리모델링 비용 세부비용을 생략한 전체적인 내역입니다. 

제일 많은 비용을 차지하는 부분이 가구 / 바닥 / 목공사 / 도기공사 / 도배 / 타일 / 이윤 / 전기,조명공사 / 필름공사 / 철거공사 순이였어요. 

대략적인 그래프와 함께 적어드리겠습니다.

<img src="/sunbang/resources/images/igdetail2.jpg">


공과잡비는 공사진행시 소요되는 경비 같은 기타비용으로 통상적으로 3~5%대의 공과잡비 발생, 보통 견적금액이 높으면 공과잡비의 비율은 낮아지고, 
견적금액이 낮으면 공과잡비가 높아진다고 해요. 

시공업체의 이윤은 "공사"라고 들어간 항목을 더한값(총 10,290,000원)인 공사비의 8%로 잡습니다.


24평 아파트 리모델링 세부비용 전체적인 금액을 세부적으로 나뉘어보았습니다. 

공사진행시 약 10일~14일정도 소요된다고 합니다. 

제가 정보를 얻었던 곳은 아파트 인테리어를 공동구매 형식으로 하는곳이였어요. 
기본적인 옵션일 수 있지만 리모델링이 필요한 저같은 사람들한테는 조금이나마 저렴하게 할 수 있었던 방법인것 같아 찾아 적어두었던것이 이렇게 여러분께도 
도움이 될 수 있을것 같습니다.


<img src="/sunbang/resources/images/igdetail3.jpg">

공과잡비 + 이윤 + 단수정리를 합하면 총 공사금액은 11,420,000원이 됩니다.


					</pre>
					</textarea>
				</div>
			</div>
			<div class="row" id="js_iginsert_btn">
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