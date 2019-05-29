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
	href="${pageContext.request.contextPath }/resources/images/logo2.PNG">
<title>SUNBANG</title>
<style type="text/css">
#jb_follow_search .searchbar {
	margin-bottom: auto;
	margin-top: auto;
	height: 45px;
	background-color: #ffb6b9;
	border-radius: 30px;
	padding: 10px;
}

#jb_follow_search .search_input {
	color: white;
	border: 0;
	outline: 0;
	background: none;
	width: 0;
	caret-color: transparent;
	line-height: 25px;
	transition: width 0.4s linear;
	padding: 0 10px;
	width: 220px;
	transition: width 0.4s linear;
}

#jb_follow_search .search_icon {
	height: 25px;
	width: 25px;
	float: right;
	display: flex;
	justify-content: center;
	align-items: center;
	border-radius: 50%;
	color: white;
	background: white;
	color: #ffb6b9;
}

.jb_follow_profile img {
	width: 50px;
	height: 50px;
	border-radius: 70%;
}

.jb_follow_nickname {
	line-height: 2;
	font-size: 15px;
	font-family: a고딕14;
}
#jb_follow_myprofile{
font-size: 30px; font-family: a고딕14;
}

#jb_followlist_container a:link {
	color: #000000;
	text-decoration: none;
	cursor: pointer;
}

#jb_followlist_container a:visited {
	color: #000000;
	text-decoration: none;
}

#jb_followlist_container a {
	color: #000000;
	font-family: a고딕14;
	text-decoration: none;
}

@media screen and (max-width: 700px) {

	#jb_follow_myprofile {
		font-size: 23px;
	}
	
	}
	
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		$(function() {

			$("#jb_follow_list2").css("display", "none");

			$("#jb_follow_btn1").click(function() {		
				$("#list2").html("");
				$("#following_keyword").val("");
				getList2();
				$(".jb_follow_list").css("display", "none");
				$("#jb_follow_list1").css("display", "");
			});

			$("#jb_follow_btn2").click(function() {
				$("#list").html("");
				$("#follow_keyword").val("");
				getList();
				$(".jb_follow_list").css("display", "none");
				$("#jb_follow_list2").css("display", "");
			});
		    var page =1;
			 if(page == 1){    
		     getList();			     
			 getList2();
			 page++;
			 }   
			}); 
		
		
		//팔로우 리스트 출력
		function getList(){
			var keyword = "";	
			if($("#follow_keyword").val() == ""){
				keyword = "empty";
			}else{
				keyword = $("#follow_keyword").val();
			}		       
			var user_no = ${fuser.user_no};
			    $.ajax({
			        type : "post",  
			        dataType : "json", 
			        data : {user_no: user_no, keyword: keyword},
			        url : "ifsearch.do",
			        success : function(returnData) {					         	
			        	var objStr = JSON.stringify(returnData);			        	
						var jsonObj = JSON.parse(objStr);										
							var value = "";						
						for(var i in jsonObj.followlist){	
							value += "<tr align='center'><td width='33%'><div class='jb_follow_profile'>"
								    + "<img src='${pageContext.request.contextPath}/files/interior/interiorMain/"+jsonObj.followlist[i].user_profile+"'>&nbsp;&nbsp;&nbsp;"
								    +"<span style='font-size:22px; font-family: a고딕14;'>"+jsonObj.followlist[i].user_id+"</span></div></td>"													
						            +"<td width='33%' style='vertical-align: middle;'><span class='jb_follow_nickname'>"+jsonObj.followlist[i].nickname+"</span></td>"					
						            +"<td width='33%' style='vertical-align: middle;'><input type='hidden' id='fuser_no"+i+"' value='"+jsonObj.followlist[i].user_no+"'><button type='button' class='btn btn-outline-danger' id='unfollow"+i+"' onclick='delFollow("+i+");'>X</button>"
						            +"<button type='button' class='btn btn-outline-info' id='follow"+i+"' onclick='addFollow("+i+");' style='display:none;'>+</button></td></tr>";										
						}
						$("#list").html(value);
			        },error: function(returnData){			        	
			        }
		});
		}
		
		//팔로잉 리스트 출력
		function getList2(){	
			var keyword = "";	
			if($("#following_keyword").val() == ""){
				keyword = "empty";
			}else{
				keyword = $("#following_keyword").val();
			}		
			var user_no = ${fuser.user_no};
					    $.ajax({
					        type : "post",  
					        dataType : "json", 
					        data : {user_no: user_no , keyword: keyword},
					        url : "if2search.do",
					        success : function(returnData) {							       
					        	var objStr = JSON.stringify(returnData);					       
								var jsonObj = JSON.parse(objStr);							
							    var value = "";						
								for(var i in jsonObj.followinglist){	
									value += "<tr align='center'><td width='33%'><div class='jb_follow_profile'>"
									    + "<img src='${pageContext.request.contextPath}/files/interior/interiorMain/"+jsonObj.followinglist[i].user_profile+"'>&nbsp;&nbsp;&nbsp;"
									    +"<span style='font-size:22px; font-family: a고딕14;'>"+jsonObj.followinglist[i].user_id+"</span></div></td>"													
							            +"<td width='33%' style='vertical-align: middle;'><span class='jb_follow_nickname'>"+jsonObj.followinglist[i].nickname+"</span></td>"					
							            +"<td width='33%' style='vertical-align: middle;'><input type='hidden' id='ffollower_no"+i+"' value='"+jsonObj.followinglist[i].follower_no+"'><button type='button' class='btn btn-outline-danger' id='unfollowing"+i+"' onclick='delFollowing("+i+");'>X</button>"
							            +"<button type='button' class='btn btn-outline-info' id='following"+i+"' onclick='addFollowing("+i+");' style='display:none;'>+</button></td></tr>";	
								}
								$("#list2").html(value);
					        },error: function(returnData){			        	
					        }
		    });
		}
			    
		function followsearch(){
			$("#list").html("");
			getList();
		}
		
		function followingsearch(){
			$("#list2").html("");		
			getList2();
		}
		
		function delFollow(e){
			var user_no = $("#fuser_no"+e).val();
			var follower_no = "${loginUser.user_no}";
			   $.ajax({
			        type : "post",  
			        dataType : "json", 
			        data : {user_no : user_no ,follower_no : follower_no},
			        url : "ifdelete.do",
			        success : function(returnData) {	
			        	$("#unfollow"+e).css("display","none");
			        	$("#follow"+e).css("display","");
			        },error: function(returnData){
			        	
			        }
			   });
		}
		
		function delFollowing(e){
			 var user_no = "${loginUser.user_no}";
			 var follower_no = $("#ffollower_no"+e).val();
			 $.ajax({
			        type : "post",  
			        dataType : "json", 
			        data : {user_no : user_no,follower_no : follower_no },
			        url : "ifdelete.do",
			        success : function(returnData) {	
			        	$("#unfollowing"+e).css("display","none");
			        	$("#following"+e).css("display","");
			        },error: function(returnData){
			        	
			        }
			   });
		}
		
		function addFollow(e){
			var user_no = $("#fuser_no"+e).val();
			var follower_no = "${loginUser.user_no}";
			   $.ajax({
			        type : "post",  
			        dataType : "json", 
			        data : {user_no : user_no ,follower_no : follower_no},
			        url : "ifinsert.do",
			        success : function(returnData) {	
			        	$("#follow"+e).css("display","none");
			        	$("#unfollow"+e).css("display","");			        	
			        },error: function(returnData){
			        	
			        }
			   });
		}
		
		function addFollowing(e){
			 var user_no = "${loginUser.user_no}";
			 var follower_no = $("#ffollower_no"+e).val();
			 $.ajax({
			        type : "post",  
			        dataType : "json", 
			        data : {user_no : user_no,follower_no : follower_no },
			        url : "ifinsert.do",
			        success : function(returnData) {	
			        	$("#following"+e).css("display","none");
			        	$("#unfollowing"+e).css("display","");	
			        },error: function(returnData){
			        	
			        }
			   });
		}
		
	</script>
	<br>
	<div class="container" id="jb_followlist_container">	
		<div class="row">
			<div class="col-md-1"></div>
			<div class="col-md-10">
				<table class="table">
					<tr>
						<td style="width:40%;"  align="right">
							<a href="istory.do?user_no=${loginUser.user_no}&follower_no=${fuser.user_no}">
							<div class="jb_follow_profile">
								<img src="${pageContext.request.contextPath }/files/interior/interiorMain/new1.PNG"
									style="width: 200px; height: 200px; border-radius: 70%;">
							</div>
							</a>
						</td>
						<td style="width:60%;vertical-align: bottom;"  align="left">&nbsp;&nbsp;&nbsp;
						<a href="istory.do?user_no=${loginUser.user_no}&follower_no=${fuser.user_no}"><span id="jb_follow_myprofile">${fuser.nickname}</span>&nbsp;&nbsp;&nbsp;<span class="jb_follow_nickname" style="font-size: 22px;font-family: a고딕14;">${fuser.user_id}</span></a><br>
						&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;<span style="font-size: 18px;opacity:0.6;font-family: a고딕14;">팔로우 : ${fuser.follow_count}&nbsp;&nbsp; 팔로잉 : ${fuser.following_count}</span>
						</td>						
					</tr>
				</table>
			</div>
			<div class="col-md-1"></div>            
		</div>
		<br>
		<div class="row" align="center">
			<div class="col-md-12">
				<button type="button" class="btn btn-outline-info"
					id="jb_follow_btn1">팔로우</button>
				&nbsp;&nbsp;&nbsp;
				<button type="button" class="btn btn-outline-info"
					id="jb_follow_btn2">팔로잉</button>
			</div>
		</div>
		<br>
		<div class="row">
			<div class="col-md-2"></div>
			<div class="col-md-8">
				<div class="jb_follow_list" id="jb_follow_list1" style="overflow:auto; height:600px;">
					<table class="table">
						<tr align="center">
							<td colspan="3" id="jb_follow_search">							
								<div class="d-flex justify-content-center h-100">							
									<div class="searchbar">
										<input class="search_input" type="text" id="follow_keyword"
											placeholder="Search..."> <a class="search_icon" onclick="followsearch();"><i class="fas fa-search"></i></a>
									</div>
								</div>
							</td>
						</tr>
					 </table>
					 <table class="table" id="list">						
					</table>
				</div>
				<div class="jb_follow_list" id="jb_follow_list2" style="overflow:auto; height:600px;">
					<table class="table">
						<tr align="center">
							<td colspan="3" id="jb_follow_search">
								<div class="d-flex justify-content-center h-100">
									<div class="searchbar">
										<input class="search_input" type="text" id="following_keyword"
											placeholder="Search..."> <a class="search_icon" onclick="followingsearch();"><i class="fas fa-search"></i></a>
									</div>
								</div>
							</td>
						</tr>
						</table>
						<table class="table" id="list2">						
					</table>
				</div>
			</div>
			<div class="col-md-2"></div>
		</div>
	</div>
	<br>
	<br>
	<c:import url="../common/footer.jsp" />
</body>
</html>