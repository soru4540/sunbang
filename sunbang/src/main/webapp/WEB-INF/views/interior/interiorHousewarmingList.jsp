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
.jb_filter_btn {
	display: inline-block;
	font-family: a고딕15;
	font-weight: 400;
	height: 25px;
	color: white;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #ff9198;
	border: 1px solid transparent;
	padding: 3px 3px 3px 3px;
	font-size: 1rem;
	line-height: 1;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	margin-bottom: 5px;
}

.jb_filter_btn:hover {
	color: #f74265;
}

#jb_filter2_container .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_filter2_container .col-md-12 li {
	margin: 0 36px 0 36px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_filter2_container .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter2_container .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter2_container .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_filter2_container .col-md-4 h5 {
	font-family: a고딕15;
	padding-top: 5px;
}

#jb_filter2_container .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter2_img {
	width: 100%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_filter2_container .hovereffect {
	width: 100%;
	height: 230px;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
	border-radius: .75rem;
}

#jb_filter2_container .hovereffect img {
	display: block;
	position: relative;
	-webkit-transition: all .3s linear;
	transition: all .3s linear;
}

.jb_filter_a:hover img {
	-ms-transform: scale(1.15);
	-webkit-transform: scale(1.15);
	transform: scale(1.15);
}


#jb_filter2_items .jb_filter2_item {
	text-align: center;
	padding-top: 20px;
}

#jb_filter2_items .jb_filter2_item a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter2_items .jb_filter2_item a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter2_items .jb_filter2_item a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

.jb_filter2_filterBtn {
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

.jb_filter2_filterBtn2 {
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

#jb_top {
	width:100%;
	height:30px;
	color: grey;
	background-color: #f2f2f2;
	text-align:center;
	margin: 2px;
	cursor:pointer;
	display:none;
}

@media screen and (min-width: 800px) {
  #jb_top {
	position: fixed;
	top: 90%;
	left: 90%;
	width: 5%;
	color: grey;
	background-color: #f2f2f2;
	border-color: #bee5eb;
	border-radius: 5px;
	padding:2px;
  }
}

</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		$(function() {		
						
			$(window).scroll(function() {			
				if ($(this).scrollTop() > 500) {				
					$('#jb_top').fadeIn();
				} else {
					$('#jb_top').fadeOut();
				}
			});
			
			$("#jb_top").click(function() {
				var offset = $('html').offset();
				$("html, body").animate({
					scrollTop : offset.top
				}, 500);
			});
			
			//필터 7개
			$("#jb_filter2_items1").css("display", "none");
			$("#jb_filter2_items2").css("display", "none");
			$("#jb_filter2_items3").css("display", "none");
			$("#jb_filter2_items4").css("display", "none");
			$("#jb_filter2_items5").css("display", "none");
			$("#jb_filter2_items6").css("display", "none");
		

			//필터 클릭 체크 7개
			var jb_filter2_click1 = 0;
			var jb_filter2_click2 = 0;
			var jb_filter2_click3 = 0;
			var jb_filter2_click4 = 0;
			var jb_filter2_click5 = 0;
			var jb_filter2_click6 = 0;
	
			
		
		$("#jb_filter2_filter1").click(function() {
				if (jb_filter2_click1 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items1").css("display", "");
					jb_filter2_click1++;
					jb_filter2_click2=0;
					jb_filter2_click3=0;
					jb_filter2_click4=0;
					jb_filter2_click5=0;
					jb_filter2_click6=0;		
				} else {
					$(".jb_filter2_item").css("display", "none");
					jb_filter2_click1=0;							
				}
			});

			$("#jb_filter2_filter2").click(function() {
				if (jb_filter2_click2 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items2").css("display", "");
					jb_filter2_click1=0;
					jb_filter2_click2++;			
					jb_filter2_click3=0;
					jb_filter2_click4=0;
					jb_filter2_click5=0;
					jb_filter2_click6=0;			
				} else {
					$(".jb_filter2_item").css("display", "none");
					jb_filter2_click2=0;
						
				}
			});

			$("#jb_filter2_filter3").click(function() {
				if (jb_filter2_click3 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items3").css("display", "");
					jb_filter2_click1=0;
					jb_filter2_click2=0;			
					jb_filter2_click3++;
					jb_filter2_click4=0;
					jb_filter2_click5=0;
					jb_filter2_click6=0;			
				} else {
					$(".jb_filter2_item").css("display", "none");
					jb_filter2_click3=0;					
				}
			});

			$("#jb_filter2_filter4").click(function() {
				if (jb_filter2_click4 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items4").css("display", "");
					jb_filter2_click1=0;
					jb_filter2_click2=0;			
					jb_filter2_click3=0;
					jb_filter2_click4++;
					jb_filter2_click5=0;
					jb_filter2_click6=0;				
				} else {
					$(".jb_filter2_item").css("display", "none");					
					jb_filter2_click4=0;				
				}
			});

			$("#jb_filter2_filter5").click(function() {
				if (jb_filter2_click5 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items5").css("display", "");
					jb_filter2_click1=0;
					jb_filter2_click2=0;			
					jb_filter2_click3=0;
					jb_filter2_click4=0;
					jb_filter2_click5++;
					jb_filter2_click6=0;			
				} else {
					$(".jb_filter2_item").css("display", "none");				
					jb_filter2_click5=0;					
				}
			});


			$("#jb_filter2_filter6").click(function() {
				if (jb_filter2_click6 == 0) {
					$(".jb_filter2_item").css("display", "none");
					$("#jb_filter2_items6").css("display", "");
					jb_filter2_click1=0;
					jb_filter2_click2=0;			
					jb_filter2_click3=0;
					jb_filter2_click4=0;
					jb_filter2_click5=0;
					jb_filter2_click6++;				
				} else {
					$(".jb_filter2_item").css("display", "none");				
					jb_filter2_click6=0;					
				}
			});

			if ($("#keyword1").val() == "empty") {
				$("#jb_filter_btn1").css("display", "none");
			}
			if ($("#keyword2").val() == "empty") {
				$("#jb_filter_btn2").css("display", "none");
			}
			if ($("#keyword3").val() == "empty") {
				$("#jb_filter_btn3").css("display", "none");
			}
			if ($("#keyword4").val() == "empty") {
				$("#jb_filter_btn4").css("display", "none");
			}
			if ($("#keyword5").val() == "empty") {
				$("#jb_filter_btn5").css("display", "none");
			}
			if ($("#keyword6").val() == "empty") {
				$("#jb_filter_btn6").css("display", "none");
			}		

		});
		
		var page = 1;  //페이징과 같은 방식이라고 생각하면 된다. 
		 
		$(function(){  //페이지가 로드되면 데이터를 가져오고 page를 증가시킨다.
		     getList(page);
		     page++;
		}); 
		 
		$(window).scroll(function(){   //스크롤이 일정 하단 으로 내려가면 리스트를 조회하고 page를 증가시킨다.					  
			if(page != 0){
			if( $(window).scrollTop()+370 >= $(document).height() - $(window).height()){
		          getList(page);
		           page++;   		           
		     } 
		    }
		});
		
		 
		//게시판 리스트 출력
		function getList(pagenum){		
		    $.ajax({
		        type : "post",  
		        dataType : "json", 
		        data : {board_type: "housewarming" ,page : pagenum, keyword1 : $("#keyword1").val(),keyword2 : $("#keyword2").val(),keyword3 : $("#keyword3").val(),keyword4 :$("#keyword4").val() ,keyword5 :$("#keyword5").val(),keyword6 :$("#keyword6").val() },
		        url : "ifilter2select.do",
		        success : function(returnData) {		    
		        	
		        	var objStr = JSON.stringify(returnData);	
					var jsonObj = JSON.parse(objStr);							
						var value = $("#list").html();			
						
						if(jsonObj.iblist.length == 0){
							value = "<div class='col' align='center'><br><br><br><br><br><br><br><h1>조회된 게시물이 없습니다.</h3></div>";
							$("#list").html(value);		
						}
						
						 if (jsonObj.end_num == jsonObj.total_num){
							 page = 0;
						 }
			            if (jsonObj.start_num<=jsonObj.total_num){			            	
			            	if(jsonObj.iblist.length>0){
			            	if(pagenum==1){
			            	var list_no = 0;
			            	}else {
			            		var list_no = 12 + ((pagenum-2)*6);				            	
			            	}
			            	for(var i in jsonObj.iblist){	
			            		
			            	value += "<div class='col-md-4' align='center'><a class='jb_filter_a' href='ibselect.do?board_no="+jsonObj.iblist[i].board_no+"&board_type="+jsonObj.iblist[i].board_type+"'><div class='hovereffect'>"
			    				  +	"<img src='${pageContext.request.contextPath}/files/interior/interiorBoard/"+jsonObj.iblist[i].post_data+"' class='jb_filter2_img'></div><br>"
			    				  + "<h5>"+jsonObj.iblist[i].board_title+"</h5><h6><i class='far fa-user-circle'></i>&nbsp;"+jsonObj.iblist[i].nickname+"</h6>"
			    				  + "<h6 style='opacity: 0.35;'>좋아요 : "+jsonObj.iblist[i].like_count+" 조회수 : "+jsonObj.iblist[i].board_hits+"</h6></a></div>";			            					            		            
			                 list_no++;                        
			            	}
			            	$("#list").html(value);					           
			            	}
			            } 
			    },error: function(){
							}
		     });		    
	    	} 
 
		 //필터 1
		function addFilter1(e) {
			$("#keyword1").val(e);
			$("#jb_filter_btn1").css("display", "");			
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
		 //필터 2
		function addFilter2(e) {
			$("#keyword2").val(e);
			$("#jb_filter_btn2").css("display", "");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
		 //필터 3
		function addFilter3(e) {
			$("#keyword3").val(e);
			$("#jb_filter_btn3").css("display", "");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
		 //필터 4
		function addFilter4(e) {
			$("#keyword4").val(e);
			$("#jb_filter_btn4").css("display", "");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
        //필터 5
		function addFilter5(e) {
			$("#keyword5").val(e);
			$("#jb_filter_btn5").css("display", "");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
		//필터 6
		function addFilter6(e) {
			$("#keyword6").val(e);
			$("#jb_filter_btn6").css("display", "");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
	
		
		//필터 제거
		function delFilter(e){
		    $("#keyword"+e).val("empty");				
			$("#jb_filter_btn"+e).css("display", "none");
			$("#list").html("");
			page = 1;
			getList(page);
	        page++;   		
		}
		
	</script>
	<br>
	<br>   
	<div class="container" id="jb_filter2_container" style="min-height: 960px;">
		<div class="row">		
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter1">
					정렬 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter2">
					주거형태 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter3">
					평수 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter4">
					예산 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter5">
					스타일 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
			<div class="col" align="center">
				<button class="jb_filter2_filterBtn" id="jb_filter2_filter6">
					색상 <span style="color: #ff9198;">▼</span>
				</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12" id="jb_filter2_items">
				<div class="jb_filter2_item" id="jb_filter2_items1">
					<button class="jb_filter2_filterBtn2" onclick="addFilter1('조회수');">조회수</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter1('좋아요');">좋아요</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter1('팔로우');">팔로우</button>
				</div>
				<div class="jb_filter2_item" id="jb_filter2_items2">				
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('원룸&오피스텔');">원룸&오피스텔</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('아파트');">아파트</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('빌라&연립');">빌라&연립</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('단독주택');">단독주택</button> &nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('사무공간');">사무공간</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter2('상업공간');">상업공간</button>&nbsp;&nbsp;&nbsp;&nbsp;					
				</div>
				<div class="jb_filter2_item" id="jb_filter2_items3">				
					<button class="jb_filter2_filterBtn2" onclick="addFilter3('10평미만');">10평 미만</button> &nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter3('10평대');">10평대</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter3('20평대');">20평대</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter3('30평대');">30평대</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter3('40평대이상');">40평대 이상</button>
				</div>
				<div class="jb_filter2_item" id="jb_filter2_items4">				
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('~100만원');">~100만원</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('100~200만원');">100~200만원</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('200~300만원');">200~300만원</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('300~500만원');">300~500만원</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('500~1000만원');">500~1000만원</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('1000~2000만원');">1000~2000만원</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('2000~3000만원');">2000~3000만원</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter4('3000만원~');">3000만원~</button>					
				</div>				
				<div class="jb_filter2_item" id="jb_filter2_items5">				
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('모던');">모던</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('미니멀&심플');">미니멀&심플</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('내추럴');">내추럴</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('북유럽');">북유럽</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('빈티지&레트로');">빈티지&레트로</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('클래식&앤틱');">클래식&앤틱</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('프렌치&프로방스');">프렌치&프로방스</button>
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('러블리&로맨틱');">러블리&로맨틱</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter5('인더스트리얼');">인더스트리얼</button>&nbsp;&nbsp;&nbsp;&nbsp;				
				</div>					
				<div class="jb_filter2_item" id="jb_filter2_items6">				
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#fafafa');">그레이</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#FFF');">화이트</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#000');">블랙</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#3d97dd');">블루</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#96d783');">그린</button>&nbsp;&nbsp;&nbsp;&nbsp; 
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#d53736');">레드</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('#fed144');">옐로우</button>&nbsp;&nbsp;&nbsp;&nbsp;
					<button class="jb_filter2_filterBtn2" onclick="addFilter6('##ee8a94');">핑크</button>
				</div>				
			</div>
		</div>		
		<div class="row">
			<div class="col-md-12">
			    <input type="hidden" id="keyword1" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn1" onclick="delFilter(1);">
					<span style="color: #fff;">정렬&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword2" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn2" onclick="delFilter(2);">
					<span style="color: #fff;">주거형태&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword3" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn3" onclick="delFilter(3);">
					<span style="color: #fff;">평수&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword4" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn4" onclick="delFilter(4);">
					<span style="color: #fff;">예산&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword5" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn5" onclick="delFilter(5);">
					<span style="color: #fff;">스타일&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword6" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn6" onclick="delFilter(6);">
					<span style="color: #fff;">색상&nbsp;ⓧ</span>
				</button>
				&nbsp;&nbsp;				
			</div>
		</div>
		<hr color="#ff9198">
		<br>					
		<div class="row" id="list">
		</div>
		<br>
		 <div class="row" id="jb_top">
		<div class="col-md-12">
			<i class="fas fa-angle-double-up"></i>
		</div>
	    </div>
		</div>
		<c:import url="../common/footer.jsp" />
</body>
</html>