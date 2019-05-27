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

.jb_search_btn {
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

.jb_search_btn2 {
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

.jb_search_btn3 {
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

.jb_search_btn:hover {
	color: #f74265;
}

#jb_search_filter ul {
	list-style: none;
	margin: 0;
	padding: 0;
}

#jb_search_filter li {
	margin: 0 60px 0 70px;
	padding: 0 0 0 0;
	border: 0;
	float: left;
}

#jb_search_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_search_container a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_search_container a:active {
	color: #000000;
	font-family: a고딕15;
	text-decoration: none;
}

#jb_search_container h6 {
	font-family: a고딕15;
}

#jb_search_container h5 {
	font-family: a고딕15;
}

.jb_search_img {
	width: 100%;
	height: 70%;
	border-radius: .75rem;
	margin-bottom: 5px;
}

#jb_search_container .col-md-3 {
	height: 360px;
}

#jb_search_items .jb_filter1_item {
	text-align: center;
	padding-top: 20px;
}

#jb_search_items .jb_filter1_item a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_search_items .jb_filter1_item a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_search_items .jb_filter1_item a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

.jb_search_filterBtn {
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
.jb_search_filterBtn2 {
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

.jb_search_submitBtn {
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

</style>
</head>
<body>
  <c:import url="../common/interiorHeader.jsp" />  
<!--   <script type="text/javascript">
  $(function(){
	  getList();
  });
  
  var keyword = ${keyword};
  var user_no = $("#i_user_no").val();
  function getList(){		
	    $.ajax({
	        type : "post",  
	        dataType : "json", 
	        data : {keyword1: keyword,user_no: user_no},
	        url : "isearchselect.do",
	        success : function(returnData) {
	        	alert("성공");
	        	var objStr = JSON.stringify(returnData);	
				var jsonObj = JSON.parse(objStr);							
				var value1 = "";
				var value2 = "";
				var value3 = "";
	        },error: function(returnData) {
				
			}
	    });	
  }
  
  
  </script> -->
  <c:if test="${empty loginUser}">
	<input type="hidden" id="i_user_no" value="0">
	</c:if>
	<c:if test="${!empty loginUser}">
	<input type="hidden" id="i_user_no" value="${loginUser.user_no}">
	</c:if>
  <br>
  <div class="container" id="jb_search_container">
  <div class="row">
    <div class="col">
      <h3>검색 결과</h3>
      <hr>
    </div>
  </div>
  <div class="row">
    <div class="col">
      <h4>사진_Photograph</h3>
       <hr>
    </div>
  </div>
  <div class="row" id="list1">
   
  </div>    
  <div class="row">
    <div class="col">
      <h4>집들이_HouseWarming</h3>
       <hr>
    </div>
  </div>
   <div class="row" id="list2">
    
  </div>   
  <div class="row">
    <div class="col">
      <h4>노하우_KnowHow</h3>
       <hr>
    </div>
  </div>
   <div class="row" id="list3">
    
  </div>   

  </div>
  <br><br>
<c:import url="../common/footer.jsp" />
</body>
</html>