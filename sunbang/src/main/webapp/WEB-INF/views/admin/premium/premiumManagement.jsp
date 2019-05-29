<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<style type="text/css">
#js_primiumM_tb {
	min-height: 600px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
}

#js_primiumM_h {
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
				console.log("3");
				$("#key").html("");
				$("#key").html("<select class='custom-select' name='selstatus' id='selstatus'><option value='using'>이용중</option><option value='expire'>이용만료</option></select>");
			}
		});
	});
	function detailView(data) {
		var popupX = (window.screen.width/2) - (1000/2);
		var popupY= (window.screen.height/2) - (900/2);
		window.open('abdetailselect.do?business_user_no='+data, 'detailView',
				'width=1000,height=860, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
	};
	
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
				selectk= "p.business_user_no";
			}else{
				selectk= "u.user_name";
			}
			location.href = "aplistselect.do?selectval="+selectk+"&keyword="+keyword;
		}
		if(selectk==3){
			var status = $("#selstatus").val()
			location.href = "aplistselect.do?selectval=expiration_date&keyword="+status;
		}
	}
</script>
</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<c:import url="../../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_primiumM_h">프리미엄 서비스 결제 내역</h4>
		<div id="js_primiumM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="60px;">가입번호</th>
						<th scope="col" width="400px;">기업회원번호</th>
						<th scope="col" width="200px;">이름</th>
						<th scope="col" width="400px;">상호</th>
						<th scope="col" width="200px;">결제일자</th>
						<th scope="col" width="200px;">만료일</th>
						<th scope="col" width="100px;">이용가능일수</th>
						<th scope="col" width="300px;">상태</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${plist }" var="p">
						<tr>
							<th scope="row">${ p.charge_no }</th>
							<td><a
								href="javascript:detailView(${ p.business_user_no });">${ p.business_user_no }</a>
							</td>
							<td>${ p.user_name }</td>
							<td>${ p.office_name }</td>
							<td>${ p.charge_date }</td>
							<td>${ p.expiration_date }</td>
							<c:set var="now" value="<%=new java.util.Date()%>" />
							<fmt:parseNumber
								value="${p.expiration_date.time / (1000*60*60*24)}"
								integerOnly="true" var="exdate"></fmt:parseNumber>
							<fmt:parseNumber value="${now.time / (1000*60*60*24)}"
								integerOnly="true" var="date"></fmt:parseNumber>
							<c:set var="dday" value="${(exdate - date)+1}" />
							<c:if test="${ dday < 0 }">
								<td>-</td>
								<c:if test="${ p.charged_status == '결제완료' }">
								<td><a style="color: #dc3545">이용만료</a></td>
								</c:if>
								<c:if test="${ p.charged_status == '환불처리' }">
								<td><a style="color: blue">환불처리</a></td>
								</c:if>
							</c:if>
							<c:if test="${ dday >= 0 }">
								<td>${dday}</td>
								<td><a style="color: #28a745">이용중</a></td>
							</c:if>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-sm" style="margin: 0 auto; padding: 0px;">
				<div class="row" style="margin: 0 auto;">
					<select class="custom-select" name="selbox" id="selbox"
						style="width: 110px;">
						<option value="">선택</option>
						<option value="1">기업번호</option>
						<option value="2">이름</option>
						<option value="3">상태</option>
					</select>
					<div class="col" id="key"
						style="max-width: 200px; margin: 0 auto; padding: 0px;">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search" id="keyword"
							name="keyword">
					</div>
				</div>
			</div>
			<div class="col-sm" style="margin: 0 auto; padding: 0px;">
				<div class="row" style="margin: 0 auto;">
				<button class="btn btn-info btn" onclick="search()">검색</button>
				<a class="dropdown-item" href="aplistselect.do?"
					style="width: 20px;">reset</a>
				</div>
			</div>
			<div class="col">
				<nav aria-label="Page navigation example">
					<ul class="pagination">
						<c:if test="${ page.page <= 1 }">
							<li class="page-item"><span aria-hidden="true"
								class="page-link">&laquo;&laquo;</span>&nbsp;</li>
						</c:if>
						<c:if test="${ page.page > 1 }">
							<c:url var="pli" value="aplistselect.do?">
								<c:param name="page" value="1" />
							</c:url>
							<li class="page-item"><a class="page-link" href="${ pli }"><span
									aria-hidden="true">&laquo;&laquo;</span></a>&nbsp;</li>
						</c:if>
						<c:if
							test="${ page.page - 10 < page.startpage and page.page - 10 > 1 }">
							<c:url var="pli" value="aplistselect.do?">
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
									<c:url var="psearchbno" value="aplistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchbno }">${ p }</a></li>
								</c:if>
								<c:if test="${!empty selectval and selectval eq 'u.user_name'}">
									<c:url var="psearchuname" value="aplistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchuname }">${ p }</a></li>
								</c:if>
								<c:if
									test="${!empty selectval and selectval eq 'expiration_date'}">
									<c:url var="psearchedate" value="aplistselect.do?">
										<c:param name="selectval" value="${ selectval }" />
										<c:param name="keyword" value="${ keyword }" />
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ psearchedate }">${ p }</a></li>
								</c:if>
								<c:if test="${empty search}">
									<c:url var="psearch" value="aplistselect.do?">
										<c:param name="page" value="${ p }" />
									</c:url>
									<li class="page-item"><a class="page-link"
										href="${ blist }">${ p }</a></li>
								</c:if>
							</c:if>
						</c:forEach>
						<c:if
							test="${page.page + 10 > page.endpage and page.page + 10 < page.maxpage}">
							<c:url var="next" value="aplistselect.do?">
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
							<c:url var="mpage" value="aplistselect.do?">
								<c:param name="page" value="${ page.maxpage }" />
							</c:url>
							<li class="page-item"><a class="page-link"
								href="${ page.maxpage }"><span aria-hidden="true">&raquo;&raquo;</span></a></li>
						</c:if>
					</ul>
				</nav>
			</div>
			<div class="col" align="right">
				<button class="btn btn-dark"
					onclick="location.href='auhlistselect.do'">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>