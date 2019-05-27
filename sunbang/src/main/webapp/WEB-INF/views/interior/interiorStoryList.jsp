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

#jb_story_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_story_container a:visited {
	color: #000000;
	text-decoration: none;
}

 #jb_story_container a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
} 

#jb_story_container h6 {
	font-family: a고딕15;
}

#jb_story_container h5 {
	font-family: a고딕15;
}

.jb_story_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_story_container .col-md-4 {
	height: 360px;
}

.jb_story_profile img {
	width: 140px;
	height: 140px;
	border-radius: 70%;
}

#jb_story_container #fix_con {
	position: fixed;
	width: 240px;
    z-index:1;
    background-color: #fff;
}

.jb_story_filterBtn2 {
	display: inline-block;
	font-weight: 400;	
	font-family: a고딕14;
	color: #212529;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 0px;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.textline {
width: 85%;
line-height: 40px;
outline-style: none;
  
}

.jb_story_submitBtn {
	display: inline-block;
	font-weight: 400;
	font-family: a고딕14;
	color: #212529;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: transparent;
	border: 1px solid #ff9198;
	padding: .375rem .75rem;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#jb_ireportcontent {
	width:100%;
	border: 1px solid #ced4da;
	border-radius:4px;
}

@media screen and (max-width: 1400px) {

	#jb_story_container #fix_con {
		width: auto;
		min-height: 0;
		position: relative;
		top: 0px;	
	}
	
	#jb_story_container .col-md-9{
	padding: 20px;
	margin:20px;
	}
	
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
	$(function() {
        
		//스크롤 무빙시 버튼 페이드인 페이드아웃
		$(window).scroll(function() {
			if ($(this).scrollTop() > 500) {
				$('#MOVE_TOP_BTN').fadeIn();
			} else {
				$('#MOVE_TOP_BTN').fadeOut();
			}
		});
		//클릭시 스크롤 최상단으로 이동
		$("#MOVE_TOP_BTN").click(function() {
			$('html, body').animate({
				scrollTop : 0
			}, 400);
			return false;
		});
	});
	
	//좋아요 홀수번째 클릭시 동작하는 좋아요 추가/삭제
	function changeLike1(i){	
		if($("#i_user_no").val() != 0){
		if($("#likekey"+i).val()==1){		
			$(function(){				
				$.ajax({						
					url: "ildelete.do",
					data: {user_no: $("#i_user_no").val(), board_no: $("#like"+i).val()},
					type: "post",
					success: function(){
						$("#1like"+i).css("display","none");		
						$("#2like"+i).css("display","");
						$("#likekey"+i).val(0);
					},
					error: function(){
					}
				});
	        });	
		}else if($("#likekey"+i).val()==0){			
            $(function(){
            	$.ajax({
					url: "ilinsert.do",
					data: {user_no: $("#i_user_no").val(),board_no: $("#like"+i).val()},
					type: "post",
					success: function(){
						$("#1like"+i).css("display","none");		
						$("#2like"+i).css("display","");		
						$("#likekey"+i).val(1);
					},
					error: function(){
					}
				});
			});									
		}
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
	}
	
	//좋아요 짝수번째 클릭시 동작하는 좋아요 추가/삭제
	function changeLike2(i){						
		if($("#i_user_no").val() != 0){
		if($("#likekey"+i).val()==1){					
		$(function(){
			$.ajax({
				url: "ildelete.do",
				data: {user_no: $("#i_user_no").val(),board_no: $("#like"+i).val()},
				type: "post",
				success: function(){
					$("#2like"+i).css("display","none");
					$("#1like"+i).css("display","");			
					$("#likekey"+i).val(0);
				},
				error: function(){
				}
			});
        });	
		}else if($("#likekey"+i).val()==0){						
			$(function(){					
				$.ajax({
					url: "ilinsert.do",
					data: {user_no: $("#i_user_no").val(),board_no: $("#like"+i).val()},
					type: "post",
					success: function(){
						$("#2like"+i).css("display","none");			
						$("#1like"+i).css("display","");			
						$("#likekey"+i).val(1);
					},
					error: function(){
					}
				});
			});
		}
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
	}

		var page = 1; //페이징과 같은 방식이라고 생각하면 된다. 

		$(function() { //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
			getList(page);
			page++;
		});

		$(window).scroll(
				function() { //스크롤이 일정 하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.					  
					if (page != 0) {
						if ($(window).scrollTop() + 370 >= $(document).height()
								- $(window).height()) {
							getList(page);
							page++;
						}
					}
				});

		//게시판 리스트 출력
		function getList(pagenum) {
			$
					.ajax({
						type : "post",
						dataType : "json",
						data : {
							board_type : "photograph",
							page : pagenum,
							user_no : $("#i_user_no").val()						
						},
						url : "islistselect.do",
						success : function(returnData) {

							var objStr = JSON.stringify(returnData);
							var jsonObj = JSON.parse(objStr);
							var value = $("#list").html();
							var value2 = $("#list2").html();
							if (jsonObj.end_num == jsonObj.total_num) {
								page = 0;
							}
							if (jsonObj.start_num <= jsonObj.total_num) {
								if (jsonObj.iblist.length > 0) {
									if (pagenum == 1) {
										var list_no = 0;
									} else {
										var list_no = 16 + ((pagenum - 2) * 8);
									}
									for ( var i in jsonObj.iblist) {
										value += "<div class='col-md-4'>"
												+ "<h6 align='left'>"
												+ "<i class='far fa-user-circle'></i>&nbsp;"
												+ jsonObj.iblist[i].nickname
												+ "</h6>"
												+ "<a href='#'> <img src='${pageContext.request.contextPath}/files/interior/interiorMain/"+jsonObj.iblist[i].post_data+"' class='jb_story_img'></a><br>"
												+ "<h5 align='center'>";
										var count = 0
										for ( var k in jsonObj.illist) {
											if (jsonObj.illist[k].board_no == jsonObj.iblist[i].board_no) {
												value += "<input type='hidden' id='like"+list_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='likekey"+list_no+"' value='1'><i class='fas fa-heart' id='1like"
														+ list_no
														+ "' onclick='changeLike1("
														+ list_no
														+ ");' style='color:#eb3a47;'></i>"
														+ "<i class='far fa-heart' id='2like"
														+ list_no
														+ "' onclick='changeLike2("
														+ list_no
														+ ");' style='display:none;color:black;'></i>&nbsp;&nbsp;&nbsp;&nbsp;";
												count = 1;
											}
										}
										if (count != 1) {
											value += "<input type='hidden' id='like"+list_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='likekey"+list_no+"' value='0'><i class='far fa-heart' id='1like"
													+ list_no
													+ "' onclick='changeLike1("
													+ list_no
													+ ");' value='0'></i>"
													+ "<i class='fas fa-heart' id='2like"
													+ list_no
													+ "' onclick='changeLike2("
													+ list_no
													+ ");' value='1' style='display:none;color:#eb3a47;'></i>&nbsp;&nbsp;&nbsp;&nbsp;";
										}
										value += "<a data-toggle='modal' data-target='#jb_replyModal"
												+ jsonObj.iblist[i].board_no
												+ "' id='jb_reply' onclick='openReplyModal("
												+ jsonObj.iblist[i].board_no
												+ ");'><i class='far fa-comment'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-size: large; opacity: 0.4;''>조회 : "
												+ jsonObj.iblist[i].board_hits
												+ "</span>"
												+ "</h5><h5 align='center'>"
												+ jsonObj.iblist[i].board_title
												+ "</h5></div>";
										value2 += "<div class='modal fade' id='jb_replyModal"+jsonObj.iblist[i].board_no+"'><div class='modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered'><div class='modal-content'>"
												+ "<div class='modal-header'><h4 class='modal-title'>댓글</h4><button class='close' data-dismiss='modal'>&times;</button></div>"
												+ "<div class='modal-body'><div class='row'><div class='col-md-12' id='replylist"+jsonObj.iblist[i].board_no+"'></div></div></div>"
												+ "<div class='modal-footer' id='reply"+jsonObj.iblist[i].board_no+"'><img class='mr-3' src='https://www.layoutit.com/img/sports-q-c-64-64-8.jpg' />"
												+ "<input type='text' class='textline'id='reply_contents"+jsonObj.iblist[i].board_no+"'><p style='padding-left:1.5em;'></p><input type='hidden' id='board_no"+jsonObj.iblist[i].board_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='reply_lev"+jsonObj.iblist[i].board_no+"' value='1'><input type='hidden' id='origin_reply_no"+jsonObj.iblist[i].board_no+"' value='0'>"
												+ "<input type='button' class='jb_story_submitBtn' value='전송' onclick='addReply("
												+ jsonObj.iblist[i].board_no
												+ ");'><p style='padding-left:1.5em;'></p></div></div></div></div>";
										list_no++;
									}
									$("#list").html(value);
									$("#list2").html(value2);
								}
							}
						},
						error : function() {
						}
					});
		}

		//모달 open시 동작(댓글 리스트 출력)
		function openReplyModal(e) {
			listReply(e);
		}

		//댓글 리스트 출력
		function listReply(boardnum) {
			$
					.ajax({
						type : "post",
						dataType : "json",
						data : {
							board_no : boardnum
						},
						url : "irlist.do",
						success : function(returnData) {
							var objStr = JSON.stringify(returnData);
							var jsonObj = JSON.parse(objStr);
							var value = "";
							if (jsonObj != null) {
								for ( var i in jsonObj.irlist) {

									if (jsonObj.irlist[i].reply_lev == 1) {

										if (i != 0
												&& jsonObj.irlist[i - 1].reply_lev == 2) {
											value += "</div></div>";
										}
										value += "<div class='media'><img class='mr-3' src='https://www.layoutit.com/img/sports-q-c-64-64-8.jpg' />"
												+ "<div class='media-body'><h5 class='mt-0'>"
												+ jsonObj.irlist[i].nickname
												+ "</h5>"
												+ "<h6><input type='hidden' id='reply_contents_return"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_contents+"'><div id='reply_contents_line"+jsonObj.irlist[i].reply_no+"'>"
												+ jsonObj.irlist[i].reply_contents
												+ "</div><h6><input type='hidden' id='board_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].board_no+"'><input type='hidden' id='origin_reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_no+"'>"
												+ "<input class='jb_filter_btn2' type='button' value='댓글달기' onclick='addReplyLine("
												+ jsonObj.irlist[i].reply_no
												+ ");'>";
										if (jsonObj.irlist[i].user_no == $(
												"#i_user_no").val()) {
											value += "<input class='jb_filter_btn2' type='button' value='댓글수정' onclick='changeReply("
													+ jsonObj.irlist[i].reply_no
													+ ");'><input class='jb_filter_btn2' type='button' value='댓글삭제' onclick='delReply("
													+ jsonObj.irlist[i].reply_no
													+ ");'>";
										}
									}
									if (jsonObj.irlist[i].reply_lev == 2) {
										value += "<div class='media mt-3'><a class='pr-3' href='#'><img src='https://www.layoutit.com/img/sports-q-c-64-64-2.jpg' /></a>"
												+ "<div class='media-body'><h5 class='mt-0'>"
												+ jsonObj.irlist[i].nickname
												+ "</h5>"
												+ "<h6><input type='hidden' id='reply_contents_return"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_contents+"'><div id='reply_contents_line"+jsonObj.irlist[i].reply_no+"'>"
												+ jsonObj.irlist[i].reply_contents
												+ "</div><h6><input type='hidden' id='board_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].board_no+"'><input type='hidden' id='origin_reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].origin_reply_no+"'>"
												+ "<input class='jb_filter_btn2' type='button' value='댓글달기' onclick='addReplyLine("
												+ jsonObj.irlist[i].reply_no
												+ ");'>";
										if (jsonObj.irlist[i].user_no == $(
												"#i_user_no").val()) {
											value += "<input class='jb_filter_btn2' type='button' value='댓글수정' onclick='changeReply("
													+ jsonObj.irlist[i].reply_no
													+ ");'><input class='jb_filter_btn2' type='button' value='댓글삭제' onclick='delReply("
													+ jsonObj.irlist[i].reply_no
													+ ");'></div></div>";
										} else {
											value += "</div></div>";
										}
									}

									if (i == jsonObj.irlist.length - 1) {
										value += "</div></div>";
									}
								}
								$("#replylist" + boardnum).html(value);
							}
						},
						error : function() {
						}
					});
		}

		//댓글달기 클릭시 모달하단 입력창에 해당 댓글의 댓글달기로 변환	
		function addReplyLine(e) {
			var i = $("#board_no" + e).val();
			$("#reply_lev" + i).val(2);
			$("#origin_reply_no" + i).val($("#origin_reply_no" + e).val());
		}

		//댓글추가
		function addReply(e) {
			if ($("#i_user_no").val() != 0) {
				if ($("#reply_contents" + e).val() != "") {
					$.ajax({
						type : "post",
						dataType : "json",
						data : {
							board_no : e,
							reply_lev : $("#reply_lev" + e).val(),
							origin_reply_no : $("#origin_reply_no" + e).val(),
							reply_contents : $("#reply_contents" + e).val(),
							user_no : $("#i_user_no").val()
						},
						url : "irinsert.do",
						success : function(returndata) {
							var i = returndata;
							listReply(i);
							$("#reply_lev" + i).val(1);
							$("#origin_reply_no" + i).val(0);
							$("#reply_contents" + i).val("");
						},
						error : function() {

						}
					});
				} else {
					alert("댓글을 입력해주세요!");
				}
			} else {
				alert("로그인 후 이용 가능합니다.");
			}
		}

		//댓글 삭제
		function delReply(e) {
			var i = $("#board_no" + e).val();
			$.ajax({
				type : "post",
				dataType : "json",
				data : {
					reply_no : e,
					board_no : i
				},
				url : "irdelete.do",
				success : function(returndata) {
					var i = returndata;
					listReply(i);
				},
				error : function() {

				}
			});
		}

		//댓글수정 클릭시 수정창으로 변환
		function changeReply(e) {
			value = "<input type='text' id='reply_contents_update"
					+ e
					+ "' style='width:70%'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_filter_btn3' onclick='updateReply("
					+ e
					+ ");' value='수정'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_filter_btn3' onclick='returnReply("
					+ e + ");' value='취소'>";
			$("#reply_contents_line" + e).html(value);
		}

		//댓글 수정
		function updateReply(e) {
			var i = $("#reply_contents_update" + e).val();
			if (i != "") {
				var b = $("#board_no" + e).val();
				$.ajax({
					type : "post",
					dataType : "json",
					data : {
						reply_no : e,
						reply_contents : i,
						board_no : b
					},
					url : "irupdate.do",
					success : function(returndata) {
						var i = returndata;
						listReply(i);
					},
					error : function() {

					}
				});
			} else {
				alert("수정할 내용을 입력해주세요!");
			}
		}

		//댓글 수정 취소
		function returnReply(e) {
			$("#reply_contents_line" + e).html(
					$("#reply_contents_return" + e).val());
		}
		
		//팔로우 추가
		function addFollow(e){
			if($("#i_user_no").val()!=0){
			$.ajax({
				type : "post",
				dataType : "json",
				data : {
					user_no : $("#i_user_no").val(),
					follower_no : e,				
				},
				url : "ifinsert.do",
				success : function(returndata) {
					$("#follow_btn1").css("display","none");
					$("#follow_btn2").css("display","");
				},error : function() {

				}
			});
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
		}
		
		//팔로우 취소
		function delFollow(e){
			if($("#i_user_no").val()!=0){
			$.ajax({
				type : "post",
				dataType : "json",
				data : {
					user_no : $("#i_user_no").val(),
					follower_no : e,				
				},
				url : "ifdelete.do",
				success : function(returndata) {
				$("#follow_btn2").css("display","none");
				$("#follow_btn1").css("display","");
				},
				error : function() {

				}
			});
		}else{
			alert("로그인이 필요한 서비스입니다.");
		}
		}

		function addReport(e){
			var reportcontent = $("#jb_ireportcontent").val(); 
			reportcontent = reportcontent.replace(/(?:\r\n|\r|\n)/g, '<br/>');

			$.ajax({
				url: "ireportinsert.do",
				type: "post",
				dataType : "json",
				data: {report_system: "user" ,category: $("#category").val() ,reported_board: "userid",contents_no: e ,contents: reportcontent ,user_no: $("#i_user_no").val()},			
				success: function(result){
					if(result == 1){
						alert("신고가 완료되었습니다.");					
					}
				},error: function() {
					
			 } 	
			});		
		}
		
	</script>
	<br>
	<br>
	<c:if test="${empty loginUser}">
	<input type="hidden" id="i_user_no" value="0">
	</c:if>
	<c:if test="${!empty loginUser}">
	<input type="hidden" id="i_user_no" value="${loginUser.user_no}">
	</c:if>
	<div class="container" id="jb_story_container">
		<div class="row">
			<div class="col-md-12">
				<div class="row">
					<div class="col-md-3">					 				
						    <div id="fix_con">													
								<div class="jb_story_profile">
									<img src="${pageContext.request.contextPath }/files/interior/interiorMain/profile.PNG">
								</div>
								<br>
								<a class="font-weight-bold">한서은천재짱짱뿡뿡</a> <br><a href="ifollowlist.do?user_no=1"><span
									style="font-family: a고딕14; opacity: 0.5;">팔로우 : 78 팔로잉 :
									17</span></a><br>
								<br>
								<p>미니멀 라이프를 꿈꾸는 이를 위한 수납 노하우! 글씨가 넘쳐도 자동 줄바꿈이 됐으면 하는 작은 소원이
									있다...</p>
								<br>								
									<c:if test="${checkfollow != 1}"><button type="button" class="btn btn-outline-info" id="follow_btn1" onclick="addFollow(${follower_no});">팔로우</button><button type="button" class="btn btn-outline-info" id="follow_btn2" style="display:none;" onclick="delFollow(${follower_no});">언팔로우</button>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>
									<c:if test="${checkfollow == 1}"><button type="button" class="btn btn-outline-info" id="follow_btn2" onclick="delFollow(${follower_no});">언팔로우</button><button type="button" class="btn btn-outline-info" id="follow_btn1" style="display:none;" onclick="addFollow(${follower_no});">팔로우</button>&nbsp;&nbsp;&nbsp;&nbsp;</c:if>									
									<button type="button" class="btn btn-outline-danger" data-toggle="modal" data-target="#jb_reportModal" id="jb_report">신고</button>																	
							</div>						
					    </div>
					    			<!-- The Modal -->
						<div class="modal fade" id="jb_reportModal">
							<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
								<div class="modal-content">

									<!-- Modal Header -->
									<div class="modal-header">
										<h4 class="modal-title">인테리어 회원 신고</h4>
										<button type="button" class="close" data-dismiss="modal">&times;</button>
									</div>

									<!-- Modal body -->
									<div class="modal-body">									
										<p>확인 후 이용규칙 위반 및 부적절한 게시물을 게재한 회원일 경우 해당 회원은 이용이 제한되거나 이용이 불가합니다.<br>
											허위신고일 시 신고자는 법적인 책임을 질 수 있습니다.</p>
										 <p style="color:#006080">- 선방은 쾌적하고 편리한 커뮤니티를 만들고자 노력하고 있습니다 : ) -</p><br>
									<h5> 신고 카테고리 </h5> 	
								   <select class="custom-select" id="category">	
								        <option value="">카테고리</option>							
										<option value="욕설">욕설</option>
                                        <option value="사기">사기</option>
                                        <option value="부적절한 행동">부적절한 행동</option>
                                         <option value="기타">기타</option>		
									</select><br><br>
									<h5> 신고내용 </h5><hr> 	
										<textarea rows="20" cols="20" id="jb_ireportcontent" placeholder="신고 사유를 작성해주세요"></textarea>
									</div>

									<!-- Modal footer -->
									<div class="modal-footer">
										<button type="button" class="btn btn-secondary" data-dismiss="modal" onclick="addReport(${follower_no});">제출</button>
									</div>
								</div>
							</div>
						</div>
					    
					  <div class="col-md-9">				
						<div class="row" id="list">							
						 </div>
					    <div class="row" id="list2">
		              </div>	
					</div>
				</div>
			</div>
		</div>		
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>