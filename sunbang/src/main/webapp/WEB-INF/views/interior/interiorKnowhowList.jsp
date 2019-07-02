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

.jb_follow_profile img {
	width: 30px;
	height: 30px;
	border-radius: 70%;
}

</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		$(function() {		
			$(window).scroll(function() {			
				if ($(this).scrollTop() > 400) {				
					$('#jb_top').fadeIn();
				} else {
					$('#jb_top').fadeOut();
				}
			});

			$("#jb_top").click(function() {
				var offset = $('html').offset();
				$("html, body").animate({
					scrollTop : offset.top
				}, 400);
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
					
					if(pagenum ==1 && jsonObj.iblist.length == 0){
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
		            		
		            	value += "<div class='col-md-4'><a href='ibselect.do?board_no="+jsonObj.iblist[i].board_no+"&board_type="+jsonObj.iblist[i].board_type+"'>"
		            	       + "<img src='${pageContext.request.contextPath }/files/interior/interiorBoard/"+jsonObj.iblist[i].post_data+"' class='jb_filter3_img'><br>"
		    				   + "<h6 style='padding-top: 5px;'>";
		    				   if(jsonObj.iblist[i].category1 != null){
		    					   value += jsonObj.iblist[i].category1+" ";		    					   
		    				   }
		    				   if(jsonObj.iblist[i].category2 != null){
		    					   value += jsonObj.iblist[i].category2+" ";
		    				   }
		    				   if(jsonObj.iblist[i].category3 != null){
		    					   value += jsonObj.iblist[i].category3;
		    				   }
		    				   value += "</h6><h5>"+jsonObj.iblist[i].board_title+"</h5>"
		    				   +"<div class='jb_follow_profile'>"
	        				   +"<img src='${pageContext.request.contextPath}/files/user/userImages/"+jsonObj.iblist[i].user_profile+"'>&nbsp;&nbsp;"
	        				   +"<span style='font-size:18px; font-family: a고딕12;vertical-align:middle;'>"+jsonObj.iblist[i].nickname+"</span></div>"
		    				   +"</a></div>";				    					            		            					            		            
		                 list_no++;                        
		            	}
		            	$("#list").html(value);					           
		            	}
		            } 
		    },error: function(){
						}
	     });		    
    	} 

	var jb_filter3_click1 = 0;
	var jb_filter3_click2 = 0;
	var jb_filter3_click3 = 0;
	var jb_filter3_click4 = 0;
	var jb_filter3_click5 = 0;
	
	 //필터 1
	function addFilter1(e) {	
		if (jb_filter3_click1 == 0) {
			$(".filter3allbtn").css("border","0px");
			$("#filter3btn1").css("border","1px solid #ffb6b9");
			$(".keyword").val("empty");
				$("#keyword1").val(e);
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click1++;					
			} else {
				$(".filter3allbtn").css("border","0px");
				$(".keyword").val("empty");			
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click1--;
				jb_filter3_click2=0;
				jb_filter3_click3=0;
				jb_filter3_click4=0;
				jb_filter3_click5=0;		
			}
		}
		//필터 2
		function addFilter2(e) {
			if (jb_filter3_click2 == 0) {
			$(".filter3allbtn").css("border","0px");
			$("#filter3btn2").css("border","1px solid #ffb6b9");
			$(".keyword").val("empty");
			$("#keyword2").val(e);
			$("#list").html("");
			page = 1;
			getList(page);
			page++;			
			jb_filter3_click2++;			
			}else{
				$(".filter3allbtn").css("border","0px");
				$(".keyword").val("empty");					
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click2--;
				jb_filter3_click1=0;
				jb_filter3_click3=0;
				jb_filter3_click4=0;
				jb_filter3_click5=0;	
			}
		}
		//필터 3
		function addFilter3(e) {
			if (jb_filter3_click3 == 0) {
		    $(".filter3allbtn").css("border","0px");
			$("#filter3btn3").css("border","1px solid #ffb6b9");
			$(".keyword").val("empty");
			$("#keyword3").val(e);
			$("#list").html("");
			page = 1;
			getList(page);
			page++;		
			jb_filter3_click3++;			
			}else{
				$(".filter3allbtn").css("border","0px");
				$(".keyword").val("empty");				
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click3--;
				jb_filter3_click1=0;
				jb_filter3_click2=0;
				jb_filter3_click4=0;
				jb_filter3_click5=0;	
			}
		}
		//필터 4
		function addFilter4(e) {
			if (jb_filter3_click4 == 0) {
			$(".filter3allbtn").css("border","0px");
			$("#filter3btn4").css("border","1px solid #ffb6b9");
			$(".keyword").val("empty");
			$("#keyword4").val(e);
			$("#list").html("");
			page = 1;
			getList(page);
			page++;			
			jb_filter3_click4++;			
			}else{
				$(".filter3allbtn").css("border","0px");
				$(".keyword").val("empty");				
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click4--;
				jb_filter3_click1=0;
				jb_filter3_click2=0;
				jb_filter3_click3=0;
				jb_filter3_click5=0;	
			}
		}
		//필터 5
		function addFilter5(e) {
			if (jb_filter3_click5 == 0) {
			$(".filter3allbtn").css("border","0px");
			$("#filter3btn5").css("border","1px solid #ffb6b9");
			$(".keyword").val("empty");
			$("#keyword5").val(e);
			$("#list").html("");
			page = 1;
			getList(page);
			page++;		
			jb_filter3_click5++;	
			}else{
				$(".filter3allbtn").css("border","0px");
				$(".keyword").val("empty");				
				$("#list").html("");
				page = 1;
				getList(page);
				page++;
				jb_filter3_click5--;	
				jb_filter3_click1=0;
				jb_filter3_click2=0;
				jb_filter3_click3=0;
				jb_filter3_click4=0;	
			}
		}
		
	</script>
	<br>
	<br>
	<div class="container" id="jb_filter3_container" style="min-height: 960px;">
		<div class="row" align="center">						
		        <div class="col-md-1"></div>
				<input type="hidden" class="keyword" id="keyword1" value="empty">
				<div class="col-2 col-md-2"><img class="filter3allbtn" id="filter3btn1" src="${pageContext.request.contextPath }/files/interior/interiorMain/kh1.PNG" onclick="addFilter1('리모델링');"></div>	
				<input type="hidden" class="keyword" id="keyword2" value="empty">										
				<div class="col-2 col-md-2"  ><img class="filter3allbtn" id="filter3btn2" src="${pageContext.request.contextPath }/files/interior/interiorMain/kh2.PNG" onclick="addFilter2('꾸미기팁');"></div>
				<input type="hidden" class="keyword" id="keyword3" value="empty">
				<div class="col-2 col-md-2"><img class="filter3allbtn" id="filter3btn3" src="${pageContext.request.contextPath }/files/interior/interiorMain/kh3.PNG" onclick="addFilter3('지식백과');"></div>
				<input type="hidden" class="keyword" id="keyword4" value="empty">
				<div class="col-2 col-md-2"><img class="filter3allbtn" id="filter3btn4" src="${pageContext.request.contextPath }/files/interior/interiorMain/kh4.PNG" onclick="addFilter4('이거어때');"></div>
				<input type="hidden" class="keyword" id="keyword5" value="empty">	
				<div class="col-2 col-md-2"><img class="filter3allbtn" id="filter3btn5" src="${pageContext.request.contextPath }/files/interior/interiorMain/kh5.PNG" onclick="addFilter5('생활정보');"></div>
				<div class="col-md-1"></div>						
		</div>
		<br>		
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