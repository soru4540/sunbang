<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<title>선방</title>

<!-- <script>
$(window).scroll(function() {
	var scrollHeight = $(document).height();
	var scrollPosition = $(window).height() + $(window).scrollTop();
	if ((scrollHeight - scrollPosition) / scrollHeight === 0) {
		$("body").css("background","red");
	} else {
		$("body").css("background","white");
	}
});
</script> -->

<style type="text/css">
#sh_myroommanagement {
	margin: 5px;
	padding: 5px;
	text-align: left;
	font-size: 11pt;
	border: 1px solid #f2f2f2;
	border-radius: 5px;
	color:#595959;
}

#sh_myroomlist .col-md-3 {
	width:100%;
	font-size: 10pt;
}

.sh_myroomlist_title {
	padding: 5px;
	text-align: left;
	border: 1px solid #f2f2f2;
	color:#595959;
	width:100%;
	height:90px;	
}

.sh_myroomlist_btn {
	border-radius:4px;
	background-color:white;
	color:#61C0BF;
	width:100%;
	height:30px;
	margin:1px;
	border: 1px solid #61C0BF;
}

.sh_myroomlist_btn:hover {
	background-color:#61C0BF;
	color:white;
}


#sh_myroomList_progress {
	height:40px;
	background-color:#61C0BF;
	color:white;
}

/*삭제예정 */
#sh_myroomList_progress2 {
	height:40px;
	background-color:#347f7c;
	color:white;
}

/*삭제예정 */
#sh_myroomList_progress3 {
	height:40px;
	background-color:#333333;
	color:white;
}

/*삭제예정 */
#sh_myroomList_progress4 {
	height:40px;
	background-color:red;
	color:white;
	opacity:0.6;
}

#sh_myroomlist img {
	width:100%;
	height:100%;
	border-radius:7px;
}

/* @media screen and (max-width: 414px) {
	#sh_myroomlist img {

	width:100%;
	height:100%;
  }
} */

#sh_myroomlist_img {
	text-align:center;
}
</style>

<body>
<c:import url="../common/propertyHeader.jsp" /><br>
<div class="container">
	<div class="row">
		<div class="col-md-12">
			<br><h4 class="text-center">내 방 관리</h4><hr>
			<div class="row"  id="sh_myroommanagement">
				<div class="col-md-12"> <!-- 방 관리  --><br>
					<p> 일반회원은 최대 5개의 매물만 등록이 가능합니다.<br>
						프리미엄 회원은 매물 등록의 제한이 없습니다.<hr> 
						 광고중 : 내가 등록한 매물이 공개중인 상태 <br>
						 거래완료 : 등록한 매물이 거래완료된 상태 <br>
						 검수중 : 운영원칙 위배 또는 신고, 허위매물로 비공개된 상태 </p>
				</div>
			</div>
			<div class="row" id="sh_myroomlist"> <!-- 내 방 리스트  -->
				<div class="col-md-12"><br><br>
					<h6>내 방 리스트</h6><hr>
					<div class="row"> <!-- 1line -->
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>							
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress" value="광고중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress2" value="계약진행중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress3" value="거래완료">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3"  style="opacity:0.6">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress4" value="검수중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">	
								</div>
							</div>
						</div>																		
					</div> <!-- 1line -->
					<br><br>
					<div class="row"> <!-- 2line -->
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>							
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress" value="광고중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress" value="광고중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample1.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress3" value="거래완료">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">									
								</div>
							</div>
						</div>
						<div class="col-md-3" style="opacity:0.6">
							<div class="row">
								<div class="col-md-12" id="sh_myroomlist_img">
									<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/sample2.png">
								</div>
							</div>
							<div class="row">
								<div class="col-md-12">
									<div class="sh_myroomlist_title"><b>매물번호:0205123</b><br>효창동/오피스텔/전세 1억 5000만원/57.6㎡/
									</div>
								</div>
							</div>								
							<div class="row">
								<div class="col-md-12">
									<input type="button" class="sh_myroomlist_btn" id="sh_myroomList_progress4" value="검수중">
									<input type="button" class="sh_myroomlist_btn" value="수정">
									<input type="button" class="sh_myroomlist_btn" value="삭제">	
								</div>
							</div>
						</div>																		
					</div> <!-- 2line -->					
					<br><br>
<!-- 					<nav> paging
						<ul class="pagination justify-content-center" id="sh_myroompaging">
							<li class="page-item">
								<a class="page-link" href="#">Previous</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">1</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">2</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">3</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">4</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">5</a>
							</li>
							<li class="page-item">
								<a class="page-link" href="#">Next</a>
							</li>
						</ul>
					</nav> paging -->
				</div>
			</div> <!-- 내 방 리스트  -->
		</div>
	</div>
</div>
<c:import url="../common/footer.jsp" />
</body>
</html>