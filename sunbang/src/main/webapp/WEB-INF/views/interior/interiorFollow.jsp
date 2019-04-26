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
	href="${pageContext.request.contextPath }/resources/images/logo2.PNG">
<title>SUNBANG</title>
<style type="text/css">
#jb_follow_search .searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 45px;
	background-color: #ff7381;
	border-radius: 30px;
	padding: 10px;
}

#jb_follow_search .search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 25px;
	transition: width 0.4s linear;
}

#jb_follow_search .searchbar:hover>.search_input {
	padding: 0 10px;
	width: 220px;
	transition: width 0.4s linear;
}

#jb_follow_search .searchbar:hover>.search_icon {
	background: white;
	color: #ffb6b9;
}

#jb_follow_search .search_icon {
	height: 25px;
	width: 25px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
}

.jb_follow_profile img {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}

.jb_follow_nickname {
	line-height: 2;
	font-size: 15px;
	font-family: a고딕14;
}
#jb_follow_myprofile{
font-size: 30px; font-family: a고딕14;
}

@media screen and (max-width: 700px) {

	#jb_follow_myprofile {
		font-size: 23px;
	}
	
	}
	
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<br>

	<script type="text/javascript">
		$(function() {

			$("#jb_follow_list2").css("display", "none");

			$("#jb_follow_btn1").click(function() {
				$(".jb_follow_list").css("display", "none");
				$("#jb_follow_list1").css("display", "");
			});

			$("#jb_follow_btn2").click(function() {
				$(".jb_follow_list").css("display", "none");
				$("#jb_follow_list2").css("display", "");
			});

		});
	</script>
	<div class="container">
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<img src="${pageContext.request.contextPath }/files/interior/interiorMain/sample1.PNG" width="100%" height="380px" />
			</div>
			<div class="col-md-1"></div>
		</div>
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table">
					<tr>
						<td width="20%"  align="right">
							<div class="jb_follow_profile">
								<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
									style="width: 110px; height: 110px; border-radius: 70%;">
							</div>
						</td>
						<td style="width:80%;vertical-align: bottom;"  align="left">&nbsp;&nbsp;&nbsp;
						<span id="jb_follow_myprofile">한과장님</span>&nbsp;&nbsp;&nbsp;<span class="jb_follow_nickname" style="font-size: 22px;font-family: a고딕14;">myid485</span><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 18px;opacity:0.6;font-family: a고딕14;">팔로우 :17&nbsp;&nbsp; 팔로잉 : 28</span>
						</td>						
					</tr>
				</table>
			</div>
			<div class="col-md-1"></div>
		</div>
		<br>
		<div class="row" align="center">
			<div class="col-md-12">
				<button type="button" class="btn btn-outline-info"
					id="jb_follow_btn1">팔로우</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-info"
					id="jb_follow_btn2">팔로잉</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="jb_follow_list" id="jb_follow_list1" style="overflow:auto; height:600px;">
					<table class="table">
						<tr align="center">
							<th colspan="3" id="jb_follow_search">
								<div class="d-flex justify-content-center h-100">
									<div class="searchbar">
										<input class="search_input" type="text" name=""
											placeholder="Search..."> <a href="#"
											class="search_icon"><i class="fas fa-search"></i></a>
									</div>
								</div>
							</th>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">jsol123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">홍회장님</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">hans123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">한과장님</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">kkals123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">김칼스</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">handj123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">녕진과조장</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">hans123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">한과장님</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">kkals123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">김칼스</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">handj123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">녕진과조장</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new2.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">kkals123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">김칼스</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new3.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">handj123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">녕진과조장</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
					</table>
				</div>
				<div class="jb_follow_list" id="jb_follow_list2" style="overflow:auto; height:600px;">
					<table class="table">
						<tr align="center">
							<th colspan="3" id="jb_follow_search">
								<div class="d-flex justify-content-center h-100">
									<div class="searchbar">
										<input class="search_input" type="text" name=""
											placeholder="Search..."> <a href="#"
											class="search_icon"><i class="fas fa-search"></i></a>
									</div>
								</div>
							</th>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">hans123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">한과장님</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">kkals123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">김칼스</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">handj123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">녕진과조장</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">hans123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">한과장님</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
							<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">kkals123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">김칼스</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
						<tr align="center">
								<td width="33%">
								<div class="jb_follow_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG">&nbsp;&nbsp;&nbsp;<span
										style="font-size:22px; font-family: a고딕14;">handj123</span>
								</div>
							</td>
							<td width="33%" style="vertical-align: middle;"><span class="jb_follow_nickname">녕진과조장</span>
							</td>
							<td width="33%" style="vertical-align: middle;">
								<button type="button" class="btn btn-outline-danger">X</button>
							</td>
						</tr>
					</table>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>