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
<style type="text/css">
#js_userM_content {
	float: left;
	width: 360px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#js_userM_tb {
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
	min-height: 600px;
	text-align: center;
}

#js_userM_h {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
}
</style>
<script type="text/javascript">
function detailView(data) {
	var popupX = (window.screen.width/2) - (1000/2);
	var popupY= (window.screen.height/2) - (700/2);
	window.open('ardetailselect.do?report_system=user&report_no='+data, 'detailView',
		'width=1000,height=700, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');	
};
function selSearch(){
	var category = $("#selBox").val();
	location.href = "arlistselect.do?report_system=user&selectval=category&keyword="+category;
}
</script>
</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<c:import url="../../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_userM_h">회원 신고 관리</h4>
		<div id="js_userM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">No</th>
						<th scope="col" width="150px;">카테고리</th>
						<th scope="col" width="150px;">신고회원</th>
						<th scope="col">내용</th>
						<th scope="col" width="130px;">작성자</th>
						<th scope="col" width="130px;">일자</th>
						<th scope="col" width="130px;">처리일자</th>
						<th scope="col" width="100px;">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${rlist }" var="r">
					<tr>
						<th scope="row">${r.report_no }</th>
						<td>${r.category }</td>
						<td>${r.reported_board }</td>
						<td id="js_userM_content">
							<a href="javascript:detailView(${r.report_no });">${ r.contents}</a></td>
						<td>${r.user_id}</td>
						<td>${r.report_date }</td>
						<td>${r.handle_date }</td>
						<td id="status">
							<c:if test="${r.report_status == 0}">
								<p style="color: blue; margin:0;">미처리</p>
							</c:if> 
							<c:if test="${r.report_status == 1}">
								<p style="color: orange; margin:0;">확인완료</p>
							</c:if> 
							<c:if test="${r.report_status == 2}">
								<p style="color: grren; margin:0;">처리완료</p>
							</c:if>
						</td>
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row" style="margin: 0 auto;">
			<div class="col-sm">
				<div class="row">
				<select class="custom-select" name="selBox" id="selBox" style="min-width: 150px;max-width: 150px;">
					<option value="">카테고리 선택</option>
					<option value="욕설">욕설</option>
					<option value="사기">사기</option>
					<option value="부적절한 행동">부적절한 행동</option>
					<option value="기타">기타</option>
				</select>
				<button class="btn btn-info" onclick="selSearch();">검색</button>
				<a class="dropdown-item" href="arlistselect.do?report_system=user&page=1"style="width: 80px;">reset</a>
				</div>
			</div>
			<div class="col-sm" align="center"  style="margin: 0 auto;"> 
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${ page.page <= 1 }">
							<li class="page-item"><span aria-hidden="true"
								class="page-link">&laquo;&laquo;</span>&nbsp;</li>
						</c:if>
						<c:if test="${ page.page > 1 }">
							<c:url var="bli" value="ablistselect.do?">
								<c:param name="page" value="1" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${ pli }"><span
									aria-hidden="true">&laquo;&laquo;</span></a>&nbsp;</li>
						</c:if>
						<c:if
							test="${ page.page - 10 < page.startpage and page.page - 10 > 1 }">
							<c:url var="bli" value="ablistselect.do?">
								<c:param name="page" value="${page.startpage - 10 }" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${pli}"><span
									aria-hidden="true" class="page-link">&laquo;</span></a></li>
						</c:if>
						<c:if
							test="${ page.page - 10 >= page.startpage and page.page - 10 <= 1 }">
							<li class="page-item"><span class="page-link"
								aria-hidden="true">&laquo;</span></li>
						</c:if>

						<c:forEach var="p" begin="${ page.startpage }"
							end="${ page.endpage }">
							<c:if test="${ p == page.page}">
								<li class="page-item"><a class="page-link"><b>${ p }</b></a></li>
							</c:if>
							<c:if test="${ p ne page.page}">
								<c:if
									test="${!empty selectval and selectval eq 'p.business_user_no'}">
									<c:url var="psearchbno" value="ablistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchbno }">${ p }</a></li>
								</c:if>
								<c:if test="${!empty selectval and selectval eq 'u.user_name'}">
									<c:url var="psearchuname" value="ablistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchuname }">${ p }</a></li>
								</c:if>
								<c:if
									test="${!empty selectval and selectval eq 'expiration_date'}">
									<c:url var="psearchedate" value="ablistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchedate }">${ p }</a></li>
								</c:if>
								<c:if test="${empty search}">
									<c:url var="psearch" value="ablistselect.do?">
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ blist }">${ p }</a></li>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if
							test="${page.page + 10 > page.endpage and page.page + 10 < page.maxpage}">
							<c:url var="next" value="ablistselect.do?">
								<c:param name="page" value="${ page.endpage + 10 }" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${ next }"><span
									aria-hidden="true">&raquo;</span></a>&nbsp;</li>
						</c:if>
						<c:if
							test="${page.page + 10 <= page.endpage and page.page + 10 >= page.maxpage}">
							<li class="page-item"><span aria-hidden="true">&raquo;</span>&nbsp;
							</li>
						</c:if>
						<c:if test="${ page.page >= page.maxpage }">
							<li class="page-item"><span aria-hidden="true"
								class="page-link">&raquo;&raquo;</span></li>
						</c:if>
						<c:if test="${ page.page < page.maxpage }">
							<c:url var="mpage" value="ablistselect.do?">
								<c:param name="page" value="${ page.maxpage }" />
							</c:url>
							<li class="page-item"><a class="page-link"
								href="${ page.maxpage }"><span aria-hidden="true">&raquo;&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col-sm" align="right" style="margin:0 auto;">
				<button class="btn btn-dark"
					onclick="location.href='auhlistselect.do'">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>