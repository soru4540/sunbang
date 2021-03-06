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

.insert_btn {
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

.submit {
	background-color: #ffa0a8;
	color: white;
	border: #ffa0a8;
	width: 100%;
	height: 50px;
	font-size: 17px;
	font-family: a고딕15;
}

#insert_icon {
	color: #ff9198;
	font-size: 30px;
	vertical-align: middle;
}

.insert_line {
	color: #ff9198;
	font-size: 24px;
	vertical-align: middle;
}

#insert_container label {
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

#insert_container label input {
	position: absolute;
	width: 0;
	height: 0;
	overflow: hidden;
	height: 0;
}
</style>
</head>
<body>
	<c:import url="../common/interiorHeader.jsp" />
	<script type="text/javascript">
		//게시물추가버튼 숨김
		$(function() {
			$("#input_img0").on("change", handleImgFileSelect0);

			$("#row2").css("display", "none");
			$("#row3").css("display", "none");
			$("#row4").css("display", "none");
			$("#row5").css("display", "none");
			$("#line1").css("display", "none");
			$("#line2").css("display", "none");
			$("#line3").css("display", "none");
			$("#line4").css("display", "none");
			
			
			$("#upload").bind("click",function() { 
				 var img0 = $("#input_img0").val(); 
				 if(img0==""){ 
					 alert("커버 사진은 반드시 등록해야 합니다."); 
	                 return false; 
				 }
				 var housing_type = $("#housing_type").val();
				 if(housing_type ==""){
					 alert("주거형태를 입력해주세요."); 
	                 return false; 
				 }
				 var floor_area = $("#floor_area").val();
				 if(floor_area=""){
					 alert("평수를 입력해주세요."); 
	                 return false; 
				 }
				 
				 var style = $("#style").val();
				 if(style=""){
					 alert("스타일을 입력해주세요."); 
	                 return false; 
				 }
				 
				 var color1 = $("#color1").val();
				 var color2 = $("#color2").val();
				 var color3 = $("#color3").val();
				 if(color1 == "" && color2 == "" && color3 == ""){
					 alert("컬러  하나 이상 입력해야 합니다."); 
	                 return false; 
				 }
				 var board_title= $("#board_title").val();
				 if(board_title==""){ 
					 alert("집들이 제목은 반드시 입력해야 합니다."); 
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
		function handleImgFileSelect0(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img0").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}

		//파일업로드하면 아래화면에 출력 메소드(게시물1)
		function handleImgFileSelect1(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img1").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물2)
		function handleImgFileSelect2(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img2").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물3)
		function handleImgFileSelect3(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img3").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물4)
		function handleImgFileSelect4(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img4").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}
		//파일업로드하면 아래화면에 출력 메소드(게시물5)
		function handleImgFileSelect5(e) {
			var files = e.target.files;
			var filesArr = Array.prototype.slice.call(files);

			filesArr.forEach(function(f) {
				if (!f.type.match("image.*")) {
					alert("확장자는 이미지 확장자만 가능합니다.");
					return;
				}
				sel_file = f;
				var reader = new FileReader();
				reader.onload = function(e) {
					$("#img5").attr("src", e.target.result);
				}
				reader.readAsDataURL(f);
			});
		}

		//클릭시 게시물 추가항목들 생성
		function addType(e) {
			$("#row" + e)
					.html(
							"<i class='fas fa-times-circle' id='insert_icon' onclick='delType("
									+ e
									+ ");'></i>&nbsp;&nbsp;&nbsp;"
									+ "<input type='button' class='insert_btn' value='사진' onclick='addData1("
									+ e
									+ ")'>&nbsp;&nbsp;&nbsp;<input type='button' class='insert_btn' value='동영상' onclick='addData2("
									+ e + ")'>&nbsp;&nbsp;&nbsp;");
			$("#row" + (e + 1)).css("display", "");
			$("#line" + e).css("display", "");
			$("#rowdata" + e).html(
					"<input type='hidden' name='post_keyword' value='empty'>");

		}
		function delType(e) {
			$("#row" + e)
					.html(
							"<i class='fas fa-plus-circle' id='insert_icon' onclick='addType("
									+ e
									+ ");''></i>&nbsp;&nbsp;&nbsp;<span class='insert_line'>------------------------------------------</span>");
			$("#rowdata" + e).html(
					"<input type='hidden' name='post_keyword' value='empty'>");
		}
		//클릭시 사진 입력창 생성
		function addData1(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='photo'><label style='font-family:a고딕14;'>파일 선택<input type='file' id='input_img" + e + "' name='post_data" + e + "'></label><br><div class='row' style='background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; margin: 0 auto; padding-top: 30px; padding-bottom: 30px; max-width: inherit;'>"
									+ "<img id='img"
									+ e
									+ "' style='min-height:540px; max-height:100%; margin: 0 auto; max-width: inherit; '></div><br><br>내용 : <textarea id='' name='post_contents" + e +"' rows='5' cols='101' style='resize: none;border: 1px solid #ff9198; width:100%;'></textarea>");
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

		///클릭시 동영상 입력창 생성	
		function addData2(e) {
			$("#rowdata" + e)
					.html(
							"<br><input type='hidden' name='post_keyword' value='video'>동영상 URL 링크를 입력해주세요 : <br><input type='text' id='' name='post_data"+e+"' size='100' style='width:100%;'><br><br>내용 : <textarea id='' name='post_contents"+e+"' rows='5' cols='101' style='resize: none;border: 1px solid #ff9198; width:100%;'></textarea>");
		}


	</script>
	<br>
	<br>
	<div class="container" id="insert_container">
		<form name="khinsert" id="khinsert" action="ibinsert.do" method="post"
			enctype="multipart/form-data"> 
			<br>
			<h4 align="center" style="font-family: a고딕15;">집들이 등록</h4>
			<br> <input type="hidden" name="board_type" value="housewarming">
			<input type="hidden" id="user_no" name="user_no"
				value="${loginUser.user_no}">
			<div class="row">
				<input type="hidden" id="" name="post_keyword" value="cover">
				<label style="font-family: a고딕14;">파일선택 <input type="file"
					id="input_img0" name="post_data0">
				</label>
			</div>
			<div class="row">
				<div class="col" align="center"
					style="background-color: #fbfbfb; height: 600px; width: 100%; text-align: center; padding-top: 30px; padding-bottom: 30px;">
					<img id="img0"
						style="max-height: 100%; min-height: 540px; max-width: inherit;">
				</div>
			</div>
			<br> <br> 
			<div class="row">
				<div class="col">
					<select class="housing_type" id="housing_type" name="housing_type"
						style="width: 100%; height: 35px; font-family: a고딕14;" >
						<option value="">주거 형태(필수)</option>
						<option value="원룸&오피스텔">원룸&amp;오피스텔</option>
						<option value="아파트">아파트</option>
						<option value="빌라&연립">빌라&amp;연립</option>
						<option value="단독주택">단독주택</option>
						<option value="사무공간">사무공간</option>
						<option value="상업공간">상업공간</option>
					</select>
				</div>
				&nbsp;&nbsp;
				<div class="col">
					<select class="floor_area" id="floor_area" name="floor_area"
						style="width: 100%; height: 35px; font-family: a고딕14;">
						<option value="">평수 선택</option>
						<option value="9">10평 미만</option>
						<option value="10">10평 이상</option>
						<option value="20">20평 미만</option>
						<option value="30">30평 미만</option>
						<option value="40">40평 미만</option>
					</select>
				</div>		
				&nbsp;&nbsp;
				<div class="col">
					<select class="style" id="style" name="style"
						style="width: 100%; height: 35px; font-family: a고딕14;">
						<option value="">스타일 선택</option>
						<option value="모던">모던</option>
						<option value="미니멀&심플">미니멀&amp;심플</option>
						<option value="내추럴">내추럴</option>
						<option value="빈티지&레트로">빈티지&amp;레트로</option>
						<option value="클래식&앤틱">클래식&amp;앤틱</option>
						<option value="프렌치&프로방스">프렌치&amp;프로방스</option>
						<option value="러블리&로맨틱">러블리&amp;로맨틱</option>
						<option value="인더스트리얼">인더스트리얼</option>
					</select>
				</div>			
			</div>
			<br>
			<div class="row">
			<div class="col">
					<select class="color" id="color1" name="color1"
						style="width: 100%; height: 35px; font-family: a고딕14;">
						<option value="">전체 컬러 선택</option>
						<option value="#d53736">RED</option>
						<option value="#fed144">YELLOW</option>
						<option value="#96d783">GREEN</option>
						<option value="#3d97dd">BLUE</option>
						<option value="#ee8a94">PINK</option>
						<option value="#fafafa">WHITE</option>
						<option value="#fff">GRAY</option>
						<option value="#000">BLACK</option>
					</select>
				</div>
				<div class="col">
					<select class="color" id="color2" name="color2"
						style="width: 100%; height: 35px; font-family: a고딕14;">
							<option value="">벽 컬러 선택</option>
						<option value="#d53736">RED</option>
						<option value="#fed144">YELLOW</option>
						<option value="#96d783">GREEN</option>
						<option value="#3d97dd">BLUE</option>
						<option value="#ee8a94">PINK</option>
						<option value="#fafafa">WHITE</option>
						<option value="#fff">GRAY</option>
						<option value="#000">BLACK</option>
					</select>
				</div>
				<div class="col">
					<select class="color" id="color3" name="color3"
						style="width: 100%; height: 35px; font-family: a고딕14;">
				       <option value="">바닥 컬러 선택</option>
						<option value="#d53736">RED</option>
						<option value="#fed144">YELLOW</option>
						<option value="#96d783">GREEN</option>
						<option value="#3d97dd">BLUE</option>
						<option value="#ee8a94">PINK</option>
						<option value="#fafafa">WHITE</option>
						<option value="#fff">GRAY</option>
						<option value="#000">BLACK</option>
					</select>
				</div>
			</div>
			<br>
			<div class="row">
				<div class="col" style="font-family: a고딕14; ">				
					<span >예산 : </span><input type="number" style="height: 35px; "
						size="53" name="budget" id="budget" required>&nbsp;원			
				</div>
				<br><br>
			</div>
			<div class="row">
				<div class="col">				
					<span style="font-family: a고딕14; ">제목 : </span><input type="text"
						size="53" name="board_title" id="board_title" style="width:96.2%; height: 35px;">
				</div>				
			</div>
			<br>
			<div class="text">
				<!-- 내용 -->
				<textarea class="form-control" id="post_contents0" rows="5"
					wrap="hard" name="post_contents0" style="font-family: a고딕14;"></textarea>
			</div>			
			<br>
			<div class="row">
				<div class="col" id="row1">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(1);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata1"></div>
			</div>
			<div class="row" id="line1">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row2" style="width: 100%;">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(2);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata2"></div>
			</div>
			<div class="row" id="line2">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row3">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(3);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata3"></div>
			</div>
			<div class="row" id="line3">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>

			<div class="row">
				<div class="col" id="row4">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(4);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata4"></div>
			</div>
			<div class="row" id="line4">
				<div class="col">
					<br>
					<hr color="#ff9198">
					<br>
				</div>
			</div>
			<div class="row">
				<div class="col" id="row5" style="width: 100%;">
					<i class="fas fa-plus-circle" id="insert_icon"
						onclick="addType(5);"></i>&nbsp;&nbsp;&nbsp;<span
						class="insert_line">------------------------------------------</span>
				</div>
			</div>
			<div class="row">
				<div class="col" id="rowdata5"></div>
			</div>
			<br> <br>
			<div class="row">
				<div class="col" style="text-align: right;">
					<input class="submit" id="upload" type="submit" value="등&nbsp;록">
				</div>
			</div>
		</form>
		<br> <br>
	</div>
	<c:import url="../common/footer.jsp" />
</body>
</html>