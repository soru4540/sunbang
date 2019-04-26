<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body>
	<nav class="navbar navbar-expand-lg navbar-light bg-light">
		<a class="navbar-brand" style="font-size: 16px;" href="/sunbang/views/admin/adminPage.jsp">관리자 메뉴</a>
		<button class="navbar-toggler" type="button" data-toggle="collapse"
			data-target="#navbarNavDropdown" aria-controls="navbarNavDropdown"
			aria-expanded="false" aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarNavDropdown">
			<ul class="navbar-nav">
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle"
					href="/sunbang/views/admin/feedback.jsp" id="navbarDropdownMenuLink"
					role="button" data-toggle="dropdown" aria-haspopup="true"
					aria-expanded="false"> 신고 처리 </a>
					<div class="dropdown-menu" aria-labelledby="navbarDropdownMenuLink"
						style="top: 45px;">
						<a class="dropdown-item" href="/sunbang/views/admin/reportManagementP.jsp">부동산</a> 
						<a class="dropdown-item" href="/sunbang/views/admin/reportManagementI.jsp">인테리어</a> 
						<a class="dropdown-item" href="/sunbang/views/admin/reportManagementU.jsp">회원</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="#">1:1 상담</a></li>
				<li class="nav-item dropdown"><a
					class="nav-link dropdown-toggle" href="#"
					id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
					aria-haspopup="true" aria-expanded="false"> 기업회원 관리 </a>
					<div class="dropdown-menu" style="top: 45px;"
						aria-labelledby="navbarDropdownMenuLink">
						<a class="dropdown-item" href="/sunbang/views/admin/businessUserManagement.jsp">기업회원 관리</a> <a
							class="dropdown-item" href="/sunbang/views/admin/premiumManagement.jsp">프리미엄 결제 내역</a>
					</div></li>
				<li class="nav-item"><a class="nav-link" href="/sunbang/views/admin/nomalUserManagement.jsp">회원 관리</a></li>
			</ul>
		</div>
	</nav>
</body>
</html>