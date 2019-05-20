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

#jb_filter3_container .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_filter3_container .col-md-12 li {
	margin: 0 45px 0 70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_filter3_container .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter3_container .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter3_container .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_filter3_container .col-md-4 h5 {
	font-family: a고딕15;
}

#jb_filter3_container .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter3_img {   
	width: 100%;
	height: 230px;
	margin-top: 15px;
	margin-bottom: 5px;
}

#jb_filter3_container .col-md-4:hover {
	border: 1px solid #ff9198;
	transition-delay: 0.08s;
}

#jb_filter3_container .col-md-2 img{
margin:5px;
padding:5px;
border: 1px solid #ffb6b9;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		$(function() {
			$(window).scroll(function() {
				if ($(this).scrollTop() > 500) {
					$('#MOVE_TOP_BTN').fadeIn();
				} else {
					$('#MOVE_TOP_BTN').fadeOut();
				}
			});

			$("#MOVE_TOP_BTN").click(function() {
				$('html, body').animate({
					scrollTop : 0
				}, 400);
				return false;
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
	        data : {board_type: "knowhow" ,page : pagenum, keyword1 : $("#keyword1").val(),keyword2 : $("#keyword2").val(),keyword3 : $("#keyword3").val(),keyword4 :$("#keyword4").val() ,keyword5 :$("#keyword5").val()},
	        url : "ifilter3select.do",
	        success : function(returnData) {		    	        	
	        	var objStr = JSON.stringify(returnData);	
				var jsonObj = JSON.parse(objStr);							
					var value = $("#list").html();						
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
		            		
		            	value += "<div class='col-md-4'><a href='ibselect.do?board_no=3&board_type=knowhow'>"
		            	       + "<img src='${pageContext.request.contextPath }/files/interior/interiorMain/"+jsonObj.iblist[i].post_data+"' class='jb_filter3_img'><br>"
		    				   + "<h6 style='padding-top: 5px;'>리모델링</h6><h5>"+jsonObj.iblist[i].board_title+"</h5><h6><i class='far fa-user-circle'></i>&nbsp;"+jsonObj.iblist[i].nickname+"</h6> </a></div>";				    					            		            					            		            
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

	<<div class="container" id="jb_filter3_container">
		<div class="row" align="center">		
				<div class="col-md-1"></div>
				<div class="col-md-2"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh1.PNG" onclick="addFilter1('리모델링');"></div>								
				<div class="col-md-2"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh2.PNG" onclick="addFilter2('꾸미기팁');"></div>
				<div class="col-md-2"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh3.PNG" onclick="addFilter3('지식백과');"></div>
				<div class="col-md-2"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh4.PNG" onclick="addFilter4('이거어때');"></div>	
				<div class="col-md-2"><img src="${pageContext.request.contextPath }/files/interior/interiorMain/kh5.PNG" onclick="addFilter5('생활정보');"></div>				
			<div class="col-md-1"></div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
			   <input type="hidden" id="keyword1" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn1" onclick="delFilter(1);">
					<span style="color: #fff;">리모델링</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword2" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn2" onclick="delFilter(2);">
					<span style="color: #fff;">꾸미기팁</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword3" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn3" onclick="delFilter(3);">
					<span style="color: #fff;">지식백과</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword4" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn4" onclick="delFilter(4);">
					<span style="color: #fff;">이거어때</span>&nbsp;<span>ⓧ</span>
				</button>
				&nbsp;&nbsp;
				<input type="hidden" id="keyword5" value="empty">
				<button type="button" class="jb_filter_btn" id="jb_filter_btn5" onclick="delFilter(5);">
					<span style="color: #fff;">생활정보</span>&nbsp;<span>ⓧ</span>
				</button>
			</div>
		</div>
		<hr color="#ff9198">
		<br>		
		<div class="row" id="list">			
		</div>
		<br>
		<div class="row">
			<div class="col-md-12">
				<a id="MOVE_TOP_BTN" href="#" style="color: #000;">TOP</a>
			</div>
		</div>
		<c:import url="../common/footer.jsp" />
</body>
</html>