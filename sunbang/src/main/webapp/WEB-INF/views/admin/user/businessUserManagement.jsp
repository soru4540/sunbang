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
#js_buserM_tb {
	min-height: 600px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
}

#js_buserM_h {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
}
</style>
<script type="text/javascript"
	src="/sunbang/resources/js/jquery-3.3.1.min.js"></script>
<script type="text/javascript">

$(function(){
	$("#selbox").change(function(){
		if($("#selbox").val()==1 || $("#selbox").val()==2){
			$("#key").html("");
			$("#key").html("<input class='form-control mr-sm-2' type='search' placeholder='Search' aria-label='Search' id='keyword' name='keyword'>");
		}
		if($("#selbox").val()==3){
			$("#key").html("");
			$("#key").html("<select class='custom-select' name='selstatus' id='selstatus'>"
					+"<option value='N'>미승인</option>"
					+"<option value='Y'>승인</option>"
					+"<option value='W'>경고</option></select>");
		}
	});
});

function search(){
	var selectk = $("#selbox").val();
	var keyword = $("#keyword").val();
	if (selectk == "") {
		alert("카테고리를 선택하세요.");
		$("#selbox").select();
		return;
	}
	if(selectk==1 || selectk==2){
		if (keyword == "") {
			alert("검색할 문자를 입력하세요.");
			$("#keyword").select();
			return;
		}
		if(keyword != "" && selectk==1){
			selectk= "business_user_no";
		}else{
			selectk= "user_name";
		}
		location.href = "ablistselect.do?selectval="+selectk+"&keyword="+keyword;
	}
	if(selectk==3){
		var status = $("#selstatus").val()
		location.href = "ablistselect.do?selectval=status_agreement&keyword="+status;
	}
}
function detailView(data) {
	var popupX = (window.screen.width/2) - (1000/2);
	var popupY= (window.screen.height/2) - (1000/2);
	window.open('abdetailselect.do?business_user_no='+data, 'detailView',
			'width=1000,height=880, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
}
</script>
</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<c:import url="../../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_buserM_h">기업회원 관리</h4>
		<div id="js_buserM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="50px;">No</th>
						<th scope="col" width="100px;">기업번호</th>
						<th scope="col" width="300px;">상호</th>
						<th scope="col" width="300px;">이름</th>
						<th scope="col" width="100px;">신청일자</th>
						<th scope="col" width="100px;">처리일자</th>
						<th scope="col" width="100px;">P</th>
						<th scope="col" width="100px;">승인상태</th>
						<th scope="col" width="100px;">회원등급</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${blist }" var="b" varStatus="status">
						<tr>
						<td><c:out value="${status.count}" /></td>
							<td><a href="javascript:detailView(${b.business_user_no });">${b.business_user_no }</a></td>
							<td>${b.office_name }</td>
							<td>${b.user_name }</td>
							<td>${b.join_date }</td>
							<td>${b.update_date }</td>
							<td><c:if test="${b.premium_status == 'N'}">
								미가입
							</c:if> <c:if test="${b.premium_status == 'Y'}">
								가입
							</c:if></td>
							<td id="status">
								<c:if test="${b.status_agreement == 'N'}">
									<p style="color: blue; margin:0;">미승인</p>
								</c:if> <c:if test="${b.status_agreement == 'Y'}">
									<p style="color: green; margin:0;">승인</p>
								</c:if> <c:if test="${b.status_agreement == 'W'}">
									<p style="color: orange; margin:0;">경고</p>
								</c:if>
							</td>
							<td>
								<c:if test="${b.user_status == 0}">
									전체이용가능
								</c:if>
								<c:if test="${b.user_status == 1}">
									부동산 블랙
								</c:if>
								<c:if test="${b.user_status == 2}">
									인테리어 블랙
								</c:if>
								<c:if test="${b.user_status == 3}">
									채팅 블랙
								</c:if>
								<c:if test="${b.user_status == 4}">
									부동산/인테리어 블랙
								</c:if>
								<c:if test="${b.user_status == 5}">
									인테리어/채팅 블랙
								</c:if>
								<c:if test="${b.user_status == 6}">
									부동산/채팅 블랙
								</c:if>
								<c:if test="${b.user_status == 7}">
									전체 블랙
								</c:if>
								<c:if test="${b.user_status == 8}">
									탈퇴
								</c:if>
								<c:if test="${b.user_status == 9}">
									경고(부동산블랙)
								</c:if>
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-sm" style="margin: 0 auto; padding: 0px;">
				<div class="row" style="margin: 0 auto;">
				<select class="custom-select" name="selbox" id="selbox" style="width:110px;">
					<option value="">선택</option>
					<option value="1">기업번호</option>
					<option value="2">이름</option>
					<option value="3">상태</option>
				</select>
				<div class="col" id="key" style="max-width: 200px; margin: 0 auto; padding: 0px;">
				<input class="form-control mr-sm-2" type="search"
					placeholder="Search" aria-label="Search" id="keyword"
					name="keyword">
				</div>
				</div>
			</div>
			<div class="col-sm" style="margin: 0 auto; padding: 0px;">
				<div class="row" style="margin: 0 auto;">
				<button class="btn btn-info btn" onclick="search()">검색</button>
				<a class="dropdown-item" href="ablistselect.do?"
					style="width: 20px;">reset</a>
				</div>
			</div>
			<div class="col-sm">
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
			<div class="col-sm" align="right">
				<button class="btn btn-dark" onclick="history.go(-1);">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>