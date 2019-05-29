<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> 
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>   
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>        
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, minimum-scale=1, maximum-scale=1, user-scalable=no">
<link rel="shortcut icon" type="image⁄x-icon" href="${pageContext.request.contextPath}/resources/images/logo1.PNG">
<title>SUNBANG</title>
<script type="text/javascript" src="${pageContext.request.contextPath }/resources/js/jquery-3.3.1.min.js"></script>
<!-- 맨위로 -->
<script type="text/javascript">
$(function(){
	$("#sh_top").click(function(){
		var offset = $('html').offset();
		$("html, body").animate({scrollTop:offset.top},500);
	});
});
</script>
<!-- 매물상태 별 표시 / 매물삭제 -->
<script type="text/javascript">
$(function(){
	$(".sh_myroomlist_title").each(function(i){
		
		if($("#sh_myroomList_progress"+i).val() == "숨기기"){
			$("#sh_myroomList_progress"+i).css("background-color", "white");
			$("#sh_myroomList_progress"+i).css("color", "#61C0BF");
			$("#sh_realty_info"+i).css("opacity", "0.4");
		}
		
		if($("#sh_myroomList_progress"+i).val() == "검수중" || $("#sh_myroomList_progress"+i).val() == "수정완료"){
			$("#sh_myroomList_progress"+i).css("background-color", "#ff6666");
			$("#sh_myroomList_progress"+i).css("border", "1px solid #ff6666");
			$("#sh_myroomList_progress"+i).val("검수중");
		}
		
		if($("#sh_myroomList_progress"+i).val() == "계약진행중"){
			$("#sh_myroomList_progress"+i).css("background-color", "#347f7c");
			$("#sh_myroomList_progress"+i).css("border", "1px solid #347f7c");
		}
		
		if($("#sh_myroomList_progress"+i).val() == "거래완료"){
			$("#sh_myroomList_progress"+i).css("background-color", "#333333");
			$("#sh_myroomList_progress"+i).css("border", "1px solid #333333");
		}		
		
		$("#sh_rdelete_btn"+i).click(function(){
			//삭제내용 <br>로 변환
			var str = $("#sh_rdeletecontent"+i).val(); 
			str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			$("#sh_rdeletecontent"+i).val(str); 

			var realty = new Object();
			realty.realty_status = $("#sh_rdeletetitle"+i).val();
			realty.realty_detail_comment = $("#sh_rdeletecontent"+i).val();
			realty.realty_no = $("#sh_realtyno"+i).val();
			
			$.ajax({
				url: "rmdelete.do",
				type: "post",
				data: JSON.stringify(realty),
				contentType: "application/json; charset=utf-8",
				success: function(result){
					if(result == 1){
						alert("삭제되었습니다.");
						$("#sh_myroomList_progress"+i).val("삭제중");
						$("#sh_realty_info"+i).css("opacity", "0.6");
						$("#sh_realty_info"+i).hide();
					}
				}
			});
		});
	});
});
</script>

<style type="text/css">

#sh_top {
	width:100%;
	height:30px;
	color: grey;
	background-color: #f2f2f2;
	text-align:center;
	margin: 2px;
	cursor:pointer;
}

@media screen and (min-width: 800px) {
  #sh_top {
	position: fixed;
	top: 90%;
	left: 90%;
	width: 5%;
	border-radius: 5px;
	padding:2px;
  }
}

#sh_myroommanagement {
	margin: 5px;
	padding: 5px;
	text-align: left;
	font-size: 11pt;
	border: 1px solid #f2f2f2;
	border-radius: 5px;
	color:#595959;
}

#sh_realtymylistempty {
	margin: 5px;
	padding: 5px;
	text-align: center;
	font-size: 20pt;
	border: 1px solid #f2f2f2;
	border-radius: 5px;
	color:#595959;
}

#sh_myroomlist .col-md-3 {
	width:100%;
	font-size: 10pt;
	padding:10px;
}

.sh_myroomlist_title {
	padding: 5px;
	text-align: left;
	border: 1px solid #f2f2f2;
	color:#595959;
	width:100%;
	height:140px;	
}

.sh_myroomlist_status {
	border-radius:4px;
	background-color:#61C0BF;
	color:white;
	width:100%;
	height:40px;
	margin:1px;
	border: 1px solid #61C0BF;
	text-align: center;
}

.sh_myroomlist_btn {
	border-radius:4px;
	background-color:white;
	color:#61C0BF;
	width:100%;
	height:30px;
	margin:1px;
	border: 1px solid #61C0BF;
	text-align: center;
}


.sh_myroomlist_btn:hover {
	background-color:#61C0BF;
	color:white;
}

#sh_myroomlist img {
	height:100%;
	width:100%;
	border-radius:7px;
	text-align:center;
}

.sh_myroomlist_img {
	height: 200px;
	text-align:center;
	overflow:hidden;
	cursor:pointer;
}

.sh_myroomlist_img:hover {
	opacity:0.6;
}

@media screen and (max-width: 768px) {
  .sh_myroomlist_img {
    width: 100%;
    height: 100%;
    position: relative;
  }
}

.sh_rdeletecontent {
	width:100%;
	border: 1px solid #ced4da;
	border-radius:4px;
}

</style>

<body>
<c:import url="../common/realtyHeader.jsp" /><br>
<div class="container" style="font-family: a고딕12;">
	<div class="row">
		<div class="col-md-12">
			<br><h4 class="text-center">내 방 관리</h4><hr>
			<div class="row" id="sh_myroommanagement">
				<div class="col-md-12"> <!-- 방 관리  --><br>
					<p> 일반회원은 최대 5개의 매물만 등록이 가능합니다.<br>
						프리미엄 회원은 매물 등록의 제한이 없습니다.<hr> 
						숨기기 : 등록한 매물이 숨겨진 상태 <br>
						광고중 : 등록한 매물이 공개중인 상태 <br>
						계약진행중 : 등록한 매물이 계약진행중인 상태 <br>
						거래완료 : 등록한 매물이 거래완료된 상태 <br>
						검수중 : 운영원칙 위배 또는 신고, 허위매물로 비공개된 상태 </p>
				</div>
			</div>
			<div class="row" id="sh_myroomlist"> <!-- 내 방 리스트  -->
				<div class="col-md-12"><br><br>
					<h6>내 방 리스트 : 총 ${fn:length(realtyList)} 개</h6><hr>
					<c:if test="${empty realtyList }">
					<br><br>
					<div class="row" id="sh_realtymylistempty">
						<div class="col-md-12">
							<hr><br><br>
							등록한 매물이 없습니다.
							<br><br><br><br><hr>
						</div>
					</div>
					<br><br>
					</c:if>
					<div class="row">
						<c:forEach items="${realtyList }" var="realtyList" varStatus="status">
						<c:set var="index" value="${status.index }" />
							<div class="col-md-3" id="sh_realty_info${index }"> <!-- 항목 -->
								<div class="row"> <!-- 매물사진 -->
									<div class="sh_myroomlist_img">
										<div class="col-md-12">
											<img src="${pageContext.request.contextPath }/files/realty/realtyNormalImages/${realtyList.realty_image1 }" 
											     onclick="location.href='rdetail.do?realty_no=${realtyList.realty_no }'">
										</div>
									</div>	
								</div> <!-- 매물사진 -->
								<div class="row"> <!-- 매물정보 -->
									<div class="col-md-12">
										<div class="sh_myroomlist_title">
											<b>매물번호: ${realtyList.realty_no }</b><br>
											${realtyList.road_address }<br>
											${realtyList.realty_type } /
											<c:if test="${not empty realtyList.building_type }">
											 ${realtyList.building_type } /
											</c:if>
											${realtyList.exclusive_area } 평 <br>
											<c:if test="${realtyList.month_lease != 0 }">
												월세 <fmt:formatNumber value="${realtyList.month_lease }" /> 원 / 
												보증금 <fmt:formatNumber value="${realtyList.deposit }" /> 원 <br>
												
											</c:if>
											<c:if test="${realtyList.payback_deposit_lease != 0 }">
												전세 <fmt:formatNumber value="${realtyList.payback_deposit_lease }" /> 원 <br>
											</c:if>
											<c:if test="${realtyList.purchase != 0 }">
												매매 <fmt:formatNumber value="${realtyList.purchase }" /> 원
											</c:if>																						
										</div>
									</div>
								</div> <!-- 매물정보 -->							
								<div class="row">
									<div class="col-md-12">
										<input type="text" class="sh_myroomlist_status" id="sh_myroomList_progress${index }" value="${realtyList.realty_status }" readonly>
										<input type="button" class="sh_myroomlist_btn" value="수정" onclick="location.href='rupdateview.do?realty_no=${realtyList.realty_no }'">
										<input type="hidden" id="sh_realtyno${index }" value="${realtyList.realty_no }">
										<c:if test="${realtyList.realty_status != '검수중' && realtyList.realty_status != '수정완료'}">
											<input type="button" class="sh_myroomlist_btn" data-toggle="modal" data-target="#sh_rdeleteModal${index }" id="sh_rdelete${index }" value="삭제">
										</c:if>
									</div>
								</div>
							</div>  <!-- 항목 -->
							<div class="modal fade" id="sh_rdeleteModal${index }"> <!-- The Modal -->
								<div class="modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered">
									<div class="modal-content">
	
										<!-- Modal Header -->
										<div class="modal-header">
											<h4 class="modal-title">매물 삭제</h4>
											<button type="button" class="close" data-dismiss="modal">&times;</button>
										</div>
	
										<!-- Modal body -->
										<div class="modal-body">
											<p style="color:#006080">삭제하고자 하시는 사유를 입력해주세요. 사이트 운영에 도움이 됩니다.</p>
											<p>매물번호 : ${realtyList.realty_no }</p>
											<h5> 삭제사유 </h5>
											<select class="custom-select" id="sh_rdeletetitle${index }">
												<option value="삭제" style="color:grey">삭제사유 선택</option>
												<option value="삭제">매물 거래가 완료되어서 매물을 노출시키고 싶지 않습니다.</option>
												<option value="완전삭제">천재지변에 의해서 매물을 판매할 수 없게 되었습니다.</option>
												<option value="완전삭제">매물 정보가 잘못입력되었습니다.</option>
												<option value="삭제">정보공개를 원치 않습니다.</option>
												<option value="삭제">직접입력</option>
											</select>															
											<hr> 	
											<textarea rows="10" cols="20" class="sh_rdeletecontent" id="sh_rdeletecontent${index }" placeholder="삭제 사유를 작성해주세요"></textarea>
										</div>
	
										<!-- Modal footer -->
										<div class="modal-footer">
											<button type="button" id="sh_rdelete_btn${index }" class="btn btn-secondary" data-dismiss="modal">제출</button>
										</div>
									</div>
								</div>
							</div> <!-- The Modal -->								
							
						</c:forEach>
					</div>	
				</div>
			</div> <!-- 내 방 리스트  -->
		</div>
	</div>
	<br><br><br><br><br>
	<div class="row" id="sh_top">
		<div class="col-md-12">
			<i class="fas fa-angle-double-up"></i>
		</div>
	</div>
</div>
<c:import url="../common/footer.jsp" />
</body>
</html>