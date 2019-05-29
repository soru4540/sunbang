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
#js_userM_tb {
	min-height: 600px;
	text-align: center;
	text-overflow: ellipsis;
	white-space: nowrap;
	overflow-x: auto;
}

#js_userM_h {
	margin-top: 60px;
	margin-bottom: 30px;
	text-align: center;
}
#reason{
	overflow: hidden;
	text-overflow: ellipsis;
	white-space: nowrap;
	max-width:300px;
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
			var str = "<select class='custom-select' name='selstatus' id='selstatus' style='width: 200px;'>"
				+"<option value='0'>전체이용가능</option>"
				+"<option value='1'>부동산 블랙</option>"
				+"<option value='2'>인테리어 블랙</option>"
				+"<option value='3'>채팅 블랙</option>"
				+"<option value='4'>부동산/인테리어 블랙</option>"
				+"<option value='5'>인테리어/채팅 블랙</option>"
				+"<option value='6'>부동산/채팅 블랙</option>"
				+"<option value='7'>전체 블랙</option>"
				+"<option value='8'>탈퇴</option>"
				+"<option value='9'>경고(부동산블랙)</option></select>";
			
			$("#key").html("");
			$("#key").html(str);
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
			selectk= "user_id";
		}else{
			selectk= "user_name";
		}
		location.href = "aulistselect.do?selectval="+selectk+"&keyword="+keyword;
	}
	if(selectk==3){
		var status = $("#selstatus").val()
		location.href = "aulistselect.do?selectval=user_status&keyword="+status;
	}
}

function detailView(data) {
	var popupX = (window.screen.width/2) - (1000/2);
	var popupY= (window.screen.height/2) - (1000/2);
	window.open('audetailselect.do?user_id='+data, 'detailView',
			'width=1000,height=880, left='+ popupX + ', top='+ popupY + ', screenX='+ popupX + ', screenY= '+ popupY+',scrollbars=no');
}

function text(data){
	var reason = "";
	if($("#reason"+data).text() != ""){
		reason = $("#reason"+data).text();
	}
	$("#reason"+data).html("");
	$("#reason"+data).html("<input type='text'class='form-control' id='text"+
			data+"' name='title' value='"+reason+"'>");
	var btn1 = document.getElementById("btn1"+data);
	btn1.type= "hidden";
	var btn2 = document.getElementById("btn2"+data);
	btn2.type= "button";
}
function update(data){
	var reason = $("#text"+data).val();
	console.log(reason);
	location.href="aurupdate.do?user_no="+data+"&reason="+reason;
}

function user_delete(data){
	var reason = $("#text"+data).val();
	location.href="audelete.do?user_no="+data+"&reason="+reason;
}
</script>
</head>
<body>
	<c:import url="../../common/realtyHeader.jsp"></c:import>
	<c:import url="../../common/adminHeader.jsp"></c:import>
	<div class="container" style="min-height: 960px;">
		<h4 id="js_userM_h">회원 관리</h4>
		<div id="js_userM_tb">
			<table class="table table-sm">
				<thead>
					<tr>
						<th scope="col" width="50px;">No</th>
						<th scope="col" width="80px;">회원번호</th>
						<th scope="col" width="150px;">ID</th>
						<th scope="col" width="150px;">이름</th>
						<th scope="col" width="100px;">가입일자</th>
						<th scope="col" width="100px;">수정일자</th>
						<th scope="col" width="200px;">상태</th>
						<th scope="col" width="300px;">사유</th>
						<th scope="col"></th>
					</tr>
				</thead>
				<tbody>
					<c:forEach items="${ulist }" var="u" varStatus="status">
						<tr>
							<td><c:out value="${status.count}" /></td>
							<td><a href="#" onclick="detailView('${u.user_id }')">${u.user_no }</a></td>
							<td>${u.user_id }</td>
							<td>${u.user_name }</td>
							<td>${u.join_date }</td>
							<td>${u.update_date }</td>
							<td id="status">
							<c:if test="${u.user_status == 0}">
									전체이용가능
								</c:if>
								<c:if test="${u.user_status == 1}">
									부동산 블랙
								</c:if>
								<c:if test="${u.user_status == 2}">
									인테리어 블랙
								</c:if>
								<c:if test="${u.user_status == 3}">
									채팅 블랙
								</c:if>
								<c:if test="${u.user_status == 4}">
									부동산/인테리어 블랙
								</c:if>
								<c:if test="${u.user_status == 5}">
									인테리어/채팅 블랙
								</c:if>
								<c:if test="${u.user_status == 6}">
									부동산/채팅 블랙
								</c:if>
								<c:if test="${u.user_status == 7}">
									전체 블랙
								</c:if>
								<c:if test="${u.user_status == 8}">
									탈퇴
								</c:if>
								<c:if test="${u.user_status == 9}">
									경고(부동산블랙)
								</c:if>
							</td>
							<td id="reason"><a id="reason${u.user_no }">${u.reason_leave }</a></td>
							<td><input type="button" class="btn btn-info btn-sm"
								value="수정" id="btn1${u.user_no }" onclick="text(${u.user_no })">
								<input type="hidden" class="btn btn-primary btn-sm" value="저장"
								id="btn2${u.user_no }" onclick="update(${u.user_no })">
							</td>
						</tr>
					</c:forEach>
				</tbody>
			</table>
		</div>
		<div class="row">
			<div class="col-sm" style="margin: 0 auto; padding: 0px;">
				<div class="row" style="margin: 0 auto; width: 420px;">
					<select class="custom-select" name="selbox" id="selbox"
						style="width: 110px;">
						<option value="">선택</option>
						<option value="1">아이디</option>
						<option value="2">이름</option>
						<option value="3">상태</option>
					</select>
					<div class="col" id="key"
						style="max-width: 200px; min-width: 200px; margin: 0 auto; padding: 0px;">
						<input class="form-control mr-sm-2" type="search"
							placeholder="Search" aria-label="Search" id="keyword"
							name="keyword">
					</div>
					<button class="btn btn-info btn" onclick="search()">검색</button>
					<a class="dropdown-item" href="aulistselect.do?"
						style="width: 20px;">reset</a>
				</div>
			</div>
			<div class="col-sm">
				<nav aria-label="Page navigation example">
					<ul class="pagination" style="float: right;">
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
				<button class="btn btn-dark" onclick="location.href='auhlistselect.do'">관리자페이지로</button>
			</div>
		</div>
	</div>
	<c:import url="../../common/footer.jsp"></c:import>
</body>
</html>