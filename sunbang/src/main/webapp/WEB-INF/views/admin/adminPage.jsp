<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<style type="text/css">
#js_apage_tb {
	min-height: 400px;
	white-space: nowrap;
	overflow: auto;
	border: 1px solid lightgray;
	text-align: center;
}

.js_apage_content {
	float: left;
	width: 540px;
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
}

#icon {
	padding-left: 3%;
	color: #343a40;
	font-weight: bold;
}

#col {
	align: center;
	text-align: center;
	border: 3px solid #343a40;
	border-radius: 2em 2em 2em 2em;
	margin: 20px;
	margin-top: 50px;
	padding: 30px;
	padding-top: 50px;
	padding-bottom: 50px;
}

#count {
	float: unset !important;
	margin-left: 5px;
}
</style>
<!-- <script type="text/javascript">
$(function() {
	
})
</script> -->
</head>
<body>
	<c:import url="../common/realtyHeader.jsp"></c:import>
	<c:import url="../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<div style="margin-top: 50px;">
			<h5 style="margin: 20px;">신고 미처리 건 : &nbsp; ${fn:length(rlist)}
				건</h5>
			<div id="js_apage_tb">
				<table class="table table-sm">
					<thead class="thead-dark">
						<tr>
							<th scope="col" width="60px;">No</th>
							<th scope="col" width="100px;">분류</th>
							<th scope="col" width="150px;">카테고리</th>
							<th scope="col">내용</th>
							<th scope="col" width="130px;">작성자</th>
							<th scope="col" width="130px;">일자</th>
						</tr>
					</thead>
					<tbody>
						<c:forEach items="${ rlist }" var="report" varStatus="status">
							<tr>
								<th scope="row">${report.report_no}</th>
								<c:if test="${report.report_system eq 'realty'}">
									<td>부동산</td>
								</c:if>
								<c:if test="${report.report_system eq 'interior'}">
									<td>인테리어</td>
								</c:if>
								<c:if test="${report.report_system eq 'user'}">
									<td>회원</td>
								</c:if>
								<td>${report.category}</td>
								<td class="js_apage_content" id="content${report.report_no}">${report.contents}</td>
								<td>${report.user_id}</td>
								<td>${report.report_date}</td>
							</tr>
							<script>
								$(function(){
					   				var str = $("#content${report.report_no}").text();
					   				str.split("<br>").join("\r\n");
					   				$("#content${report.report_no}").text(str);
								});
							</script>
						</c:forEach>
					</tbody>
				</table>
			</div>

			<div class="row">
				<div class="col" id="col">
					<a href="cmyview.do" id="icon"> <i
						class="fas fa-comments fa-3x"></i><br> <br>1:1 상담<br>리스트
					<c:if test="${ccount > 0}">
						<span class="badge badge-danger float-right" id="count">${ccount }</span>
					</c:if>
					</a>
				</div>
				<div class="col" id="col">
					<a href="ablistselect.do?page=1" id="icon">
						<i class="fas fa-user-tie fa-3x"></i><br> <br>신규<br>기업회원
					</a> 
					<c:if test="${bucount > 0}">
						<span class="badge badge-danger float-right" id="count">${bucount }</span>
					</c:if>
				</div>
				<div class="col" id="col">
					<a href="aplistselect.do?page=1" id="icon">
						<i class="fas fa-award fa-3x"></i><br> <br>프리미엄 <br>결제
						내역
					</a>
					<c:if test="${pcount > 0}">
						<span class="badge badge-danger float-right" id="count">${pcount }</span>
					</c:if>
				</div>
			</div>
		</div>
	</div>
	<c:import url="../common/footer.jsp"></c:import>
</body>
</html>