<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<style type="text/css">
.fix_con {
	position: fixed;
	width: 20%;
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

.di {
	word-wrap: break-word;
	overflow: hidden;
	word-break: break-all;
}

#js_igdetail_hr {
	margin-top: 50px;
	margin-bottom: 40px;
}

#js_igdetail_p {
	white-space: pre-wrap;
	font-family: a고딕11;
	font-size: 16px;
	line-height: 1.8em;
}

img {
	max-width: 100%;
}

#js_igdetail_h4 {
	font-size: 22px;
	font-family: a고딕15;
}
</style>

</head>
<body>
	<c:import url="../../common/interiorHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px; margin-top: 60px;">
		<div class="row">
			<div class="col-sm-9">
				<p>${guide.category }</p>
				<br>
				<h4 id="js_igdetail_h4">${guide.title }</h4>
				<hr id="js_igdetail_hr">
				<div class="box_introduce">
					<p id="js_igdetail_p">${guide.contents}</p>
				</div>
			</div>
			<div class="col-sm-3">
				<div class="fix_con">
					<div class="d1" style="width: 70%;">
						<p>
							${guide.category } &nbsp; &nbsp;
							<c:if test="true">
								<button type="button" class="btn btn-outline-success btn-sm"
									onclick="location.href='agupdateview.do?guide_system=interior&guide_no=${guide.guide_no}'">수정</button>
								<button type="button" class="btn btn-outline-danger btn-sm"
									data-toggle="modal" data-target="#exampleModal">삭제</button>
							</c:if>
						</p>
						<p style="font-size: 18px; font-family: a고딕15;">${guide.title }</p>
						<div>
							<p>
								<i class="fas fa-home"></i> <a class="font-weight-bold">선방</a>
							</p>
						</div>
						<br>
						<div>
							<button type="button" class="btn btn-outline-primary"
								onclick="javascript:window.scrollTo(0,0);">상단으로</button>
							<button type="button" class="btn btn-outline-info"
								onclick="location.href='aglistselect.do?guide_system=interior'">목록으로</button>
						</div>
						<hr>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
		aria-labelledby="exampleModalLabel" aria-hidden="true">
		<div class="modal-dialog" role="document">
			<div class="modal-content">
				<div class="modal-header">
					<h5 class="modal-title" id="exampleModalLabel">삭제 안내메세지</h5>
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close">
						<span aria-hidden="true">&times;</span>
					</button>
				</div>
				<div class="modal-body">해당 게시물을 정말 삭제하시겠습니까?</div>
				<div class="modal-footer">
					<button type="button" class="btn btn-secondary"
						data-dismiss="modal">취소</button>
					<button type="button" class="btn btn-primary" 
					onclick="location.href='agdelete.do?guide_system=${guide.guide_system }&guide_no=${guide.guide_no}'">삭제</button>
				</div>
			</div>
		</div>
	</div>

	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>