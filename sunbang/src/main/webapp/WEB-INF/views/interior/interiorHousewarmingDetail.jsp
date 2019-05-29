<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon"
	href="${pageContext.request.contextPath}/resources/images/logo2.PNG">
<title>SUNBANG</title>
<script type="text/javascript"
	src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>

<!-- 맨위로 -->
<script type="text/javascript">
	$(function() {
		$("#sh_top").click(function() {
			var offset = $('html').offset();
			$("html, body").animate({
				scrollTop : offset.top
			}, 500);
		});
	});
</script>
<!-- 신고하기 -->
<script type="text/javascript">
	$(function() {

		var report = new Object();
		report.contents_no=${houseWList[0].board_no};
		report.user_no=${loginUser.user_no};
		$.ajax({
			url : "rkcheck.do",
			type : "post",
			data : JSON.stringify(report),
			contentType : "application/json; charset=utf-8",
			success : function(result) {
				if (result == 0) {
					$("#sh_report").unbind('click', false);
				} else {
					$("#sh_report").bind('click', false);
					$("#sh_report").click(function() {
						alert("이미 신고하신 게시물입니다.");
					});
				}
			}
		});

		$("#sh_rrinsert_btn").click(function() {
			//신고내용 <br>로 변환
			var str = $("#sh_rreportcontent").val();
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("#sh_rreportcontent").val(str);

			var report = new Object();
			report.category = $("#sh_rdelete_category").val();
			report.contents_no = ${houseWList[0].board_no}
			;
			report.contents = $("#sh_rreportcontent").val();
			report.user_no = ${loginUser.user_no};

			$.ajax({
				url : "rkinsert.do",
				type : "post",
				data : JSON.stringify(report),
				contentType : "application/json; charset=utf-8",
				success : function(result) {
					if (result == 1) {
						alert("신고가 완료되었습니다.");
						$("#sh_report").bind('click', false);
						$("#sh_report").click(function() {
							alert("이미 신고하신 게시물입니다.");
						});
					}
				}
			});
		});
	});
</script>
<!-- 수정하기 -->
<script type="text/javascript">
	$(function() {
		$("#sh_housewarming_update_btn").click(function() {
			location.href = "ibupdateview.do?board_no=" + ${houseWList[0].board_no};
		});
	});
</script>
<!-- 삭제하기 -->
<script type="text/javascript">
	$(function() {
		$("#housewarming_allDelete_btn")
				.click(
						function() {
							if (confirm("삭제하시겠습니까?")) {
								document.form1.action = "${pageContext.request.contextPath}/intrior/ibdelete.do";
								document.form1.submit();
							}
						});
	});
</script>
<!-- 좋아요 -->
<script type="text/javascript">
	$(function() {
		var user_no = ${loginUser.user_no};
		var board_no = ${houseWList[0].board_no};

		$.ajax({
			url : "ilcheck.do",
			data : {
				user_no : user_no,
				board_no : board_no
			},
			type : "post",
			success : function(result) {
				if (result == 0) {
					$("#sh_like_btn").css("background-color", "white");
					$("#sh_like_btn").css("color", "#ff9198");
					$("#sh_like").val(0);
				} else {
					$("#sh_like_btn").css("background-color", "#ff9198");
					$("#sh_like_btn").css("color", "white");
					$("#sh_like").val(1);
				}
			}
		});

		//버튼 클릭 이벤트
		$("#sh_like_btn").click(function() {
			if ($("#sh_like").val() == 0) { //좋아요 하지 않았을 때
				$.ajax({
					url : "ilinsert.do",
					data : {
						user_no : user_no,
						board_no : board_no
					},
					type : "post",
					success : function() {
						$("#sh_like_btn").css("background-color", "#ff9198");
						$("#sh_like_btn").css("color", "white");
						$("#sh_like").val(1);
					}
				});

			} else { //좋아요 했을 때
				$.ajax({
					url : "ildelete.do",
					data : {
						user_no : user_no,
						board_no : board_no
					},
					type : "post",
					success : function() {
						$("#sh_like_btn").css("background-color", "white");
						$("#sh_like_btn").css("color", "#ff9198");
						$("#sh_like").val(0);
					}
				});
			}
		});
	});
</script>
<!-- 팔로우 -->
<script type="text/javascript">
	$(function() {
		/* if (loginUser != empty) { */
			var user_no = ${loginUser.user_no};
			var follower_no = ${houseWList[0].user_no};
		/* } */
		$.ajax({
			url : "ifcheck.do",
			data : {
				user_no : user_no,
				follower_no : follower_no
			},
			type : "post",
			success : function(result) {
				if (result == 0) {
					$("#sh_follow_btn").css("background-color", "white");
					$("#sh_follow_btn").css("color", "#61C0BF");
					$("#sh_follow").val(0);
					$("#sh_follow_btn").html("팔로우");
				} else {
					$("#sh_follow_btn").css("background-color", "#61C0BF");
					$("#sh_follow_btn").css("color", "white");
					$("#sh_follow").val(1);
					$("#sh_follow_btn").html("팔로잉");
				}
			}
		});

		$("#sh_follow_btn").click(function() {
			if ($("#sh_follow").val() == 0) {
				$.ajax({
					url : "ifinsert.do",
					data : {
						user_no : user_no,
						follower_no : follower_no
					},
					type : "post",
					success : function() {
						$("#sh_follow_btn").css("background-color", "#61C0BF");
						$("#sh_follow_btn").css("color", "white");
						$("#sh_follow").val(1);
						$("#sh_follow_btn").html("팔로잉");
					}
				});
			} else {
				$.ajax({
					url : "ifdelete.do",
					data : {
						user_no : user_no,
						follower_no : follower_no
					},
					type : "post",
					success : function() {
						$("#sh_follow_btn").css("background-color", "white");
						$("#sh_follow_btn").css("color", "#61C0BF");
						$("#sh_follow").val(0);
						$("#sh_follow_btn").html("팔로우");
					}
				});
			}
		});
	});
</script>

<style type="text/css">
#sh_top {
	width: 100%;
	height: 30px;
	color: grey;
	background-color: #f2f2f2;
	text-align: center;
	margin: 2px;
	cursor: pointer;
}

@media screen and (min-width: 800px) {
	#sh_top {
		position: fixed;
		top: 90%;
		left: 90%;
		width: 5%;
		color: grey;
		background-color: #f2f2f2;
		border-color: #bee5eb;
		border-radius: 5px;
		padding: 2px;
	}
}

#sh_sidebar {
	padding: 10px;
	font-family: a고딕11; //
	background-color: #f2f2f2;
}

@media screen and (min-width: 800px) {
	#sh_sidebar {
		width: 16%;
		padding: 2px;
		height: 300px;
		position: fixed;
	}
}

#sh_category {
	font-weight: bold;
	font-size: large;
}

#sh_boardhits {
	float:left;
	font-weight: normal;
	color: grey;
}

#sh_report {
	float: right;
	font-size: 15px;
	color: #b30000;
	font-weight: normal;
	cursor: pointer;
}

#sh_rreportcontent {
	width: 100%;
	border: 1px solid #ced4da;
	border-radius: 4px;
}

#sh_board_date {
	font-size: small;
	color: grey;
}

#sh_user_profile {
	width: 50px;
	height: 50px;
	font-size: large;
}

#sh_user_profile img {
	width: 50px;
	height: 50px;
	border-radius: 50%;
}

#sh_like_btn {
	width: 100%;
	color: #ff9198;
	background-color: white;
	border: 1px solid #ff9198;
	border-radius: 4px;
	padding: 5px;
	margin: 5px;
}

#sh_like_btn:hover {
	color: white;
	background-color: #ff9198;
}

#sh_follow_btn {
	width: 100%;
	color: #61C0BF;
	background-color: white;
	border: 1px solid #61C0BF;
	border-radius: 4px;
	padding: 5px;
	margin: 5px;
}

#sh_follow_btn:hover {
	color: white;
	background-color: #61C0BF;
}

#sh_needlogin {
	width: 100%;
	color: white;
	background-color: #ff9198;
	border: 1px solid #ff9198;
	border-radius: 4px;
	padding: 5px;
	margin: 5px;
	text-align: center;
}

#sh_needlogin a {
	text-decoration: none;
	color: white;
}

#sh_housewarming_update_btn {
	width: 100%;
	color: white;
	background-color: #ff9198;
	border: 1px solid #ff9198;
	border-radius: 4px;
	padding: 5px;
	margin: 5px;
	text-align: center;
}

#sh_housewarming_content {
	width: 100%;
	font-family: a고딕10;
}

#sh_housewarming_content p {
	font-weight: bold;
}

#sh_housewarming_content img {
	width: 100%;
	border-radius: 5px;
}

#sh_housewarming_content button {
	width: 100%;
	color: white;
	background-color: #ff9198;
	border: 1px solid #ff9198;
	border-radius: 4px;
	padding: 5px;
}

.sh_housewarming_content_btn {
	width: 50%;
	margin: auto;
}

#housewarming_allDelete_btn {
	width: 100%;
	color: white;
	background-color: #ff9198;
	border: 1px solid #ff9198;
	border-radius: 4px;
	padding: 5px;
	margin: 5px;
	text-align: center;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<form name="form1">
		<div class="container">
			<div class="row">
				<div class="col-md-12">
					<div class="row">
						<div class="col-md-3">
							<div class="row" id="sh_sidebar">
								<!-- sidebar -->
								<div class="col-md-12">
									<br>
									<p id="sh_category" name="category">
										<c:if test="${not empty houseWList[0].housing_type }">
								${houseWList[0].housing_type }  
								</c:if>
										<c:if test="${not empty houseWList[0].floor_area }">
								/ ${houseWList[0].floor_area }  평  
								</c:if>
									</p><hr>
									<span id="sh_boardhits">조회수 : ${houseWList[0].board_hits }</span>
									<c:if test="${not empty loginUser }">
										<a data-toggle="modal" data-target="#sh_reportModal"
											id="sh_report">신고 <i class="far fa-angry"></i></a>
										<br>
									</c:if>
									<br>
									<p id="sh_board_title" name="board_title">
										제목<br>${houseWList[0].board_title }</p>
									<span id="sh_user_profile"> <img
										src="${pageContext.request.contextPath }/files/user/userImages/${houseWList[0].user_profile }">&nbsp;
										${houseWList[0].nickname }
									</span> <br> <br>
									<p id="sh_board_date" name="board_date">
										<fmt:formatDate value="${houseWList[0].board_date }"
											pattern="yyyy.MM.dd (E)" />
									</p>
									<div class="row">
										<c:if test="${empty loginUser }">
											<div id="sh_needlogin">
												<a href="uloginview.do">로그인이 필요한 서비스입니다.</a>
											</div>
										</c:if>
										<c:if test="${loginUser.user_no == houseWList[0].user_no}">
											<button type="button" id="sh_like_btn">
												<i class="far fa-heart"></i> 좋아요
											</button>
											<input type="button" id="sh_housewarming_update_btn"
												value="수정">
											<input type="button" id="housewarming_allDelete_btn"
												value="삭제">
										</c:if>
										<div class="col-md-6">
											<input type="hidden" value="0" id="sh_like">
											<c:if
												test="${not empty loginUser && loginUser.user_no != houseWList[0].user_no}">
												<button type="button" id="sh_like_btn">
													<i class="far fa-heart"></i> 좋아요
												</button>
											</c:if>
										</div>
										<div class="col-md-6">
											<input type="hidden" value="0" id="sh_follow">
											<c:if
												test="${not empty loginUser && loginUser.user_no != houseWList[0].user_no}">
												<button type="button" id="sh_follow_btn">팔로우</button>
											</c:if>
										</div>
									</div>
									<br> <br>
								</div>
							</div>
							<!-- sidebar -->
							<!-- The Modal -->
							<div class="modal fade" id="sh_reportModal">
								<div
									class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
									<div class="modal-content">

										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">사진 신고</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>

										<!-- Modal body -->
										<div class="modal-body">
											<p style="color: #006080">부적절한 게시글에 대해 신고해주세요!</p>
											<p>
												확인 후 부적절한 글일 경우 해당 글은 삭제되며 글쓴이의 이용이 제재됩니다. <br> 허위신고일 시
												신고자는 이용이 제재될 수 있습니다. <br>
											<h5>신고 카테고리</h5>
											<select class="custom-select" id="sh_rdelete_category">
												<option value=기타 style="color: grey">삭제사유 선택</option>
												<option value="허위글">허위글</option>
												<option value="사진도용">사진도용</option>
												<option value="광고">광고</option>
												<option value="부적절">부적절한 게시물</option>
												<option value="기타">기타</option>
											</select><br> <br>

											<h5>신고내용</h5>
											<hr>
											<textarea rows="20" cols="20" id="sh_rreportcontent"
												placeholder="신고 사유를 작성해주세요"></textarea>
										</div>

										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="button" id="sh_rrinsert_btn"
												class="btn btn-secondary" data-dismiss="modal">제출</button>
										</div>
									</div>
								</div>
							</div>
							<!-- modal 끝 -->
						</div>
						<div class="col-md-9" id="sh_housewarming_content">
							<br>
							<c:forEach items="${houseWList }" var="houseWList"
								varStatus="status">
								<c:if test="${houseWList.post_keyword == 'cover' }">
									<img
										src="${pageContext.request.contextPath }/files/interior/interiorBoard/${houseWList.post_data }">
									<br>
									<br>
									<a id="housewarming_text${status.index }">${houseWList.post_contents }</a>
									<br>
									<br>
								</c:if>
							</c:forEach>													
							<div class="text" style="margin-left: 20px; color: gray;">
								ⓒ<c:if test="${not empty houseWList[0].nickname}">${houseWList[0].nickname }</c:if></div>
							<br>
							<table class="table" style="width: 50%; margin-left: 10px;">
								<tbody>
									<tr>
										<th style="width: 20%;">주거형태</th>										
										<td style="width: 80%;"><c:if test="${not empty houseWList[0].housing_type }">${houseWList[0].housing_type }</c:if></td>										
									</tr>
									<tr>
										<th>평수</th>										
										<td><c:if test="${not empty houseWList[0].floor_area }">${houseWList[0].floor_area }</c:if> 평</td>										
									</tr>
									<tr>
										<th>예산</th>										
										<td><c:if test="${not empty houseWList[0].budget }">${houseWList[0].budget }</c:if> 원</td>										
									</tr>
									<tr>
										<th>스타일</th>										
										<td><c:if test="${not empty houseWList[0].style }">${houseWList[0].style }</c:if></td>										
									</tr>
									<tr>
										<th></th>
										<td></td>
									</tr>
								</tbody>
							</table>
							<hr>
							<br>
							<c:forEach items="${houseWList }" var="houseWList"
								varStatus="status">
								<c:if test="${houseWList.post_keyword == 'photo' }">
									<img
										src="${pageContext.request.contextPath }/files/interior/interiorBoard/${houseWList.post_data }">
									<br>
									<br>
									<a id="housewarming_text${status.index }">${houseWList.post_contents }</a>
									<br>
									<br>
								</c:if>

								<c:if test="${houseWList.post_keyword == 'video' }">
									<!-- 동영상 주소 변환 watch?v=  ->  embed/ -->
									<script type="text/javascript">
										$(function() {
											var address = "${houseWList.post_data}";
											address = address.replace(
													'watch?v=', 'embed/');
											$(
													"#sh_transAddress${status.index }")
													.attr("src", address);
										});
									</script>
									<br>
									<br>
									<iframe id="sh_transAddress${status.index }" width="100%"
										height="500px" frameborder="0" allowfullscreen></iframe>
									<br>
									<br>
									<a id="housewarming_text${status.index }">${houseWList.post_contents }</a>
									<br>
									<br>
								</c:if>
							</c:forEach>
							<br> <br> <br> <br> <br> <br> <br>
							<hr style="border: 1px solid lightgray;">
							<br> <br>
							<!-- 댓글창 -->
							<section class="replyForm">
								<div class="form_horizontal">
									<div class="form-group">
										<label for="writer" class="col-sm-2 control-label">작성자</label>
										<div class="col-sm-12">
											<input type="text" id="writer" name="writer"
												class="form-control" />
										</div>
									</div>

									<div class="form-group">
										<label for="content" class="col-sm-2 control-label">댓글내용</label>
										<div class="col-sm-12">
											<textarea id="content" name="content" class="form-control"></textarea>
										</div>
									</div>

									<div class="form-group">
										<div class="col-sm-offset-2 col-sm-12">
											<button type="button" class="repSubmit btn btn-success">작성</button>
										</div>
										<script type="text/javascript">
											var formObj = $(".replyForm form[role='form']");

											$(".repSubmit").click(
													function() {
														formObj.attr("action",
																"replyWrite");
														formObj.submit();
													});
										</script>
									</div>
								</div>
							</section>
							<!-- 댓글창 fin -->
							<br> <br> <br> <br> <br> <br> <br>
						</div>
					</div>
				</div>
			</div>
			<div class="row" id="sh_top">
				<div class="col-md-12">
					<i class="fas fa-angle-double-up"></i>
				</div>
			</div>

		</div>
	</form>
	<c:import url="../common/footer.jsp" />
</body>
</html>