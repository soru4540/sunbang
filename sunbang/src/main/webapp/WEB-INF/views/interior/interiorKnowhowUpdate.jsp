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
.jb_khinsert_btn {
	display: inline-block;
	font-weight: 400;
	color: #fff;
	text-align: center;
	vertical-align: middle;
	-webkit-user-select: none;
	-moz-user-select: none;
	-ms-user-select: none;
	user-select: none;
	background-color: #ff9198;
	border: 0;
	padding: .375rem .75rem;
	font-family: a고딕15;
	font-size: 1rem;
	line-height: 1.5;
	border-radius: .25rem;
	transition: color .15s ease-in-out, background-color .15s ease-in-out,
		border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

#jb_khinsert_icon {
	color: #ff9198;
	font-size: 30px;
	vertical-align: middle;
}

.jb_khinsert_line {
	color: #ff9198;
	font-size: 24px;
	vertical-align: middle;
}

#jb_khinsert_container label {
	position: relative;
	cursor: pointer;
	display: inline-block;
	vertical-align: middle;
	overflow: hidden;
	width: 100px;
	height: 35px;
	background: #ff9198;
	color: #fff;
	text-align: center;
	line-height: 35px;
}

#jb_khinsert_container label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
}

.submit {
	background-color: #ffa0a8;
	color: white;
	border: #ffa0a8;
	width: 100%;
	height: 50px;
	font-size: 17px;
	font-family: a고딕15;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
	//게시물추가버튼 숨김
	$(function(){
		   $("#input_img0").on("change",handleImgFileSelect0);	
		   
			$('#upload').bind("click",function() { 
				if($("#origin_post0").val() == 'empty'){
					var img0 = $("#input_img0").val(); 
					 if(img0==""){ 
						 alert("커버 사진은 반드시 등록해야 합니다."); 
		                 return false; 
					 }
					}
				 var category1 = $("#category1").val();
				 var category2 = $("#category2").val();
				 var category3 = $("#category3").val();
				 if(category1 == "" && category2 == "" && category3 == ""){
					 alert("카테고리는 하나 이상 입력해야 합니다."); 
	                 return false; 
				 }
				 var board_title= $("#jb_khinsert_title").val();
				 if(board_title==""){ 
					 alert("노하우 제목은 반드시 입력해야 합니다."); 
	                 return false; 
				 }	
				 var post_contents0 = $("#post_contents0").val();
				 if(post_contents0==""){
					 alert("게시물 내용을 입력해주세요."); 
	                 return false; 
				 }
	               
			         var str = $("#post_contents0").val(); 
			         str = str.replace(/(?:\r\n|\r|\n)/g, '<br/>');
			         $("#post_contents0").val(str);
			         		    
				}); 
	});	
	
	//파일업로드하면 아래화면에 출력 메소드(커버)
	function handleImgFileSelect0(e){
		$("#origin_post0").val("empty");
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img0").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});			
	}
	
	//파일업로드하면 아래화면에 출력 메소드(게시물1)
	function handleImgFileSelect1(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img1").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});			
	}
	//파일업로드하면 아래화면에 출력 메소드(게시물2)
	function handleImgFileSelect2(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img2").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});			
	}
	//파일업로드하면 아래화면에 출력 메소드(게시물3)
	function handleImgFileSelect3(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img3").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});			
	}
	//파일업로드하면 아래화면에 출력 메소드(게시물4)
	function handleImgFileSelect4(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img4").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});			
	}
	//파일업로드하면 아래화면에 출력 메소드(게시물5)
	function handleImgFileSelect5(e){
		var files = e.target.files;
		var filesArr = Array.prototype.slice.call(files);
		
		filesArr.forEach(function(f){
			if(!f.type.match("image.*")){
				alert("확장자는 이미지 확장자만 가능합니다.");
				return;
			}			
			sel_file = f;			
			var reader = new FileReader();
			reader.onload = function(e) {
				$("#img5").attr("src",e.target.result);
			}
			reader.readAsDataURL(f);
		});		
	}
		
	function addClickEvent(e){
		if (e == 1) {
			$(function() {
				$("#hidden_input_img" + e).on("change", uhandleImgFileSelect1);					
			});
		} else if (e == 2) {
			$(function() {
				$("#hidden_input_img" + e).on("change", uhandleImgFileSelect2);
			});
		} else if (e == 3) {
			$(function() {
				$("#hidden_input_img" + e).on("change", uhandleImgFileSelect3);
			});
		} else if (e == 4) {
			$(function() {
				$("#hidden_input_img" + e).on("change", uhandleImgFileSelect4);
			});
		} else if (e == 5) {
			$(function() {
				$("#hidden_input_img" + e).on("change", uhandleImgFileSelect5);
			});
		}
	   }
		
		//파일업로드하면 아래화면에 출력 메소드(수정으로 불러온 게시물1)
		function uhandleImgFileSelect1(e){
			$("#origin_post1").val("empty");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}			
				sel_file = f;			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#hidden_img1").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
			});			
		}
		//파일업로드하면 아래화면에 출력 메소드(수정으로 불러온 게시물2)
		function uhandleImgFileSelect2(e){
			$("#origin_post2").val("empty");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}			
				sel_file = f;			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#hidden_img2").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
			});			
		}
		//파일업로드하면 아래화면에 출력 메소드(수정으로 불러온 게시물3)
		function uhandleImgFileSelect3(e){
			$("#origin_post3").val("empty");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}			
				sel_file = f;			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#hidden_img3").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
			});			
		}
		//파일업로드하면 아래화면에 출력 메소드(수정으로 불러온 게시물4)
		function uhandleImgFileSelect4(e){
			$("#origin_post4").val("empty");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}			
				sel_file = f;			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#hidden_img4").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
			});			
		}
		//파일업로드하면 아래화면에 출력 메소드(수정으로 불러온 게시물5)
		function uhandleImgFileSelect5(e){
			$("#origin_post5").val("empty");
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);
			
			filesArr.forEach(function(f){
				if(!f.type.match("image.*")){
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}			
				sel_file = f;			
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#hidden_img5").attr("src",e.target.result);
				}
				reader.readAsDataURL(f);
			});			
				
	}
	//클릭시 게시물 추가항목들 생성
	function addType(e){					
		$("#row"+e).html("<i class='fas fa-times-circle' id='jb_khinsert_icon' onclick='delType("+e+");'></i>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_khinsert_btn' value='소제목' onclick='addData1("+e+")'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_khinsert_btn' value='텍스트' onclick='addData2("+e+")'>&nbsp;&nbsp;&nbsp;"+
		"<input type='button' class='jb_khinsert_btn' value='사진' onclick='addData3("+e+")'>&nbsp;&nbsp;&nbsp;<input type='button'  class='jb_khinsert_btn' value='동영상' onclick='addData4("+e+")'>&nbsp;&nbsp;&nbsp;"+
		"<input type='button'  class='jb_khinsert_btn' value='버튼' onclick='addData5("+e+")'>&nbsp;&nbsp;&nbsp;<input type='button' class='jb_khinsert_btn' value='구분선' onclick='addData6("+e+")'>"); 			
		$("#row"+(e+1)).css("display", "");
		$("#line"+e).css("display", "");
		$("#rowdata"+e).html("<input type='hidden' name='post_keyword' value='empty'>");
	
	}		
	//클릭시 게시물 추가버튼으로 돌아감
	function delType(e) {
		$("#row"+e).html("<i class='fas fa-plus-circle' id='jb_khinsert_icon' onclick='addType("+e+");''></i>&nbsp;&nbsp;&nbsp;<span class='jb_khinsert_line'>------------------------------------------</span>");
		$("#rowdata"+e).html("<input type='hidden' name='post_keyword' value='empty'>");	
	}
	
	//클릭시 게시물 추가버튼으로 돌아감
	function delType2(e) {
		$("#rowdata"+e).html("<input type='hidden' name='post_keyword' value='strapline'>");
		$("#div"+e).css("display","none");
		$("#loaddata"+e).css("display","");		
	}
	
	//클릭시 소제목 입력창 생성
	function addData1(e){
		$("#rowdata"+e).html("<br><input type='hidden' name='post_keyword' value='strapline'>소제목 : <br><input type='text'  class='' id='' name='post_contents"+e+"' size='100' style='width:100%;'>");
	}
	//클릭시 텍스트 입력창 생성
	function addData2(e){
		$("#rowdata"+e).html("<br><input type='hidden' name='post_keyword' value='text'>내용 : <br><textarea id='' name='post_contents"+e+"' rows='5' cols='101' style='resize: none;width:100%;'></textarea>");
	}	
	//클릭시 사진 입력창 생성
	function addData3(e){
		$("#rowdata" + e)
		.html(
				"<br><input type='hidden' name='post_keyword' value='photo'><label style='font-family:a고딕14;'>파일 선택<input type='file' id='input_img" + e + "' name='post_data" + e + "'></label><br><div class='row' style='background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; margin: 0 auto; padding-top: 30px; padding-bottom: 30px; max-width: inherit;'>"
						+ "<img id='img"
						+ e
						+ "' style='min-height:540px; max-height:100%; margin: 0 auto; max-width: inherit; '></div><br><br>내용 : <textarea id='' name='post_contents"
						+ e
						+ "' rows='5' cols='101' style='resize: none; width:100%;'></textarea>");
			if (e == 1) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect1);					
				});
			} else if (e == 2) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect2);
				});
			} else if (e == 3) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect3);
				});
			} else if (e == 4) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect4);
				});
			} else if (e == 5) {
				$(function() {
					$("#input_img" + e).on("change", handleImgFileSelect5);
				});
			}
		}
	//클릭시 동영상 입력창 생성	
	function addData4(e){
		$("#rowdata" + e)
		.html(
				"<br><input type='hidden' name='post_keyword' value='video'>동영상 URL 링크를 입력해주세요 : <br><input type='text' id='' name='post_data"
						+ e
						+ "' size='100' style='width:100%;'><br><br>내용 : <textarea id='' name='post_contents"
						+ e
						+ "' rows='5' cols='101' style='resize: none; width:100%;'></textarea>");
	}
	//클릭시 버튼 입력창 생성
	function addData5(e){
		$("#rowdata"+e).html("<br><input type='hidden' name='post_keyword' value='button'>버튼 URL 링크를 입력해주세요 : <br><input type='text' id='' name='post_data"+e+"' size='100'style='width:100%;'><br><br>내용 : <input type='text' id='' name='post_contents"+e+"' size='100' style='width:96%;'>");
	}
	//클릭시 구분선 입력창 생성
	function addData6(e){
		$("#rowdata"+e).html("<br><input type='hidden' name='post_keyword' value='divisionline'><select class='' id='divisionline"+e+"' name='post_data"+e+"' style='width:300px;'><option value='solid' selected>실선</option><option value='dashed'>파선</option><option value='dotted'>점선</option>"+
				"<option value='double'>두줄</option></select><br><br><hr id='hrline"+e+"' style='border:3px solid #ffb6b9;width:70%;'>");
		if(e == 1){
			$(function() {
				$("#divisionline" + e).on("change", function changeline(){
					$("#hrline"+e).css("border-style",$("#divisionline"+e).val());			
				});
			});
		}else if(e == 2){
			$(function() {
				$("#divisionline" + e).on("change", function changeline(){
					$("#hrline"+e).css("border-style",$("#divisionline"+e).val());
				});
			});
		}else if(e == 3){
			$(function() {
				$("#divisionline" + e).on("change", function changeline(){
					$("#hrline"+e).css("border-style",$("#divisionline"+e).val());
				});
			});
		}else if(e == 4){
			$(function() {
				$("#divisionline" + e).on("change", function changeline(){
					$("#hrline"+e).css("border-style",$("#divisionline"+e).val());
				});
			});
		}else if(e ==5){
			$(function() {
				$("#divisionline" + e).on("change", function changeline(){
					$("#hrline"+e).css("border-style",$("#divisionline"+e).val());
				});
			});
		}
	}

	function changeRow(e){
		$("#loaddata"+e).css("display","none");
		$("#div"+e).css("display","");
	}
	
	function delPost(e){		
	   $.ajax({
		        type : "post",  
		        dataType : "text",
		        data : {post_no : $("#post_no"+e).val()},		        
		        url : "ipdelete.do",
		        success : function(returnData) {			 
		        	    
		        	   $("#loaddata"+e).html("<input type='hidden' name='hidden_post_keyword' value='empty'>");
		    		   $("#loaddata"+e).css("display","none");	
		    		   $("#row"+e).html("<i class='fas fa-plus-circle' id='jb_khinsert_icon' onclick='addType("+e+");''></i>&nbsp;&nbsp;&nbsp;<span class='jb_khinsert_line'>------------------------------------------</span>");
		    		   $("#rowdata"+e).html("<input type='hidden' name='post_keyword' value='empty'>");	        
		    	       $("#div"+e).css("display","");	
		        },error:function(){
		        	
		        }
		});		    		     
	}
	
	</script>
	<br>
	<br>
	<div class="container" id="jb_khinsert_container">
		<form name="khupdate" id="khupdate" action="ibupdate.do" method="post"
			enctype="multipart/form-data">
			<c:forEach var="iblist" items="${iblist}" varStatus="status">
				<c:if test="${status.index == 0}">
					<div class="row">
						<input type="hidden" id="post_no${status.index}" name="post_no"
							value="${iblist.post_no}">
						<div class="col">
							<input type="hidden" id="" name="hidden_post_keyword"
								value="cover"> <input type="hidden" id=""
								name="post_keyword" value="empty"> <label>파일 선택
								<input type="hidden" id="origin_post${status.index}"
								name="origin_post${status.index}" value="${iblist.post_data}">
								<input type="hidden" id="origin_post_data${status.index}"
								name="origin_post_data${status.index}"
								value="${iblist.post_data}"> <input type="file"
								id="input_img${status.index}" name="post_data${status.index}">
							</label>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col" align="center"
						style="background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; padding-top: 30px; padding-bottom: 30px;">
							<img id="img0"
								style="max-height: 100%; min-height: 540px; max-width: inherit;"							
								src="${pageContext.request.contextPath}/files/interior/interiorBoard/${iblist.post_data}">
						</div>
					</div>
					<br>
					
							<input type="hidden" name="board_no" value="${iblist.board_no}">
							<input type="hidden" name="board_status"
								value="${iblist.board_status}"> 
								<div class="row">
								<div class="col" align="center">
								<select class="category" id="category1" name="category1"
								style="width: 100%; height: 35px; font-family: a고딕14;" >
								<option value="">카테고리</option>
								<c:if test="${iblist.category1 == '리모델링'}">
									<option value="리모델링" selected>리모델링</option>
								</c:if>
								<c:if test="${iblist.category1 != '리모델링'}">
									<option value="리모델링">리모델링</option>
								</c:if>
								<c:if test="${iblist.category1 == '꾸미기팁'}">
									<option value="꾸미기팁" selected>꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category1 != '꾸미기팁'}">
									<option value="꾸미기팁">꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category1 == '지식백과'}">
									<option value="지식백과" selected>지식백과</option>
								</c:if>
								<c:if test="${iblist.category1 != '지식백과'}">
									<option value="지식백과">지식백과</option>
								</c:if>
								<c:if test="${iblist.category1 == '이거어때'}">
									<option value="이거어때" selected>이거어때</option>
								</c:if>
								<c:if test="${iblist.category1 != '이거어때'}">
									<option value="이거어때">이거어때</option>
								</c:if>
								<c:if test="${iblist.category1 == '생활정보'}">
									<option value="생활정보" selected>생활정보</option>
								</c:if>
								<c:if test="${iblist.category1 != '생활정보'}">
									<option value="생활정보">생활정보</option>
								</c:if>
							</select> 
							</div>
							&nbsp;&nbsp;
							<div class="col">
							<select class="category" id="category2" name="category2"
							style="width: 100%; height: 35px; font-family: a고딕14;">
								<option value="">카테고리</option>
								<c:if test="${iblist.category2 == '리모델링'}">
									<option value="리모델링" selected>리모델링</option>
								</c:if>
								<c:if test="${iblist.category2 != '리모델링'}">
									<option value="리모델링">리모델링</option>
								</c:if>
								<c:if test="${iblist.category2 == '꾸미기팁'}">
									<option value="꾸미기팁" selected>꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category2 != '꾸미기팁'}">
									<option value="꾸미기팁">꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category2 == '지식백과'}">
									<option value="지식백과" selected>지식백과</option>
								</c:if>
								<c:if test="${iblist.category2 != '지식백과'}">
									<option value="지식백과">지식백과</option>
								</c:if>
								<c:if test="${iblist.category2 == '이거어때'}">
									<option value="이거어때" selected>이거어때</option>
								</c:if>
								<c:if test="${iblist.category2 != '이거어때'}">
									<option value="이거어때">이거어때</option>
								</c:if>
								<c:if test="${iblist.category2 == '생활정보'}">
									<option value="생활정보" selected>생활정보</option>
								</c:if>
								<c:if test="${iblist.category2 != '생활정보'}">
									<option value="생활정보">생활정보</option>
								</c:if>
							</select>
							</div>
							&nbsp;&nbsp; 
							<div class="col">							
							<select class="category" id="category3" name="category3"
							style="width: 100%; height: 35px; font-family: a고딕14;">
								<option value="">카테고리</option>
								<c:if test="${iblist.category3 == '리모델링'}">
									<option value="리모델링" selected>리모델링</option>
								</c:if>
								<c:if test="${iblist.category3 != '리모델링'}">
									<option value="리모델링">리모델링</option>
								</c:if>
								<c:if test="${iblist.category3 == '꾸미기팁'}">
									<option value="꾸미기팁" selected>꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category3 != '꾸미기팁'}">
									<option value="꾸미기팁">꾸미기팁</option>
								</c:if>
								<c:if test="${iblist.category3 == '지식백과'}">
									<option value="지식백과" selected>지식백과</option>
								</c:if>
								<c:if test="${iblist.category3 != '지식백과'}">
									<option value="지식백과">지식백과</option>
								</c:if>
								<c:if test="${iblist.category3 == '이거어때'}">
									<option value="이거어때" selected>이거어때</option>
								</c:if>
								<c:if test="${iblist.category3 != '이거어때'}">
									<option value="이거어때">이거어때</option>
								</c:if>
								<c:if test="${iblist.category3 == '생활정보'}">
									<option value="생활정보" selected>생활정보</option>
								</c:if>
								<c:if test="${iblist.category3 != '생활정보'}">
									<option value="생활정보">생활정보</option>
								</c:if>
							</select>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col">
							<span style="font-family: a고딕14;">제목 : </span><input type="text"
								size="53" name="board_title" id="jb_khinsert_title"
								value="${iblist.board_title }" style="width:96%;">
						</div>
					</div>								
					<br>
					<div class="row">
						<div class="col">
							<textarea id="" name="post_contents0" rows="5" cols="101"
								style="resize: none; width:100%;">${iblist.post_contents}</textarea>
						</div>
					</div>
					<br>
					<div class="row">
						<div class="col">
							<hr color="#ff9198">
							<br>
						</div>
					</div>
				</c:if>

				<c:if test="${status.index != 0}">
					<div class="row">
						<input type="hidden" id="post_no${status.index}" name="post_no"
							value="${iblist.post_no}">
						<div class="col" style="width:100%;" id="loaddata${status.index}">
							<button class="" type="button"
								onclick="changeRow(${status.index})">수정</button>
							&nbsp;&nbsp;&nbsp;
							<button class="" type="button" onclick="delPost(${status.index})">삭제</button>
							<br>
							<c:if test="${iblist.post_keyword == 'strapline'}">
								<br>
								<input type="hidden" name="hidden_post_keyword"
									value="strapline">소제목 : <br>
								<input type="text" class="" id=""
									name="hidden_post_contents${status.index}" size="100"
									value="${iblist.post_contents}">
							</c:if>
							<!-- 텍스트일때 -->
							<c:if test="${iblist.post_keyword == 'text'}">
								<br>
								<input type="hidden" name="hidden_post_keyword" value="text">내용 : <br>
								<textarea id="" name="hidden_post_contents${status.index}"
									rows="5" cols="101"
									style="resize: none; width:100%;">${iblist.post_contents}</textarea>
							</c:if>
							<!-- 사진일때 -->
							<c:if test="${iblist.post_keyword == 'photo'}">
								<br>
								<input type="hidden" name="hidden_post_keyword" value="photo">
								<input type="hidden" id="origin_post${status.index}"
									name="origin_post${status.index}" value="${iblist.post_data}">
								<input type="hidden" id="origin_post_data${status.index}"
									name="origin_post_data${status.index}"
									value="${iblist.post_data}">
								<label onclick="addClickEvent(${status.index});">파일선택<input
									type="file" id="hidden_input_img${status.index}"
									name="hidden_post_data${status.index}"></label>
								<br>
								<div class="row">
									<div class="col">
										<img id="hidden_img${status.index}"
											style="max-height: 100%; min-height: 540px; max-width: inherit;"
											src="${pageContext.request.contextPath }/files/interior/interiorBoard/${iblist.post_data}"><br>
										<br>내용 :
										<textarea id="" name="hidden_post_contents${status.index}"
											rows="5" cols="101"
											style="resize: none; width: 100%;">${iblist.post_contents}</textarea>
									</div>
								</div>
							</c:if>
							<!-- 동영상 링크 일때 -->
							<c:if test="${iblist.post_keyword == 'video'}">
								<br>
								<input type="hidden" name="hidden_post_keyword" value="video">동영상 URL 링크를 입력해주세요 : <br>
								<input type="text" id="" name="hidden_post_data${status.index}"
									size="100" value="${iblist.post_data}" style="width: 100%;">
								<br>
								<br>내용 : <textarea id=""
									name="hidden_post_contents${status.index}" rows="5" cols="101"
									style="resize: none; width: 100%; ">${iblist.post_contents}</textarea>
							</c:if>
							<c:if test="${iblist.post_keyword == 'button'}">
								<br>
								<input type="hidden" name="hidden_post_keyword" value="button">버튼 URL 링크를 입력해주세요 : <br>
								<input type="text" id="" name="hidden_post_data${status.index}"
									size="100" value="${iblist.post_data}" style="width: 100%;">
								<br>
								<br>내용 : <input type="text" id=""
									name="hidden_post_contents${status.index}" size="100"
									value="${iblist.post_contents}" style="width: 100%;">
							</c:if>
							<!-- 구분선일때 -->
							<c:if test="${iblist.post_keyword == 'divisionline'}">
								<br>
								<input type="hidden" name="hidden_post_keyword"
									value="divisionline">
								<select class="" id="divisionline${status.index}"
									name="hidden_post_data${status.index}" style="width: 300px;">
									<c:if test="${iblist.post_data=='solid'}">
										<option value="solid" selected>실선</option>
									</c:if>
									<c:if test="${iblist.post_data!='solid'}">
										<option value="solid">실선</option>
									</c:if>
									<c:if test="${iblist.post_data=='dashed'}">
										<option value="dashed" selected>파선</option>
									</c:if>
									<c:if test="${iblist.post_data!='dashed'}">
										<option value="dashed">파선</option>
									</c:if>
									<c:if test="${iblist.post_data=='dotted'}">
										<option value="dotted" selected>점선</option>
									</c:if>
									<c:if test="${iblist.post_data!='dotted'}">
										<option value="dotted">점선</option>
									</c:if>
									<c:if test="${iblist.post_data=='double'}">
										<option value="double" selected>두줄</option>
									</c:if>
									<c:if test="${iblist.post_data!='double'}">
										<option value="double">두줄</option>
									</c:if>
								</select>
								<br>
								<br>
								<hr id="hrline${status.index}"
									style="border:3px ${iblist.post_data} #ffb6b9;width:70%;">
							</c:if>
						</div>
					</div>
					
					<div class="row" id="div${status.index}" style="display: none;">
						<div class="col" style="width:100%;" id="row${status.index}">
							<i class="fas fa-times-circle" id="jb_khinsert_icon"
								onclick="delType2(${status.index});"></i>&nbsp;&nbsp;&nbsp;<input
								type="button" class="jb_khinsert_btn" value="소제목"
								onclick="addData1(${status.index})">&nbsp;&nbsp;&nbsp;<input
								type="button" class="jb_khinsert_btn" value="텍스트"
								onclick="addData2(${status.index})">&nbsp;&nbsp;&nbsp; <input
								type="button" class="jb_khinsert_btn" value="사진"
								onclick="addData3(${status.index})">&nbsp;&nbsp;&nbsp;<input
								type="button" class="jb_khinsert_btn" value="동영상"
								onclick="addData4(${status.index})">&nbsp;&nbsp;&nbsp; <input
								type="button" class="jb_khinsert_btn" value="버튼"
								onclick="addData5(${status.index})">&nbsp;&nbsp;&nbsp;<input
								type="button" class="jb_khinsert_btn" value="구분선"
								onclick="addData6(${status.index})">
						</div>
					</div>
					<div class="row">
						<div class="col" id="rowdata${status.index}">
							<input type="hidden" name="post_keyword" value="empty">
						</div>
					</div>
					<div class="row" id="line${status.index}">
						<div class="col">
							<br>
							<hr color="#ff9198">
							<br>
						</div>
					</div>
				</c:if>

				<c:set var="count" value="${status.index}" />
			</c:forEach>

			<c:if test="${count < 5}">
				<c:forEach var="index" begin="${count+1}" end="5">
					<div class="row">
						<div class="col" style="width:100%;" id="loaddata${index}">
							<input type="hidden" name='hidden_post_keyword' value="empty">
						</div>
					</div>
					<div class="row">
						<div class="col" style="width:100%;" id="row${index}">
							<i class="fas fa-plus-circle" id="jb_khinsert_icon"
								onclick="addType(${index});"></i>&nbsp;&nbsp;&nbsp;<span
								class="jb_khinsert_line">------------------------------------------</span>
						</div>
					</div>
					<div class="row">
						<div class="col" id="rowdata${index}">
							<input type="hidden" name="post_keyword" value="empty">
						</div>
					</div>
					<div class="row" id="line${index}">
						<div class="col">
							<br>
							<hr color="#ff9198">
							<br>
						</div>
					</div>
				</c:forEach>
			</c:if>
			<div class="row">
				<div class="col">
					<input class="submit" type="submit" value="수 정">
				</div>
			</div>
		</form>
		<br>
		<br>
	</div>
	<c:import url="../common/footer.jsp" />

</body>
</html>