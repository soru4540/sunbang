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
	src="${pageContext.request.contextPath}/resources/js/jquery-3.3.1.min.js"></script>
<style type="text/css">
#js_prepay_title {
	margin-top: 120px;
	margin-bottom: 100px;
	text-align: center;
	font-family: a고딕13;
}

#js_prepay_title h3 {
	padding: 20px;
	font-family: a고딕15;
}

#js_prepay_row {
	margin: 0 auto;
	text-align: center;
}

#js_prepay_row .col-sm {
	width: 200px;
	height: 120px;
	margin: 0 auto;
}

#js_prepay_row .col-sm p {
	height: 85%;
	width: 100%;
	margin: 10px;
	padding-top: 35px;
	text-overflow: ellipsis;
	white-space: nowrap;
	border-radius: 0.8em 0.8em 0.8em 0.8em;
	font-family: a고딕13;
	font-size: 20px;
}

.selectClass {
	background: #17a2b8;
	color: white;
}

#js_prepay_btn {
	width: 100%;
	text-align: center;
	margin-top: 50px;
}

#js_prepay_pp{
	height:30px;
	font-family: a고딕13;
	font-size: 18px;
}
</style>

</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<div id="js_prepay_title">
			<h3>선방 프리미엄 서비스</h3>
			<h4>프리미엄 매물 소개 + 매물 무제한 등록</h4>
		</div>
		<div class="row" id="js_prepay_row">
			<div class="col-sm" id="1">
				<p class="btn btn-outline-info">30일</p>
			</div>
			<div class="col-sm" id="2">
				<p class="btn btn-outline-info">90일</p>
			</div>
			<div class="col-sm" id="3">
				<p class="btn btn-outline-info">180일</p>
			</div>
			<div class="col-sm" id="4">
				<p class="btn btn-outline-info">365일</p>
			</div>
		</div>
		<script type="text/javascript">
			var id;
			var select;
			$(".col-sm").click(
					function() {
						$("#js_prepay_pp").text("");
						$("#" + id + " p").addClass("btn btn-outline-info");
						id = $(this).attr('id');
						$("#" + id + " p").removeClass();
						$("#" + id + " p").addClass("selectClass");
						console.log($("#" + id + " p").text());
						select = $("#" + id + " p").text();
						$("#js_prepay_pp").html(
								"<b id="+id+">" + select + "</b> 을 선택하셨습니다.");
					});
		</script>
		<div id="js_prepay_btn">
			<p id="js_prepay_pp"></p>
		</div>
		<div id="js_prepay_btn">
			<button type="button" class="btn btn-info" id="payBtn">결제하기</button>
		</div>
		<script type="text/javascript">
			$("#payBtn").click(function() {
				var select = $("b").attr('id');
				console.log(select);
			});
		</script>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>