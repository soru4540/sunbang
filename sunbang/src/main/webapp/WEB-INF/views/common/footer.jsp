<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title></title>
</head>
<body style="max-height: 376px;">
	<!-- Footer -->
	<footer class="page-footer font-small mdb-color lighten-3 pt-4"
		style="background-color: #fafafa">

		<!-- Footer Links -->
		<div class="container text-center text-md-left">

			<!-- Grid row -->
			<div class="row">

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 mr-auto my-md-4 my-0 mt-4 mb-1">

					<!-- Content -->
					<h5 class="font-weight-bold text-uppercase mb-4">About SUNBANG</h5>
					<p style="font-family: a고딕13; margin-right:auto! important;" >우리는 원탑 부동산&인테리어 플랫폼 ‘선방’을 통해 집을 선택하고, 꾸미는 방식까지 새롭게 정의합니다. 이를 통해 누구나
						쉽고 재미있게 자신의 공간을 만들어가는 문화가 널리 퍼지기를 꿈꿉니다.</p>

				</div>
				<!-- Grid column -->

				<hr class="clearfix w-100 d-md-none">

				<!-- Grid column -->
				<div class="col-md-2 col-lg-2 mx-auto my-md-4 my-0 mt-4 mb-1">

					<!-- Links -->
					<h5 class="font-weight-bold text-uppercase mb-4">About</h5>

					<ul class="list-unstyled">
						<li>
							<p>
								<a href="project.do">PROJECTS</a>
							</p>
						</li>
						<li>
							<p>
								<a href="aboutus.do">ABOUT US</a>
							</p>
						</li>
						<li>
							<p>
								<c:if test="${0 ne loginUser.user_no && !empty loginUser}"><a href="cmyview.do?user_no=${loginUser.user_no }">유저신고</a></c:if>
							</p>
						</li>
					</ul>

				</div>
				<!-- Grid column -->

				<hr class="clearfix w-100 d-md-none">

				<!-- Grid column -->
				<div class="col-md-4 col-lg-3 mx-auto my-md-4 my-0 mt-4 mb-1">

					<!-- Contact details -->
					<h5 class="font-weight-bold text-uppercase mb-4">Address</h5>

					<ul class="list-unstyled">
						<li>
							<p>
								<i class="fas fa-home mr-3"></i>Seoul, Republic of Korea
							</p>
						</li>
						<li>
							<p>
								<i class="fas fa-envelope mr-3"></i> sunbangFamily@kh.com
							</p>
						</li>
						<li>
							<p>
								<i class="fas fa-phone mr-3"></i> + 01 234 567 88
							</p>
						</li>
						<li>
							<p>
								<i class="fas fa-print mr-3"></i> + 01 234 567 89
							</p>
						</li>
					</ul>
				</div>
			</div>
			<!-- Footer Links -->

			<!-- Copyright -->
			<div class="footer-copyright text-center py-3">
				© 2019 Copyright: <a href="/sunbang/index.jsp"> Sunbang.com</a>
			</div>
			<!-- Copyright -->
		</div>
	</footer>
	<!-- Footer -->
</body>
</html>