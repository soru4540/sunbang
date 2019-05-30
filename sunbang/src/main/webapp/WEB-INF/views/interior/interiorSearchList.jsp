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

.jb_filter_btn2 {
	display: inline-block;
	font-family: a고딕12;
	font-weight: 400;
	height: 25px;
	color: black;
	opacity:0.6;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #fff;
	border: 1px solid transparent;
	padding: 3px 3px 3px 3px;
	font-size: 1rem;
	line-height: 1;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
	margin-bottom: 5px;
}

.jb_filter_btn3 {
	display: inline-block;
	font-family: a고딕12;
	font-weight: 400;
	height: 25px;
	color: black;	
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #fff;
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


#list1 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#list1 a:visited {
	color: #000000;
	text-decoration: none;
}

#list1 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#list1 h6 {
	font-family: a고딕15;
}

#list1 h5 {
	font-family: a고딕15;
}

.jb_filter1_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#list1 .col-md-3 {
	height: 360px;
}

#jb_filter1_items .jb_filter1_item {
	text-align: center;
	padding-top: 20px;
}

#jb_filter1_items .jb_filter1_item a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_filter1_items .jb_filter1_item a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_filter1_items .jb_filter1_item a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

.jb_filter1_filterBtn {
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
.jb_filter1_filterBtn2 {
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

.jb_filter1_submitBtn {
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

#list2 .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#list2 .col-md-12 li {
	margin: 0 36px 0 36px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#list2 .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#list2 .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#list2 .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#list2 .col-md-4 h5 {
	font-family: a고딕15;
	padding-top: 5px;
}

#list2 .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter2_img {
	width: 100%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#list2 .hovereffect {
	width: 100%;
	height: 230px;
	float: left;
	overflow: hidden;
	position: relative;
	text-align: center;
	cursor: default;
	border-radius: .75rem;
}

#list2 .hovereffect img {
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

#list3 .col-md-12 ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#list3 .col-md-12 li {
	margin: 0 45px 0 70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#list3 .col-md-4 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#list3 .col-md-4 a:visited {
	color: #000000;
	text-decoration: none;
}

#list3 .col-md-4 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#list3 .col-md-4 h5 {
	font-family: a고딕15;
}

#list3 .col-md-4 h6 {
	font-family: a고딕15;
}

.jb_filter3_img {   
	width: 100%;
	height: 230px;
	margin-top: 15px;
	margin-bottom: 5px;
}

#list3 .col-md-4:hover {
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

.mr-3{
height:50px;
width:50px;
border-radius: 5px;
}

.mr_3{
height:50px;
width:50px;
border-radius: 5px;
}


#list1_1 a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#list1_1 a:visited {
	color: #000000;
	text-decoration: none;
}

#list1_1 a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

.jb_result:hover{
cursor:pointer;
}

</style>
</head>
<body>
  <c:import url="../common/interiorHeader.jsp" />  
   <script type="text/javascript">
  $(function(){
	  
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
	  
	  getList();
  });
  
  var keyword = "${keyword}";
 
  var user_no = 0;
  if(${!empty loginUser}){
	  user_no = "${loginUser.user_no}";	
  } 
  
  function getList(){		
	    $.ajax({
	        type : "post",  
	        dataType : "json", 
	        data : {keyword1: keyword,user_no: user_no},
	        url : "isearchselect.do",
	        success : function(returnData) {	        
	        	var objStr = JSON.stringify(returnData);	
				var jsonObj = JSON.parse(objStr);				
				var list1 = "";
				var list1_1 = "";
				var list2 = "";
				var list3 = "";
				var list_no =0;
				var list1_count = 0;
				var list2_count = 0;
				var list3_count = 0;
				for(var i in jsonObj.iblist){			
					if(jsonObj.iblist[i].board_type == "photograph"){
						list1 += "<div class='col-md-3'>"
            				+"<h6 align='left'>"
            			    +"<i class='far fa-user-circle'></i>&nbsp;"+jsonObj.iblist[i].nickname
            				+"</h6>"
            				+"<a href='ibselect.do?board_no="+jsonObj.iblist[i].board_no+"&board_type="+jsonObj.iblist[i].board_type+"'> <img src='${pageContext.request.contextPath}/files/interior/interiorMain/"+jsonObj.iblist[i].post_data+"' class='jb_filter1_img'></a><br>"
            				+"<h5 align='center'>";			            				
            				var count = 0
            				  for(var k in jsonObj.illist){
            				     if(jsonObj.illist[k].board_no == jsonObj.iblist[i].board_no){
            				     list1 += "<input type='hidden' id='like"+list_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='likekey"+list_no+"' value='1'><i class='fas fa-heart' id='1like"+list_no+"' onclick='changeLike1("+list_no+");' style='color:#eb3a47;'></i>"
            				                +"<i class='far fa-heart' id='2like"+list_no+"' onclick='changeLike2("+list_no+");' style='display:none;color:black;'></i>&nbsp;&nbsp;&nbsp;&nbsp;";    						            							
            			         count = 1;
            				     }			            			    
            				  }
            				  if(count != 1){
            				  list1 += "<input type='hidden' id='like"+list_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='likekey"+list_no+"' value='0'><i class='far fa-heart' id='1like"+list_no+"' onclick='changeLike1("+list_no+");' value='0'></i>"
            				  +"<i class='fas fa-heart' id='2like"+list_no+"' onclick='changeLike2("+list_no+");' value='1' style='display:none;color:#eb3a47;'></i>&nbsp;&nbsp;&nbsp;&nbsp;";	
            				  }			              							            		
                 list1 += "<a data-toggle='modal' data-target='#jb_replyModal"+jsonObj.iblist[i].board_no+"' id='jb_reply' onclick='openReplyModal("+jsonObj.iblist[i].board_no+");'><i class='far fa-comment'></i></a>&nbsp;&nbsp;&nbsp;&nbsp;<span style='font-size: large; opacity: 0.4;''>조회 : "+jsonObj.iblist[i].board_hits+"</span>"
   	                       + "</h5><h5 align='center'>"+jsonObj.iblist[i].board_title+"</h5></div>";
            	 list1_1 +=  "<div class='modal fade' id='jb_replyModal"+jsonObj.iblist[i].board_no+"'><div class='modal-dialog modal-dialog-scrollable modal-xl modal-dialog-centered'><div class='modal-content'>"
                 +"<div class='modal-header'><h4 class='modal-title'>댓글</h4><button class='close' data-dismiss='modal'>&times;</button></div>"
                 +"<div class='modal-body'><div class='row'><div class='col-md-12' id='replylist"+jsonObj.iblist[i].board_no+"'></div></div></div>"
                 +"<div class='modal-footer' id='reply"+jsonObj.iblist[i].board_no+"'>";
                 if(${!empty loginUser}){
                	 list1_1 +="<img class='mr-3' src='${pageContext.request.contextPath }/files/user/userImages/${loginUser.user_profile}' />";
            	 }else{
            		 list1_1 += "<img class='mr-3' src='${pageContext.request.contextPath }/files/user/userImages/guest.png'/>";	 
            	 }
                 list1_1 += "<input type='text' class='textline'id='reply_contents"+jsonObj.iblist[i].board_no+"'><p style='padding-left:1.5em;'></p><input type='hidden' id='board_no"+jsonObj.iblist[i].board_no+"' value='"+jsonObj.iblist[i].board_no+"'><input type='hidden' id='reply_lev"+jsonObj.iblist[i].board_no+"' value='1'><input type='hidden' id='origin_reply_no"+jsonObj.iblist[i].board_no+"' value='0'><input type='hidden' id='reference_reply_no"+jsonObj.iblist[i].board_no+"' value='0'>"
							+"<input type='button' class='jb_filter1_submitBtn' value='전송' onclick='addReply("+jsonObj.iblist[i].board_no+");'><p style='padding-left:1.5em;'></p></div></div></div></div>";            		
            	    list_no++;
					list1_count++;
					}else if(jsonObj.iblist[i].board_type == "housewarming" ){
						list2 += "<div class='col-md-4' align='center'><a class='jb_filter_a' href='ibselect.do?board_no="+jsonObj.iblist[i].board_no+"&board_type="+jsonObj.iblist[i].board_type+"'><div class='hovereffect'>"
	    				  +	"<img src='${pageContext.request.contextPath}/files/interior/interiorMain/"+jsonObj.iblist[i].post_data+"' class='jb_filter2_img'></div><br>"
	    				  + "<h5>"+jsonObj.iblist[i].board_title+"</h5><h6><i class='far fa-user-circle'></i>&nbsp;"+jsonObj.iblist[i].nickname+"</h6>"
	    				  + "<h6 style='opacity: 0.35;'>좋아요 : "+jsonObj.iblist[i].like_count+" 조회수 : "+jsonObj.iblist[i].board_hits+"</h6></a></div>";
						list2_count++;
					}else if(jsonObj.iblist[i].board_type == "knowhow" ){
						list3 += "<div class='col-md-4'><a href='ibselect.do?board_no="+jsonObj.iblist[i].board_no+"&board_type="+jsonObj.iblist[i].board_type+"'>"
	            	       + "<img src='${pageContext.request.contextPath }/files/interior/interiorBoard/"+jsonObj.iblist[i].post_data+"' class='jb_filter3_img'><br>"
	    				   + "<h6 style='padding-top: 5px;'>리모델링</h6><h5>"+jsonObj.iblist[i].board_title+"</h5><h6><i class='far fa-user-circle'></i>&nbsp;"+jsonObj.iblist[i].nickname+"</h6> </a></div>";
						list3_count++;
					}
			
				}
				$("#list1").html(list1);		
				$("#list1_1").html(list1_1);		
				$("#list2").html(list2);		
				$("#list3").html(list3);	
				$("#list1_count").html(list1_count);			
				$("#list2_count").html(list2_count);		
				$("#list3_count").html(list3_count);	
	        },error: function(returnData) {
				
			}
	    });	
  }
  
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

	//모달 open시 동작(댓글 리스트 출력)
	function openReplyModal(e) {
		listReply(e);
	}
	
	//댓글 리스트 출력
	function listReply(boardnum){		
		   $.ajax({
		        type : "post",  
		        dataType : "json", 
		        data : {board_no : boardnum},
		        url : "irlist.do",
		        success : function(returnData) {		
		        var objStr = JSON.stringify(returnData);	
				var jsonObj = JSON.parse(objStr);				
				var value="";						
				if(jsonObj != null){
				for(var i in jsonObj.irlist){				
					
                    if(jsonObj.irlist[i].reply_lev == 1){	
                    	
                    if(i != 0 && (jsonObj.irlist[i-1].reply_lev == 2 || jsonObj.irlist[i-1].reply_lev == 1)){
                    	value += "</div></div>";
                    }                        
                    
					 value += "<div class='media'><img class='mr-3' src='${pageContext.request.contextPath }/files/user/userImages/"+jsonObj.irlist[i].user_profile+"' />"
					  + "<div class='media-body'><h5 class='mt-0'>"+jsonObj.irlist[i].nickname+"</h5>"
					  +"<h6><input type='hidden' id='reply_contents_return"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_contents+"'><div id='reply_contents_line"+jsonObj.irlist[i].reply_no+"'>"+jsonObj.irlist[i].reply_contents+"</div><h6><input type='hidden' id='board_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].board_no+"'><input type='hidden' id='origin_reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_no+"'><input type='hidden' id='reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_no+"'>"
					  +"<input class='jb_filter_btn2' type='button' value='댓글달기' onclick='addReplyLine("+jsonObj.irlist[i].reply_no+");'>";
					 if(jsonObj.irlist[i].user_no == $("#i_user_no").val()){
					    value += "<input class='jb_filter_btn2' type='button' value='댓글수정' onclick='changeReply("+jsonObj.irlist[i].reply_no+");'><input class='jb_filter_btn2' type='button' value='댓글삭제' onclick='delReply("+jsonObj.irlist[i].reply_no+");'>";	   
					   }
					   
                    }              
                    
                    if(jsonObj.irlist[i].reply_lev == 2){
					value +=	"<div class='media mt-3'><a class='pr-3' href='#'><img class='mr_3' src='${pageContext.request.contextPath }/files/user/userImages/"+jsonObj.irlist[i].user_profile+"' /></a>"
							+ "<div class='media-body'><h5 class='mt-0'>"+jsonObj.irlist[i].nickname+"</h5>"
							+ "<h6><input type='hidden' id='reply_contents_return"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_contents+"'><a href='istory.do?user_no="+$("#i_user_no").val()+"&follower_no="+jsonObj.irlist[i].re_user_no+"'>@"+jsonObj.irlist[i].re_nickname+"</a>&nbsp;&nbsp;<span id='reply_contents_line"+jsonObj.irlist[i].reply_no+"'>"+jsonObj.irlist[i].reply_contents+"</span><h6><input type='hidden' id='board_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].board_no+"'><input type='hidden' id='origin_reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].origin_reply_no+"'><input type='hidden' id='reply_no"+jsonObj.irlist[i].reply_no+"' value='"+jsonObj.irlist[i].reply_no+"'>"
							+"<input class='jb_filter_btn2' type='button' value='댓글달기' onclick='addReplyLine("+jsonObj.irlist[i].reply_no+");'>";
					 if(jsonObj.irlist[i].user_no == $("#i_user_no").val()){
						    value += "<input class='jb_filter_btn2' type='button' value='댓글수정' onclick='changeReply("+jsonObj.irlist[i].reply_no+");'><input class='jb_filter_btn2' type='button' value='댓글삭제' onclick='delReply("+jsonObj.irlist[i].reply_no+");'></div></div>";	   
					 }else{
							value += "</div></div>";
					 }
                     }	
                    
                    if( i == jsonObj.irlist.length - 1){
                    	value += "</div></div>";
                    }
				}				
				$("#replylist"+boardnum).html(value);
				}
		        },error: function(){
				}
              });		    
	}
	
  //댓글달기 클릭시 모달하단 입력창에 해당 댓글의 댓글달기로 변환	
  function addReplyLine(e){
		var i = $("#board_no"+e).val();
		$("#reply_lev"+i).val(2);
		$("#origin_reply_no"+i).val($("#origin_reply_no"+e).val());		
		$("#reference_reply_no"+i).val($("#reply_no"+e).val());
	} 
	  
   //댓글추가
      function addReply(e){            	    	
         if($("#i_user_no").val()!=0){
    	  if($("#reply_contents"+e).val() != ""){
    	  $.ajax({
		        type : "post",  
		        dataType : "json", 
		        data : {board_no : e, reply_lev : $("#reply_lev"+e).val(), origin_reply_no : $("#origin_reply_no"+e).val(),reply_contents: $("#reply_contents"+e).val(),reference_reply_no: $("#reference_reply_no"+e).val() ,user_no :$("#i_user_no").val()},
		        url : "irinsert.do",
		        success : function(returndata) {
		        	var i = returndata;
		        	listReply(i);
		        	$("#reply_lev"+i).val(1);
		        	$("#origin_reply_no"+i).val(0);
		        	$("#reply_contents"+i).val("");		
		        	$("#reference_reply_no"+i).val(0);
		        
			
		        },error: function(){
		        	
				}
              });
          }else{
        	  alert("댓글을 입력해주세요!");
          }
         }else{
        	 alert("로그인 후 이용 가능합니다.");
         }
      } 
	
  //댓글 삭제
  function delReply(e){
	  var i = $("#board_no"+e).val();
	  $.ajax({
	        type : "post",  
	        dataType : "json", 
	        data : {reply_no: e, board_no : i},
	        url : "irdelete.do",
	        success : function(returndata) {
	        	var i = returndata;
	        	listReply(i);		              
	        },error: function(){
	        	
			}
        });
  }
  
  //댓글수정 클릭시 수정창으로 변환
  function changeReply(e){
	  value="<input type='text' id='reply_contents_update"+e+"' style='width:70%'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_search_btn3' onclick='updateReply("+e+");' value='수정'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_search_btn3' onclick='returnReply("+e+");' value='취소'>";
	  $("#reply_contents_line"+e).html(value);
  }
  
  //댓글 수정
 function updateReply(e){
	  var i = $("#reply_contents_update"+e).val();
	  if(i != ""){
	  var b = $("#board_no"+e).val();
	  $.ajax({
	        type : "post",  
	        dataType : "json", 
	        data : {reply_no: e, reply_contents : i, board_no : b},
	        url : "irupdate.do",
	        success : function(returndata) {
	        	var i = returndata;
	        	listReply(i);		              
	        },error: function(){
	        	
			}
      });
	  }else{
		  alert("수정할 내용을 입력해주세요!");
	  }
 }
 
 //댓글 수정 취소
 function returnReply(e){
	 $("#reply_contents_line"+e).html($("#reply_contents_return"+e).val());
 }
  
 var key1 =0;
 var key2 =0;
 var key3 =0;
 function displayList(e){
	 if(e == 1){
		 if(key1 == 0){
		 $("#list1").css("display","");
		 key1++;
		 }else{
		 $("#list1").css("display","none");
	      key1--;
		 }		
	 }else if(e ==2){
		 if(key2 == 0){
			 $("#list2").css("display","");
			 key2++;
			 }else{
			 $("#list2").css("display","none");
		      key2--;
			 }		
	 }else if(e ==3){
		 if(key3 == 0){
			 $("#list3").css("display","");
			 key3++;
			 }else{
			 $("#list3").css("display","none");
		      key3--;
			 }		
     }
 }
  </script> 
  <c:if test="${empty loginUser}">
	<input type="hidden" id="i_user_no" value="0">
	</c:if>
	<c:if test="${!empty loginUser}">
	<input type="hidden" id="i_user_no" value="${loginUser.user_no}">
	</c:if>
  <br>
  <div class="container" id="jb_search_container" style="min-height: 960px;">
  <div class="row">
    <div class="col">
      <h3>검색 결과</h3>
      <hr>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <span class="jb_result" style="font-size:x-large;font-family: a고딕13;" onclick="displayList(1);">사진_Photograph ( <span id="list1_count"></span> ) </span>
       <hr>
    </div>
  </div>
  <div class="row" id="list1" style="display:none;">
   
  </div> 
   <div class="row" id="list1_1">
   
  </div>     
  <div class="row">
    <div class="col">
     <span class="jb_result" style="font-size:x-large;font-family: a고딕13;" onclick="displayList(2);">집들이_HouseWarming ( <span id="list2_count"></span> )</span>
       <hr>
    </div>
  </div>
   <div class="row" id="list2" style="display:none;">
    
  </div>   
  <div class="row">
    <div class="col">
      <span class="jb_result" style="font-size:x-large;font-family: a고딕13;" onclick="displayList(3);">노하우_KnowHow  ( <span id="list3_count"></span> )</span>
       <hr>
    </div>
  </div>
   <div class="row" id="list3" style="display:none;">
    
  </div>   
 <div class="row" id="jb_top">
		<div class="col-md-12">
			<i class="fas fa-angle-double-up"></i>
		</div>
	</div>
  </div>
  <br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>